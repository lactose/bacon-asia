class QuestionsController < Controller
  before_filter :find_question

  def new; end

  def create
    @question = Question.create(params[:question])

    flash[:notice] = "Question asked."
    redirect_to questions_url
  end

  def index
    @questions = Question.trending
  end

  private

  def find_question
    if params[:id].present?
      @question = Question.find(params[:id])
    else
      @Question = Question.new
    end
  end
end
