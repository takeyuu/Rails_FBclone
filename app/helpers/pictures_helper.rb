module PicturesHelper
  def confirm_new_or_edit
    @picture.id ? picture_path : pictures_path
  end

  def confirm_form_method
    @picture.id ? 'patch' : 'post'
  end
end
