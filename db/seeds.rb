# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'rule.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Rule.new
  t.category = row['Category']
  t.title= row['Title']
  t.definition= row['Definition']
  t.user_id= row['user_id']
  t.active= row['Active']

  t.save
  puts "#{t.category},#{t.title} saved"
end
puts "There are now #{Rule.count} rows in the table"