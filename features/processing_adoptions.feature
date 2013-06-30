Feature: Processing adoptions
  As adoption site administrator
  I want to process puppies adoptions
  So the adopters can pick them up

  Scenario: Verify message when adoption is processed
    Given I have a pending adoption for "Tom Jones"
    When I process that adoption
    Then I should see "Please thank Tom Jones for the order!"