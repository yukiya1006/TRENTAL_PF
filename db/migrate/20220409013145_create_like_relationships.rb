class CreateLikeRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :like_relationships do |t|
      t.integer :liker_id
      t.integer :liked_id

      t.timestamps
    end
  end
end
