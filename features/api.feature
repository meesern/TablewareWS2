Feature: Provide API
  In order to have information usable by an android app
  As an android phone
  I want to retrieve (and submit) information
  
  #Note that because this documents an API, features include url's that would 
  #not normally be appropriate for a cucumber feature specification

  Background: Prawn Pomello is mapped
    Given I have mapped 1:1:1:1:3:3:5:5 to the dish Prawn Pomello

  Scenario: Get food mapped to a code
    When I request the code 
    Then I should see Prawn Pomello
    And I should get type: food

  Scenario: Get an offer mapped to a code
    Given I have mapped 1:1:1:1:2:3:5:6 to the special offer 10% off
    When I request /v1/1:1:1:1:2:3:5:6
    Then I should see 10% off
    And I should get type: offer

  Scenario: Get the name for a code
    When I request /v1/1:1:1:1:3:3:5:5/name
    Then I should see Prawn Pomello

  Scenario: Get the thumbnail for a code
    When I request /v1/1:1:1:1:3:3:5:5/thumb
    Then I should get a picture

  Scenario: Get the image for a code
    When I request /v1/1:1:1:1:3:3:5:5/image
    Then I should get a picture

  Scenario: Get the url1 for a code
    When I request /v1/1:1:1:1:3:3:5:5/url1
    Then I should get a url

  Scenario: Get the personal code
    Given bob is registered
    When I request /v1/1:1:1:1:3:3:5:5/person/bob
    Then I should see Prawn Pomello
    And  I should get type: food
    And  I should see bob


