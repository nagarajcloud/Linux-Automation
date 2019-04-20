# Linux-Automation
Linux Automation Scripts

# Linux Metrics Collection Scripts

linux_metrics.sh - This script shows usage details of disk, cpu and network statistics

Operating Systems : Ubuntu 18.04.2 LTS

# Prerequisites:
  
    Install systat package using below command
    
      apt install sysstat
    
# How to run?

		1. Download the file to your machine
		
		2. Grant execution permission to the file
		
				chmod +x linux_metrics.sh
			
		3. To get disk metrics ( Ensure you are running from the same path where the file is downloaded )
		
				./linux_metrics.sh disk
				./linux_metrics.sh cpu
				./linux_metrics.sh network
				
				
		



