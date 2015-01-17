class CreateWatchlaters < ActiveRecord::Migration
  def change
    create_table :watchlaters do |t|
      t.references :user
      t.references :episode
      
      t.timestamps
    end
  end
end
