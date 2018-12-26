class CreateReports < ActiveRecord::Migration[5.0]
  def change
    # 신고 및 건의사항 모델 Report
    create_table :reports do |t|
      t.string :title     # 제목
      t.string :content   # 내용
      t.timestamps
    end
  end
end
