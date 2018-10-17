class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :crono_jobs, :healthys, :healthy
  end
end
