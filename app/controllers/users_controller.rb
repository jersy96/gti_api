class UsersController < ApplicationController
  rescue_from Exceptions::UnallowedRole, with: :if_unallowed_role

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :ok
    else
      render json: user.errors.messages, status: :unprocessable_entity
    end
  end

  private
  def user_params
    @permitted_params =  params.require(:user).permit(
      :email,
      :password,
      :role,
      :first_name,
      :second_name,
      :first_lastname,
      :second_lastname,
      :address,
      :phone,
      :cellphone
    )
    validate_allowed_values
  end

  def validate_allowed_values
    role = @permitted_params[:role]
    raise Exceptions::UnallowedRole.new(role) if User.roles.keys.include?(role) and not RolesCategories::NOT_ADMIN.include?(role)
    @permitted_params
  end

  def if_unallowed_role(exception)
    render json: {unallowed_role: exception.message}
  end
end
