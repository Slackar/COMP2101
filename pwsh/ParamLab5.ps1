Param([Parameter(Mandatory=$true,position=1, ValueFromPipeline=$true)]$object)
($object.GetType()) | Select-Object Fullname, Name | fl