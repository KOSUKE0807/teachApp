class ScoresController < ApplicationController
  def create
    @score = Score.new(score_params)
    if @score.save
      flash[:notice] = "テスト追加しました。"
      redirect_to @score.student
    else
      flash[:notice] = "テスト追加できませんでした。"
      redirect_to @score.student
    end
  end

  def destroy
    @score = Score.find(params[:id])
    test_id = @score.test_id
    @score.destroy
    redirect_to test_path(test_id)
  end
  
  private
  def score_params
    params.require(:score).permit(:score, :student_id, :test_id)
  end
end
