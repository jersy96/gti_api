class StudentsController < ApplicationController
  skip_before_action :set_current_user, only: [:create]
  before_action :set_student, only: [:update]

  def create
    student = Student.new(student_params)
    if student.save
      render json: student, status: :ok
    else
      render json: student.errors.messages, status: :unprocessable_entity
    end
  end

  def update
    @student.attributes = student_params
    if @student.save
      render json: @student, status: :ok
    else
      render json: @student.errors.messages, status: :unprocessable_entity
    end
  end

  private
  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.permit(
      :email,
      :password,
      :first_name,
      :second_name,
      :first_lastname,
      :second_lastname,
      :address,
      :phone,
      :cellphone,
      :university,
      :career,
      :profile_picture
    )
  end
end
