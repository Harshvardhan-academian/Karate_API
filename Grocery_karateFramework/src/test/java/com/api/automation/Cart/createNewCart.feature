Feature: Test status endpoint of API

  Background: set up the base path
    Given url 'http://simple-grocery-store-api.online'

  
  #Scenario: Create a new cart successfully
  #Given path '/carts'
  #When method post
  #Then status 201
  #* print response
  #And match response == { created: true, cartId: '#notnull' }
  #Scenario: Create a new cart successfully
  #Given path '/carts'
  #When method post
  #Then status 201
  #And match response.created == true
  #And def cartId = response.cartId
  #And print 'Cart ID:', cartId
  #And karate.write(cartId, 'cartId.txt')
  Scenario: Create a new cart and capture cartId
    Given path '/carts'
    When method post
    Then status 201
    And match response.created == true
    And def cartId = response.cartId
    And print cartId
    And karate.write(cartId, 'cartId.txt')

