***Keywords***



open default browser
    open browser       ${url}          ${browser}
    Set Window Size     ${width}        ${height}



wait and click fro element              
    [Arguments]         ${xpath}
    wait until element is visible       ${xpath}
    click element       ${xpath}