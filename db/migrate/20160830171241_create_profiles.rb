class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :fio
      t.string :name
      t.string :descriprion
      t.decimal :money_from
      t.decimal :money_to
      t.string :location
      t.string :category
      t.string :expectations
      t.string :skype
      t.string :site
      t.string :linkedin

      t.timestamps
    end
  end
end
