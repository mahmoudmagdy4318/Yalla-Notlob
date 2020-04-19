class Users::OmniauthController < ApplicationController
    def facebook
        @user = User.create_from_provider_data(request.env['omniauth.auth'])
        if @user.persisted?
          sign_in_and_redirect @user
          puts "loloooo", request.env['omniauth.auth'].info.name
         
        else
          flash[:error] = 'There was a problem signing you in through Facebook. Please register or try signing in later.'
          redirect_to new_user_registration_url
        end 
    end
    def google_oauth2
      @user = User.create_from_google_data(request.env['omniauth.auth'])
      if @user.persisted?
        sign_in_and_redirect @user
      else
        flash[:error] = 'There was a problem signing you in through Google. Please register or try signing in later.'
        redirect_to new_user_registration_url
      end 
    end
end
