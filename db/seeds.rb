# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'




csv_text = File.read(Rails.root.join('lib', 'seeds', 'testinflows.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Income.new
  t.amount = row['amount']
  t.details = row['details']
  t.user_id = row['user_id']
  t.budget_id = row['budget_id']
  t.income_type = row['income_type']
  t.person_id = row['person_id']
  t.save
  puts "#{t.details} saved"
end
puts "There are now #{Income.count} rows in the table"


csv_text = File.read(Rails.root.join('lib', 'seeds', 'testoutflows.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Expense.new
  t.amount = row['amount']
  t.details = row['details']
  t.user_id = row['user_id']
  t.budget_id = row['budget_id']
  t.expense_type = row['expense_type']
  t.person_id = row['person_id']
  t.save
  puts "#{t.details} saved"
end
puts "There are now #{Expense.count} rows in the table"

csv_text = File.read(Rails.root.join('lib', 'seeds', 'outflowtypes.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Outflowtype.new
  t.name = row['flowtype']

  t.save
  puts "#{t.name} saved"
end
puts "There are now #{Outflowtype.count} rows in the table"




csv_text = File.read(Rails.root.join('lib', 'seeds', 'budgettest.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Budget.new
  t.year = row['year']
  t.month = row['month']
  t.budget_date = row['budget_date']
  t.name = row['name']

  t.save
  puts "#{t.name} saved"
end
puts "There are now #{Budget.count} rows in the table"



csv_text = File.read(Rails.root.join('lib', 'seeds', 'budgettest.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Cashflow.new
  t.year = row['year']
  t.month = row['month']
  t.accounting_date = row['budget_date']
  t.name = row['name']

  t.save
  puts "#{t.name} saved"
end
puts "There are now #{Cashflow.count} rows in the table"


csv_text = File.read(Rails.root.join('lib', 'seeds', 'budgettest.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Saving.new
  t.year = row['year']
  t.month = row['month']
  t.saving_date = row['budget_date']
  t.name = row['name']

  t.save
  puts "#{t.name} saved"
end
puts "There are now #{Saving.count} rows in the table"


csv_text = File.read(Rails.root.join('lib', 'seeds', 'passwords.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Passwordrepository.new
  t.system_name = row['system_name']
  t.user_name= row['user_name']
  t.system_password = row['system_password']
  t.active = row['active']

  t.save
  puts "#{t.system_name} saved"
end
puts "There are now #{Passwordrepository.count} rows in the table"

csv_text = File.read(Rails.root.join('lib', 'seeds', 'people.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Person.new
  t.name = row['name']
  t.surname= row['surname']
  t.dob = row['dob']
  t.active = row['active']
  t.fullname = row['fullname']

  t.save
  puts "#{t.name} saved"
end
puts "There are now #{Person.count} rows in the table"


csv_text = File.read(Rails.root.join('lib', 'seeds', 'departments.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Department.new
  t.name = row['name']
  t.description= row['description']
  t.active = row['active']

  t.save
  puts "#{t.name} saved"
end
puts "There are now #{Department.count} rows in the table"


csv_text = File.read(Rails.root.join('lib', 'seeds', 'inflowtypes.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Inflowtype.new
  t.name = row['inflow']
  t.save
  puts "#{t.name} saved"
end
puts "There are now #{Inflowtype.count} rows in the table"