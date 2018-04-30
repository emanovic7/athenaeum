class BookSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :book_subjects do |y|
      y.integer :book_id
      y.integer :subject_id
    end
  end
end
