Feature: Retrieve cart items

  Background: set up the base url
    Given url 'http://simple-grocery-store-api.online'
    * def File = Java.type('java.io.File')
    * def Scanner = Java.type('java.util.Scanner')
    * def path = 'C:/Users/HarshvardhanNigaveka/eclipse-workspace/Grocery_karateFramework/target/CartId.txt'
    * def file = new File(path)
    * def scanner = new Scanner(file)
    * def cartId = scanner.useDelimiter('\\Z').next()

  #And call read("../cartIdHelper.feature")
  Scenario: Retriving cart items
    Given path '/carts/'+cartId+'/items'
    When method get
    Then status 200
    * def itemId = response[0].id
    And karate.write(itemId,'itemId.txt')

  Scenario: To get the cart items from grocery api which (cart) is not present
    Given path 'carts/'+ cartId + 'abc'+ '/items'
    And header Accept = 'application/json'
    When method get
    Then status 404
    And print response
