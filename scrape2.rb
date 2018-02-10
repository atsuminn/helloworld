require 'nokogiri'
require 'open-uri'
# ssl証明を任せる
require 'certified'
require 'json'

# エンコード状況確認。"で囲むと中に式を記述可能
p "Now Encoding : #{__ENCODING__}"
date = ARGV[0]
p date


url1 = 'https://job.rikunabi.com/2019/search/pre/internship/result/?freeword=%E4%BA%A4%E9%80%9A%E8%B2%BB'
url2 = 'https://job.rikunabi.com/2019/search/pre/internship/result/?freeword='+date

p url1
p url2

charset = nil

html = open(url1) do |f|
    charset = f.charset
    p "Sites Encoding : #{charset}" # サイトの文字コードを確認
    f.read
end

html2 = open(url2) do |f|
    charset = f.charset
    p "Sites Encoding : #{charset}" # サイトの文字コードを確認
    f.read
end

rikunabi = []
rikunabi2 = []
doc = Nokogiri::HTML.parse(html, url1)
doc.xpath('//h2[@class="ts-p-_cassette-title"]').each do |node|
  rikunabi.push(node.css('a').inner_text)
end

doc2 = Nokogiri::HTML.parse(html2, url2)
doc2.xpath('//h2[@class="ts-p-_cassette-title"]').each do |node|
  rikunabi2.push(node.css('a').inner_text)
end

p rikunabi
p 'ーーーーーーーーーーーーーーーーーーーーーー'
p rikunabi2


p '配列 length'
p rikunabi.length
p 'ーーーーーーーーーーーーーーーーーーーーーー'
p rikunabi2.length
