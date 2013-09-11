class FriendshipsController < ApplicationController
  respond_to :html, :json
  before_action :set_friendship, only: [:show, :edit, :update, :destroy]

  # GET /friendships
  # GET /friendships.json
  def index
    # @friendships = Friendship.for_user(current_user)
    @friendships = current_user.friendships
 
    respond_with(@contacts) do |format|
      format.json
      format.html
    end
 end

  # GET /friendships/1
  # GET /friendships/1.json
  def show
  end

  # GET /friendships/new
  def new
    @friendship = Friendship.new
  end

  # GET /friendships/1/edit
  def edit
  end

  # POST /friendships
  # POST /friendships.json
  def create
    @friendship = Friendship.new(friendship_params)

    respond_to do |format|
      if @friendship.save
        format.html { redirect_to @friendship, notice: 'Friendship was successfully created.' }
        format.json { render action: 'show', status: :created, location: @friendship }
      else
        format.html { render action: 'new' }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friendships/1
  # PATCH/PUT /friendships/1.json
  def update
    p @friendship.inspect
    if params[:state] == 'confirm' &&
        @friendship.state == 'pending' &&
        @friendship.user_id == current_user.id &&
        Friendship.accept(current_user.id, @friendship.friend_id)
      respond_with @friendship
    else
      respond_with_errors
    end
  end

  # DELETE /friendships/1
  # DELETE /friendships/1.json
  def destroy
    # @friendship.destroy
    p "++++++++++++++++++++++++++destroy+++++++++++++++++++++++++++++"
    respond_to do |format|
      format.html { redirect_to friendships_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friendship
      @friendship = Friendship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friendship_params
      params[:friendship].permit(:message, :state)
    end
end
