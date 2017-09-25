class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :worktitleReview #작업주제
      t.text :evalReview #개인평가
      t.float :satisForworkReview #작업물에 대한 만족도
      t.float :satisForworkerReview #작업자와의 호흡
      t.text :placeReview #작업 장소
      t.string :dayReview #날짜

      t.timestamps
    end
  end
end
