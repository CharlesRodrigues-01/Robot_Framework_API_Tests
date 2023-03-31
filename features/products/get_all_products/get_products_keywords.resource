*** Settings ***
Library         RequestsLibrary
Library         Collections
Resource        ../../../features/support/base_API.robot

*** Keywords ***
Get Products successfully
    ${headers}    Create Dictionary    X-RapidAPI-Key    ${X-RapidAPI-Key} 
    ...    X-RapidAPI-Host    ${X-RapidAPI-Host}
    ${params}=    Create Dictionary    skip=${Skip}    limit=${Limit}   
    ${resp_API}=   GET On Session    session_rapid_API    /catalog/products    ${params}    headers=&{headers}    
    ...    expected_status=200
    Status Should Be    OK    ${resp_API}
    Should Not Be Empty               ${resp_API.json()}
    Should Be Equal As Strings        ${resp_API.headers["Content-Type"]}    application/json; charset=utf-8
    ${count}=    Get length        ${resp_API.json()["products"]}
    should be equal as numbers        ${count}                  ${Limit}
    Length Should Be                  ${resp_API.json()["products"]}    ${Limit}

Get Products without authorization
    ${params}=    Create Dictionary    skip=${Skip}    limit=${Limit}    
    ${resp_API}=   GET On Session    session_rapid_API    /catalog/products    ${params}    expected_status=401
    Should Be Equal As Strings    Unauthorized    ${resp_API.reason}
    Should Be Equal As Strings   ${resp_API.json()}[message]    ${Unauthorized_message}

Get Products without parameters
    ${HEADERS}    Create Dictionary    X-RapidAPI-Key    ${X-RapidAPI-Key} 
    ...    X-RapidAPI-Host    ${X-RapidAPI-Host}
    ${resp_API}=   GET On Session    session_rapid_API    /catalog/products    headers=&{headers}    
    ...    expected_status=200
    Status Should Be    OK    ${resp_API}
    Should Not Be Empty               ${resp_API.json()}
    Should Be Equal As Strings        ${resp_API.headers["Content-Type"]}    application/json; charset=utf-8