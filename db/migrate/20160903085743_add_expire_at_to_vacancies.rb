class AddExpireAtToVacancies < ActiveRecord::Migration[5.0]
  def change
    add_column :vacancies, :expire_at, :DateTime
  end
end
