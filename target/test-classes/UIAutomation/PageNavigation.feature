@regression
Feature: Web UI Automation

  Scenario: Page Navigation
    Given driver 'https://sites.google.com/thoughtworks.com/vodqa-india/home'
    And click('a[href="/thoughtworks.com/vodqa-india/propose-your-talk"]')
    And print driver.title