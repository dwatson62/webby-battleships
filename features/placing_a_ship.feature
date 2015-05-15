Feature: Placing the first ship
  In order to play battleships
  As a nostalgic player
  I want to place my first ship

  Scenario: Placing a ship
  Given I am on the place ship page
  Then I should see "Where to place ship: "
  When I enter "A1"
  And select "Horizontal"
  And I click on "Place"
  Then I should see a ship appear on the board