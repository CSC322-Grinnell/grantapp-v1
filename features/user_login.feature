Feature: Create login

  As a user
  So that I can login
  I want to login with my credentials

Background: user in database

    Given the following users exist:
    | username |       email    | password |
    | Test0    | test0@test.com | 1234abcd |

Scenario: see the log in form
  When I go to the user log in page
  Then I should see a form for "user_email"
  Then I should see a form for "user_password"
  Then I should see a button with "Log in" 

Scenario: log in with valid credentials
  When I go to the user log in page
  And I fill form for "user_email" with "test0@test.com"   
  And I fill form for "user_password" with "1234abcd"
  And I press "Log in"
  Then I should be on dashboard

Scenario: log in with invalid password
  When I go to the user log in page
  And I fill form for "user_email" with "test0@test.com"
  And I fill form for "user_password" with "abcdefgh"
  And I press "Log in"
  Then I should see "Invalid email or password."

Scenario: log in with invalid email
  When I go to the user log in page
  And I fill form for "user_email" with "invalid@test.com"
  And I fill form for "user_password" with "abcdefgh"
  And I press "Log in"
  Then I should see "Invalid email or password."

