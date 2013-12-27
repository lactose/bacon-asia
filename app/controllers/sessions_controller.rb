class SessionsController < Controller
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    claim_questions(user)
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  private

  def claim_questions(user)
    Question.any_in(id: session[:question_ids])
            .update_all(user_id: user.id)
  end
end
