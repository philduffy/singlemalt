class BlogsController < ApplicationController
  def edit
    @blog = Blog.find(params[:id])
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])

    @blog.update_attributes blog_params

    redirect_to root_path
  end

  private

  def blog_params
    params.require(:blog).permit(
      :content,
      :title
    )
  end
end
