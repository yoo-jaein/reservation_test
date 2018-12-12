# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open("http://computer.knu.ac.kr/07_sub/01_sub.html"))

cnt = 0

doc.css("a").each do |x|

    cnt = cnt + 1
    
    if(23 < cnt && cnt < 58)
      @notice = Notice.new
      @notice.title = x.inner_text
      @notice.link = x["href"]
      @notice.save
    else
    end
end

User.create(name: "유재인", student_dept: "컴퓨터학부", student_id: "2016110879", email: "jaein@knu.ac.kr", is_black: 0, password: "121212", password_confirmation: "121212")
User.create(name: "류가람", student_dept: "컴퓨터학부", student_id: "2016111581", email: "gg@knu.ac.kr", is_black: 0, password: "121212", password_confirmation: "121212")
User.create(name: "권민상", student_dept: "컴퓨터학부", student_id: "2016112934", email: "kk@knu.ac.kr", is_black: 0, password: "121212", password_confirmation: "121212")
User.create(name: "이장원", student_dept: "컴퓨터학부", student_id: "2015114648", email: "ee@knu.ac.kr", is_black: 0, password: "121212", password_confirmation: "121212")

Admin.create(name: "아무개", admin_id: "1001987", email: "admin@knu.ac.kr", password: "121212", password_confirmation: "121212")