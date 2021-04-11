
*** Variables ***
# Configuration
${BROWSER} =        chrome
${LOGIN_URL} =      https://login.salesforce.com
${ACCOUNT_URL} =    https://knowledge-web-14204.lightning.force.com/lightning/r/Account/0014x000009sUZOAA2/view


# Input Data
&{USER_CREDENTIALS}  Email=taniya.dey-1452066749@vlocityapps.com  Password=Vlocity1234
${CONTRACT_NAME} =  Test Contract
#Variables

${CONTRACT_TERM1} =  1 year
${CONTRACT_TERM2} =  2 years
${CONTRACT_STATUS1} =  Draft
${CONTRACT_STATUS2} =  Signed
${ACCOUNT_NAME} =  John Smith