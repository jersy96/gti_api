class CreateJoinTableSubjectTutor < ActiveRecord::Migration[5.1]
  def change
    create_join_table :subjects, :tutors do |t|
      # t.index [:subject_id, :tutor_id]
      # t.index [:tutor_id, :subject_id]
    end
  end
end
