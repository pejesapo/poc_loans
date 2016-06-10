Feature: Ask for a Loan
  Fields validation

  Scenario: System allows applying when filling correct information
    Given "Majo" has navigated to the Loans Web App
    When she asks for a S/."<amount>" loan
    Then System shows Security Questions page

  Scenario: Validate user can't ask for a Loan when DNI is in wrong format
    Given "Majo" has navigated to the Loans Web App
    When she fills "<dni>" as DNI and a valid amount
    Then System responds an error message: "<errorMessage>"

    Examples: Less than 8 digits
      | dni       | errorMessage  |
      | 912345    | Error message |
    Examples: It's totally alphabetic
      | dni       | errorMessage  |
      | asdfg     | Error message |
    Examples: It's totally non-alphanumeric
      | dni       | errorMessage  |
      | *#,.*#,.* | Error message |
    Examples: Empty
      | dni       | errorMessage  |
      |           | Error message |

  Scenario: Validate user can't ask for a Loan when amount is in wrong format
    Given "Majo" has navigated to the Loans Web App
    When she fills "<amount>" as amount and a valid dni
    Then System responds an error message: "<errorMessage>"

    Examples: S/0 as amount
      | amount    | errorMessage  |
      | 0         | Error message |
    Examples: It's totally alphabetic
      | amount    | errorMessage  |
      | asdfg     | Error message |
    Examples: It's totally non-alphanumeric
      | amount    | errorMessage  |
      | *#,.*#,.* | Error message |
    Examples: Empty
      | amount    | errorMessage  |
      |           | Error message |

  Scenario: Validate user can't ask for a Loan when amount is less than S/1000
    Given "Majo" has navigated to the Loans Web App
    When she fills "<amount>" as amount and a valid dni
    Then System responds an error message: "<errorMessage>"
    Examples: Empty
      | amount    | errorMessage  |
      | 999       | Error message |