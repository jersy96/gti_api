class SolicitudeSerializer < ActiveModel::Serializer
  attributes :id, :solicitude_type, :state, :hours, :address, :date, :attendants, :student, :tutor, :description, :total_debt

  def date
    I18n.l(object.date)
  end

  def student
    StudentSerializer.new(object.student).as_json[:student]
  end

  def tutor
    TutorSerializer.new(object.tutor).as_json[:tutor]
  end
end
