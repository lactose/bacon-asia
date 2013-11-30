class SessionsController < Controller
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    user.associate_questions(session[:question_ids]) if session[:question_ids].present?
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
