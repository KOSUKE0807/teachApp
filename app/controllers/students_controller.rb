class StudentsController < ApplicationController
  def new
    @student= Student.new
    @teachers = Teacher.all
  end

  def create
    @student= Student.new(student_params)
    if @student.save
      redirect_to stu_mypage_path
      session[:stu_id] = @student.id
    else
      redirect_to new_student_path
    end
  end
  

  def show
    @student = Student.find_by(id: params[:id])
    @types = Test
    @uniq_test_scores = {}
    @temp_scores = []
    
    
    
    TestType.all.each do |type|
      @student.scores.each do |score|
        if type.id == score.test.test_type_id
          @temp_scores.push(score.score)
        end
      end
     
      @uniq_test_scores[type.id] = @temp_scores
      @temp_scores = []
    end
    @score = @student.scores.new
    gon.data = []
    @n = 0
    @uniq_test_scores[1].each do |score|
      gon.data.push(score)
      @n = @n + 1
    end
  end
  
  def mypage
    @student = Student.find(params[:id])
    @test_types = TestType.all
    @test_cards = {}
    @tmp_array = []
    @count = 0
    @test_types.each do |type|
      @test_cards[type.id] = []
    end
    @test_types.each do |type|
      type.tests.each do |test|
        test.scores.each do |score|
          if score.student_id == @student.id
            @tmp_array = [test.test_date, score.score]
            @test_cards[type.id].push({date: @tmp_array[0], score: @tmp_array[1]}) 
            @tmp_array = []
            @count = test
          end
        end
      end
    end
  end
  
  private
  def student_params
    params.require(:student).permit(:name,:teacher_id, :password, :password_confirmation)
  end
   
  
end
