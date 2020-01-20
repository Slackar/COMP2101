'DETAILED SYSTEM INFORMATION

-----------System Hardware Description-----------'
gwmi win32_computersystem

""
'-----------Operating System-----------'
gwmi win32_operatingsystem | select-object @{n='Operating System Name'; e={$_.caption}}, Version
#gwmi win32_operatingsystem | Select-Object @{n='Organization';e={ if ($_.organization) {$_.organization} else {"no org data"} } }

""
'-----------Processor-----------'
gwmi win32_processor | select-object @{n='Processor Type'; e={$_.caption}}, 
    Name, @{n='Speed/GHz'; e={$_.MaxClockSpeed/1000}}, NumberOfCores,
    @{n="L1 Cache Size";e={switch($_.L1CacheSize){$null{$stat="NA"}
    0{$stat="0"}};$stat}}, 
    @{n="L2 Cache Size";e={switch($_.L2CacheSize){$null{$stat="NA"}
    0{$stat="0"}};$stat}},
    @{n="L3 Cache Size";e={switch($_.L3CacheSize){$null{$stat="NA"}
    0{$stat="0"}};$stat}}

""
'-----------Video Controller-----------'
gwmi win32_videocontroller | 
Format-list @{n="Video Card Vendor"; e={$_.AdapterCompatibility}},
Description,
@{n="Current Screen Resolution"; e={$_.VideoModeDescription}}

""
'-----------RAM DIMM Information-----------'
$totalcapacity = 0
get-wmiobject -class win32_physicalmemory | 
foreach {
new-object -TypeName psobject -Property @{
Manufacturer =$_.manufacturer
Description = $_.description                                                           
"Size(GB)" = $_.capacity/1gb                              
Bank = $_.banklabel                              
Slot = $_.devicelocator                  
}                 
$totalcapacity += $_.capacity/1gb} |
ft -auto @{n='Manufacturer';e={ if ($_.manufacturer) {$_.manufacturer} else {"VMWare"} } }, description, "Size(GB)", Bank, Slot
"Total RAM: ${totalcapacity}GB"

""
'-----------Physical Drive(s) Information-----------'
Get-WmiObject Win32_DiskDrive | ForEach-Object {
  $disk = $_
  $partitions = "ASSOCIATORS OF " +
                "{Win32_DiskDrive.DeviceID='$($disk.DeviceID)'} " +
                "WHERE AssocClass = Win32_DiskDriveToDiskPartition"
  Get-WmiObject -Query $partitions | ForEach-Object {
    $partition = $_
    $drives = "ASSOCIATORS OF " +
              "{Win32_DiskPartition.DeviceID='$($partition.DeviceID)'} " +
              "WHERE AssocClass = Win32_LogicalDiskToPartition"
    Get-WmiObject -Query $drives | ForEach-Object {
      New-Object -Type PSCustomObject -Property @{
        Disk        = $disk.DeviceID
        'Disk FUll Size(GB)'    = ($disk.Size/1GB) -as [single]
        'Disk Model'   = $disk.Model
        'Partition Size(GB)'   = $partition.size/1gb -as [single]
        'Drive Letter' = $_.DeviceID
        'FreeSpace(GB)'   = ($_.FreeSpace/1GB) -as [single]
        'FreeSpace(%)'   = ($_.FreeSpace/$_.Size*100) -as [int]
     } 
    }    
  }
} | ft -auto Disk, 'Drive Letter', 'Disk Model', 'Disk FUll Size(GB)', 'Partition Size(GB)', 'FreeSpace(GB)', 'FreeSpace(%)'



#$list = ('operatingsystem','computersystem','processor','videocontroller')
#foreach ($myvar in $list[0..3]) {
#(gwmi win32_$myvar) | ?{$_.Value -ne 0}
#(gwmi win32_$myvar| Select -First 1).PSObject.Properties | ?{$_.Value -ne $null} | FT Name,Value
#}
