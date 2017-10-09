function file5_function {

    param(
        $stringInput = "default"
    )

    Write-Host "file5 function input param: $stringInput"

    #$script:file5_returnVar = "$stringInput" + "-boogalloo" 
    return "$stringInput" + "-boogalloo"
}