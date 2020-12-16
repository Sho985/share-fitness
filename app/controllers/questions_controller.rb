class QuestionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = Question.all.ransack(params[:q])
    @questions = @q.result(distinct: true)
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

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to questions_path, notice: '更新が完了しました！'
    else
      render 'edit'
    end
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    redirect_to questions_path, notice: '削除が完了しました！'
  end

  private
    def question_params
      params.require(:question).permit(:title, :category ,:question_content, :question_image).merge(user_id: current_user.id)
    end
end
