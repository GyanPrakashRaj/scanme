$ips = ("192.168.1.1", "192.168.1.3", "192.168.1.15"); 
$ports = (21, 22, 80, 443);

foreach ($ip in $ips) {

    if (Test-Connection -BufferSize 32 -Count 1 -ComputerName $ip -Quiet) {
        Write-Host "https://github.com/GyanPrakashRaj"
        Write-Host "[+] The "$ip" is Online"
        Write-Host "[!] Port Scan starting ..."
        Write-host "...gprsit"
        foreach ($port in $ports) {
            try {
            
                $socket = New-Object System.Net.Sockets.TcpClient($ip, $port);
    
            }
            catch {
    
            }; 
    
            if ($socket -eq $null) {
                Write-Host $ip":"$port" - Closed";
        
            }
            else {
            
               Write-Host $ip":"$port" - Open"; 
               $socket = $null;
            }
        }
    }
    else {
        Write-Host "[-] The "$ip" is Down"
    }

    

}
