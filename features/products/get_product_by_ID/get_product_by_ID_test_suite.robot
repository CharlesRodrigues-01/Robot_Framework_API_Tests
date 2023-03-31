*** Settings ***
Resource          get_product_by_ID_keywords.resource
Resource          ../create_product/create_product_keywords.resource
Resource          ../delete_product/delete_product_keywords.resource
Suite Setup    Create Session  session_rapid_API  ${Base_URL}

*** Test Cases ***
Get Product by ID
    [Tags]    Products
    Create Products successfully
    Get Product by ID successfully
    Delete Products by ID successfully
    
Get Product by ID without authorization
    [Tags]    Products
    Get Product by ID without authorization

Get non-existent Product by ID
    [Tags]    Products
    Get non-existent Product by ID

