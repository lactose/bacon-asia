class AnswersController < Controller
  before_filter :find_answer

  def upvote
    @answer.upvote!
    redirect_to question_url(@answer.question)
  end

  private

  def find_answer
    if params[:id].present?
      @answer = Answer.find(params[:id])
    elsif params[:answer_id].present?
      @answer = Answer.find(params[:answer_id])
    else
      @answer = Answer.new
    end
  end
end
