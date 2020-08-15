class PicturesController < ApplicationController
  def top
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
    render :new if @picture.invalid?
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    @user = User.find(current_user.id)
    if @picture.save
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to user_path(current_user.id)
  end

  private
  def picture_params
    params.require(:picture).permit(:content, :image)
  end
end
