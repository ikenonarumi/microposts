class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :user, null:false
      t.references :micropost, null:false
      t.timestamps null: false
      
      t.index [:user_id, :micropost_id], unique: true
    end
  end
end
