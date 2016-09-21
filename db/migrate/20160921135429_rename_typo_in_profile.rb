class RenameTypoInProfile < ActiveRecord::Migration[5.0]
  def change
    rename_column :profiles, :descriprion, :description
  end
end
