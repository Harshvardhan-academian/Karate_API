Feature: API Client Registration

  Background: set up the base url
    Given url 'http://simple-grocery-store-api.online'

  Scenario Outline: Register a New API Client
    Given path '/api-clients'
    And request { clientName: <clientName>, clientEmail: <clientEmail> }
    When method post
    Then status 201
    And match response contains { accessToken: '#string' }
    * def access_token = response.accessToken
    And print access_token
    * karate.write(access_token,'secure.txt')

    Examples: 
      | clientName | clientEmail          |
      | Harry      | Harrynikas@gmail.com |

  Scenario: Register a New API Client - Bad Request (400)
    Given path '/api-clients'
    And request { clientName: 'Invalid', clientEmail: 'invalid@email.com' }
    When method post
    Then status 400
    And match response == { error: 'Invalid parameters provided' }

  Scenario: Register a New API Client - Conflict (409)
    Given path '/api-clients'
    And request { clientName: 'Harry', clientEmail: 'Harrynikas@gmail.com' }
    When method post
    Then status 409
    And match response == { error: 'API client already registered with this email address' }
