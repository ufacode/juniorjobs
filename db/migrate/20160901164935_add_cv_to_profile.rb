class AddCvToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :cv, :string
  end
end
