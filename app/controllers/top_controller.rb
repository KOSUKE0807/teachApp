class TopController < ApplicationController
  def home
    @center_date = Date.new(2021, 1, 16)
    @date = @center_date - Date.current
    @date_of_examination = @date.to_i
    
    # @scores = []
    # @type_scores = {}
    
    # @type_names = TestType.all
    
    # @test_types = TestType.all
    
    # TestType.find_by(id: 1).tests.each do |test|
    #     test.scores.each do |score|
    #       @scores.push(score.score)
    #     end
    # end
    # @test_types.each do |type|
    #   type.tests.each do |test|
    #     test.scores.each do |score|
    #       @scores.push(score.score)
    #     end
    #   end
    #   @type_scores[type.id] = @scores
    #   @scores = []
    # end

    
    # @total = 0
    # @type_ave_scores = {}
    # @type_scores.each do |i, val|
    #   val.each do |score|
    #     @total = @total + score
    #   end
    #   @ave_score = 1 if @total == 0 || val.length == 0
    #   @ave_score = @total / val.length if @ave_score != 1
    #   @type_ave_scores[i] = @ave_score
    #   @total = 0
    #   @ave_score = 0
    # end
    # @test_types[1].each do |s|
    #   @total = @total + s
    # end
    # @test_types = {}
    # @test_types[1] = [2,2,2,2,2,2]
    # @test_types[2] = [2,2,2,2,2,2]
    # @test_types[3] = [2,2,2,2,2,2]
    # @test_types[4] = [2,2,2,2,2,2]
    # @ave_score = @total / 1
    
    # @ranking_scores =  @scores.sort.reverse
    
    @test_type_names = []
    TestType.all.each do |type|
      @test_type_names.push(type.name)
    end
    
    # テストタイプごとのスコアを全件取得
    @all_scores = {}
    @tmp_scores = []
    TestType.all.each do |type|
      type.tests.each do |test|
        test.scores.each do |score|
          @tmp_scores.push(score.score)
        end
      end
      @all_scores[type.id] = {}
      @all_scores[type.id][:scores] = @tmp_scores
      @tmp_scores = []
    end
    
    # テストタイプごとの平均点を計算
    @total = 0
    @all_scores.each do |type_id, hashs|
      hashs.each do |k,scores|
        scores.each do |s|
          @total += s
        end
      end
      @total = 1 if @total == 0 
      @all_scores[type_id][:scores] = [20, 20, 20] if @all_scores[type_id][:scores].length == 0
      @all_scores[type_id][:ave_score] = @total / @all_scores[type_id][:scores].length if @total != 0 
      @total = 0
    end
    
    # テストタイプごとのランキングを配列として取得
    @all_scores.each do |type_id, hash|
      @all_scores[type_id][:ranking] = hash[:scores].sort.reverse
    end
  end
  
end

