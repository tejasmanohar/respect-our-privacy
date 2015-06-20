class DropColumns < ActiveRecord::Migration
  def change
    drop_table :phones
    drop_table :emails
  end
end
