class AddSubjectIdToAuthorSubjects < ActiveRecord::Migration[5.2]
  def change
    add_column :author_subjects, :subject_id, :integer
  end
end
