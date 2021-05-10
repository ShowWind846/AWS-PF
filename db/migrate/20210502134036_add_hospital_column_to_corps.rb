class AddHospitalColumnToCorps < ActiveRecord::Migration[5.2]
  def change
    add_column :corps, :hospital, :string, default: "未設定"
  end
end
