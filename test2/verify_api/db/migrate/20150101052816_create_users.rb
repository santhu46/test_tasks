class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.boolean :status,default: false
      t.timestamps
    end
  end
end
