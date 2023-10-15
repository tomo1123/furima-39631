class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: 'ユーザー登録が完了しました。'
    else
      render :new
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      redirect_to root_path, notice: 'ユーザーを削除しました。'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :last_name, :first_name, :last_name_kana, :first_name_kana,:birthday)
  end
end
