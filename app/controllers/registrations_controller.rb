class RegistrationsController < Devise::RegistrationsController
  def create
    super
    if @user.save && session[:omniauth]
      @user.authentications.create(:provider => session[:omniauth]['provider'], :uid => session[:omniauth]['uid'])
    end
    session[:omniauth] = nil unless @user.new_record?
  end
  
  private
  
  def build_resource(*args)
    super
    if session[:omniauth] and session[:omniauth]['info']['email']
      @user.email = session[:omniauth]['info']['email'] if @user.email.blank?
      @user.nickname = session[:omniauth]['info']['email'][/\w*/] if @user.nickname.blank? 
    end
  end
end