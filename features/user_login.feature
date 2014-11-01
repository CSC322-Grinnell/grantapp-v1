Feature: Create login

  As a user
  So that I can login
  I want to login with my credentials

Background: user in database

    Given the following users exist:
    | username |       email    | password |
    | Test0    | test0@test.com | 1234abcd |

Scenario: see the log in form
  When I go to the log in page
  Then I should see a form for "email"
  Then I should see a form for "password"
  Then I should see a button with "Login" 

Scenario: log in with valid credentials
  When I go to the log in page
  And I fill form for "email" with "test0@test.com"   
  And I fill form for "password" with "1234abcd"
  And I press "Login"
  Then I should be directed to dashboard

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
