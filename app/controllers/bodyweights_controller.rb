class BodyweightsController < ApplicationController
  before_action :authenticate_user!
  before_action :not_authorized_user

  def index
    @bodyweight = Bodyweight.new
    @user = User.find(params[:user_id])
    @bodyweights = @user.bodyweights.order(day: :asc).last(7)
  end

  def create
    @bodyweight = Bodyweight.new(bodyweight_params)
    if @bodyweight.save
      redirect_to user_bodyweights_path, notice: '体重を記録しました!'
    else
      redirect_to user_bodyweights_path, alert: '体重の記録に失敗しました。日付と体重を正しく入力してください(既に記録している日付は選択できません)'
    end
  end

  def destroy
    bodyweight = Bodyweight.find_by(id: params[:id], user_id: params[:user_id])
    bodyweight.destroy
    redirect_to user_bodyweights_path, notice: '体重記録を削除しました!'
  end

    private

    def bodyweight_params
      params.require(:bodyweight).permit(:bodyweight, :day).merge(user_id: current_user.id)
    end

    def not_authorized_user
      user = User.find(params[:user_id])
      if user.id != current_user.id
        redirect_to user_path(current_user), alert: "アクセス権限がありません"
      end
    end
end
