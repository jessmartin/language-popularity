class CreateStackOverflowQuestions < ActiveRecord::Migration
  def self.up
    create_table :stack_overflow_questions do |t|
      t.integer :number_of_questions
      t.date :date
      t.integer :language_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :stack_overflow_questions
  end
end
