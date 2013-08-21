Feature: Article Merging
  As a blog administrator
  In order to avoid having many articles with same content
  I want to be able to merge articles to one

  Scenario: A non-admin cannot merge two articles
    Given I am on the edit article page of "Foobar"
    And I am not an administrator
    Then I should not see "Merge Articles"

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: When articles are merged, the merged article should contain the text of both previous articles

    Given I am on the edit article page of "Foobar"
    Then I should see "Merge Articles"
    When i fill in "Article ID" with 50
    And I click "Merge"
    Then I should be on some page
    And see both articles
