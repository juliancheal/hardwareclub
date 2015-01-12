module ApplicationHelper
  def videojs(*options, &blk)
    default_options = {
      controls: true,
      setup: "{}",
      preload: "auto"
    }
    options = default_options.merge(options.extract_options!)
    render partial: 'video/video', locals: { options: options }, &blk
  end
end
