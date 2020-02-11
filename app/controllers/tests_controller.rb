class TestsController < ApplicationController
  def index
    @tests = Test.all
    @score = Score.new
  end

  def show
    @test = Test.find_by(id: params[:id])
    @score = Score.new(test_id: @test.id)
    @students = Student.where(teacher_id: current_teacher.id)
    @scores = Score.where(test_id: @test.id)
    @total_score = 0
    @scores.each do |s|
      @total_score = @total_score + s.score
    end
    if @total_score != 0 && @scores.count != 0
       @ave_score = @total_score / @scores.count
    end
  end

  def new
    @test = Test.new(flash[:test])
    @types = TestType.all
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to tests_path
    else
      redirect_to new_test_path, flash: {
        test: @test
      }
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  def test_params
    params.require(:test).permit(:name, :test_type_id, :test_date)
  end
end
