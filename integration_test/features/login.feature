@tag
Feature: Login

  @debug
  Scenario: Successful login
    Given que escrevo email "gabriel@example.com"
    Given que escrevo senha "password123"
    When I Navigate to home
    Then I expect the Home screen to be visible
