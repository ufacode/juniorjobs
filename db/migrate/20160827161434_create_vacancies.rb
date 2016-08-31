class CreateVacancies < ActiveRecord::Migration[5.0]
  def change
    create_table :vacancies do |t|
    	t.string :name
    	t.string :kind
    	t.text   :description
    	t.string :location
    	t.boolean :remote
    	t.string :company
    	t.string :site
    	t.string :phone
    	t.string :contact_to
    	t.integer :user_id

      t.timestamps
    end
  end
end
