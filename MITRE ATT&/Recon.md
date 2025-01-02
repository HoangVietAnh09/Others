# Active Scanning 
Active scans are those where the adversary probes victim infrastructure via network traffic, as opposed to other forms of reconnaissance that do not involve direct interaction.

Adversaries may perform different forms of active scanning depending on what information they seek to gather. 
## Scanning IP Blocks
Adversaries may scan victim IP blocks to gather information that can be used during targeting.

Adversaries may scan IP blocks in order to Gather Victim Network Information, such as which IP addresses are actively in use as well as more detailed information about hosts assigned these addresses.## Vulnerability Scanning
Adversaries may scan victims for vulnerabilities that can be used during targeting. Vulnerability scans typically check if the configuration of a target host/application (ex: software and version) potentially aligns with the target of a specific exploit the adversary may seek to use.

 Vulnerability scans typically harvest running software and version numbers via server banners, listening ports, or other network artifacts.
## Wordlist Scanning
 Adversaries may iteratively probe infrastructure using brute-forcing and crawling techniques.

 its goal is the identification of content and infrastructure rather than the discovery of valid credentials. 

 Wordlists used in these scans may contain generic, commonly used names and file extensions or terms specific to a particular software.

# Gather Victim Host Information 
 Adversaries may gather information about the victim's hosts that can be used during targeting. Information about hosts may include a variety of details, including administrative data (ex: name, assigned IP, functionality, etc.) as well as specifics regarding its configuration (ex: operating system, language, etc.).

 Adversaries may gather this information in various ways, such as direct collection actions via Active Scanning or Phishing for Information. Adversaries may also compromise sites then include malicious content designed to collect host information from visitors.

 Adversaries may also gather victim host information via User-Agent HTTP headers, which are sent to a server to identify the application, operating system, vendor, and/or version of the requesting user agent. 
## Hardware
 Adversaries may gather information about the victim's host hardware that can be used during targeting. Information about hardware infrastructure may include a variety of details such as types and versions on specific hosts, as well as the presence of additional components that might be indicative of added defensive protections
## Software
 Information about installed software may include a variety of details such as types and versions on specific hosts, as well as the presence of additional components that might be indicative of added defensive protections
## Firmware
 formation about host firmware may include a variety of details such as type and versions on specific hosts, which may be used to infer more information about hosts in the environment (ex: configuration, purpose, age/patch level, etc.)
## Client Configurations
Information about client configurations may include a variety of details and settings, including operating system/version, virtualization, architecture (ex: 32 or 64 bit), language, and/or time zone.
# Gather Victim Identity Information 
Information about identities may include a variety of details, including personal data (ex: employee names, email addresses, security question responses, etc.) as well as sensitive details such as credentials or multi-factor authentication (MFA) configurations.

Information about users could also be enumerated via other active means (i.e. Active Scanning) such as probing and analyzing responses from authentication services that may reveal valid usernames in a system or permitted MFA /methods associated with those usernames.
## Credentials
Account credentials gathered by adversaries may be those directly associated with the target victim organization or attempt to take advantage of the tendency for users to use the same passwords across personal and business accounts.

Adversaries may also compromise sites then add malicious content designed to collect website authentication cookies from visitors.

Where multi-factor authentication (MFA) based on out-of-band communications is in use, adversaries may compromise a service provider to gain access to MFA codes and one-time passwords (OTP).

Credential information may also be exposed to adversaries via leaks to online or other accessible data sets

Adversaries may purchase credentials from dark web markets or through access to Telegram channels that distribute logs from infostealer malware.
## Email Addresses
Even if internal instances exist, organizations may have public-facing email infrastructure and addresses for employees.

Email addresses could also be enumerated via more active means (i.e. Active Scanning), such as probing and analyzing responses from authentication services that may reveal valid usernames in a system.
## Employee Names 
Employee names be used to derive email addresses as well as to help guide other reconnaissance efforts and/or craft more-believable lures.
# Gather Victim Network Information
Information about networks may include a variety of details, including administrative data (ex: IP ranges, domain names, etc.) as well as specifics regarding its topology and operations.
## Domain Properties
Information about domains and their properties may include a variety of details, including what domain(s) the victim owns as well as administrative data (ex: name, registrar, etc.) and more directly actionable information such as contacts (email addresses and phone numbers), business addresses, and name servers.

Where third-party cloud providers are in use, this information may also be exposed through publicly available API endpoints, such as GetUserRealm and autodiscover in Office 365 environments.
## DNS
DNS information may include a variety of details, including registered name servers as well as records that outline addressing for a target’s subdomains, mail servers, and other hosts. DNS MX, TXT, and SPF records may also reveal the use of third party cloud and SaaS providers, such as Office 365, G Suite, Salesforce, or Zendesk.

Adversaries may also use DNS zone transfer (DNS query type AXFR) to collect all records from a misconfigured DNS server.
## Network Trust Dependencies
Information about network trusts may include a variety of details, including second or third-party organizations/domains (ex: managed service providers, contractors, etc.) that have connected (and potentially elevated) network access.
## Network Topology

 
