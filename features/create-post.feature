Feature: Create post feature
  Test the functionality of creating post

  Scenario: Create post - positive
    Given I have logged in as a regular user
    Then I can create post

  Scenario: Update post - positive
    Given I have logged in as a regular user
    Then I can create post
    Then I can update post