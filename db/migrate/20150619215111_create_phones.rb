class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :number
      t.integer :requests_count
    end
  end
end
