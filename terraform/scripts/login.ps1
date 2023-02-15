param([String] $env="dev")
# Login to Azure batch account

if($env -eq "dev"){
    $resourceGroup = "resourcegroupdev"
    $batchAccount = "batchaccountdev"
}
else{
    $resourceGroup = "resourcegroupprd"
    $batchAccount = "batchaccountprd"
}

az batch account login -g $resourceGroup -n $batchAccount