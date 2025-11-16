*** Settings ***
Resource  resource.robot
Suite Setup     Open And Configure Browser
Suite Teardown  Close Browser
Test Setup      Reset Application Create User And Go To Register Page

*** Variables ***
${SERVER}        localhost:5001
${DELAY}         0.5 seconds
${HOME_URL}      http://${SERVER}
${LOGIN_URL}     http://${SERVER}/login
${REGISTER_URL}  http://${SERVER}/register
${BROWSER}       firefox
${HEADLESS}      false

*** Test Cases ***

Register With Valid Username And Password
    Set Username  kalle1
    Set Password  kalle456
    Set Password Confirmation  kalle456
    Click Button  Register
    Title Should Be  Welcome to Ohtu Application!

Register With Too Short Username And Valid Password
    Set Username  ka
    Set Password  kalle456
    Set Password Confirmation  kalle456
    Click Button  Register
    Register Should Fail With Message  Username too short

Register With Valid Username And Too Short Password
    Set Username  kalle1
    Set Password  kall
    Set Password Confirmation  kall
    Click Button  Register
    Register Should Fail With Message  Invalid password

Register With Valid Username And Invalid Password
    Set Username  kalle1
    Set Password  kallekalle
    Set Password Confirmation  kallekalle
    Click Button  Register
    Register Should Fail With Message  Password should not contain only letters

Register With Nonmatching Password And Password Confirmation
    Set Username  kalle1
    Set Password  kalle456
    Set Password Confirmation  kalle457
    Click Button  Register
    Register Should Fail With Message  Passwords do not match

Register With Username That Is Already In Use
    Set Username  kalle
    Set Password  kalle456
    Set Password Confirmation  kalle456
    Click Button  Register
    Register Should Fail With Message  User with username kalle already exists


*** Keywords ***
Go To Register Page
    Go to  ${REGISTER_URL} 

Reset Application Create User And Go To Register Page
    Go To Register Page
    Reset Application
    Create User  kalle  kalle123

Register Should Fail With Message
    [Arguments]  ${message}
    Register Page Should Be Open
    Page Should Contain  ${message}

Set Username
    [Arguments]  ${username}
    Input Text  username  ${username}

Set Password
    [Arguments]  ${password}
    Input Password  password  ${password}

Set Password Confirmation
    [Arguments]  ${password_confirmation}
    Input Password  password_confirmation  ${password_confirmation}

Register Page Should Be Open
    Title Should Be  Register