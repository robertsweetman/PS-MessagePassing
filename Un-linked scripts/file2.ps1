function input2 {
    
    param(
        $value2 = $Args[0]
    )
    
    Write-Host "file2 call result: $value2"
            
}

input2 -value2 $value1