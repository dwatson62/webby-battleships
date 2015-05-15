Feature: Starting the game
  In order to play battleships
  As a nostalgic player
  I want to start a new game

  Scenario: Registering
  Given I am on the homepage
  When I click "New Game"
  Then I should see "What's your name?"
  When I enter my name, "Daryl"
  And I click on "Go!"