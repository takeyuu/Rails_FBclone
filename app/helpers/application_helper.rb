module ApplicationHelper
  def choose_confirm
    if action_name == 'new' || action_name == 'create' || action_name == 'confirm' || action_name == 'show'
      confirm_pictures_path
    elsif action_name == 'edit' || action_name == 'update'
      confirm_picture_path
    end
  end
end
