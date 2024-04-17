***Settings***


Resource        ../init.robot
Test Setup      testsetup

**Test Cases***


Add an admin into web
    [Tags]          admin
    [Documentation]         
    Login with user 
    Add an admin      
    Validate user added Sucessfully             ${random}




***Keywords***
testsetup
    open default browser
    ${value}            Generate Random String    5       [LETTERS]
    Set test Variable           ${random}           ${value}
