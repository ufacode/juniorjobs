class ChangeTableVacancies < ActiveRecord::Migration[5.0]
  def change
  	change_column :vacancies, :expire, :DateTime
  end
end
