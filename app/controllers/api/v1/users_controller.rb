class Api::V1::UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    @user.api_key = SecureRandom.hex(10)
    @user.save
    user = UserFacade.new(@user)
    render json: UserSerializer.new(user)
  end


  private

  def user_params
    params.permit('email', 'password')
  end

end