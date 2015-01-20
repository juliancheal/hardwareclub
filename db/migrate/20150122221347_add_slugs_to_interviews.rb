class AddSlugsToInterviews < ActiveRecord::Migration
  def change
    add_column :interviews, :slug, :string, unique: true
  end
end
