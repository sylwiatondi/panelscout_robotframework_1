*** Test Cases ***
Library     SeleniumLibrary
Documentation   Suite descryption #automated tests for scouts website

*** Variables ***
${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en
${BROWSER}      Chrome
${SIGNINBUTTON}     xpath=//*[(text()= 'Sign in')]
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${PAGELOGO}     xpath=//*[@id="__next"]/form/div/div[1]/h5

*** Test Cases ***
Login to the system
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    [Teardown]    Close Browser

*** Keywords ***
Open login page
    Open Browser     ${LOGIN URL}    ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text      ${EMAILINPUT}   user08@getnada.com
Type in password
    Input Text       ${PASSWORDINPUT}   Test-1234
Click on the Submit button
    Click Element   xpath=//*[(text()= 'Sign in')]
Assert dashboard
    wait until element is visible    ${PAGELOGO}
    title should be     Scouts panel
    Capture Page Screenshot     alert.png
