*** Settings ***
Library         RequestsLibrary
Library         Collections
Resource        ../../../features/support/base_API.robot

*** Variable ***
${Category}    Software
${Invalid_Category}    x

*** Keywords ***
Get Products in category successfully
    ${headers}    Create Dictionary    X-RapidAPI-Key    ${X-RapidAPI-Key} 
    ...    X-RapidAPI-Host    ${X-RapidAPI-Host}
    ${params}=    Create Dictionary    skip=${Skip}    limit=${Limit}   
    ${resp_API}=   GET On Session    session_rapid_API    /catalog/category/${Category}/products    ${params}    headers=&{headers}    
    ...    expected_status=200
    Status Should Be    OK    ${resp_API}
    Should Not Be Empty               ${resp_API.json()}
    Should Be Equal As Strings        ${resp_API.headers["Content-Type"]}    application/json; charset=utf-8
    ${count}=    Get length        ${resp_API.json()["products"]}
    should be equal as numbers        ${count}                  ${Limit}
    Length Should Be                  ${resp_API.json()["products"]}    ${Limit}

Get Products in category without authorization
    ${params}=    Create Dictionary    skip=${Skip}    limit=${Limit}    
    ${resp_API}=   GET On Session    session_rapid_API    /catalog/category/${Category}/products    ${params}    expected_status=401
    Should Be Equal As Strings    Unauthorized    ${resp_API.reason}
    Should Be Equal As Strings   ${resp_API.json()}[message]    ${Unauthorized_message}

Get Products in non-existent category
    ${HEADERS}    Create Dictionary    X-RapidAPI-Key    ${X-RapidAPI-Key} 
    ...    X-RapidAPI-Host    ${X-RapidAPI-Host}
    ${params}=    Create Dictionary    skip=${Skip}    limit=${Limit}   
    ${resp_API}=   GET On Session    session_rapid_API    /catalog/category/${Invalid_Category}/products    ${params}    headers=&{headers}    
    ...    expected_status=200
    Status Should Be    OK    ${resp_API}
    Should Not Be Empty               ${resp_API.json()}
    Should Be Equal As Strings        ${resp_API.headers["Content-Type"]}    application/json; charset=utf-8
    Should Be Empty    ${resp_API.json()}[products]