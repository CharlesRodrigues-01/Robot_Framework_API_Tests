*** Settings ***
Library         RequestsLibrary
Library         Collections
Resource        ../../../features/support/base_API.robot

*** Keywords ***
Get Product by ID successfully
    ${headers}    Create Dictionary    X-RapidAPI-Key    ${X-RapidAPI-Key} 
    ...    X-RapidAPI-Host    ${X-RapidAPI-Host}
    ${resp_API}=   GET On Session    session_rapid_API    /catalog/product/${id}    headers=&{headers}    
    ...    expected_status=200
    Status Should Be    OK    ${resp_API}
    Should Not Be Empty               ${resp_API.json()}
    Should Be Equal As Strings        ${resp_API.headers["Content-Type"]}    application/json; charset=utf-8
    Should Be Equal As Numbers   ${resp_API.json()}[id]    ${id}
    Should Be Equal As Strings   ${resp_API.json()}[name]    ${name}
    Should Be Equal As Strings   ${resp_API.json()}[manufacturer]    ${manufacturer}
    Should Be Equal As Numbers   ${resp_API.json()}[price]    ${price}

Get Product by ID without authorization
    ${resp_API}=   GET On Session    session_rapid_API    /catalog/product/${id}    expected_status=401
    Should Be Equal As Strings    Unauthorized    ${resp_API.reason}
    Should Be Equal As Strings   ${resp_API.json()}[message]    ${Unauthorized_message}

Get non-existent Product by ID
    ${headers}    Create Dictionary    X-RapidAPI-Key    ${X-RapidAPI-Key} 
    ...    X-RapidAPI-Host    ${X-RapidAPI-Host}
    ${resp_API}=   GET On Session    session_rapid_API    /catalog/product/${non_existent_id}    headers=&{headers}    
    ...    expected_status=404
    Status Should Be    Not Found    ${resp_API}
    Should Not Be Empty               ${resp_API.json()}
    Should Be Equal As Strings        ${resp_API.headers["Content-Type"]}    application/json; charset=utf-8
    Should Be Equal As Numbers   ${resp_API.json()}[statusCode]    404
    Should Be Equal As Strings   ${resp_API.json()}[message]    ${product_not_found_message}
