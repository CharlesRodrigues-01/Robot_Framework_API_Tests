*** Settings ***
Resource          get_products_keywords.resource
Suite Setup    Create Session  session_rapid_API  ${Base_URL}

*** Test Cases ***
Get Products 
    [Tags]    Products
    Get Products successfully

Get Products without authorization
    [Tags]    Products
    Get Products without authorization

Get Products without parameters
    [Tags]    Products
    Get Products without parameters