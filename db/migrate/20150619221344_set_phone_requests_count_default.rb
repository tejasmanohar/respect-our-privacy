class SetPhoneRequestsCountDefault < ActiveRecord::Migration
  def change
    change_column_default :phones, :requests_count, 0
  end
end
