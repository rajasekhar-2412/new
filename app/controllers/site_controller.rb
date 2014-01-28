class SiteController < ApplicationController
  def index
    if current_user
      @bookmarks = current_user.bookmarks.order('created_at desc')
        if current_user.username.blank?
          flash[:alert] = 'You dont have username. Please update your username'
        end
    else
      @bookmarks = Bookmark.where(is_shared: true).order('created_at desc')
    end
  end
end
