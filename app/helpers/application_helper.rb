module ApplicationHelper
  def is_admin?
    @current_user.role == 'admin' ? true : false
  end
end
