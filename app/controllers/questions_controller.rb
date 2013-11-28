class QuestionsController < Controller
  before_filter :find_question

  def index
    @questions = Question.trending
  end

  def new; end

  def create
    @question = Question.create(question_params)

    flash[:notice] = "Question asked."
    redirect_to questions_url
  end

  def show; end

  def add_answer
    @answer = @question.answers.build(answer_params)

    if @answer.save
      redirect_to question_url(@question)
    else
      render :show
    end
  end

  def upvote
    @question.upvote!
    redirect_to questions_url
  end

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

  def answer_params
    params.require(:answer).permit(:body)
  end
end
