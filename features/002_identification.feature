Feature: Identification

  Scenario: User responds correctly identification question
    Given "Majo" has applied for a Loan
    When she answers "<answer>" on Security Question Page
    Then System shows Available Loans page

  Scenario: User responds a wrong answer for identification question
    Given "Majo" has applied for a Loan
    When she answers "<answer>" on Security Question Page
    Then System shows Reject Page