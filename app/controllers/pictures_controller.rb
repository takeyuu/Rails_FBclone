class PicturesController < ApplicationController
  def top
    @user = User.find(current_user.id)
  end
end
