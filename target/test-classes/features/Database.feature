@regression
Feature: Database validations

  Scenario: Create users details
    Given def config = { username: 'postgres', password: 'admin', url: 'jdbc:postgresql://localhost:5432/postgres', driverClassName: 'org.postgresql.Driver' }
    When def DbUtils = Java.type('org.karate.DbUtils')
    And def db = new DbUtils(config)
    When def employee = db.readRows('select * from employee')
    Then match employee[0].name == 'Manoj'
    Then print employee
