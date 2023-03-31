*** Settings ***
Resource          get_categories_keywords.resource
Suite Setup    Create Session  session_rapid_API  ${Base_URL}

*** Test Cases ***
Get Categories 
    [Tags]    Categories
    Get Categories successfully
    
Get Categories without authorization
    [Tags]    Categories
    Get Categories without authorization
