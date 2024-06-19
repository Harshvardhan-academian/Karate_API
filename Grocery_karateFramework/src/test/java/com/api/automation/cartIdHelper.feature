Feature: Cart Helper

  Background: 
    * def File = Java.type('java.io.File')
    * def Scanner = Java.type('java.util.Scanner')

  Scenario: Read CartId from File
    * def path = 'C:/Users/HarshvardhanNigaveka/eclipse-workspace/Grocery_karateFramework/target/CartId.txt'
    * def file = new File(path)
    * def scanner = new Scanner(file)
    * def cartId = scanner.useDelimiter('\\Z').next()
    * scanner.close()
    And print cartId
