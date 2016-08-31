class ChangesVacancyColmns < ActiveRecord::Migration[5.0]
  def change
  	change_column :vacancies, :expire, :integer
  end
end
