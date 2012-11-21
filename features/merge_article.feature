Feature: Write Articles
  As a blog administrator
  In order to organize my thoughts with the world
  I want to be able to merge articles in my blog

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Successfully merge articles
    Given I am on the new article page
    When I fill in "article_title" with "Foobar"
    And I fill in "article__body_and_extended_editor" with "Lorem Ipsum"
    fill in "article_id" with 1
    And I press "Merge"
    Then I should see "This article will be merged with article_id 1"
    When I press "Publish"
    Then I should be on the admin content page
    When I go to the home page
    Then I should see "Foobar"
    When I follow "Foobar"
    Then I should see "Lorem Ipsum"
    And I should see "merged with article"
