class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    # 예약에 사용되는 모델 Post
    create_table :posts do |t|
      t.string :classroom   # 강의실 정보
      t.text :starttime     # 예약 시작 시간
      t.text :endtime       # 예약 종료 시간
      t.integer :user_id    # 예약 신청자의 id
      t.string :content     # 간단한 설명
      t.integer :people     # 사용 인원
      t.datetime :date      # 예약 날짜
      t.integer :status     # 처음엔 0, 만약 수락된다면 1이고 거절당하면 2의 상태.
      t.timestamps null: false
    end
  end
end
