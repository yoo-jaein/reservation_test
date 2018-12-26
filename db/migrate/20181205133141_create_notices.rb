class CreateNotices < ActiveRecord::Migration[5.0]
  def change
    # 컴퓨터학부 공지사항 모델 Notice
    create_table :notices do |t|
      t.string :title     # 공지사항의 제목
      t.string :link      # 공지사항의 링크
      t.timestamps
    end
  end
end
