$SpamConfigExport = "C:\Temp\spamConfig.json"
$SpamConfig = ConvertFrom-Json -InputObject ((Get-Content -Path $SpamConfigExport) -join "`n")
$SpamConfig.spam_settings.reverse_dns_enabled ="true"
$SpamConfig.spam_settings.reverse_dns_enabled_smtp ="true"
$SpamConfig.spam_settings.reverse_dns_enabled_smtp_out ="false"
$SpamConfig.spam_settings.reverse_dns_forward_confirm ="false"
$SpamConfig.spam_settings.reverse_dns_weight_forward_fail ="10"
$SpamConfig.spam_settings.reverse_dns_weight_forward_mismatch ="5"
$SpamConfig.spam_settings.reverse_dns_weight_pass ="0"
$SpamConfig.spam_settings.reverse_dns_weight_reverse_fail ="8"
$SpamConfig.spam_settings.spf_enabled ="true"
$SpamConfig.spam_settings.spf_enable_smtp_in ="true"
$SpamConfig.spam_settings.spf_enable_smtp_out ="false"
$SpamConfig.spam_settings.spf_scan_from_header ="false"
$SpamConfig.spam_settings.spf_srs_enabled ="true"
$SpamConfig.spam_settings.spf_weight_fail ="8"
$SpamConfig.spam_settings.spf_weight_soft_fail ="4"
$SpamConfig.spam_settings.spf_weight_neutral ="0"
$SpamConfig.spam_settings.spf_weight_none ="0"
$SpamConfig.spam_settings.spf_weight_no_record ="0"
$SpamConfig.spam_settings.spf_weight_pass ="0"
$SpamConfig.spam_settings.spf_weight_perm_error ="2"
$SpamConfig.spam_settings.spf_weight_temp_error ="0"
$SpamConfig.spam_settings.dk_weight_pass ="-2"
$SpamConfig.spam_settings.dk_weight_fail ="2"
$SpamConfig.spam_settings.dk_weight_none ="0"
$SpamConfig.spam_settings.dk_enabled ="false"
$SpamConfig.spam_settings.dk_max_message_sign ="0"
$SpamConfig.spam_settings.dk_max_message_verify ="1"
$SpamConfig.spam_settings.dkim_weight_pass ="0"
$SpamConfig.spam_settings.dkim_weight_fail ="8"
$SpamConfig.spam_settings.dkim_weight_none ="0"
$SpamConfig.spam_settings.dkim_enabled ="true"
$SpamConfig.spam_settings.dkim_max_message_sign ="0"
$SpamConfig.spam_settings.dkim_max_message_verify ="100"
$Ip4Lookups = '
    {
      "ip4r_lookups": [
        {
          "guid": "ae195ff3-3862-4ba3-a9db-a597118ef1b2",
          "name": "Anonmails DNSBL",
          "description": "DNSBL spam.dnsbl.anonmails.de",
          "is_enabled": true,
          "is_enabled_smtp_in": true,
          "is_enabled_smtp_out": false,
          "is_uribl": false,
          "lookup_domain": "spam.dnsbl.anonmails.de",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.0.2"
          ],
          "use_bitmap": false,
          "weight": 5,
          "weight_max": 30
        },
        {
          "guid": "f9a5357b-f90b-493f-b95f-100e94a46c9b",
          "name": "Barracuda Reputation Block List",
          "description": "http://www.barracudanetworks.com/reputation",
          "is_enabled": true,
          "is_enabled_smtp_in": true,
          "is_enabled_smtp_out": false,
          "is_uribl": false,
          "lookup_domain": "b.barracudacentral.org",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.0.2"
          ],
          "use_bitmap": false,
          "weight": 5,
          "weight_max": 30
        },
        {
          "guid": "66298d85-11dd-4e0d-af18-9cd74fb65374",
          "name": "CBL",
          "description": "CBL",
          "is_enabled": true,
          "is_enabled_smtp_in": true,
          "is_enabled_smtp_out": false,
          "is_uribl": false,
          "lookup_domain": "cbl.abuseat.org",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.0.2"
          ],
          "use_bitmap": false,
          "weight": 5,
          "weight_max": 30
        },
        {
          "guid": "b008c07c-ee23-45b5-aa05-7403f26a7dff",
          "name": "DNSWL -  Low",
          "description": "Occasional spam occurrences",
          "is_enabled": true,
          "is_enabled_smtp_in": true,
          "is_enabled_smtp_out": false,
          "is_uribl": false,
          "lookup_domain": "list.dnswl.org",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.1.1",
            "127.0.2.1",
            "127.0.3.1",
            "127.0.4.1",
            "127.0.5.1",
            "127.0.6.1",
            "127.0.7.1",
            "127.0.8.1",
            "127.0.9.1",
            "127.0.10.1",
            "127.0.11.1",
            "127.0.12.1",
            "127.0.13.1",
            "127.0.14.1",
            "127.0.15.1"
          ],
          "use_bitmap": false,
          "weight": -2,
          "weight_max": 30
        },
        {
          "guid": "40974a67-d461-45bd-b3eb-bd8557731f83",
          "name": "DNSWL - Blocked",
          "description": "Query refused",
          "is_enabled": false,
          "is_enabled_smtp_in": false,
          "is_enabled_smtp_out": false,
          "is_uribl": false,
          "lookup_domain": "list.dnswl.org",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.0.255"
          ],
          "use_bitmap": false,
          "weight": 0,
          "weight_max": 30
        },
        {
          "guid": "df22eacd-405e-47b1-874b-96ae1bb6d07b",
          "name": "DNSWL - High",
          "description": "Never sends spam",
          "is_enabled": true,
          "is_enabled_smtp_in": true,
          "is_enabled_smtp_out": false,
          "is_uribl": false,
          "lookup_domain": "list.dnswl.org",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.1.3",
            "127.0.2.3",
            "127.0.3.3",
            "127.0.4.3",
            "127.0.5.3",
            "127.0.6.3",
            "127.0.7.3",
            "127.0.8.3",
            "127.0.9.3",
            "127.0.10.3",
            "127.0.11.3",
            "127.0.12.3",
            "127.0.13.3",
            "127.0.14.3",
            "127.0.15.3"
          ],
          "use_bitmap": false,
          "weight": -5,
          "weight_max": 30
        },
        {
          "guid": "ab4fcf3e-9427-446b-ac5e-6d53693a6a16",
          "name": "DNSWL - Medium",
          "description": "Extremely rare spam occurrences",
          "is_enabled": true,
          "is_enabled_smtp_in": true,
          "is_enabled_smtp_out": false,
          "is_uribl": false,
          "lookup_domain": "list.dnswl.org",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.1.2",
            "127.0.2.2",
            "127.0.3.2",
            "127.0.4.2",
            "127.0.5.2",
            "127.0.6.2",
            "127.0.7.2",
            "127.0.8.2",
            "127.0.9.2",
            "127.0.10.2",
            "127.0.11.2",
            "127.0.12.2",
            "127.0.13.2",
            "127.0.14.2",
            "127.0.15.2"
          ],
          "use_bitmap": false,
          "weight": -4,
          "weight_max": 30
        },
        {
          "guid": "d1eed386-bdb9-4a92-a057-559d99d32c2c",
          "name": "DNSWL - None",
          "description": "Legitimate mail server, may also send spam",
          "is_enabled": true,
          "is_enabled_smtp_in": true,
          "is_enabled_smtp_out": false,
          "is_uribl": false,
          "lookup_domain": "list.dnswl.org",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.1.0",
            "127.0.2.0",
            "127.0.3.0",
            "127.0.4.0",
            "127.0.5.0",
            "127.0.6.0",
            "127.0.7.0",
            "127.0.8.0",
            "127.0.9.0",
            "127.0.10.0",
            "127.0.11.0",
            "127.0.12.0",
            "127.0.13.0",
            "127.0.14.0",
            "127.0.15.0"
          ],
          "use_bitmap": false,
          "weight": -2,
          "weight_max": 30
        },
        {
          "guid": "918e9781-946b-4e99-b361-79b9082c88e9",
          "name": "Habeas other score",
          "description": "",
          "is_enabled": true,
          "is_enabled_smtp_in": true,
          "is_enabled_smtp_out": false,
          "is_uribl": false,
          "lookup_domain": "accredit.habeas.com",
          "prefix_data": "",
          "require_lookup_match": false,
          "results_indicating_spam": [
            "127.0.0.2"
          ],
          "use_bitmap": false,
          "weight": 0,
          "weight_max": 30
        },
        {
          "guid": "4e4e39ab-2458-4f46-b638-82e286897d23",
          "name": "Habeas SafeList 127.0.0.30",
          "description": "Not certified?",
          "is_enabled": true,
          "is_enabled_smtp_in": true,
          "is_enabled_smtp_out": false,
          "is_uribl": false,
          "lookup_domain": "accredit.habeas.com",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.0.30"
          ],
          "use_bitmap": false,
          "weight": 0,
          "weight_max": 30
        },
        {
          "guid": "78a7ade7-3aa9-4466-b75c-93c164215ffa",
          "name": "Habeas SafeList 127.0.0.50",
          "description": "Return Path SenderScore Safe List - certified?",
          "is_enabled": true,
          "is_enabled_smtp_in": true,
          "is_enabled_smtp_out": false,
          "is_uribl": false,
          "lookup_domain": "accredit.habeas.com",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.0.50"
          ],
          "use_bitmap": false,
          "weight": -5,
          "weight_max": 30
        },
        {
          "guid": "e88e190c-9eed-4542-9359-b8abaf75a85b",
          "name": "HostKarma - Blacklist",
          "description": "HostKarma - Blacklist",
          "is_enabled": true,
          "is_enabled_smtp_in": true,
          "is_enabled_smtp_out": false,
          "is_uribl": false,
          "lookup_domain": "hostkarma.junkemailfilter.com",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.0.2"
          ],
          "use_bitmap": false,
          "weight": 5,
          "weight_max": 30
        },
        {
          "guid": "da3b01c7-a43f-49cf-bf1a-33f3a92cf11a",
          "name": "HostKarma - Brownlist",
          "description": "HostKarma - Brownlist",
          "is_enabled": true,
          "is_enabled_smtp_in": true,
          "is_enabled_smtp_out": false,
          "is_uribl": false,
          "lookup_domain": "hostkarma.junkemailfilter.com",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.0.4"
          ],
          "use_bitmap": false,
          "weight": 3,
          "weight_max": 30
        },
        {
          "guid": "a988c46f-4b11-407e-a57a-49b97dabebf7",
          "name": "HostKarma - Whitelist",
          "description": "HostKarma - Whitelist",
          "is_enabled": true,
          "is_enabled_smtp_in": true,
          "is_enabled_smtp_out": false,
          "is_uribl": false,
          "lookup_domain": "hostkarma.junkemailfilter.com",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.0.1"
          ],
          "use_bitmap": false,
          "weight": -5,
          "weight_max": 30
        },
        {
          "guid": "27d006b8-0ee1-453c-ace0-faa8de942dd2",
          "name": "HostKarma - Yellowlist",
          "description": "Yellowlist - mix of spam and nonspam",
          "is_enabled": true,
          "is_enabled_smtp_in": true,
          "is_enabled_smtp_out": false,
          "is_uribl": false,
          "lookup_domain": "hostkarma.junkemailfilter.com",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.0.3"
          ],
          "use_bitmap": false,
          "weight": 2,
          "weight_max": 30
        },
        {
          "guid": "685c1ea7-30e1-4bde-9914-9e12d816ff4f",
          "name": "IBM DNS Blacklist",
          "description": "",
          "is_enabled": true,
          "is_enabled_smtp_in": true,
          "is_enabled_smtp_out": false,
          "is_uribl": false,
          "lookup_domain": "dnsbl.cobion.com",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.0.1"
          ],
          "use_bitmap": false,
          "weight": 5,
          "weight_max": 30
        },
        {
          "guid": "d8e9736e-8954-4fcb-8a59-e553cf1a8f18",
          "name": "ISX DNSBL",
          "description": "https://bl.isx.fr/",
          "is_enabled": true,
          "is_enabled_smtp_in": true,
          "is_enabled_smtp_out": false,
          "is_uribl": false,
          "lookup_domain": "dnsbl.isx.fr",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.0.2"
          ],
          "use_bitmap": false,
          "weight": 4,
          "weight_max": 30
        },
        {
          "guid": "fe1b140c-054e-42e2-b4c2-11865a63dc84",
          "name": "RBLDNS",
          "description": "http://rbldns.ru/",
          "is_enabled": true,
          "is_enabled_smtp_in": true,
          "is_enabled_smtp_out": false,
          "is_uribl": false,
          "lookup_domain": "rbl.rbldns.ru",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.0.2"
          ],
          "use_bitmap": false,
          "weight": 4,
          "weight_max": 30
        },
        {
          "guid": "fa10a048-7f3f-436a-a505-f132de6d4802",
          "name": "SEM-FRESH",
          "description": "List includes domains first registered in the last 5 days",
          "is_enabled": true,
          "is_enabled_smtp_in": false,
          "is_enabled_smtp_out": false,
          "is_uribl": true,
          "lookup_domain": "fresh.spameatingmonkey.net",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.0.2"
          ],
          "use_bitmap": false,
          "weight": 3,
          "weight_max": 3
        },
        {
          "guid": "548861ca-9413-4a55-bb2e-95a0e8c4f260",
          "name": "SEM-URI",
          "description": "List includes domains and URIs detected in mail sent to a spamtrap",
          "is_enabled": true,
          "is_enabled_smtp_in": false,
          "is_enabled_smtp_out": false,
          "is_uribl": true,
          "lookup_domain": "uribl.spameatingmonkey.net",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.0.2"
          ],
          "use_bitmap": false,
          "weight": 5,
          "weight_max": 5
        },
        {
          "guid": "586e270a-5cf7-49fd-890f-d7eb0d6ae741",
          "name": "Sender Score 0-9",
          "description": "Bad reputation",
          "is_enabled": true,
          "is_enabled_smtp_in": true,
          "is_enabled_smtp_out": false,
          "is_uribl": false,
          "lookup_domain": "score.senderscore.com",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.4.0",
            "127.0.4.1",
            "127.0.4.2",
            "127.0.4.3",
            "127.0.4.4",
            "127.0.4.5",
            "127.0.4.6",
            "127.0.4.7",
            "127.0.4.8",
            "127.0.4.9"
          ],
          "use_bitmap": false,
          "weight": 5,
          "weight_max": 30
        },
        {
          "guid": "fba1e776-6fed-4cfd-9f86-164c08c75bd6",
          "name": "Sender Score 95-100",
          "description": "Good reputation",
          "is_enabled": true,
          "is_enabled_smtp_in": true,
          "is_enabled_smtp_out": false,
          "is_uribl": false,
          "lookup_domain": "score.senderscore.com",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.4.95",
            "127.0.4.96",
            "127.0.4.97",
            "127.0.4.98",
            "127.0.4.99"
            "127.0.4.100"
          ],
          "use_bitmap": false,
          "weight": -5,
          "weight_max": 30
        },
        {
          "guid": "ec49f626-b403-4ace-9ac3-83649c92af59",
          "name": "SORBS - Abuse",
          "description": "SORBS - Abuse",
          "is_enabled": true,
          "is_enabled_smtp_in": true,
          "is_enabled_smtp_out": false,
          "is_uribl": false,
          "lookup_domain": "dnsbl.sorbs.net",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.0.7"
          ],
          "use_bitmap": false,
          "weight": 2,
          "weight_max": 30
        },
        {
          "guid": "e0c86dee-048d-4b4f-9174-560004e5d678",
          "name": "SORBS - Dynamic IP",
          "description": "SORBS - Dynamic IP",
          "is_enabled": true,
          "is_enabled_smtp_in": true,
          "is_enabled_smtp_out": false,
          "is_uribl": false,
          "lookup_domain": "dnsbl.sorbs.net",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.0.10"
          ],
          "use_bitmap": false,
          "weight": 3,
          "weight_max": 30
        },
        {
          "guid": "6da7f6c8-22e4-4cd1-8d57-f525abcca66e",
          "name": "SORBS - No Server",
          "description": "SORBS - No Server",
          "is_enabled": true,
          "is_enabled_smtp_in": true,
          "is_enabled_smtp_out": false,
          "is_uribl": false,
          "lookup_domain": "noserver.dnsbl.sorbs.net",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.0.14"
          ],
          "use_bitmap": false,
          "weight": 10,
          "weight_max": 30
        },
        {
          "guid": "93a77682-a1dc-41e6-bca9-ef43de769bed",
          "name": "SORBS - NoMail",
          "description": "SORBS - NoMail",
          "is_enabled": true,
          "is_enabled_smtp_in": true,
          "is_enabled_smtp_out": false,
          "is_uribl": false,
          "lookup_domain": "nomail.rhsbl.sorbs.net",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.0.12"
          ],
          "use_bitmap": false,
          "weight": 10,
          "weight_max": 30
        },
        {
          "guid": "7ca047c5-5630-4ff8-ba3c-8cf9d984c300",
          "name": "SORBS - Proxy",
          "description": "SORBS - Proxy",
          "is_enabled": true,
          "is_enabled_smtp_in": true,
          "is_enabled_smtp_out": false,
          "is_uribl": false,
          "lookup_domain": "dnsbl.sorbs.net",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.0.4"
          ],
          "use_bitmap": false,
          "weight": 1,
          "weight_max": 30
        },
        {
          "guid": "22f8d29e-c6be-4075-b1f4-58709e9cf98a",
          "name": "SORBS - Recent",
          "description": "SORBS - Recent",
          "is_enabled": true,
          "is_enabled_smtp_in": true,
          "is_enabled_smtp_out": false,
          "is_uribl": false,
          "lookup_domain": "recent.spam.dnsbl.sorbs.net",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.0.6"
          ],
          "use_bitmap": false,
          "weight": 4,
          "weight_max": 30
        },
        {
          "guid": "4da6d892-8f02-445d-8d79-d4586c72198f",
          "name": "SORBS - Socks",
          "description": "SORBS - Socks",
          "is_enabled": true,
          "is_enabled_smtp_in": true,
          "is_enabled_smtp_out": false,
          "is_uribl": false,
          "lookup_domain": "dnsbl.sorbs.net",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.0.3"
          ],
          "use_bitmap": false,
          "weight": 1,
          "weight_max": 30
        },
        {
          "guid": "592476ce-2b2f-4828-8525-526abc112bdd",
          "name": "SpamCop",
          "description": "SpamCop",
          "is_enabled": true,
          "is_enabled_smtp_in": true,
          "is_enabled_smtp_out": false,
          "is_uribl": false,
          "lookup_domain": "bl.spamcop.net",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.0.2"
          ],
          "use_bitmap": false,
          "weight": 5,
          "weight_max": 30
        },
        {
          "guid": "7e4384ac-e8ed-467c-980a-346706564ba0",
          "name": "Spamhaus - CSS",
          "description": "Direct snowshoe spam sources detected via automation",
          "is_enabled": true,
          "is_enabled_smtp_in": true,
          "is_enabled_smtp_out": false,
          "is_uribl": false,
          "lookup_domain": "zen.spamhaus.org",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.0.3"
          ],
          "use_bitmap": false,
          "weight": 5,
          "weight_max": 30
        },
        {
          "guid": "71e7545d-20ff-4e52-9a2d-b5d9b08153ec",
          "name": "Spamhaus - PBL",
          "description": "Spamhaus - PBL",
          "is_enabled": true,
          "is_enabled_smtp_in": true,
          "is_enabled_smtp_out": false,
          "is_uribl": false,
          "lookup_domain": "zen.spamhaus.org",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.0.10"
          ],
          "use_bitmap": false,
          "weight": 5,
          "weight_max": 30
        },
        {
          "guid": "bd1735c5-7cd1-4667-ab6b-c2ef88028d1d",
          "name": "Spamhaus - PBL2",
          "description": "Spamhaus - PBL2",
          "is_enabled": true,
          "is_enabled_smtp_in": true,
          "is_enabled_smtp_out": false,
          "is_uribl": false,
          "lookup_domain": "zen.spamhaus.org",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.0.11"
          ],
          "use_bitmap": false,
          "weight": 5,
          "weight_max": 30
        },
        {
          "guid": "ea59e981-a2fb-4dd2-a03e-fd26045974fa",
          "name": "Spamhaus - SBL",
          "description": "Spamhaus - SBL",
          "is_enabled": true,
          "is_enabled_smtp_in": true,
          "is_enabled_smtp_out": false,
          "is_uribl": false,
          "lookup_domain": "zen.spamhaus.org",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.0.2"
          ],
          "use_bitmap": false,
          "weight": 5,
          "weight_max": 30
        },
        {
          "guid": "df33023a-00da-499f-8326-e8f0f69209ea",
          "name": "Spamhaus - XBL",
          "description": "Spamhaus - XBL",
          "is_enabled": false,
          "is_enabled_smtp_in": false,
          "is_enabled_smtp_out": false,
          "is_uribl": false,
          "lookup_domain": "zen.spamhaus.org",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.0.4"
          ],
          "use_bitmap": false,
          "weight": 5,
          "weight_max": 30
        },
        {
          "guid": "12e3a1c2-dd88-400f-adc7-853e260e01bf",
          "name": "Spamhaus - XBL2",
          "description": "Spamhaus - XBL2",
          "is_enabled": false,
          "is_enabled_smtp_in": false,
          "is_enabled_smtp_out": false,
          "is_uribl": false,
          "lookup_domain": "zen.spamhaus.org",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.0.5"
          ],
          "use_bitmap": false,
          "weight": 5,
          "weight_max": 30
        },
        {
          "guid": "acbcb883-76f1-4b4e-9ee6-feb53912a51d",
          "name": "Spamhaus DBL",
          "description": "https://www.spamhaus.org/dbl/",
          "is_enabled": true,
          "is_enabled_smtp_in": false,
          "is_enabled_smtp_out": false,
          "is_uribl": true,
          "lookup_domain": "dbl.spamhaus.org",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.1.2"
          ],
          "use_bitmap": false,
          "weight": 5,
          "weight_max": 5
        },
        {
          "guid": "08649842-93c3-43b7-82c0-e864039e3866",
          "name": "SpamRats",
          "description": "SpamRats",
          "is_enabled": true,
          "is_enabled_smtp_in": true,
          "is_enabled_smtp_out": false,
          "is_uribl": false,
          "lookup_domain": "spam.spamrats.com",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.0.38"
          ],
          "use_bitmap": false,
          "weight": 5,
          "weight_max": 30
        },
        {
          "guid": "11eae5e8-b08c-45be-977c-8cb8e77c67bb",
          "name": "SURBL",
          "description": "SURBL",
          "is_enabled": true,
          "is_enabled_smtp_in": false,
          "is_enabled_smtp_out": false,
          "is_uribl": true,
          "lookup_domain": "multi.surbl.org",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.0.8",
            "127.0.0.16",
            "127.0.0.24",
            "127.0.0.64",
            "127.0.0.72",
            "127.0.0.80",
            "127.0.0.88",
            "127.0.0.96",
            "127.0.0.128",
            "127.0.0.136",
            "127.0.0.144",
            "127.0.0.152",
            "127.0.0.192",
            "127.0.0.200",
            "127.0.0.208",
            "127.0.0.216"
          ],
          "use_bitmap": false,
          "weight": 5,
          "weight_max": 5
        },
        {
          "guid": "ce578ba9-e4d8-486e-90b5-580cb7a6c972",
          "name": "Surriel",
          "description": "Surriel",
          "is_enabled": true,
          "is_enabled_smtp_in": true,
          "is_enabled_smtp_out": false,
          "is_uribl": false,
          "lookup_domain": "psbl.surriel.com",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.0.2"
          ],
          "use_bitmap": false,
          "weight": 5,
          "weight_max": 30
        },
        {
          "guid": "0b75113a-8f38-4a85-9977-3d827b7e52cd",
          "name": "Truncate DNSBL",
          "description": "http://www.gbudb.com/truncate/index.jsp",
          "is_enabled": true,
          "is_enabled_smtp_in": true,
          "is_enabled_smtp_out": false,
          "is_uribl": false,
          "lookup_domain": "truncate.gbudb.net",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.0.2"
          ],
          "use_bitmap": false,
          "weight": 5,
          "weight_max": 30
        },
        {
          "guid": "b28c050f-56b0-4437-834d-6d38e67c4b42",
          "name": "UCEProtect Level 1",
          "description": "UCEProtect Level 1",
          "is_enabled": true,
          "is_enabled_smtp_in": true,
          "is_enabled_smtp_out": false,
          "is_uribl": false,
          "lookup_domain": "dnsbl-1.uceprotect.net",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.0.2"
          ],
          "use_bitmap": false,
          "weight": 5,
          "weight_max": 30
        },
        {
          "guid": "90ca2568-2947-476c-8575-6ac1383f2ce1",
          "name": "UCEProtect Level 2",
          "description": "UCEProtect Level 2",
          "is_enabled": true,
          "is_enabled_smtp_in": true,
          "is_enabled_smtp_out": false,
          "is_uribl": false,
          "lookup_domain": "dnsbl-2.uceprotect.net",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.0.2"
          ],
          "use_bitmap": false,
          "weight": 4,
          "weight_max": 30
        },
        {
          "guid": "816ed29b-f2ad-4dfc-bad2-cc5e32230b5e",
          "name": "UCEProtect Level 3",
          "description": "UCEProtect Level 3",
          "is_enabled": true,
          "is_enabled_smtp_in": true,
          "is_enabled_smtp_out": false,
          "is_uribl": false,
          "lookup_domain": "dnsbl-3.uceprotect.net",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.0.2"
          ],
          "use_bitmap": false,
          "weight": 2,
          "weight_max": 30
        },
        {
          "guid": "24281ae1-61f8-4114-b490-f814f102cb39",
          "name": "URIBL",
          "description": "URIBL 2=black(set to 6) 4=grey(set to 4) 8=red(set to 2)",
          "is_enabled": false,
          "is_enabled_smtp_in": false,
          "is_enabled_smtp_out": false,
          "is_uribl": true,
          "lookup_domain": "multi.uribl.com",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.0.2",
            "127.0.0.4",
            "127.0.0.8",
            "127.0.0.14"
          ],
          "use_bitmap": false,
          "weight": 6,
          "weight_max": 30
        },
        {
          "guid": "6d23f141-d170-43ef-b8d2-03a61909e363",
          "name": "URIBL Black",
          "description": "http://uribl.com/about.shtml. This list has a goal of zero false positives",
          "is_enabled": true,
          "is_enabled_smtp_in": false,
          "is_enabled_smtp_out": false,
          "is_uribl": true,
          "lookup_domain": "multi.uribl.com",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.0.2"
          ],
          "use_bitmap": false,
          "weight": 5,
          "weight_max": 5
        },
        {
          "guid": "29bc0f81-3fa4-4881-92c0-913e892841ef",
          "name": "URIBL Grey",
          "description": "http://uribl.com/about.shtml. This list can and probably will cause false positives",
          "is_enabled": true,
          "is_enabled_smtp_in": false,
          "is_enabled_smtp_out": false,
          "is_uribl": true,
          "lookup_domain": "multi.uribl.com",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.0.4"
          ],
          "use_bitmap": false,
          "weight": 3,
          "weight_max": 3
        },
        {
          "guid": "e3b69cdb-9448-444d-9fa2-d2d3ebfb62ab",
          "name": "URIBL Red",
          "description": "http://uribl.com/about.shtml. This list is automated in nature, so please use at your own risk.",
          "is_enabled": true,
          "is_enabled_smtp_in": false,
          "is_enabled_smtp_out": false,
          "is_uribl": true,
          "lookup_domain": "multi.uribl.com",
          "prefix_data": "",
          "require_lookup_match": true,
          "results_indicating_spam": [
            "127.0.0.8"
          ],
          "use_bitmap": false,
          "weight": 4,
          "weight_max": 4
        }
      ]
    }'
$Ip4Lookups = ConvertFrom-Json -InputObject $Ip4Lookups
$SpamConfig.ip4r_lookups = $Ip4Lookups.ip4r_lookups
ConvertTo-Json -InputObject $SpamConfig -Depth 3| Out-File $SpamConfigExport -Force -Encoding ascii
