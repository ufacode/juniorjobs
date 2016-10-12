class AddHideToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :hide, :boolean, :default => false
  end
end
