class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.references :users
      t.datetime :payed_at

      t.timestamp
    end
  end
end
