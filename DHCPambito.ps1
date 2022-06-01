#######################################
######### Jorge Fernández     #########
######### 26/10/2021          #########
######### Crear ámbbito DHCP  #########
######### y opsciones         #########
#######################################
cls

Remove-DhcpServerv4Scope -scopeid 192.68.20.0 -force
Add-DhcpServerv4Scope -StartRange 192.168.20.4 -EndRange 192.168.20.14 -Name Ambito1 -SubnetMask 255.255.255.240 -LeaseDuration 0.6:5 #d.h.m

Remove-DhcpServerv4Scope -scopeid 192.68.50.176 -force
Add-DhcpServerv4Scope -StartRange 192.168.50.178 -EndRange 192.168.50.182 -Name Ambito2 -SubnetMask 255.255.255.240 -LeaseDuration 0.6:5 #d.h.m

# Añadir opciones al ámbito.
Set-DhcpServerv4OptionValue -DnsDomain domi.com -DnsServer 1.1.1.1,1.0.0.1 -Router 192.168.50.177 -ScopeId 192.168.50.176

# Añadir reservas.
add-dhcpserverv4reservation -IPAddress 192.168.50.185 -clientid FF:FF:FF:FF:FF:FF -ScopeId 192.168.50.176
add-dhcpserverv4reservation -IPAddress 192.168.50.186 -clientid FF:FF:FF:FF:FF:FF -ScopeId 192.168.50.176

import-csv
$macs = .\MAC.csv
Import-Csv -path $macs
foreach($mac in $macs){
    add-dhcpserverv4reservation

}