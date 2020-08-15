module PicturesHelper
  def choose_confirm
    if action_name == 'new' || action_name == 'create' || action_name == 'confirm'
      confirm_pictures_path
    elsif action_name == 'edit' || action_name == 'update'
      confirm_picture_path
    end
  end

  def confirm_new_or_edit
    @picture.id ? picture_path : pictures_path
  end

  def confirm_form_method
    @picture.id ? 'patch' : 'post'
  end
end
