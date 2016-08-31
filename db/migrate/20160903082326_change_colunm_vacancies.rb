class ChangeColunmVacancies < ActiveRecord::Migration[5.0]
  def change_table vacancies
  	rename :expire, :expire_at
  end
end
