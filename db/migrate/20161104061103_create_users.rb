class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest
      t.string :firstname, null: false
      t.string :lastname
      t.string :username, null: false
      t.boolean :is_admin, default: false
      t.integer :question1_id
      t.integer :question2_id
      t.string :answer_q1, null: false
      t.string :answer_q2, null: false

      t.timestamps null: false
    end
    add_index :users, :email, unique: true
    add_index :users, :username, unique: true
    add_foreign_key :users, :security_questions, column: :question1_id
    add_foreign_key :users, :security_questions, column: :question2_id
  end
end
