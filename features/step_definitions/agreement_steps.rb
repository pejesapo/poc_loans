Then(/^I should get the following information in Agreement's page header$/) do |loan_data_table|

  actual = on(Agreement_Page).get_loandata
  expected = loan_data_table.hashes
  actual.should have_the_same_items_as expected
end
