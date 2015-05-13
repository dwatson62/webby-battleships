Feature: Placing a ship
  In order to play battleships
  As a nostalgic player
  I want to place a battleship

  Scenario: Placing
    Given I am on the place ship page
    When I enter "B3"
    Then I should see a battleship on "B3"