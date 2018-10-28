class RatingsController < ApplicationController
  def create
    rating = Rating.new(rating_params)
    rating.student_id = @current_user.id
    if rating.save
      render json: rating, status: :ok
    else
      render json: rating.errors.messages, status: :unprocessable_entity
    end
  end

  private
  def rating_params
    params.permit(
      :tutor_id,
      :score,
      :comment
    )
  end
end
