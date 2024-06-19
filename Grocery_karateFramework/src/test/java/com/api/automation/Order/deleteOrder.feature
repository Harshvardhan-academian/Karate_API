Feature: Delete Order

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

  Scenario: Delete Order
    Given path '/orders/'+ orderId
    * print "ORDER ID: ", orderId
    And header Authorization = 'Bearer ' + token
    When method delete
    Then status 204
    And print response
    #* call read("getAllOrders.feature")
