Feature: Test endpoint

  Background: set up the base path
    Given url 'http://simple-grocery-store-api.online'

  Scenario: Get all Products
    Given path '/products'
    When method get
    Then status 200
    And print response
    And match each $ contains { 'id': '#number', 'category': '#string', 'name': '#string', 'inStock': '#boolean' }

  Scenario: Get all Products with invalid path
    Given path '/products'+ '124'
    When method get
    Then status 404
    And print response

  Scenario: Get all Products
    Given path '/products'
    And param available = "abc"
    When method get
    Then status 400
    And print response
