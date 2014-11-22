Feature: Funding Source Dashboard

  As a funding source
  When I log in
  So that I can see a list of options I have


Background: funding source in database

  Given the following funding sources exist:
  | email        | password |      role      |
  | fs@admin.com | 1234abcd | Funding Source |

Scenario: funding source dashboard
  When I go to the user log in page
  And I fill form for "user_email" with "fs@admin.com"
  And I fill form for "user_password" with "1234abcd"
  And I press "Log in"
  Then I should be on dashboard
  Then I should see a button with "Review Applications"
  Then I should see a button with "Approve/Disapprove Applications"
  Then I should see a button with "Edit Programs"

Scenario: funding source log in with invalid credentials
  When I go to the user log in page
  And I fill form for "user_email" with "fs0@admim.com"
  And I fill form for "user_password" with "98765432"
  And I press "Log in"
  Then I should see "Invalid email or password."
