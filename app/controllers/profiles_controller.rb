class ProfilesController < ApplicationController
  def index
     if current_user
       @users = User.where("id !=?",current_user.id)
     else
       @users = User.all
     end
  end

  def notifications
     @notifications = Friendship.where(friend_id: current_user.id, :is_accept => 'false')
    #if @notifications.empty?
    #  flash[:notice] = "You don't have any friend request(s)"
    #end
  end

  def show_friends_bookmarks
    @friend = Friendship.friend(current_user.id,params[:id].to_i)
    unless @friend
      flash[:notice] = "You should be his/her friend to access the bookmarks"
       redirect_to profiles_path
    else
      @name = params[:name]
      @bookmarks = Bookmark.where("user_id=?",params[:id].to_i)
       respond_to do |format|
         format.html
       end
    end
  end
end
