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