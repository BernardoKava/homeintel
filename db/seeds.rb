# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'htransactions.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = LegacyUlsterbank.new
  t.trans_date = row['date']
  t.trans_type = row['type']
  t.description = row['description']
  t.trans_value= row['value']
  t.account_name = row['account_name']
  t.account_number = row['account_number']

  t.save
  puts "#{t.trans_date}, #{t.description}, #{t.trans_value},
 #{t.account_name}, #{t.account_number} ,saved"
end
puts "There are now #{LegacyUlsterbank.count} rows in the table"




