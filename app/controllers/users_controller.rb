class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    if @user.nil?
      redirect_to meetings_path, notice: "User Not Found"
    end
  end
end
