# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'ChillLoan.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = LoanManagement.new
  t.year = row['year']
  t.month= row['month']
  t.loan_registration_id= row['loan_registration_id']
  t.payment_date= row['payment_date']
  t.amount= row['amount']
  t.note= row['note']
  t.user_id= row['user_id']

  t.save
  puts "#{t.year},#{t.loan_registration_id} saved"
end
puts "There are now #{LoanManagement.count} rows in the table"