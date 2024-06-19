Feature: Retrieve a cart

  Background: To set up the path
    Given url 'http://simple-grocery-store-api.online'
    * def File = Java.type('java.io.File')
    * def Scanner = Java.type('java.util.Scanner')
    * def path = 'C:/Users/HarshvardhanNigaveka/eclipse-workspace/Grocery_karateFramework/target/CartId.txt'
    * def file = new File(path)
    * def scanner = new Scanner(file)
    * def cartId = scanner.useDelimiter('\\Z').next()
    * scanner.close()
    * print 'Cart ID in get cart:', cartId

  Scenario: Retrieve Cart Information
    Given path '/carts/' + cartId
    * def urls = '/carts/' + cartId
    And print urls
    When method get
    Then status 200
    And print response

  Scenario: Retrieve Cart Information with invalid cartId's (Non-Existing cartId)
    Given path '/carts/' + cartId+"123"
    * def urls = '/carts/' + cartId+"123"
    And print urls
    When method get
    Then status 404
    And print response
