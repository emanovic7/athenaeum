class CreateBooksTable < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |b|
      b.string :name
      b.integer :author_id
      b.integer :subject_id
    end
  end
end
