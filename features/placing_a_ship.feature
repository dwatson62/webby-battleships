Feature: Placing a ship
  In order to play battleships
  As a nostalgic player
  I want to place a battleship

  Scenario: Placing
    Given I am on the place ship page
    When I fill in "form" with "B3" within "place ship"
    Then I should see a battleship on "B3"

  Scenario: Placing
    Given I am on the place ship page
    When I fill in "form" with "A3" within "place ship"
    Then I should see a battleship on A5

  Scenario: Placing
    Given I am on the place ship page
    When I fill in "form" with "B3" and "vertical" within "place ship"
    Then I should see a battleship on "A7"