class TutorsController < ApplicationController
  skip_before_action :set_current_user, only: [:create]
  before_action :set_tutor, only: [:show, :update]

  def show
    render json: @tutor, status: :ok
  end

  def create
    tutor = Tutor.new(tutor_params)
    if tutor.save
      render json: tutor, status: :ok
    else
      render json: tutor.errors.messages, status: :unprocessable_entity
    end
  end

  def update
    @tutor.attributes = tutor_params
    if @tutor.save
      render json: @tutor, status: :ok
    else
      render json: @tutor.errors.messages, status: :unprocessable_entity
    end
  end

  private
  def set_tutor
    @tutor = Tutor.find(params[:id])
  end

  def tutor_params
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
      :description,
      :price,
      :average
    )
  end
end
