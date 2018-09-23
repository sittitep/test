class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :txref
      t.string :type
      t.string :asset
      t.integer :amount
      t.references :user, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
