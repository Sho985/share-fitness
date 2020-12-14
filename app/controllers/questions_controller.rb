class QuestionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to questions_path, notice: '質問を投稿しました'
    else
      render 'new'
    end
  end

  private
    def question_params
      params.require(:question).permit(:title, :category ,:question_content, :question_image).merge(user_id: current_user.id)
    end
end
