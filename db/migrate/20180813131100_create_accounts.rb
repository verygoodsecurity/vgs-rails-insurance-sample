class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :address
      t.string :ssn
      t.string :income
      t.bigint :quote

      t.timestamps
    end
  end
end
