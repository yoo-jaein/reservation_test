require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open("http://computer.knu.ac.kr/07_sub/01_sub.html"))

cnt = 0

doc.css("a").each do |x|

    cnt = cnt + 1
    
    if(23 < cnt && cnt < 58)
        puts x.inner_text
        puts "http://computer.knu.ac.kr/07_sub/01_sub.html" + x["href"]
    else
    end
end