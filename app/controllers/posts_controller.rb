class PostsController < ApplicationController

  before_action :set_post, only: [:show, :update, :edit, :destroy]

  def index
    @posts = Post.paginate(page: params[:page], per_page: 5)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, success: 'Братишка, зачем ты хуйню постишь?'
    else
      render :new, danger: 'Все хуйня, давай по-новой'
    end
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to @post, info: 'Статья изменена, ёпт'
    else
      render :edit, danger: 'Что-то ты, братишка, не то сделал'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, success: 'Не, ну ты все-таки это сделал'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :summary, :body, :image, :all_tags)
 end


end
