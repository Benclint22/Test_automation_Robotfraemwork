*** Settings ***
Documentation     Resource file containing custom keywords for OrangeHRM
Library           SeleniumLibrary
Resource          Variables.robot
Suite tear

*** Keywords ***
Open Application Browser
    Open Browser                    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Implicit Wait      ${IMPLICIT_WAIT}
    Wait Until Element Is Visible   ${USERNAME_FIELD}    timeout=${TIMEOUT}

Perform User Login
    [USER]
    Wait Until Element Is Visible   ${USERNAME_FIELD}    timeout=${TIMEOUT}
    Input Text                      ${USERNAME_FIELD}    ${USERNAME}
    Input Password                  ${PASSWORD_FIELD}    ${PASSWORD}
    Click Element                   ${LOGIN_BUTTON}

Verify Dashboard Loaded
    Wait Until Element Is Visible   ${DASHBOARD_HEADER}    timeout=${TIMEOUT}
    Page Should Contain Element     ${DASHBOARD_HEADER}

Verify Logo Is Displayed
    Wait Until Element Is Visible   ${LOGO_IMAGE}          timeout=${TIMEOUT}
    Page Should Contain Element     ${LOGO_IMAGE}

Verify Logged In User Profile
    [Arguments]                     ${expected_name}=${EXPECTED_USER}
    Wait Until Element Is Visible   ${PROFILE_NAME_TEXT}   timeout=${TIMEOUT}
    Wait Until Element Is Enabled   ${LOGIN_BUTTON}
    Click Element    ${LOGIN_BUTTON}
    Element Should Contain          ${PROFILE_NAME_TEXT}   ${expected_name}
    Element Should Conatin

Close Browser Session
    Close Browser

#Topic Breakdown Overview
#QA Test Design: BVA, EP, Severity vs. Priority matrix, and STLC phases.
#API Testing: HTTP status codes, HTTP methods (PUT vs. PATCH), headers, and JSON structure indexing.
#Web Locators: CSS attributes, XPath axes (following-sibling), and dynamic waits vs. hard sleeps.
#Basic Scripting: List comprehensions, dictionary counters, regex pattern matching, and SQL (HAVING / GROUP BY).