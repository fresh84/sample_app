class UsersController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
  before_filter :correct_user, :only => [:show, :edit, :update]
  before_filter :admin_user,   :only => :destroy
      
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
      sign_in @user
      flash[:success] = "Bienvenue dans l'Application Exemple !"
      redirect_to @user
    else
      @titre = "Inscription"
      render 'new'
    end
  end
  
  def index
    @titre = "Tous les utilisateurs"
    @users = User.paginate(:page => params[:page])
  end

  def show
    @user = User.find(params[:id])
    @titre = @user.nom
  end
  
  def edit
    @user = User.find(params[:id])
    @titre = "Édition profil"
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profil actualisé."
      redirect_to @user
    else
      @titre = "Édition profil"
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Utilisateur supprimé."
    redirect_to users_path
  end


  private
  ## Strong Parameters 
  def user_params
    params.require(:user).permit(:nom, :email, :password, :password_confirmation)
  end
  def authenticate
    deny_access unless signed_in?
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
  def admin_user
    redirect_to(root_path) unless current_user_is_admin?
  end



end
