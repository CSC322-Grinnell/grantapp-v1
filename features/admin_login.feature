Feature: Admin login

  As an admin
  So that I can log in
  I want to login with my credentials


Background: admins in database

  Given the following admins exist:
  | email           | password |
  | admin@admin.com | 1234abcd |

Scenario: admin login
  When I go to the log in page
  Then I should see a form for "email"
  Then I should see a form for "password"
  Then I should see a button with "Login"

Scenario: log in with invalid password
  When I go to the log in page
  And I fill form for "email" with "test0@test.com"
  And I fill form for "password" with "abcdefgh"
  And I press "Login"
  Then I should see an error message

Scenario: log in with invalid email
  When I go to the log in page
  And I fill form for "email" with "invalid@test.com"
  And I fill form for "password" with "abcdefgh"
  And I press "Login"
  Then I should see an error message
