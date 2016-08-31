class AddExpireColumnsToVacancies < ActiveRecord::Migration[5.0]
  def change
  	add_column :vacancies, :expire, :integer
  end
end
