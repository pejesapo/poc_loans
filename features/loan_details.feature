Feature: Loan Details

  Scenario: Validate Loan Details in Agreement Page
    Given I have navigated to the Loans Web App
    When I provide the following information to get the available loan plans for me
      | amount | reason           | dni      |
      | 8700   | Gastos Escolares | 43396512 |
    And I choose option N° "2"
    And I provide the following personal information
      | cellphone | email                         | address                                             | paydate |
      | 949070173 | cdiaz@brainhousesolutions.com | Calle Los Manzanos Mz N3 Lt 27 Cooperativa 1078 VMT | 16      |
    Then I should get the following information in Agreement's page header
      | plan   | amount | monthly_fee | number_of_fees | rate | paydate        |
      | Plan 2 | S/8700 | S/577.58    | 18             | 13%  | 16 de cada mes |


