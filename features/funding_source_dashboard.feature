Feature: Funding Source Dashboard

  As a funding source
  When I log in
  So that I can see a list of options I have


Background: funding source in database

  Given the following funding sources exist:
  | email        | password |
  | fs@admin.com | 1234abcd |

Scenario: funding source dashboard
  When I go to the log in page
  And I log in with email "fs@admin.com" and password "1234abcd"
  Then I should see a button with "Review Applications"
  Then I should see a button with "Approve/Disapprove Applications"
  Then I should see a button with "Edit Programs"
