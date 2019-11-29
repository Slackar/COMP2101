$wmi = gwmi -class win32_product -filter "vendor!='Microsoft Corporation'"
$wmi | sort-object -property installdate | 
    format-table -AutoSize Name, Vendor, Version, @{n="Install Date"; e={$_.installdate}}