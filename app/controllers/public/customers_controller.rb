class Public::CustomersController < ApplicationController

  def show
    @customer=current_customer
  end

  def edit
  end

  def confirm

  end

  def withdrawal
    @customer = current_customer
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end


end
