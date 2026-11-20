class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone
      t.integer(:role, { null: false, default: 0 })
      t.string :password_digest, null: false
      t.boolean :active, null: false, default: true

      t.timestamps
    end
    # add_index( 表名,   列名,   选项          )
    add_index(:users, :email,  unique: true )
  end
end
