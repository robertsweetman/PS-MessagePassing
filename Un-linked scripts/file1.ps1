function input1 {

    param(
        $value1 = "default"
    )

    Write-Host "file1 call result: $value1"

}

# This is the important bit.
# $value1 is being defined as a global session variable
$global:value1 = "foo"

input1 -value1 $value1