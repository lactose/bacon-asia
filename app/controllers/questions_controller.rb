class QuestionsController < Controller
  include VotingController

  before_filter :find_question

  def index
    @questions = Question.popular
  end

  def new; end

  def create
    @question = Question.create(question_params)
    session[:question_ids] ||= []

    if current_user
      flash[:notice] = "Question asked."
    else
      session[:question_ids] << @question.id.to_s
      flash[:notice] = "Question asked. Sign in?"
    end

    redirect_to question_url(@question)
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
    if vote(@question)
      redirect_back_or question_url(@question)
    else
      redirect_to root_url
    end
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
    params.require(:question)
          .permit(:body)
          .merge(user: current_user)
  end

  def answer_params
    params.require(:answer)
          .permit(:body)
          .merge(user: current_user, question: @question)
  end
end
