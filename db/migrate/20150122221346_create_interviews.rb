class CreateInterviews < ActiveRecord::Migration
  def change
    create_table :interviews do |t|
      t.string :name
      t.text :description
      t.datetime :published_at
      t.integer :seconds

      t.timestamps
    end
  end
end
