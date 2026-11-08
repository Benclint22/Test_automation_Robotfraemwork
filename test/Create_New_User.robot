*** Settings ***
Documentation     Main Test Suite for OrangeHRM Demo Application
Library           SeleniumLibrary
Resource          Variables.robot
Resource          Mykeyword.robot
Suite Setup       Setup login
Suite Teardown    Close All Browsers
