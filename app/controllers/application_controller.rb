require "application_responder"

class ApplicationController < ActionController::Base
	self.responder = ApplicationResponder
	respond_to :html

	  # Prevent CSRF attacks by raising an exception.
	  # For APIs, you may want to use :null_session instead.
	 protect_from_forgery with: :exception
    
 	before_filter :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) { 
            |u| u.permit(:email, :password, :password_confirmation, :humanizer_answer, :humanizer_question_id) }
        devise_parameter_sanitizer.for(:account_update) { 
            |u| u.permit(:email, :password, :password_confirmation, :humanizer_answer, :humanizer_question_id)  }
    end

end
