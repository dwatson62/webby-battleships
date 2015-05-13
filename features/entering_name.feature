Feature: Starting the game
  In order to play battleships
  As a nostalgic player
  I want to enter my name

  Scenario: Entering a name
  Given I am on the name page
  When I fill in the form with "Daryl" on the name page
  And I click the submit button
  Then "Daryl" should be saved