class CreateSubjectsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |s|
     s.string :name
   end
  end
end
