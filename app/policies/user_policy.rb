class UserPolicy
  attr_reader :user

  def initialize(user,klass=nil)
    @user = user
  end

  def index?
    is_in_control?
  end
  
  def show?
    is_in_control?
  end
  
  def edit?
    is_in_control?
  end
  
  def update?
    is_in_control?
  end
  
  private
  def is_in_control?
    !!( @user && @user.admin? )
  end
end