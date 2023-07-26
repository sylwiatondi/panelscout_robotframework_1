*** Settings ***

Library    SeleniumLibrary
Documentation       Suite descryption #automated tests for scouts website

*** Variables ***
${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en
${BROWSER}      Chrome
${SIGNINBUTTON}     xpath=//*[(text()= 'Sign in')]
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${PAGELOGO}     xpath=//*[@id="__next"]/div[1]/header/div/h6
${SIGNOUTBUTTON}    xpath=//*[(text()= 'Sign out')]
${ADDPLAYERBUTTON}  xpath=//*[(text()= 'Add player')]
${PLAYERSBUTTTON}   xpath=//*[(text()= 'Players')]
${ADDPLAYERSEARCH}     //*[@id="__next"]/div[1]/header/div/div[1]/div[2]/input
${NAMEINPUT}        xpath=//input[@name='name']
${SURNAMEINPUT}     xpath=//input[@name='surname']
${PHONEINPUT}       xpath=//input[@name='phone']
${AGEINPUT}     xpath=//input[@name='age']
${MAINPOSITIONINPUT}       xpath=//input[@name='mainPosition']
${BUTTONSUBMIT}     xpath=//button[@type='submit']
${ADDPLAYERLOGO}    xpath=//*[@id="__next"]/div[1]/main/div[2]/form/div[1]/div/span
${CLEARBUTTON}      xpath=//*[(text()= 'Clear')]
${LEGBUTTON}        xpath=//*[@id='mui-component-select-leg']
${LEFT LEG}         xpath=//div[3]/ul/li[2]


*** Test Cases ***
Login to the system
    Open login page
    Type in email
    Type in password
    Click on the Sign in button
    Assert dashboard
    [Teardown]      Close Browser

Log of from the system
    Open Login Page
    Type In Email
    Type In Password
    Click on the Sign in button
    Assert dashboard
    Click On The Sign Out Button
    [Teardown]      Close Browser

Go to player page
    Open login page
    Type in email
    Type in password
    Click on the Sign in button
    Assert dashboard
    Click on the Add Player button
    Click on Players button
    Assert Players page
    [Teardown]      Close Browser

Add a player
    Open login page
    Type in email
    Type in password
    Click on the Sign in button
    Assert dashboard
    Click on the Add Player button
    Assert add player
    Type in name
    Type in surname
    Type in age date
    Type in main position
    Click on the Submit
    Assert add player page
    [Teardown]      Close Browser

Add a player clear
    Open login page
    Type in email
    Type in password
    Click on the Sign in button
    Assert dashboard
    Click on the Add Player button
    Assert add player
    Type In name
    Type In Surname
    Type in age date
    Type in main position
    Click on the Clear Button
    Assert add player page
    [Teardown]      Close Browser

Add a player chose leg
    Open login page
    Type in email
    Type in password
    Click on the Sign in button
    Assert dashboard
    Click on the Add Player button
    Assert add player
    Type in name
    Type in surname
    Type in age date
    Type in main position
    Click on the leg button
    Click on the left leg
    Click on the Submit
    Assert add player page
    [Teardown]      Close Browser


*** Keywords ***
Open login page
    Open Browser     ${LOGIN URL}    ${BROWSER}
    Title Should Be     Scouts panel - sign in

Type in email
    Input Text      ${EMAILINPUT}   user08@getnada.com

Type in password
    Input Text       ${PASSWORDINPUT}   Test-1234

Click on the Sign in button
    Click Element   xpath=//*[(text()= 'Sign in')]

Click on the Sign Out button
    Click Element   xpath=//*[(text()= 'Sign out')]

Click on the Add Player button
    Click Element   xpath=//*[(text()= 'Add player')]

Click on Players button
    Click Element   xpath=//*[(text()= 'Players')]

Type In name
    Input Text      ${NAMEINPUT}   Sylwia

Type in surname
    Input Text      ${SURNAMEINPUT}   Kaczorowska

Type in age date
    Input Text           ${AGEINPUT}  21.09.1984

Type in main position
    Input Text      ${MAINPOSITIONINPUT}   goalkeeper

Click On The Submit
    Click Element       xpath=//button[@type='submit']

Click on the Clear Button
    Click Element       xpath=//*[(text()= 'Clear')]

Click on the leg button
    Click Element       xpath=//*[@id='mui-component-select-leg']
Click on the left leg
    Click Element       xpath=//div[3]/ul/li[2]

Assert Players page
    wait until element is visible    ${ADDPLAYERSEARCH}
    title should be     Players (4302) page 1
    Capture Page Screenshot     alert.png

Assert add player
    wait until element is visible    ${ADDPLAYERLOGO}
    title should be     Add player
    Capture Page Screenshot     alert.png

Assert add Player page
    wait until element is visible    ${ADDPLAYERLOGO}
    title should be     Add player
    Capture Page Screenshot     alert.png

Assert dashboard
    wait until element is visible    ${PAGELOGO}
    title should be     Scouts panel
    Capture Page Screenshot     alert.png