Feature: Create programs

  As a admin
  When I log in
  So that I can create programs

Background: admin in database

  Given the following users exist:
  | email           | password | role           |
  | admin@admin.com | 1234abcd | Admin          |
  | fs@fs.com       | 1234abcd | Funding Source |
  | review@fs.com   | 1234abcd | Reviewer       |
  | app@app.com     | 1234abcd | Applicant      |

  Given the following programs exist:
  | name   |
  | Sample |

Scenario: create programs
  When I go to the user log in page
  And I log in as a user with email "admin@admin.com" and password "1234abcd"
  And I go to create program page
  And I create a program with name "Program X" and form url ""
  Then a program with name "Program X" should exist

Scenario: add form url
  When I go to the user log in page
  And I log in as a user with email "admin@admin.com" and password "1234abcd"
  And I go to create program page
  And I create a program with name "Program Y" and form url "http://www.google.com"
  And I go to programs page
  And I click "Program Y"
  Then I should see a link with "View Form" to "http://www.google.com"

Scenario: edit program
  When I go to the user log in page
  And I log in as a user with email "admin@admin.com" and password "1234abcd"
  And I go to create program page
  And I create a program with name "Program X" and form url "http://www.google.com"
  And I go to programs page
  And I click "Program X"
  And I click "Edit Program"
  And I fill form for "program_name" with "Program Super X"
  And I fill form for "program_form_url" with "http://www.bing.com"
  Then I click "Submit"
  Then a program with name "Program Super X" should exist

Scenario: delete program
  When I go to the user log in page
  And I log in as a user with email "admin@admin.com" and password "1234abcd"
  And I go to create program page
  And I create a program with name "Program X" and form url "http://www.google.com"
  And I go to programs page
  And I click "Program X"
  And I click "Edit Program"
  And I click "Delete Program"
  Then a program with name "Program X" should not exist

Scenario: funding source cannot create programs
  When I go to the user log in page
  And I log in as a user with email "fs@fs.com" and password "1234abcd"
  And I go to create program page
  Then I should be on programs page

Scenario: reviewer cannot create programs
  When I go to the user log in page
  And I log in as a user with email "review@fs.com" and password "1234abcd"
  And I go to create program page
  Then I should be on programs page

Scenario: applicant cannot create programs
  When I go to the user log in page
  And I log in as a user with email "app@app.com" and password "1234abcd"
  And I go to create program page
  Then I should be on programs page

Scenario: applicants cannot edit programs
  When I go to the user log in page
  And I log in as a user with email "app@app.com" and password "1234abcd"
  And I go to programs page
  And I click "Sample"
  Then I should not see a link with "Edit Program"
