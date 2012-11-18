class ApplicationController < ActionController::Base
  protect_from_forgery
    
  def not_found
    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404.html", :status => :not_found }
      format.xml { head :not_found }
      format.any { head :not_found }
    end
  end
  
  def unauthorized
    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/401.html", :status => :unauthorized }
      format.xml { head :unauthorized }
      format.any { head :unauthorized }
    end
  end
  
  #BEGIN COISAS DO LOGIN
  helper_method :current_user_session, :current_user

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  #END COISAS DO LOGIN
end
