#$Install = @{n="Installed";e={($_.InstallDate,'yyyyMMdd',$null)}}
gwmi -class win32_product -filter "vendor!='Microsoft Corporation'" | 
sort-object -property installdate | 
Select-Object Vendor, @{n="Installed";e={[DateTime]::ParseExact($_.InstallDate,'yyyyMMdd',$null)}}