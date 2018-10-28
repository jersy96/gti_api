class SolicitudesController < ApplicationController
  before_action :set_solicitude, only: [:update]

  def index
    solicitudes = @current_user.solicitudes.order('created_at DESC')
    render json: solicitudes, status: :ok
  end

  def create
    solicitude = Solicitude.new(solicitude_params)
    solicitude.student_id = @current_user.id
    if solicitude.save
      render json: solicitude, status: :ok
    else
      render json: solicitude.errors.messages, status: :unprocessable_entity
    end
  end

  def update
    @solicitude.attributes = update_params
    if solicitude.save
      render json: solicitude, status: :ok
    else
      render json: solicitude.errors.messages, status: :unprocessable_entity
    end
  end

  private
  def set_solicitude
    @solicitude = Solicitude.find(params[:id])
  end

  def solicitude_params
    params.permit(
      :tutor_id,
      :solicitude_type,
      :payment_method,
      :state,
      :hours,
      :address,
      :date,
      :attendants,
      :description,
      :total_debt
    )
  end

  def update_params
    params.permit(
      :tutor_id,
      :solicitude_type,
      :payment_method,
      :state,
      :hours,
      :address,
      :date,
      :attendants,
      :description,
      :total_debt
    )
  end
end
