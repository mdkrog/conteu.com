Feature: Manage Events
  As an Admin
  In order to manage events
  I want to click on the Events tab in the admin screen

Scenario: seeing a list of all events
  Given I am on the admin page
  When I click the events tab
  Then I should see a list of events
