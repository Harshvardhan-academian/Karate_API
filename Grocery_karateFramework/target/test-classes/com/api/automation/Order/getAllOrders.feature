Feature: Get All Orders

  Background: set up the base url
    Given url 'http://simple-grocery-store-api.online'
    * def File = Java.type('java.io.File')
    * def Scanner = Java.type('java.util.Scanner')
    * def path = 'C:/Users/HarshvardhanNigaveka/eclipse-workspace/Grocery_karateFramework/target/secure.txt'
    * def file = new File(path)
    * def scanner = new Scanner(file)
    * def token = scanner.useDelimiter('\\Z').next()
    * scanner.close()

  Scenario: Get All Orders
    Given path '/orders'
    And header Authorization = 'Bearer ' + token
    When method get
    Then status 200
    And print response

  Scenario: Get All Orders with invalid unathorized
    Given path '/orders'
    And header Authorization = 'Bearer ' + token + "1234"
    When method get
    Then status 401
    And print response
