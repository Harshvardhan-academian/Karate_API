Feature: To automate the tests
 
  Background: Setup the base path
    Given url 'https://simple-grocery-store-api.glitch.me'
 
  Scenario: To automate
    #	STATUS
    Given call read("classpath:com/api/automation/GetStatus/GetStatus.feature")
    # PRODUCTS
    And call read("classpath:com/api/automation/Product/getAllProducts.feature")
    And call read("classpath:com/api/automation/Product/getSingleProduct.feature")
    # CART
    And call read("classpath:com/api/automation/Cart/createNewCart.feature")
    And call read("classpath:com/api/automation/Cart/getCart.feature")
    And call read("classpath:com/api/automation/Cart/addItemsToCart.feature")
    And call read("classpath:com/api/automation/Cart/getCartItems.feature")
    And call read("classpath:com/api/automation/Cart/modifyCartItems.feature")
    And call read("classpath:com/api/automation/Cart/replaceCartItems.feature")
    And call read("classpath:com/api/automation/Cart/deleteCartItems.feature")
    # ORDERS
    And call read("classpath:com/api/automation/Order/createNewOrder.feature")
    And call read("classpath:com/api/automation/Order/getAllOrders.feature")
    And call read("classpath:com/api/automation/Order/getSingleOrder.feature")
    And call read("classpath:com/api/automation/Order/updateOrder.feature")
    And call read("classpath:com/api/automation/Order/deleteOrder.feature")