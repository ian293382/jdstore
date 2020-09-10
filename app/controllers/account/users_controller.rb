class Account::UsersController < ApplicationController

  before_action :authenticate_user!

  def edit
    @user = current_user #編輯當前使用者資料
  end

  def update
    @user = current_user
    @user.update(user_params)
    if @user.save
      redirect_to edit_account_user_path(current_user)
      flash[:notice] = '用戶資料更新成功'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :address)
  end
end
