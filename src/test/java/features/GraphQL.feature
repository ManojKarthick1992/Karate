@regression
Feature: GraphQL API call to retrieve data

  Background: Set url
    * url 'https://api.graphql.jobs/'

  Scenario: Retrieve Job details using GraphQL
    And  request { query: '{jobs{id,title}}' }
    When method POST
    Then status 200
    And  eval   for (var i=0;i<response.data.length;i++) karate.match(response.data[i].title != null)
    And  print  "API Response is " + response







