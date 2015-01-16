class EpisodePolicy
  attr_reader :user, :episode

  def initialize(user, episode)
    @user = user
    @episode = episode
  end

  def index?
    is_in_control?
  end

  def show?
    episode.published? || is_in_control?
  end

  def feed?
    episode.published?
  end

  def edit?
    is_in_control?
  end

  def create?
    is_in_control?
  end

  def update?
    is_in_control?
  end

  def destroy?
    is_in_control?
  end

  private
  def is_in_control?
    !!( @user && @user.admin? )
  end
end
