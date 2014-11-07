class AddPublishedToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :published, :boolean
  end
end
