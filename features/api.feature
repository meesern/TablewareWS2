
Feature: Provide API
  In order to have information usable by an android app
  As an android phone
  I want to retrieve (and submit) information

  Scenario: Get food mapped to a code
    Given I have mapped 1:1:1:1:3:3:5:5 to the dish Prawn Pomello
    When I request the code 
    Then I should see Prawn Pomello
    And I should get type: food

  Scenario: Get an offer mapped to a code
    Given I have mapped 1:1:1:1:3:3:5:5 to the special offer 10% off
    When I request the code 
    Then I should see 10% off
    And I should get type: offer


