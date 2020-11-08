class ApplicationController < ActionController::Base
  protected
  #deviseにname,self_introduction,imageカラムを追加
  def configure_permitted_parameters
    added_attrs = [ :email, :name, :self_introduction,:password, :password_confirmation, :image ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
end
