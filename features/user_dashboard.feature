@wip
Feature: User Dashboard

  As a funding source
  When I log in
  So that I can see a list of options I have


Background: Users in database

  Given the following users exist:
  | email            | password |      role      |
  | admin@admin.com  | 1234abcd | Admin          |
  | fs@admin.com     | 1234abcd | Funding Source |
  | review@admin.com | 1234abcd | Reviewer       |
  | app@admin.com    | 1234abcd | Application    |


Scenario: admin dashboard
  When I go to the user log in page
  And I fill form for "user_email" with "admin@admin.com"
  And I fill form for "user_password" with "1234abcd"
  And I press "Log in"
  Then I should be on dashboard
  Then I should see a button with "Review Applications"
  Then I should see a button with "Create Program"
  Then I should see a button with "Approve/Disapprove Applications"
  Then I should see a button with "Edit Programs"

Scenario: funding source dashboard
  When I go to the user log in page
  And I fill form for "user_email" with "fs@admin.com"
  And I fill form for "user_password" with "1234abcd"
  And I press "Log in"
  Then I should be on dashboard
  Then I should see a button with "Review Applications"
  Then I should see a button with "Approve/Disapprove Applications"
  Then I should see a button with "Edit Programs"

Scenario: reviewer dashboard
  When I go to the user log in page
  And I fill form for "user_email" with "revew@admin.com"
  And I fill form for "user_password" with "1234abcd"
  And I press "Log in"
  Then I should be on dashboard
  Then I should see a button with "Review Applications"

Scenario: applicant dashboard
  When I go to the user log in page
  And I fill form for "user_email" with "app@admin.com"
  And I fill form for "user_password" with "1234abcd"
  And I press "Log in"
  Then I should be on dashboard
  Then I should see a button with "New Application"
  Then I should see a button with "My Applications"

Scenario: Log in with invalid credentials
  When I go to the user log in page
  And I fill form for "user_email" with "yooo@admin.com"
  And I fill form for "user_password" with "98765432"
  And I press "Log in"
  Then I should see "Invalid email or password."
