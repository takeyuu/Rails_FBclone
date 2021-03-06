class PicturesController < ApplicationController
  before_action :select_picture, only: [:edit, :update, :destroy]
  before_action :authenticate_user, only: [:new, :confirm, :create, :edit, :update, :destroy]
  def top
    @picture = Picture.all
    if logged_in?
      @user = User.find(current_user.id)
    else
      @user = User.new
    end
  end

  def new
    @picture = current_user.pictures.new
  end

  def confirm
    @picture = current_user.pictures.build(picture_params)
    @picture.id = params[:id]
    if @picture.invalid?
      flash.now[:danger] = 'エラー！内容が未記入です'
      render :new
    end
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    if @picture.save
      redirect_to user_path(current_user.id)
    else
      flash.now[:danger] = 'エラー！内容が未記入です'
      render :new
    end
  end

  def edit
  end

  def update
    if @picture.update(picture_params)
      redirect_to user_path(current_user.id)
    else
      flash.now[:danger] = 'エラーがあります'
      render :edit
    end
  end

  def destroy
    @picture.destroy
    flash[:notice] = '投稿を消去しました'
    redirect_to user_path(current_user.id)
  end

  private
  def picture_params
    params.require(:picture).permit(:content, :image, :image_cache)
  end

  def select_picture
    @picture = Picture.find(params[:id])
  end
end
