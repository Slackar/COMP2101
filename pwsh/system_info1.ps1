﻿$list = ('operatingsystem','computersystem','processor','videocontroller')
foreach ($myvar in $list[0..3]) {
(gwmi win32_$myvar) | ?{$_.Value -ne 0}
#(gwmi win32_$myvar| Select -First 1).PSObject.Properties | ?{$_.Value -ne $null} | FT Name,Value
}
