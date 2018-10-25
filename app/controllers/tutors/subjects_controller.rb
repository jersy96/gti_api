class Tutors::SubjectsController < ApplicationController
  before_action :set_tutor
  before_action :set_subjects

  def create
    @tutor.subjects << @subjects
    render json: ordered_subjects, status: :ok
  end

  def destroy
    @tutor.subjects.delete(@subjects)
    render json: ordered_subjects, status: :ok
  end

  private
  def set_tutor
    @tutor = Tutor.find(params[:tutor_id])
  end

  def set_subjects
    @subjects = params.require(:subjects)
    @subjects = [@subjects] unless @subjects.instance_of? Array
    @subjects.uniq!
    @subjects.map! do |subject_id|
      Subject.find(subject_id)
    end
  end

  def ordered_subjects
    @tutor.subjects.order(:name)
  end
end
