class RegistrationsController < Devise::RegistrationsController
  def create
    super
    @user.save!
    @user.authentications.create(:provider => session[:omniauth]['provider'], :uid => session[:omniauth]['uid'])
    session[:omniauth] = nil unless @user.new_record?
  end
  
  private
  
  def build_resource(*args)
    super
    if session[:omniauth]
      @user.email = session[:omniauth]['info']['email'] if @user.email.blank?
    end
  end
end