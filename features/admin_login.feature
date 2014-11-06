Feature: Admin login

  As an admin
  So that I can log in
  I want to login with my credentials


Background: admins in database

  Given the following admins exist:
  | email           | password |
  | admin@admin.com | 1234abcd |

Scenario: admin login
  When I go to the admin log in page
  Then I should see a form for "admin_user_email"
  Then I should see a form for "admin_user_password"
  Then I should see a button with "Login"

Scenario: log in with invalid password
  When I go to the admin log in page
  And I fill form for "admin_user_email" with "test0@test.com"
  And I fill form for "admin_user_password" with "abcdefgh"
  And I press "Login"
  Then I should see "Invalid email or password."

Scenario: log in with invalid email
  When I go to the admin log in page
  And I fill form for "admin_user_email" with "invalid@test.com"
  And I fill form for "admin_user_password" with "abcdefgh"
  And I press "Login"
  Then I should see "Invalid email or password."



Scenario: log in with valid email and password
  When I go to the admin log in page
  And I fill form for "admin_user_email" with "admin@admin.com"
  And I fill form for "admin_user_password" with "1234abcd"
  And I press "Login"
  Then I should be on admin dashboard
