class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      # チェックボックスでログインの保持を選択する
      params[:session][:remember_me] == '1' ? remember(user) : forget(user) # 三項演算子 [条件式] ? [trueの場合実行される処理] : [falseの場合実行される処理]
      redirect_back_or user
    else
      flash.now[:danger] = "認証に失敗しました。"
      render :new
    end
  end
  
  def destroy
    # ログイン中の場合のみログアウト処理を実行する。
    log_out if logged_in?
    flash[:success] = "ログアウトしました"
    redirect_to root_url
  end
end
