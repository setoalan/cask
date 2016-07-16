module UsersHelper
  def validate_user
    if @user && @user != current_user
      redirect_to root_path, alert: 'Access denied.'
    end
  end
end
