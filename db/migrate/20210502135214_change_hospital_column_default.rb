class ChangeHospitalColumnDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:corps, :hospital, from: "未設定", to: nil)
  end
end
