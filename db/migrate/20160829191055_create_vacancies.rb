class CreateVacancies < ActiveRecord::Migration[5.0]
  def change
    create_table :vacancies do |t|
      t.string :name
      t.string :kind
      t.string :description
      t.decimal :money_from
      t.decimal :money_to
      t.string :location
      t.Boolean :remote
      t.DateTime :expire_at
      t.string :company
      t.string :site
      t.integer :phone
      t.string :contact_fio
      t.integer :user_id

      t.timestamps
    end
  end
end
