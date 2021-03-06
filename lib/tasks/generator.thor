require 'ffaker'

class Generator < Thor

  desc 'gen_users', "generate users(pat_quan, mail_mask{xxxN@xxx.xx | random})"
  def gen_users(pat_quan, email_mask)
    # invoke :clear_forum_patient [login_mask, email_mask]

    require File.expand_path('config/environment.rb')

    counter=0
    pat_quan.to_i.times do
      counter+=1

      if counter.odd?
        name = Faker::NameRU.first_name(:male)
      else
        name = Faker::NameRU.first_name(:female)
      end
      email = email_mask == 'random' ? Faker::Internet.email : email_mask.gsub("N", counter.to_s)

      user = User.new   :name =>  name,
                              :email => email,
                              :password => "123456",
                              :password_confirmation => "123456"

      user.sign_in_count = rand(6)
      user.current_sign_in_at = Time.now
      user.last_sign_in_at = Time.now - 1.hour
      user.current_sign_in_ip = Faker::Internet.ip_v4_address
      user.last_sign_in_ip = Faker::Internet.ip_v4_address

      if user.save
        puts "user #{user.name} (#{email}) successfully saved (#{counter}) \n"
      else
        puts "\n !!! user hasn't been saved, invalid data #{user.errors.inspect}!!! \n"
      end
    end
  end

  desc 'clear_users', "clear generated patient email_mask"
  def clear_users(email_mask)
    require File.expand_path('config/environment.rb')

    email = email_mask.gsub("N", "%")

    User.where("email ilike '#{email}'").each do |u|
      u.destroy
    end
  end

  desc 'gen_friends', "generate friends"
  def gen_friends
    require File.expand_path('config/environment.rb')

    states = %w(active request pending)

    User.all.each do |mem|
      puts "======================================\n"
      puts mem.email
      r = 2+rand(3)
      r = 5+rand(6)
      r.times do
        friend = User.where("id <> ?", mem.id).order("RANDOM()").first
        puts "=============\n"
        puts friend.email
        unless Friendship.between_users(mem.id, friend.id).any?
          state = states[rand(3)]
          message = Faker::Lorem.sentence
          puts "=====#{state}"
          if state == 'pending'
            f = Friendship.create!(user_id: mem.id, friend_id: friend.id, message: message, state: 'pending')
            f = Friendship.create!(user_id: friend.id, friend_id: mem.id, message: message, state: 'request')
          elsif state == 'request'
            f = Friendship.create!(user_id: mem.id, friend_id: friend.id, message: message, state: 'request')
            f = Friendship.create!(user_id: friend.id, friend_id: mem.id, message: message, state: 'pending')
          else
            f = Friendship.create!(user_id: friend.id, friend_id: mem.id, message: message, state: state)
            f = Friendship.create!(user_id: mem.id, friend_id: friend.id, message: message, state: state)
          end
          f.save!
        end
      end
    end
  end

end
