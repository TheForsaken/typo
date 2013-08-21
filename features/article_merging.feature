Feature: Article Merging
  As a blog administrator
  In order to avoid having many articles with same content
  I want to be able to merge articles to one

  Background:
    Given the blog is set up

  Scenario: A non-admin cannot merge two articles
    Given I am logged into the user panel
    And I am on the edit article page with id "1"
    Then I should not see "Merge Articles"

  Scenario: When articles are merged, the merged article should contain the text of both previous articles
    Given I am logged into the admin panel
    Given I am on the edit article page with id "1"
    Then I should see "Merge Articles"
    When I fill in "Article ID" with 50
    And I click "Merge"
    Then I should be on some page
    And see both articles
