class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @wallpost = current_user.wallposts.build if signed_in?
      @wall_items = current_user.wall.paginate(page: params[:page])
    end
  end
end
