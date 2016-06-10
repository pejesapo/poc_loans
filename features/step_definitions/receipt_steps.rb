Given(/^I have applied to a Loan with the following information$/) do
  step 'I have navigated to the Loans Web App'
  step 'I provide the following information to get the available loan plans for me',table(%{
    | amount | reason           | dni      |
    | 8700   | Gastos Escolares | 43396512 |
  })

end