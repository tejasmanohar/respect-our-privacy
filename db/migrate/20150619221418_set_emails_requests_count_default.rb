class SetEmailsRequestsCountDefault < ActiveRecord::Migration
  def change
    change_column_default :emails, :requests_count, 0
  end
end
