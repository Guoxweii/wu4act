class CreatePost < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.string :deleted
    end
  end
end
