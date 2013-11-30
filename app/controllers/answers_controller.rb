class AnswersController < Controller
  include VotingController

  before_filter :find_answer

  def upvote
    if vote(@answer)
      redirect_to question_url(@answer.question)
    else
      redirect_to questions_url
    end
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
