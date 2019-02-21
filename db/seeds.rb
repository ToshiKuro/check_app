# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# User登録
user         = User.new
user.name    = '鈴木一郎'
user.save

user         = User.new
user.name    = '田中二郎'
user.save

user         = User.new
user.name    = '佐藤三郎'
user.save

user         = User.new
user.name    = '高橋四郎'
user.save

user         = User.new
user.name    = '伊藤五郎'
user.save

user         = User.new
user.name    = '山本六郎'
user.save


# List登録
list         = List.new
list.name    = 'a101'
list.save

list         = List.new
list.name    = 'a102'
list.save

list         = List.new
list.name    = 'b201'
list.save

list         = List.new
list.name    = 'b202'
list.save


# （List）Item登録
item         = Item.new
item.list_id = 1
item.name    = '計画書'
item.path    = '/uploads/upload_file/file/4/pln201.pdf'
item.save

item         = Item.new
item.list_id = 1
item.name    = 'INFORMATION'
item.path    = '/uploads/upload_file/file/2/NOTAM201.pdf'
item.save

item         = Item.new
item.list_id = 1
item.name    = '資料１'
item.path    = 'https://www.data.jma.go.jp/airinfo/data/pict/fbjp/fbjp.png'
item.save

item         = Item.new
item.list_id = 1
item.name    = '資料２'
item.path    = '/uploads/upload_file/file/1/QMCD98_RJTT.png'
item.save

item         = Item.new
item.list_id = 1
item.name    = 'メモ'
item.path    = '/uploads/upload_file/file/1/QMCD98_RJTT.png'
item.save


item         = Item.new
item.list_id = 2
item.name    = '計画書'
item.path    = '/uploads/upload_file/file/4/pln201.pdf'
item.save

item         = Item.new
item.list_id = 2
item.name    = 'INFORMATION'
item.path    = '/uploads/upload_file/file/2/NOTAM201.pdf'
item.save

item         = Item.new
item.list_id = 2
item.name    = '資料１'
item.path    = 'https://www.data.jma.go.jp/airinfo/data/pict/fbjp/fbjp.png'
item.save

item         = Item.new
item.list_id = 2
item.name    = '資料２'
item.path    = '/uploads/upload_file/file/1/QMCD98_RJTT.png'
item.save

item         = Item.new
item.list_id = 2
item.name    = 'メモ'
item.path    = '/uploads/upload_file/file/1/QMCD98_RJTT.png'
item.save


item         = Item.new
item.list_id = 3
item.name    = '計画書'
item.path    = '/uploads/upload_file/file/4/pln201.pdf'
item.save

item         = Item.new
item.list_id = 3
item.name    = 'INFORMATION'
item.path    = '/uploads/upload_file/file/2/NOTAM201.pdf'
item.save

item         = Item.new
item.list_id = 3
item.name    = '資料１'
item.path    = 'https://www.data.jma.go.jp/airinfo/data/pict/fbjp/fbjp.png'
item.save

item         = Item.new
item.list_id = 3
item.name    = '資料２'
item.path    = '/uploads/upload_file/file/1/QMCD98_RJTT.png'
item.save

item         = Item.new
item.list_id = 3
item.name    = 'メモ'
item.path    = '/uploads/upload_file/file/1/QMCD98_RJTT.png'
item.save


item         = Item.new
item.list_id = 4
item.name    = '計画書'
item.path    = '/uploads/upload_file/file/4/pln201.pdf'
item.save

item         = Item.new
item.list_id = 4
item.name    = 'INFORMATION'
item.path    = '/uploads/upload_file/file/2/NOTAM201.pdf'
item.save

item         = Item.new
item.list_id = 4
item.name    = '資料１'
item.path    = 'https://www.data.jma.go.jp/airinfo/data/pict/fbjp/fbjp.png'
item.save

item         = Item.new
item.list_id = 4
item.name    = '資料２'
item.path    = '/uploads/upload_file/file/1/QMCD98_RJTT.png'
item.save

item         = Item.new
item.list_id = 4
item.name    = 'メモ'
item.path    = '/uploads/upload_file/file/1/QMCD98_RJTT.png'
item.save