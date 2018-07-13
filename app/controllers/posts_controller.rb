class PostsController < ApplicationController
  # before_action :authenticate_user!, :only => [:create, :destroy]
  protect_from_forgery :except => [:index, :show, :destroy, :toggle_flag]

  def index
    @posts = Post.order(id: :desc).all
  end

  def create
    if !current_user
      return redirect_to new_user_session_path
    end
    @post = Post.new(post_params)
    @post.user = current_user
    @post.save
    # redirect_to posts_path
    # 没有使用js, 因为循环js代码的问题没有解决。
  end

  def destroy
    if !current_user
      return redirect_to new_user_session_path
    end
    @post = current_user.posts.find(params[:id])
    @post.destroy

    # redirect_to posts_path
    # render :js => "alert('ok')"
    render :json => { :id => @post.id }
  end

  def like
    @post = Post.find(params[:id])
    unless Like.find_by(user_id: current_user.id, post_id: @post.id)
      Like.create(user_id: current_user.id, post_id: @post.id)
    end

    respond_to do |format|
      # format.html { redirect_to posts_path}
      format.js
    end
  end

  def unlike
    @post = Post.find(params[:id])
    like = Like.find_by(user_id: current_user.id, post_id: @post.id)
    like.destroy
    respond_to do |format|
      # format.html { redirect_to posts_path}
      format.js { render "like"}
    end
  end

  def toggle_flag
    @post = Post.find(params[:id])

    if @post.flag_at
      @post.flag_at = nil
    else
      @post.flag_at = Time.now
    end

    @post.save

    render :json => { :message => "ok", :flag_at => @post.flag_at, :id => @post.id }
  end

  protected

  def post_params
    params.require(:post).permit(:content)
  end
end
