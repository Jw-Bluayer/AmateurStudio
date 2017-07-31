# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

password = 'pass123'
  User.create(
    email: "user-1@example.com",
    password: password,
    password_confirmation: password,
    name: "김덕구",
    place: "인천",
    introduction: "하이~~~"
  )

  User.create(
    email: "user-2@example.com",
    password: password,
    password_confirmation: password,
    name: "김철수",
    place: "경기도",
    introduction: "우쮸쮸~~~"
  )

  User.create(
    email: "user-3@example.com",
    password: password,
    password_confirmation: password,
    name: "한정민",
    place: "분당",
    introduction: "늬늬~"
  )

  User.create(
    email: "user-4@example.com",
    password: password,
    password_confirmation: password,
    name: "인간미",
    place: "덕소",
    introduction: "호우!~"
  )

  User.create(
    email: "user-5@example.com",
    password: password,
    password_confirmation: password,
    name: "김밍밍",
    place: "상하이",
    introduction: "헤에?!~~"
  )
