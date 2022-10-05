@regression
Feature: User Authentication

  Background: Set url
    * url 'https://reqres.in/api/'

  @token
  Scenario: Fetch token for User details
    Given path "/register"
    And request {"email": "eve.holt@reqres.in","password": "pistol"}
    When method POST
    Then status 200
    * def accessToken = response.token


