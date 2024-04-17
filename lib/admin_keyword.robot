***Keywords***



Login with user 
    wait and click fro element      //input[@placeholder='Username']
    input text                      //input[@placeholder='Username']       ${username}
    wait and click fro element      //input[@placeholder='Password']          
    input text                      //input[@placeholder='Password']        ${password}   
    wait and click fro element      //button[normalize-space()='Login']


Add an admin
    wait and click fro element      //span[normalize-space()='Admin']
    wait and click fro element      //button[normalize-space()='Add']
    sleep    2s
    wait and click fro element       //div[@class='oxd-select-text-input']
    press keys                      NONE        ARROW_DOWN
    press keys                      NONE        ENTER
    sleep      3s
    input text                      //input[@placeholder='Type for hints...']                   A
    sleep      3s
    press keys                      NONE        ARROW_DOWN
    press keys                      NONE        ENTER
    wait and click fro element      //body[1]/div[1]/div[1]/div[2]/div[2]/div[1]/div[1]/form[1]/div[1]/div[1]/div[3]/div[1]/div[2]/div[1]/div[1]/div[2]/i[1]
    press keys                      NONE        ARROW_DOWN
    press keys                      NONE        ENTER
    wait and click fro element      //body[1]/div[1]/div[1]/div[2]/div[2]/div[1]/div[1]/form[1]/div[1]/div[1]/div[4]/div[1]/div[2]/input[1]
    input text                      //body[1]/div[1]/div[1]/div[2]/div[2]/div[1]/div[1]/form[1]/div[1]/div[1]/div[4]/div[1]/div[2]/input[1]                 ${random}
    input text                      //body[1]/div[1]/div[1]/div[2]/div[2]/div[1]/div[1]/form[1]/div[2]/div[1]/div[1]/div[1]/div[2]/input[1]                 ibad1234
    input text                      //body[1]/div[1]/div[1]/div[2]/div[2]/div[1]/div[1]/form[1]/div[2]/div[1]/div[2]/div[1]/div[2]/input[1]                 ibad1234
    wait and click fro element      //button[normalize-space()='Save']
    sleep      5s
    # Go Back


Validate user added Sucessfully
    [Arguments]         ${user}
    sleep    5s
    wait and click fro element      //span[normalize-space()='Admin']
    wait and click fro element          //body[1]/div[1]/div[1]/div[2]/div[2]/div[1]/div[1]/div[2]/form[1]/div[1]/div[1]/div[1]/div[1]/div[2]/input[1]
    input text                          //body[1]/div[1]/div[1]/div[2]/div[2]/div[1]/div[1]/div[2]/form[1]/div[1]/div[1]/div[1]/div[1]/div[2]/input[1]       ${user}
    wait and click fro element          //button[normalize-space()='Search']
    sleep      5s
    ${value}                Get text            //div[contains(text(),'${user}')]
    should be equal         ${value}            ${random} 
    
