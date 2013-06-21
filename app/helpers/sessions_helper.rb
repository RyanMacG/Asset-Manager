#permanent sets cookie expiration to 20 years by using a
#"time helper", part of a  series of rails methods that are added to
#the Fixnum class. this could be manually written as:
#cookies[:remember_token] = { value: user.remember_token,
#                             expires: 20.years.from_now.utc }
#but that's much uglier and verbose.
#But wait you say; "storing authentication in cookies is dangerous what
#about someone using Firesheep and hijacking another users session?!"
#OMFGZ you're right...maybe that's why I added in site wide SSL already :P

module SessionsHelper
  
  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token 
    self.current_user = user
  end
  
  def signed_in?
    !current_user.nil? #! "bang/not operator" so if current user is not nil
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    @current_user ||= user_from_remember_token # ||= "or equals"
  end
  
  def current_user?(user)
    user == current_user
  end
  
  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_path, notice: "Please sign in"
    end
  end
  
  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end
  
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end
  
  def store_location
    session[:return_to] = request.fullpath
  end
  
  private
    
    def user_from_remember_token
      remember_token = cookies[:remember_token]
      User.find_by_remember_token(remember_token) unless remember_token.nil?
    end
    
    def clear_return_to
      session.delete(:return_to)
    end
end