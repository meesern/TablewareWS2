
Feature: Manage Dishes
  In order to have a dishes represented by markers
  As an admin
  I want to add, edit and delete dishes

  Scenario: List Dishes
    Given I have dishes named Prawn Pomello, Char Grilled Chicken
    When I go to the list of dishes
    Then I should see Prawn Pomello
    And I should see Char Grilled Chicken

