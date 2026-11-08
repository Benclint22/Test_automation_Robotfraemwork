*** Settings ***
Documentation     Main Test Suite for OrangeHRM Demo Application
Library           SeleniumLibrary
Resource          Variables.robot
Resource          Mykeyword.robot
Suite Teardown    Close All Browsers

*** Test Cases ***
Verify logo is displayed
    [Documentation]    Verifies that the company logo loads successfully on the login page.
    [Tags]             Smoke    UI
    Open Application Browser
    Verify Logo Is Displayed
    [Teardown]         Close Browser Session

Valid Login Test
    [Documentation]    Verifies successful user authentication and dashboard navigation.
    [Tags]             Smoke    Regression    Rear
    Open Application Browser
    Perform User Login
    Verify Dashboard Loaded
    [Teardown]         Close Browser Session