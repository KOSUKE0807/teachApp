class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :current_student

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
  def after_sign_in_path_for(resource)
    teachers_account_path(current_teacher)
  end
  
  def current_student
    return unless session[:stu_id]
    @current_student = Student.find(session[:stu_id])
  end
end
