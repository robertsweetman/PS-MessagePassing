function file5_function {

    param(
        $stringInput = "default"
    )

    Write-Host "file5 function input param: $stringInput"


    # TODO: explain this option (script var)
    # $script:file5_returnvalue = "$stringInput" + "-boogalloo" 
    
    # TODO: explain this in relation to how 'return' works in Powershell and why to avoid it
    "$stringInput" + "-boogalloo"
}