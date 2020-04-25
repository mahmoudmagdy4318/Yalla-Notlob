class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    before_action :get_notifications
    def get_notifications
        @notifications=Notification.all
    end

    before_action :set_user

    def set_user
        if(current_user)
            cookies[:id] = current_user.id
        end
    end

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:image])
    end
end
