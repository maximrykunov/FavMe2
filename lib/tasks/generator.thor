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

  desc 'gen_contacts', "generate contacts"
  def gen_contacts
    require File.expand_path('config/environment.rb')

    User.all(limit: 25).each do |user|
      p user.id

      r = 5+rand(6)
      r.times do
        friend = User.all(:id.not => user.id).shuffle.first
        puts "=============\n"
        unless Contact.first(owner_id: user.id, user_id: friend.id)
          puts friend.email
          Contact.create(owner_id: user.id, user_id: friend.id, name: friend.name, email: friend.email)
        end
        # unless Friendship.between_users(mem.id, friend.id).any?
        #   state = states[rand(3)]
        #   message = Faker::Lorem.sentence
        #   puts "=====#{state}"
        #   if state == 'pending'
        #     f = Friendship.create!(user_id: mem.id, friend_id: friend.id, message: message)
        #   else
        #     f = Friendship.create!(user_id: friend.id, friend_id: mem.id, message: message)
        #   end
        #   f.state = state
        #   f.save!
        # end
      end

    end
  end

end
