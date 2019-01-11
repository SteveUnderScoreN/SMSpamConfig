## SmarterMail Spam configuration recommended settings in XML and JSON format.
The configuration is based on fast DNS server being required and dedicated servers being recommended.
DNS should only use root hints beyond the network edge and not forwarders.
If using more than 100,000 queries per day customers need to register with the provider and only use
non registered services on spool filtering (registered on both) along with an inbound weight SMTP blocking.

## Recommended Antispam options for SM16
.. (XML to be provided)  
The following settings do not exist in the XML configuration file and need to be set through the web interface;  
```
  Options/Options/Autoresponders                       - Require message pass SPF  
  Options/Options/Content Filter Bouncing              - Require message pass SPF  
  Options/Options/Enable DMARC policy compliance check - Enabled  
```

## RBL/URIBL settings for SM16
Export the current Antispam settings and take a copy of your exported spamconfig.xml as a backup  
Download spamconfigupdates.xml from this repositiry  
Edit the spamconfig.xml and find the line;  
```
    <ReverseDNSEnabled>True</ReverseDNSEnabled>
```  
Replace that line and everything below (except the last line) with the contents of the spamconfigupdates.xml  
It should end;  
```
    <smtpoutgoingenabled>False</smtpoutgoingenabled>
   </SpamIp4rLookup>
  </SpamOptions>
```  
Save the file and import it into SM.
Any concerns and you can import your backup file.

## RBL/URIBL settings for SM17
.. (JSON to be provided)

## Troubleshooting
Any incoming mail that has been rejected by the 'SMTP Blocking/Incoming Weight Threshold' feature can be found  
in the SMTP logs searching for 'Mail rejected due to SMTP Spam Blocking' and displaying related traffic.  
The rules used to calculate the score are displayed here along with the connecting IP address and the sending domain.  
Use ```http://multirbl.valli.org/lookup/%ConnectingIPAdress%.html``` to get a report from all blocking services.  
Use ```https://exchange.xforce.ibmcloud.com/ip/%ConnectingIPAdress%``` to get the IBM X-Force report on the sending IP address.  
Use ```https://exchange.xforce.ibmcloud.com/url/%SendingDomain%``` to get the IBM X-Force report on the sending domain.  
E.g.  
```
  http://multirbl.valli.org/lookup/104.171.117.108.html
  https://exchange.xforce.ibmcloud.com/ip/104.171.117.108
  https://exchange.xforce.ibmcloud.com/url/smartertools.com
````
Any mail that has been processed by spool filtering can be found by searcing the Delivery log using the following;  
  To find email delivered to the inbox search for 'Filter: None'  
  To find email delivered to the junk email folder (SPAM-LOW) search for 'Filter: Move spam'  
  To find all email deleted by spool filtering search for 'Filter: Spam'  
  To find email that would have been identified as SPAM-MED but was deleted by spool filtering search for 'Filter: Spam (Weight: 2'  
