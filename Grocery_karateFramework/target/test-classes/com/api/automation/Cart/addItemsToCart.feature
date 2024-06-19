Feature: Add items into the cart

  Background: set up the base path
    Given url 'http://simple-grocery-store-api.online'
    * def File = Java.type('java.io.File')
    * def Scanner = Java.type('java.util.Scanner')
    * def path = 'C:/Users/HarshvardhanNigaveka/eclipse-workspace/Grocery_karateFramework/target/CartId.txt'
    * def file = new File(path)
    * def scanner = new Scanner(file)
    * def cartId = scanner.useDelimiter('\\Z').next()
    * scanner.close()

  Scenario Outline: Add an item to an existing cart from txt file.
    Given path '/carts/' + cartId + '/items'
    And request { "productId": <productId>, "quantity": <quantity> }
    And headers {Accept :"application/json",Content-type : "application/json"}
    When method POST
    Then status 201

    Examples: 
      | read("addItems.csv") |

  Scenario Outline: Add an item to an existing cart from txt file with invalid parameters.
    Given path '/carts/' + cartId +'/items'
    And request { "productId": <invalid_productId>, "quantity": <quantity> }
    And headers {Accept :"application/json",Content-type : "application/json"}
    When method POST
    Then status 400

    Examples: 
      | read("addItems.csv") |
