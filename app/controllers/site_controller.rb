class SiteController < ApplicationController
  def index

    if current_user
      @users= User.all.collect{|a| [a.username,a.sign_in_count]}
      @notifications = Friendship.where(friend_id: current_user.id, :is_accept => 'false')
      @bookmarks = current_user.bookmarks.order('created_at desc')
      text = ''
        if current_user.username.blank?
          text = text + 'You dont have username. Please update your username and '
        end
         if !@notifications.empty?
           text = text + "You have #{@notifications.count} Friend Request(s). Please check."
        end
         if text !=''
           flash[:notice] = text
         end

    else
      @bookmarks = Bookmark.where(is_shared: true).order('created_at desc')
    end

    path = "/app/app/assets/images"
    @images=Dir.entries(path).delete_if{|a| a == '.' || a== ".." || a==".keep"}
    #@random_images = images[rand(images.size)]
  end
end
