*** Settings ***
Library         RequestsLibrary
Library         Collections
Resource        ../../../features/support/base_API.robot

*** Variable ***
${internal_server_error_message}    Internal server error

*** Keywords ***
Create Products successfully
    ${headers}    Create Dictionary    X-RapidAPI-Key    ${X-RapidAPI-Key} 
    ...    X-RapidAPI-Host    ${X-RapidAPI-Host}
    ${body}=            Create Dictionary     name=${name}    price=${price}    manufacturer=${manufacturer}    
    ...    category=${category}    description=${description}    tags=${tags}
    ${resp_API}=   POST On Session    session_rapid_API    /catalog/product    json=${body}    headers=&{headers}    
    ...    expected_status=201
    Should Not Be Empty               ${resp_API.json()}
    Should Be Equal As Strings        ${resp_API.headers["Content-Type"]}    application/json; charset=utf-8
    Should Be Equal As Strings   ${resp_API.json()}[name]    ${name}
    Should Be Equal As Strings   ${resp_API.json()}[manufacturer]    ${manufacturer}
    Should Be Equal As Numbers   ${resp_API.json()}[price]    ${price}
    ${id}          Get From Dictionary    ${resp_API.json()}    id
    Set Suite Variable                ${id}

Create Product without authorization
    ${body}=            Create Dictionary     name=${name}    price=${price}    manufacturer=${manufacturer}    
    ...    category=    description=    tags=
    ${resp_API}=   POST On Session    session_rapid_API    /catalog/product    json=${body}    expected_status=401
    Should Be Equal As Strings    Unauthorized    ${resp_API.reason}
    Should Be Equal As Strings   ${resp_API.json()}[message]    ${Unauthorized_message}

Create Product with empty fields
    ${headers}    Create Dictionary    X-RapidAPI-Key    ${X-RapidAPI-Key} 
    ...    X-RapidAPI-Host    ${X-RapidAPI-Host}
    ${body}=            Create Dictionary     name=    price=    manufacturer=    
    ...    category=    description=    tags=
    ${resp_API}=   POST On Session    session_rapid_API    /catalog/product    json=${body}    headers=&{headers}    
    ...    expected_status=201
    Should Not Be Empty               ${resp_API.json()}
    Should Be Equal As Strings        ${resp_API.headers["Content-Type"]}    application/json; charset=utf-8
    ${id}          Get From Dictionary    ${resp_API.json()}    id
    Set Suite Variable                ${id}

Create Product without body
    ${headers}    Create Dictionary    X-RapidAPI-Key    ${X-RapidAPI-Key} 
    ...    X-RapidAPI-Host    ${X-RapidAPI-Host}
    ${resp_API}=   POST On Session    session_rapid_API    /catalog/product    headers=&{headers}    
    ...    expected_status=500
    Status Should Be    Internal Server Error    ${resp_API}
    Should Not Be Empty               ${resp_API.json()}
    Should Be Equal As Strings        ${resp_API.headers["Content-Type"]}    application/json; charset=utf-8
    Should Be Equal As Numbers   ${resp_API.json()}[statusCode]    500
    Should Be Equal As Strings   ${resp_API.json()}[message]    ${internal_server_error_message}