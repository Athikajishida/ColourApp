class AddSlugToColours < ActiveRecord::Migration[7.1]
  def change
    add_column :colours, :slug, :string
    add_index :colours, :slug, unique: true
  end
end
