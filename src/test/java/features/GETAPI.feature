@regression
Feature: Get API call

  Background: Set url
    * url 'https://reqres.in/api/'

  Scenario: Get the details of User with header
    Given path "/users/2"
    When method GET
    Then header Accept = 'application/json'
    And def request_headers = {Connection: 'Keep-Alive', Accept: 'application/json'}
    Then headers request_headers
    Then status 200
    And print  "API Response is " + response
    And print  "Response status is " + responseStatus
    And print  "Response time is " + responseTime

  Scenario: Get the details of User with parameter and assertions in API response
    Given path "/users"
    And param per_page = 6
    When method GET
    Then header Accept = 'application/json'
    Then status 200
    And print  "API Response is " + response
    And print  "Response status is " + responseStatus
    And match  response.data[0].first_name != null
    And assert response.data.length == 6

  Scenario: Get the details of User with conditional logic checks and Loops
    Given path "/users"
    And param per_page = 6
    When method GET
    Then header Accept = 'application/json'
    Then status 200
    When def firstName = []
    And eval for (var i=0;i<response.data.length;i++) if (response.data.length == 6) {firstName.add(response.data[i].first_name)} else {karate.fail('Invalid response')}
    And print firstName
    And match  response.data[0].first_name != null
    And assert response.data.length == 6

  Scenario: Get the details of User with header Authorization token
    Given path "/users/2"
    When method GET
    And print "access token is " + accessToken
    And def response = call read('UserAuthentication.feature@token')
    And print "AccessToken is:" + response.accessToken
    And header Authorization = 'Bearer' + response.token
    Then status 200
    And print  "Response status is " + responseStatus
    And print  "Response time is " + responseTime



