class CreateJoinTableCategoryActivity < ActiveRecord::Migration[6.1]
  def change
    create_join_table :categories, :activities do |t|
      t.index [:category_id, :activity_id]
    end
  end
end
