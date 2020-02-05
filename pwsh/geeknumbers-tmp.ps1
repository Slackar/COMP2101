(1..8) | foreach {
    new-object -typename psobject -property @{
       PlaceCount=$_
       MaxValueInBinary=[math]::pow(2,$_)
       MaxValueInOctal=[math]::pow(8,$_)
       MaxValueInHex=[math]::pow(16,$_)
     }
} | format-table PlaceCount, MaxValueInBinary, MaxValueInOctal, MaxValueInHex
