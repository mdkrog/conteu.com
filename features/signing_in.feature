Feature: Sign in as Admin
  As a web browser
  In order to get to the admin page
  I want to sign in
 
Scenario: using a valid signature
  Given I am on the sign in page
  When I submit the login form
  Then I should see the text "Admin"
