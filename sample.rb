# URLにアクセスするためのライブラリの読み込み
require 'open-uri'
# Nokogiriライブラリの読み込み
require 'nokogiri'
require 'pry'

# スクレイピング先のURL
url = 'https://www.data.jma.go.jp/airinfo/index.html'

# charset = nil
# html = open(url) do |f|
#   charset = f.charset # 文字種別を取得
#   f.read # htmlを読み込んで変数htmlに渡す
# end

# htmlをパース(解析)してオブジェクトを生成
doc = Nokogiri::HTML(open(url))
binding.pry
# タイトルを表示
p doc.title