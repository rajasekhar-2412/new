class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  autocomplete :user, :username,:full => true,:display_value => :display_name
  require 'numbers_in_words'
  require 'numbers_in_words/duck_punch'

  def create_friend
    unless current_user.id == params[:friend_id].to_i
      if Friendship.where("(friend_id=? and user_id=?) or (user_id=? and friend_id=?)",
                          params[:friend_id].to_i,current_user.id,params[:friend_id].to_i,current_user.id).empty?
        @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
        if @friendship.save
          flash[:notice] = "Added friend."
          redirect_to root_url
        else
          flash[:error] = "Unable to add friend."
          redirect_to root_url
        end
      else
        flash[:notice] = "Already friend Request Sent."
        redirect_to friends_path
      end
    else
      flash[:alert] = "You Can't Add Yourself as Your Friend"
      redirect_to friends_path
    end
  end


  def update_friend
    if  @friendship = Friendship.where("(friend_id=? and user_id=?) or (user_id=? and friend_id=?)",
                                       current_user.id,params[:friend_id].to_i,current_user.id,params[:friend_id].to_i)
      params[:for] == "Added" ? @friendship.first.update_attributes(:is_accept => 'true') :  Friendship.delete_friend(params[:id].to_i)
      flash[:alert] = "Friend #{params[:for]} Successfully"
      redirect_to   friends_path
    end
  end

  def friends
    @friends_sent = Friendship.where("(user_id=?) and is_accept=?", current_user.id,'true')
    @friends_approved = Friendship.where("(friend_id=?) and is_accept=?", current_user.id,'true')
  end

  def search_friend
    @buddies = User.where('username ilike ?',"#{params[:name]}")
    @notice =  "#{@buddies.count.in_words.capitalize} friend(s) found. "
    respond_to do |format|
      format.html {render :layout => false}
    end

  end

  def show
    redirect_to search_friend_path(:name => params[:name])
  end
end


