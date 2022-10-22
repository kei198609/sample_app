class SessionsController < ApplicationController
  # GET /login
  def new
  end
 # POST /login
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        message  = "アカウントが有効化されていません"
        message += "メールの有効化リンクを確認してください"
        flash[:warning] = message
        redirect_to root_url
      end
    else
      # エラーメッセージを作成する
      flash.now[:danger] = "メールアドレスとパスワードの組み合わせが無効です"
      render 'new'
    end
  end
  

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end