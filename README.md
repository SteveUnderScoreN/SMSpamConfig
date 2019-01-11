SmarterMail SPAM configuration recommended settings in XMl and JSON format.
The configuration is based on fast DNS server being required and dedicated servers being recommended.
DNS should only use root hints beyond the network edge and not forwarders.
If using more than 100,000 queries per day customers need to register with the provider and only use
non registered services on spool filtering (registered on both) along with an inbound weight SMTP blocking.

