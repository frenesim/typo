Feature: Merge Articles as admin
  As a blog administrator
  In order to organize my thoughts in the world
  I want to be able to merge articles in my blog

  Background:
    Given the blog is set up
    Given the following articles exist:
  	| title         | body    |
  	| Aladdin       | Gddfsd  |
  	| Aladdinoli    | Geeeee  |
	
  Scenario: Admin successfully merge articles
  	Given I am logged into the admin panel as admin
    Given I am on the edit article id 1 page
    When I fill in "merge_with" with "2"
    And I press "Merge"
    Then I should be on the admin content page
    And I should see "Article was successfully merged"
    
    
  Scenario: Non-Admin can not merge articles
  	Given I am logged into the admin panel as tipical
    Given I am on the new article page
    When I fill in "article_title" with "Foobar"
    And I fill in "article__body_and_extended_editor" with "Lorem Ipsum"
    Then I should not see "Merge Articles"
