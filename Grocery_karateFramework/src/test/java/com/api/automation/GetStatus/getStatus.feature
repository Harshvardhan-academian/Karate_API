Feature: Test status endpoint of API

  Background: set up the base path
    Given url 'http://simple-grocery-store-api.online'

  Scenario: Check if the API status is UP
    Given path '/status'
    When method get
    Then status 200
    And match response.status == 'UP'
    * print "API is working!"
  #Scenario: Check if the API status is not up
    #Given path '/status'
    #When method get
    #Then status 200
    #And match response.status != 'UP'
    #Then print "API is not working !"
#
  #Scenario: Check if the endpoint is not found
    #Given path '/status'
    #When method get
    #Then status 404
    #* print "Endpoint is not found"
