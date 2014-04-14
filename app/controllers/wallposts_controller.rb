class WallpostsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]

  def index
  end

  def create
    @wallpost = current_user.wallposts.build(wallpost_params)

    if @wallpost.save
      flash[:success] = "Wallpost created!"
      redirect_to :back
    else
      @wall_items = []
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

    def wallpost_params
      params.require(:wallpost).permit(:content)
    end
end