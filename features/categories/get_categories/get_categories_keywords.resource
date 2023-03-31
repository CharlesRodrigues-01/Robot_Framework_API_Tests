*** Settings ***
Library         RequestsLibrary
Library         Collections
Resource        ../../../features/support/base_API.robot

*** Keywords ***
Get Categories successfully
    ${headers}    Create Dictionary    X-RapidAPI-Key    ${X-RapidAPI-Key} 
    ...    X-RapidAPI-Host    ${X-RapidAPI-Host}
    ${resp_API}=   GET On Session    session_rapid_API    /catalog/categories    headers=&{headers}    
    ...    expected_status=200
    Status Should Be    OK    ${resp_API}
    Should Not Be Empty               ${resp_API.json()}
    Should Be Equal As Strings        ${resp_API.headers["Content-Type"]}    application/json; charset=utf-8
    ${count}=    Get length        ${resp_API.json()["categories"]}
    Length Should Be                  ${resp_API.json()["categories"]}    ${count}

Get Categories without authorization
    ${resp_API}=   GET On Session    session_rapid_API    /catalog/products    expected_status=401
    Should Be Equal As Strings    Unauthorized    ${resp_API.reason}
    Should Be Equal As Strings   ${resp_API.json()}[message]    ${Unauthorized_message}