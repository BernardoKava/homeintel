# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'RentBook.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = RentManagement.new
  t.year = row['year']
  t.month= row['month']
  t.amount= row['amount']
  t.date_collected= row['date_collected']
  t.details= row['details']
  t.collected_by= row['collected_by']
  t.user_id= row['logged_by']

  t.save
  puts "#{t.year},#{t.date_collected} saved"
end
puts "There are now #{RentManagement.count} rows in the table"