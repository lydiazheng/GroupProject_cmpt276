class CreateSecurityQuestions < ActiveRecord::Migration
  def change
    create_table :security_questions do |t|
      t.string :question

      t.timestamps null: false
    end
  end
end
