class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:secret]
  
  # GET /accountsettings/profile
  def info
    @user = current_user 
  end

  def credit_card

  end

  def secret

  end


  # PATCH /accountsettings/profile
  def profile
    puts "----------------------------------"
    puts 'update'
    @user = current_user
    @user.first_name = user_params[:first_name]
    @user.last_name = user_params[:last_name]
    @user.phone = user_params[:phone]
    @user.job = user_params[:job]
    @user.company = user_params[:company]
    @user.description = user_params[:description]
    @user.website = user_params[:website]
    @user.address = user_params[:address]

    if @user.save
      flash[:success] = "Update user profile succesfully!"
      redirect_back(fallback_location: root_path)
    else
      @user.errors.full_messages.each do |message|
        flash[:error] = message
      end
      render :contact_info
    end

  end

  private
  def user_params
    params.require(:user).permit(
    :first_name, 
    :last_name, 
    :description, 
    :phone,
    :address,
    :avatar,
    :sex,
    :job,
    :company,
    :website
    )
  end
end
