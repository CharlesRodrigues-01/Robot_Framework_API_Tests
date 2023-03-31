*** Settings ***
Resource          get_products_in_category_keywords.resource
Suite Setup    Create Session  session_rapid_API  ${Base_URL}

*** Test Cases ***
Get Products in category 
    [Tags]    Categories
    Get Products in category successfully

Get Products in category without authorization
    [Tags]    Categories
    Get Products in category without authorization

Get Products in non-existent category
    [Tags]    Categories
    Get Products in non-existent category
