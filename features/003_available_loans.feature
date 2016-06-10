Feature: Available loans

  Scenario: Get all available loans
    Given "Majo" has navigated to the Loans Web App
    When she asks for a S/."<amount>" loan for "<loan_purpose>"
    Then the following plans should be displayed
      | monthly_fee | number_of_fees | rate | total_interest |
      | S/1120      | 12 cuotas      | 12%  | S/1440         |
      | S/796.67    | 18 cuotas      | 13%  | S/2340         |
      | S/640       | 24 cuotas      | 14%  | S/3360         |
      | S/483.33    | 36 cuotas      | 15%  | S/5400         |
      | S/360       | 60 cuotas      | 16%  | S/9600         |

  Scenario: "Solicitar" Button works for every Plan
    Given "Majo" has navigated to the Loans Web App
    When she accepts plan N. "<planNumber>"
    Then System shows that plan's details

  Examples
    | planNumber |
    | 1          |
    | 2          |
    | 3          |
    | 4          |
    | 5          |