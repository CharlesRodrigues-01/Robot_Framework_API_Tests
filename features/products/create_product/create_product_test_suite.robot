*** Settings ***
Resource          create_product_keywords.resource
Resource          ../delete_product/delete_product_keywords.resource
Suite Setup    Create Session  session_rapid_API  ${Base_URL}

*** Test Cases ***
Create Products
    [Tags]    Products
    Create Products successfully
    Delete Products by ID successfully

Create Product without authorization
    [Tags]    Products
    Create Product without authorization

Create Product with empty fields
    [Tags]    Products
    Create Product with empty fields
    Delete Products by ID successfully

Create Product without body
    [Tags]    Products
    Create Product without body


