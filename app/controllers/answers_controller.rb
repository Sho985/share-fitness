class AnswersController < ApplicationController
  before_action :authenticate_user!

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)
    if @answer.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    Answer.find_by(question_id: params[:question_id],id: params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end

    private

    def answer_params
      params.require(:answer).permit(:answer_content).merge(user_id: current_user.id)
    end
end
