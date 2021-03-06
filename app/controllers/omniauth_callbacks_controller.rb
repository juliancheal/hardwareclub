class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # def self.provides_callback_for(provider)
  #   class_eval %Q{
  #     def #{provider}
  #       @user = User.find_for_oauth(env["omniauth.auth"], current_user)
  # 
  #       if @user.persisted?
  #         sign_in_and_redirect @user, event: :authentication
  #         set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
  #       else
  #         session["devise.#{provider}_data"] = env["omniauth.auth"]
  #         redirect_to new_user_registration_url
  #       end
  #     end
  #   }
  # end
  # 
  # [:twitter, :facebook, :github].each do |provider|
  #   provides_callback_for provider
  # end
  skip_before_filter :authenticate_user!
	def all
		p env["omniauth.auth"]
		user = User.find_for_oauth(env["omniauth.auth"], current_user)
		if user.persisted?
			sign_in_and_redirect(user)
		else
			session["devise.user_attributes"] = user.attributes
			redirect_to new_user_registration_url
		end
	end

	  def failure
      #handle you logic here..
      #and delegate to super.
      super
   end


	alias_method :facebook, :all
	alias_method :twitter, :all
	alias_method :linkedin, :all
	alias_method :github, :all
	alias_method :passthru, :all
	alias_method :google_oauth2, :all

  def after_sign_in_path_for(resource)
    if resource.email_verified?
      super resource
    else
      finish_signup_path(resource)
    end
  end
end