@regression
Feature: Post API call

  Background: Set url
    * url 'https://reqres.in/api/'

  Scenario: Create users details
    Given path "/users"
    And  request {"name": "Karate","job": "teacher"}
    When method POST
    Then status 201
    And match response == {"name": "Karate","job": "teacher","id": "#string","createdAt": "#ignore"}
    And print  "API Response is " + response

  Scenario: Create users details by fetching request payload from Json File
    Given path "/users"
    And  def filepath = karate.properties['user.dir'] + "/src/test/java/data/requestPayload.json"
    And  request read(filepath);
    When method POST
    Then status 201
    And  def filepath = karate.properties['user.dir'] + "/src/test/java/data/responsePayload.json"
    And match response == read(filepath);
    And print  "API Response is " + response







