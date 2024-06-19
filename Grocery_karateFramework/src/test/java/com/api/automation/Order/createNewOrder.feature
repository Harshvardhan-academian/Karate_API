Feature: Test Order API

  Background: set up the base url
    Given url 'http://simple-grocery-store-api.online'
    * def File = Java.type('java.io.File')
    * def Scanner = Java.type('java.util.Scanner')
    * def path = 'C:/Users/HarshvardhanNigaveka/eclipse-workspace/Grocery_karateFramework/target/CartId.txt'
    * def file = new File(path)
    * def scanner = new Scanner(file)
    * def cartId = scanner.useDelimiter('\\Z').next()
    * def path1 = 'C:/Users/HarshvardhanNigaveka/eclipse-workspace/Grocery_karateFramework/target/secure.txt'
    * def file1 = new File(path1)
    * def scanner = new Scanner(file1)
    * def token = scanner.useDelimiter('\\Z').next()
    * scanner.close()

  Scenario Outline: Create Order with Valid Data
    Given path '/orders'
    And request { cartId: "#(cartId)", customerName: <customerName> }
    And header Authorization = 'Bearer ' + token
    When method post
    Then status 201
    And match response.created == true
    And def orderId = response.orderId
    And karate.write(orderId, 'orderId.txt')

    Examples: 
      | customerName |
      | "Harry"      |

  Scenario Outline: Create new order in application with invalid parameters
    Given path '/orders'
    * def cartId = cartId + 'abc'
    And request { cartId: "#(cartId)", customerName: <customerName> }
    And header Authorization = 'Bearer ' + token
    When method post
    Then status 400
    And print response

    Examples: 
      | customerName |
      | "Joe Smith"  |

  Scenario Outline: Create new order in application => Unauthorized
    Given path '/orders'
    And request { cartId: "#(cartId)", customerName: <customerName> }
    And header Authorization = 'Bearer ' + '<invalidAccessToken>'
    When method post
    Then status 401
    And print response

    Examples: 
      | customerName | invalidAccessToken                                               |
      | "Joe Smith"  | beff20404a47f23c9ca61f576a0cfa49d9febdb228a409c2f7630cd724288ab3 |
