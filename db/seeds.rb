# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# TestType.create([
#         {name: "英文法テスト"},
#         {name: "標準英単語テスト"},
#         {name: "発展英単語テスト"},
#         {name: "基礎英単語テスト"}
#     ])

Score.create([
        {score: 90, student_id: 1, test_id: 151 },
        {score: 80, student_id: 1, test_id: 151 },
        {score: 65, student_id: 1, test_id: 151 },
        {score: 85, student_id: 1, test_id: 151 },
        {score: 45, student_id: 1, test_id: 151 },
        {score: 75, student_id: 1, test_id: 151 },
        {score: 70, student_id: 1, test_id: 151 },
        {score: 64, student_id: 1, test_id: 151 },
        {score: 54, student_id: 1, test_id: 151 },
        {score: 65, student_id: 1, test_id: 151 },
        {score: 65, student_id: 1, test_id: 151 },
        {score: 86, student_id: 1, test_id: 151 },
        {score: 65, student_id: 1, test_id: 151 },
        {score: 68, student_id: 1, test_id: 151 },
        {score: 89, student_id: 1, test_id: 151 },
        {score: 65, student_id: 1, test_id: 151 },
        {score: 78, student_id: 1, test_id: 151 },
        {score: 86, student_id: 1, test_id: 151 },
        ])

# types = [25,26,27,28]

# Student.create(name: "halhal", password: "password", password_confirmation: "password", teacher_id: 1)

# 30.times do |i|
#     Test.create(
#         name: "#{i+1}回目のテストです", test_type_id: types[(i % 4) + 25], test_date: "2020-01-#{i+1}" 
#     )
# end

# 30.times do |i|
#     s = 60 + i
#     t = 16 + i
#     Score.create(
#         score: s, student_id: 1, test_id: t
#     )
# end

# (10..20).each do |i|
#     Message.create({
#         title: "title #{i}", detail: "#{i}日までの宿題です", date: "2020/02/#{i}", student_id: 1
#     })
# end