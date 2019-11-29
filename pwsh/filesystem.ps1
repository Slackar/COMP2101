get-wmiobject -class win32_logicaldisk |
    Where-Object size -gt 0 | 
    select-object @{n="Drive Letter"; e={$_.deviceid}}, 
    @{n="Size(GB) "; e={$_.Size/1GB -as [int]}}, 
    @{n="Free-Space(GB) "; e={$_.Freespace/1GB -as [int]}}, 
    @{n="Provider Name"; e={$_.providername}}