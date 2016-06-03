Feature: Available loans

  Scenario: Get all available loans for me
    Given I have navigated to the Loans Web App
    When I provide the following information to get the available loan plans for me
      | amount | reason | dni      |
      | 12000  | Viajar | 41345827 |
    Then I should get the following plans:
      | monthly_fee | number_of_fees | rate | total_interest                     |
      | S/1120      | 12 cuotas      | 12%  | Pagarás S/1440 en total de interés |
      | S/796.67    | 18 cuotas      | 13%  | Pagarás S/2340 en total de interés |
      | S/640       | 24 cuotas      | 14%  | Pagarás S/3360 en total de interés |
