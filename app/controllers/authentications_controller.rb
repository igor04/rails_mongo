class AuthenticationsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :create

  def index
    @authentications = current_user.authentications if current_user
  end
  
  def create
    omniauth = request.env["omniauth.auth"]

    authentication = Authentication.where(omniauth.slice(:provider, :uid)).first
    if authentication
      flash[:notice] = "Signed in successfully."
      sign_in_and_redirect(:user, authentication.user)
    elsif current_user
      current_user.authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'])
      flash[:notice] = "Authentication successful."
      redirect_to authentications_url
    else
      session[:omniauth] = omniauth.except('extra')
      flash[:notice] = "You don't have #{omniauth[:provider]} authentication!"
      redirect_to new_user_registration_url
    end
  end
  
  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = "Successfully destroyed authentication."
    redirect_to authentications_url
  end
end