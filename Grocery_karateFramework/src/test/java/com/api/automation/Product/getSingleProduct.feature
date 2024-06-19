Feature: To check endpoint

  Background: set up the base path
    Given url 'http://simple-grocery-store-api.online'

  Scenario Outline: Get a product with different valid IDs
    Given path '/products/<productId>'
    When method GET
    Then status 200
    And match response == { id: '#number',category : '#string', name: '#string',manufacturer:'#string', price: '#number',current-stock:'#number',inStock:'#boolean'}

    Examples: 
      | productId |
      |      4643 |
      |      2585 |
      |      4641 |

  Scenario Outline: Get a product with invalid IDs
    Given path '/products/<productId>'
    When method GET
    Then status 404
    And print 'Product not found !'
    * print response

    Examples: 
      | productId |
      |      4644 |
