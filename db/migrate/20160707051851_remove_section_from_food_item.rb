class RemoveSectionFromFoodItem < ActiveRecord::Migration[5.0]
  def change
    remove_column :food_items, :section, :string
    add_reference :food_items, :section, index: true
  end
end
