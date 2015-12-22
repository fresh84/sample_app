class UsersController < ApplicationController
  def new
    @titre = "Inscription"
    @user = User.new
#    @user = User.new(user_params) ## Invoke user_params method
#    if @user.save
#      redirect_to @user, notice: 'User was successfully created.' 
#    else
#      render action: 'new'
#    end       
  end

  def create
    @user = User.new(user_params) ## Invoke user_params method
    if @user.save
      flash[:success] = "Bienvenue dans l'Application Exemple!"
      redirect_to @user
    else
      @titre = "Inscription"
      render 'new'
    end
  end
  
  def show
    @user = User.find(params[:id])
    @titre = @user.nom
  end

  private
  ## Strong Parameters 
  def user_params
    params.require(:user).permit(:nom, :email, :password, :password_confirmation)
  end
end
