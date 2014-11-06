class AddSlugsToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :slug, :string, unique: true
  end
end
