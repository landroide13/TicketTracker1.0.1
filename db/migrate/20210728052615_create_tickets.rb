class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.text :description
      t.string :response
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
