class AddTitliToTags < ActiveRecord::Migration[7.2]
  def change
    add_column :tags, :title, :string
  end
end
