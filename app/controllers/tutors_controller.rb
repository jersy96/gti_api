class TutorsController < ApplicationController
  rescue_from Exceptions::UnknownFilterType, with: :if_unknown_filter
  skip_before_action :set_current_user, only: [:create]
  before_action :set_tutor, only: [:show, :update]

  def index
    tutors = if index_params.present?
      tf = TutorFilter.new
      tf.filter(index_params[:filters])
    else
      Tutor.all
    end
    render json: tutors, status: :ok
  end

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
      :average,
      :profile_picture,
      :firebase_token
    )
  end

  def index_params
    params.permit(
      filters:[
        :type,
        content:[
          :value,
          :price1,
          :price2
        ]
      ]
    )
  end

  def if_unknown_filter(exception)
    render json: {filter_type: exception.message}
  end
end
