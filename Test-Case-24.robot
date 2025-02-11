*** Settings ***
Library  SeleniumLibrary
Library  Collections

*** Variables ***
${URL}  http://automationexercise.com
${BROWSER}  Chrome

*** Test Cases ***
Test Case 24: Download Invoice after purchase order
    Open Browser  ${URL}  ${BROWSER}
    Maximize Browser Window
    
    Verify Home Page Is Visible
    Add Products To Cart
    Click Cart Button
    Verify Cart Page Is Displayed
    Click Proceed To Checkout
    Click Register Or Login Button
    Fill Signup Details And Create Account
    Verify Account Created And Click Continue
    Verify Logged In As Username
    Click Cart Button
    Click Proceed To Checkout Button
    Verify Address Details And Review Order
    Enter Description And Place Order
    Enter Payment Details
    Click Pay And Confirm Order
    Verify Order Success Message
    Click Download Invoice And Verify
    Click Continue Button
    Click Delete Account Button
    Verify Account Deleted And Click Continue
    
    Close Browser

*** Keywords ***
Verify Home Page Is Visible
    Wait Until Page Contains  Home

Add Products To Cart
    #เพิ่มสินค้าลงในตะกร้า
    Wait Until Element Is Visible  //button[contains(text(),'Add to cart')]
    Click Element  //button[contains(text(),'Add to cart')]

Click Cart Button
    Click Element  //a[contains(text(),'Cart')]

Verify Cart Page Is Displayed
    Wait Until Page Contains  Shopping Cart

Click Proceed To Checkout
    Click Element  //button[contains(text(),'Proceed To Checkout')]

Click Register Or Login Button
    Click Element  //a[contains(text(),'Register / Login')]

Fill Signup Details And Create Account
    #กรอกข้อมูลสมัครสมาชิก
    Input Text  name=name  Test User
    Input Text  name=email  testuser@example.com
    Input Text  name=password  test1234
    Click Button  Submit

Verify Account Created And Click Continue
    Wait Until Page Contains  ACCOUNT CREATED!
    Click Button  Continue

Verify Logged In As Username
    Wait Until Page Contains  Logged in as Test User

Click Proceed To Checkout Button
    Click Element  //button[contains(text(),'Proceed To Checkout')]

Verify Address Details And Review Order
    Wait Until Page Contains  Address Details

Enter Description And Place Order
    Input Text  name=message  This is a test order.
    Click Button  Place Order

Enter Payment Details
    Input Text  name=card_name  Test User
    Input Text  name=card_number  4111111111111111
    Input Text  name=cvc  123
    Input Text  name=exp_month  12
    Input Text  name=exp_year  2025

Click Pay And Confirm Order
    Click Button  Pay and Confirm Order

Verify Order Success Message
    Wait Until Page Contains  Your order has been placed successfully!

Click Download Invoice And Verify
    Click Button  Download Invoice
    #กดปุ่ม Download Invoice และตรวจสอบว่ามีข้อความ Download Invoice แสดงอยู่

Click Continue Button
    Click Button  Continue

Click Delete Account Button
    Click Element  //a[contains(text(),'Delete Account')]

Verify Account Deleted And Click Continue
    Wait Until Page Contains  ACCOUNT DELETED!
    Click Button  Continue
