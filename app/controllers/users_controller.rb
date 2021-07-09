class UsersController < ApplicationController
  def index
    @users=User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid? && @user.save
      redirect_to users_path
      flash[:success]="user created successfully"
    else
      flash[:error]="fill all the fields"
      redirect_to :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.valid?
      redirect_to user_path(@user)
    else
    flash[:error]="fill all the fields"
    redirect_to :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :age)
  end

end
