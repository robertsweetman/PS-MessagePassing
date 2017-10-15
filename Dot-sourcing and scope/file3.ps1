# parameters for running file3.ps1 should be at the TOP of the script!!
# let's say these are from the 'wider' environment (the user or some other application)
param()

# Powershell 3.0 and up has $PSScriptRoot which will automatically return the path of the running script
# loading contents of \file4.ps1 to allow file4_function to be executed
. ($PSScriptRoot + "\file4.ps1")
. ($PSScriptRoot + "\file5.ps1")
. ($PSScriptRoot + "\folder1\file6.ps1")

file4_function

# TODO: explain why this is required and how it works in relation to 'return' or not having one
$file5_returnvalue = file5_function -stringInput "woohoo"

<# https://blogs.technet.microsoft.com/heyscriptingguy/2009/07/08/hey-scripting-guy-how-do-i-get-data-out-of-a-function/
This is a really good article on function scope. 
#>

Write-Host "file5 return var: $file5_returnvalue <== returned to the calling script"

#Get-Location