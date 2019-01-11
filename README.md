## SmarterMail SPAM configuration recommended settings in XML and JSON format.
The configuration is based on fast DNS server being required and dedicated servers being recommended.
DNS should only use root hints beyond the network edge and not forwarders.
If using more than 100,000 queries per day customers need to register with the provider and only use
non registered services on spool filtering (registered on both) along with an inbound weight SMTP blocking.

## Recommended Antispam options for SM16
.. (XMl to be provided)  
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
