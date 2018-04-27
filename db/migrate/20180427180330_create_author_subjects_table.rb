class CreateAuthorSubjectsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :author_subjects do |i|
      i.integer :author_id
      i.integer :book_id
    end
  end
end
