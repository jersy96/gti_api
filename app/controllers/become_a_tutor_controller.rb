class BecomeATutorController < ApplicationController
  def update
    if @current_user.type == 'Student'
      tutor = @current_user.become_tutor(tutor_params)
      if tutor.valid?
        render json: tutor, status: :ok
      else
        render json: tutor.errors.messages, status: :unprocessable_entity
      end
    else
      render json: {student: I18n.t('errors.messages.not_a_student')}, status: :unprocessable_entity
    end
  end

  private
  def tutor_params
    params.require(:tutor_attributes).permit(
      :description,
      :price,
      :average
    )
  end
end
