# jutil
DevOps Utilities You May Find Useful

1. rbc (Reboot checker)
   * On RHEL 7 / CentOS 7 / Fedora requires: coreutils gawk hostname lsof mailx rpm sed util-linux
   * Default is to check if the system needs to be rebooted
   * Add a flag to alert via email, log to syslog, or to reboot the system if required
   * Tested on Fedora / RHEL

2. libreswan-key-to-conf
   * Take a list of names, IPs, and RSA public keys and output libreswan configuration
   * A separate IPSec SA is created between each of the hosts listed in the input file
   * Growth is #conf_items = (num_hosts*(num_hosts-1))/2
   * Tested on RHEL 7

3. dnscheck
   * This is a dumb (unintelligent) utility designed to check DNS server health over time
   * Output can be graphed with gnuplot
   * Designed to be run from cron and STDOUT redirected to a file:
   
    ```*/5 * * * *  /home/user/bin/dnscheck <DNS SERVER IP> >> /home/user/bin/dns-stats```
    
4. yum.upgrade / dnf.upgrade 
   * Stupid simple method to update all packages on a RHEL / CentOS / Fedora machine
   * yum.upgrade for RHEL / CentOS, dnf.upgrade for Fedora
   * Why? Because 'yum-cron' has only hourly or daily schedules, at fixed times
   * Place it in /usr/local/libexec
   * This can be called from cron at any schedule cron can perform, e.g.:

   ```00 07  *  *  *  root  /usr/local/libexec/yum.upgrade```

   * Works on RHEL & CentOS 5, 6, & 7, the same way
   * Now sends email when error is generated (yum.upgrade)

5. test-vhosts-from-httpd
   * Much like it sounds
   * use the shell command commented out at the top of the script to gather what vhosts are provided
   * using that saved information, you can run this script elsewhere to test all those vhosts
   * not perfect, but a sanity check to say, this is what happened before and after

6. reboot-test.php
   * PHP based web page
   * prints hostname
   * prints load averages
   * displays background.jpg
   * checks if systemd is going to reboot the system soon
   * returns 503 when reboot is imminent so load balancers can remove system from the pool
