*** Settings ***
Documentation    Complete API Test Suite for Swagger Petstore using RequestsLibrary
Library          RequestsLibrary
Library          Collections

*** Variables ***
${BASE_URL}      https://petstore.swagger.io/v2
${PET_ID}        987654

*** Test Cases ***
Get Available Pets
    [Documentation]    Fetches all pets with status available
    [Tags]             get_pets
    Create Session     pet_session    ${BASE_URL}    verify=true
    ${response}=       GET On Session    pet_session    /pet/findByStatus    params=status=available
    Status Should Be   200    ${response}

Get Sold Pets
    [Documentation]    Fetches all pets with status sold
    [Tags]             get_pets
    Create Session     pet_session    ${BASE_URL}    verify=true
    ${response}=       GET On Session    pet_session    /pet/findByStatus    params=status=sold
    Status Should Be   200    ${response}

Get Pending Pets
    [Documentation]    Fetches all pets with status pending
    [Tags]             get_pets
    Create Session     pet_session    ${BASE_URL}    verify=true
    ${response}=       GET On Session    pet_session    /pet/findByStatus    params=status=pending
    Status Should Be   200    ${response}

Create A New Pet
    [Documentation]    Creates a new pet entry in the pet store
    [Tags]             bender    create
    Create Session     pet_session    ${BASE_URL}    verify=true
    ${body}=           Create Dictionary    id=${PET_ID}    name=monkey    status=available
    ${response}=       POST On Session      pet_session    /pet    json=${body}
    Status Should Be   200                  ${response}
    Should Be Equal As Strings    ${response.json()['name']}    monkey

Delete Existing Pet
    [Documentation]    Deletes the created pet record by ID
    [Tags]             bender    delete
    Create Session     pet_session    ${BASE_URL}    verify=true
    ${response}=       DELETE On Session    pet_session    /pet/${PET_ID}
    Status Should Be   200                 ${response}