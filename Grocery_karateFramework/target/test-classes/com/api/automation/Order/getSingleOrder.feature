Feature: Get Single Order

  Background: set up the base url
    Given url 'http://simple-grocery-store-api.online'
    * def File = Java.type('java.io.File')
    * def Scanner = Java.type('java.util.Scanner')
    * def path = 'C:/Users/HarshvardhanNigaveka/eclipse-workspace/Grocery_karateFramework/target/secure.txt'
    * def file = new File(path)
    * def scanner = new Scanner(file)
    * def token = scanner.useDelimiter('\\Z').next()
    * def path1 = 'C:/Users/HarshvardhanNigaveka/eclipse-workspace/Grocery_karateFramework/target/orderId.txt'
    * def file1 = new File(path1)
    * def scanner = new Scanner(file1)
    * def orderId = scanner.useDelimiter('\\Z').next()
    * scanner.close()

  Scenario: Get single Order
    Given path '/orders/'+ orderId
    * print "ORDER ID: ", orderId
    And header Authorization = 'Bearer ' + token
    When method get
    Then status 200
    And print response

  Scenario: Get single Order with unauthrized
    Given path '/orders/'+ orderId
    * print "ORDER ID: ", orderId
    And header Authorization = 'Bearer ' + token +"123"
    When method get
    Then status 401
    And print response

  Scenario: Get single Order with invalid Id's
    Given path '/orders/'+ orderId+'12'
    * print "ORDER ID: ", orderId
    And header Authorization = 'Bearer ' + token
    When method get
    Then status 404
    And print response
