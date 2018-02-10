require 'nokogiri'
require 'open-uri'
# ssl証明を任せる
require 'certified'

# エンコード状況確認。"で囲むと中に式を記述可能
p "Now Encoding : #{__ENCODING__}"

url = 'https://qiita.com/search?q=ruby'

charset = nil

html = open(url) do |f|
    charset = f.charset
    p "Sites Encoding : #{charset}" # サイトの文字コードを確認
    f.read
end

doc = Nokogiri::HTML.parse(html, url)
doc.xpath('//h1[@class="searchResult_itemTitle"]').each do |node|
  p node.css('a').inner_text
end
