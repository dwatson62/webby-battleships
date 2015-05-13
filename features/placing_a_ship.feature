Feature: Starting the game
  In order to play battleships
  As a nostalgic player
  I want to place a battleship

  Scenario: Placing a battleship
  Given I am on the place ship page
  When I fill in the form with "B1" on the place ship page
  Then I should see a ship in B1