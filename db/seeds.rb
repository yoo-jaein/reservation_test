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