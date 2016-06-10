
And(/^I provide the following personal information$/) do |table|
  cellphone = table.hashes.first['cellphone']
  email = table.hashes.first['email']
  address = table.hashes.first['address']
  paydate = table.hashes.first['paydate']
  on(Personal_Information_Page).enter_values(cellphone, email, address, paydate)


end

