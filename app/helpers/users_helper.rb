module UsersHelper
  def validate_user
    if @user != current_user && current_user.role != 'admin'
      redirect_to root_path, alert: 'Access denied.'
    end
  end
end
