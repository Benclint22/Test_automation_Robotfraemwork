*** Variables ***
# --- Application Configuration ---
${URL}                  https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}              chrome
${TIMEOUT}              20s
${IMPLICIT_WAIT}        10s

# --- Test Data / Credentials ---
${USERNAME}             Admin
${PASSWORD}             admin123
${EXPECTED_USER}        Benjaminn Nwanoruo

# --- Page Element Locators ---
${LOGO_IMAGE}           xpath://img[@alt='company-branding']
${USERNAME_FIELD}       name:username
${PASSWORD_FIELD}       name:password
${LOGIN_BUTTON}         xpath://button[@type='submit']
${DASHBOARD_HEADER}     xpath://h6[text()='Dashboard']
${PROFILE_NAME_TEXT}    css:.oxd-userdropdown-name
