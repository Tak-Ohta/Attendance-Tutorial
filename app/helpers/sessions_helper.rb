module SessionsHelper
  
  # ユーザーのブラウザ内にある⼀時的cookiesに暗号化済みのuser.id が⾃動で⽣成される。
  def log_in(user)
    session[:user_id] = user.id
  end
  
  # 現在ログイン中のユーザーがいる場合、オブジェクトを返す。
  def current_user
    if session[:user_id]
      # current_userメソッド：サインインしているユーザーを取得する
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
  
  # 現在ログイン中のユーザーがいればtrue、そうでなければfalseを返す
  def logged_in?
    !current_user.nil?
  end

  # セッションと@current_userを破棄する
  def logout
    session.delete(:user_id) # セッションからユーザーIDを削除するdeleteメソッド
    @current_user = nil  # 変数@current_userにnilを代入してユーザーオブジェクトを削除
  end
  
end
