class QuestionsController < Controller
  before_filter :find_question

  def new; end

  def create
    @question = Question.create(question_params)

    flash[:notice] = "Question asked."
    redirect_to questions_url
  end

  def index
    @questions = Question.trending
  end

  def upvote
    @question.upvote!
    redirect_to questions_url
  end

  def show; end

  private

  def find_question
    if params[:id].present?
      @question = Question.find(params[:id])
    elsif params[:question_id].present?
      @question = Question.find(params[:question_id])
    else
      @question = Question.new
    end
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
