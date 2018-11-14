# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'




csv_text = File.read(Rails.root.join('lib', 'seeds', 'cashflow_inflow.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Outflow.new
  t.owner = row['owner']
  t.amount= row['amount']
  t.user_id= row['user_id']
  t.cashflow_id= row['cashflow_id']
  t.year= row['year']
  t.month= row['month']
  t.outflowtype_id= row['inflowtype_id']
  t.date_posted = row['date_posted']
  t.details = row['details']
  t.save
  puts "#{t.owner},#{t.details} saved"
end
puts "There are now #{Outflow.count} rows in the table"