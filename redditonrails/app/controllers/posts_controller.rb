class PostsController < ApplicationController
  before_action :require_user ,except: [:show]
  before_action :require_user_owns_post,only: [:edit,:update]

  def new
    @post = Post.new

  end


  def create

    @post = Post.new(post_params)


    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end

  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  private
  def post_params
    params.require(:post).permit(:url,:title,:content,:user_id, sub_ids:[])

  end


end
