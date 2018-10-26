class RatingsController < ApplicationController
  def create
    rating = Rating.new(rating_params)
    if rating.save
      render json: rating, status: :ok
    else
      render json: rating.errors.messages, status: :unprocessable_entity
    end
  end

  private
  def rating_params
    params.permit(
      :student_id,
      :tutor_id,
      :score,
      :comment
    )
  end
end
