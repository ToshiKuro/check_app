# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@check_list = Checklist.new
@check_list.name    = 'プログラミング'
@check_list.item    = 'Heroku'
@check_list.address = 'https://jp.heroku.com/'
@check_list.save