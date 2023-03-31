*** Settings ***
Resource          delete_product_keywords.resource
Resource          ../create_product/create_product_keywords.resource
Suite Setup    Create Session  session_rapid_API  ${Base_URL}

*** Test Cases ***
Delete Product by ID
    [Tags]    Products
    Create Products successfully
    Delete Products by ID successfully

Delete Products without authorization
    [Tags]    Products
    Delete Products without authorization

Delete non-existent Product by ID
    [Tags]    Products
    Delete non-existent Product by ID