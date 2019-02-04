## SmarterMail Antispam configuration recommended settings in XML and JSON format.
The configuration is based on the requirement that the DNS servers used by the SmarterMail server are fast and it's recommended that they are dedicated to the SmarterMail server.  
Those DNS servers should only use root hints beyond the network edge and not forwarders.
If making more than 100,000 DNS queries per day register with the provider, consider using rsync and only use
non registered services on spool filtering (registered on both) along with inbound weight SMTP blocking.  
These settings are designed to reject any mail from IP addresses that achieve a total weight of 30 or above
when the source address is test by;
- Checking that a valid reverse DNS entry (PTR) exists
- Checking the address listing on any block list enabled for 'Incoming SMTP' blocking
- Checking the IP address against the SPF record of the domain from the envelope 'Mail From' header (senderEmail(1))
- Checking for the 'Sender Score' of the IP address  

If the cumulative score of these tests is 30 or above a response of 554 is sent to the source ad no mail is received into the system.  
If the score is below 30 the email is received into the spool for further assessment by testing the following;
- DMARC record lookup is performed against the domain in the email 'From' header (senderEmail(2)), if DMARC tests fail and the DMARC record policy is 'reject' the email is deleted and no further tests are performed
- Rerunning all IP address tests enabled for 'Spool Filtering' which will be resolved from the DNS cache if the previous test produced a result
- Assessment by the internal 'Spamassassin-Based Pattern Matching'
- Analysis of the DKIM signature
- Any custom filters enabled for 'Spool Filtering'
- Submitting any URI domains found in the email to the URIBLs enabled for 'Spool Filtering'

If the cumulative score of these tests is below 10 the email is delivered to the inbox, if the score is from 10 to 19 the email is delivered to the junk email folder and if the score is 20 or above the email is deleted.  
When using custom Spam checks with these settings a value of -3 is a recommended for any unwanted matches and a value of 3 is good for any rules that should weigh positively e.g. add 'handbags' with a value of 3 if your in the business of making/selling handbags.  

## Which settings to use
If it's a new installation or you are planning to reset all non-custom Spam check settings and start from a fresh 2019 baseline then use 'Recommended Antispam options for SMxx'.  
If you just want the recommended settings that calculate the weight of mail, including the latest services, removing retired services and including configuration fixes then use 'RBL/URIBL/Reverse DNS/Null Sender/SPF/Domain Keys/DKIM settings for SMxx'. This will need testing along with the existing configured weight actions and any custom Spam checks. It is recommended that existing settings are increased/decreased to be brought closer to the values defined in the full recommended settings option.

## Adjusting threshold weight values
If you are testing these settings or you prefer to have some borderline Spam go into the junk email folder for review  
add 5 to each of the following;
```
Settings/Antispam/Options/Options/Filtering/Low Probability of Being Spam  
Settings/Antispam/Options/Options/Filtering/Medium Probability of Being Spam  
Settings/Antispam/Options/Options/Filtering/High Probability of Being Spam  
Settings/Antispam/Options/Options/SMTP Blocking/Incoming Weight Threshold
```

## Recommended Antispam options for SM16
Export the current Antispam settings as a backup and import ['SM16 spamConfig-reset with recommended defaults.xml'](https://github.com/SteveUnderScoreN/SMSpamConfig/archive/master.zip) from this repository.  
The following settings do not exist in the XML configuration file and need to be set through the web interface;  
```
Settings/Antispam/Options/Options/Autoresponders                       - Require message pass SPF  
Settings/Antispam/Options/Options/Content Filter Bouncing              - Require message pass SPF  
Settings/Antispam/Options/Options/Enable DMARC policy compliance check - Enabled  
```
Greylisting is not required when using these settings but it is not set to disabled when importing this policy.

## Recommended Antispam options for SM17
Export the current Antispam settings as a backup and import ['SM17 spamConfig-reset with recommended defaults.json'](https://github.com/SteveUnderScoreN/SMSpamConfig/archive/master.zip) from this repository.  

## RBL/URIBL/Reverse DNS/Null Sender/SPF/Domain Keys/DKIM settings for SM16
Export the current Antispam settings and take a copy of your exported spamConfig.xml as a backup.  
Download ['SM16 spamConfig updates.xml'](https://github.com/SteveUnderScoreN/SMSpamConfig/archive/master.zip) from this repository  
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
Verify the configuration in the web interface.

## RBL/URIBL/Reverse DNS/Null Sender/SPF/Domain Keys/DKIM settings for SM17
Export the current Antispam settings and take a copy of your exported spamConfig.json as a backup.  
Download ['SM17 spamConfig updates.ps1'](https://github.com/SteveUnderScoreN/SMSpamConfig/archive/master.zip) from this repository and modify the first line to reflect the location of the spamConfig.json file.  
Run the script.  
E.g. Run PowerShell_ISE.exe, open the script pane if needed (CTRL+R), select 'SM17 spamConfig updates.ps1' in this repository and click 'Raw', select all (CTRL+A), copy (CTRL+C) and paste the script into the PowerShell_ISE script pane (CTRL+V), modift line 1 to reflect the location of the spamConfig.json file to be modified and hit F5 to run the script.  
Import the modified spamConfig.json file into SM.  
Verify the configuration in the web interface. 

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
Any Mail that has been rejected due to DMARC can be found in the SMTP logs searching for 'DMARC processing'
Any mail that has been processed by spool filtering can be found by searching the Delivery log using the following;  
  To find email delivered to the inbox search for 'Filter: None'  
  To find email delivered to the junk email folder (SPAM-LOW) search for 'Filter: Move spam'  
  To find all email deleted by spool filtering search for 'Filter: Spam'  
  To find email that would have been identified as SPAM-MED but was deleted by spool filtering search for 'Filter: Spam (Weight: 2'  
To see the score assigned to an email look at the 'X-SmarterMail-Spam' and the 'X-SmarterMail-TotalSpamWeight' headers e.g. within the Webmail interface highlight an email, click 'Actions/View Header'
