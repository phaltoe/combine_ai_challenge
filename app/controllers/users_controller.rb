# frozen_string_literal: true

# User Controller
class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    redirect_to meetings_path, notice: 'User Not Found' if @user.nil?
  end
end
