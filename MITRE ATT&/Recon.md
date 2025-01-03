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
Information about network topologies may include a variety of details, including the physical and/or logical arrangement of both external-facing and internal network environments. This information may also include specifics regarding network devices (gateways, routers, etc.) and other infrastructure.
## IP Addresses
Information about assigned IP addresses may include a variety of details, such as which IP addresses are in use. IP addresses may also enable an adversary to derive other details about a victim, such as organizational size, physical location(s), Internet service provider, and or where/how their publicly-facing infrastructure is hosted.
## Network Security Appliances
nformation about network security appliances may include a variety of details, such as the existence and specifics of deployed firewalls, content filters, and proxies/bastion hosts. Adversaries may also target information about victim network-based intrusion detection systems (NIDS) or other appliances related to defensive cybersecurity operations.
# Gather Victim Org Information
Information about an organization may include a variety of details, including the names of divisions/departments, specifics of business operations, as well as the roles and responsibilities of key employees.
##  Determine Physical Locations
Information about physical locations of a target organization may include a variety of details, including where key resources and infrastructure are housed. Physical locations may also indicate what legal jurisdiction and/or authorities the victim operates within.
## Business Relationships
 Information about an organization’s business relationships may include a variety of details, including second or third-party organizations/domains (ex: managed service providers, contractors, etc.) that have connected (and potentially elevated) network access. This information may also reveal supply chains and shipment paths for the victim’s hardware and software resources.
## Identify Business Tempo
Information about an organization’s business tempo may include a variety of details, including operational hours/days of the week. This information may also reveal times/dates of purchases and shipments of the victim’s hardware and software resources.
##  Identify Roles
Information about business roles may reveal a variety of targetable details, including identifiable information for key personnel as well as what data/resources they have access to.
# Phishing for Information 
Phishing for information is an attempt to trick targets into divulging information, frequently credentials or other actionable information. Phishing for information is different from Phishing in that the objective is gathering data from the victim rather than executing malicious code.

All forms of phishing are electronically delivered social engineering.

In spearphishing, a specific individual, company, or industry will be targeted by the adversary. More generally, adversaries can conduct non-targeted phishing, such as in mass credential harvesting campaigns.

Adversaries may also try to obtain information directly through the exchange of emails, instant messages, or other electronic conversation means.

Phishing for information may also involve evasive techniques, such as removing or manipulating emails or metadata/headers from compromised accounts being abused to send messages
## Mitigations
Use anti-spoofing and email authentication mechanisms to filter messages based on validity checks of the sender domain (using SPF) and integrity of messages (using DKIM). Enabling these mechanisms within an organization (through policies such as DMARC) may enable recipients (intra-org and cross domain) to perform similar message filtering and validation.
## Spearphishing Service
Adversaries may send spearphishing messages via third-party services to elicit sensitive information that can be used during targeting.

Spearphishing for information is an attempt to trick targets into divulging information, frequently credentials or other actionable information.
## Spearphishing Attachment
Adversaries may send spearphishing messages with a malicious attachment to elicit sensitive information that can be used during targeting.
## Spearphishing Link
Adversaries may send spearphishing messages with a malicious link to elicit sensitive information that can be used during targeting.

the malicious emails contain links generally accompanied by social engineering text to coax the user to actively click or copy and paste a URL into a browser. The given website may be a clone of a legitimate site (such as an online or corporate login portal) or may closely resemble a legitimate site in appearance and have a URL containing elements from the real site.

such as the acceptance of integer- or hexadecimal-based hostname formats and the automatic discarding of text before an "@" symbol: for example, hxxp://google.com@1157586937.

Adversaries may also embed "tracking pixels", "web bugs", or "web beacons" within phishing messages to verify the receipt of an email, while also potentially profiling and tracking victim information such as IP address. These mechanisms often appear as small images (typically one pixel in size) or otherwise obfuscated objects and are typically delivered as HTML code containing a link to a remote server.

Adversaries may also be able to spoof a complete website using what is known as a "browser-in-the-browser" (BitB) attack.

Adversaries can use phishing kits such as EvilProxy and Evilginx2 to perform adversary-in-the-middle phishing by proxying the connection between the victim and the legitimate website. On a successful login, the victim is redirected to the legitimate website, while the adversary captures their session cookie.

Adversaries may also send a malicious link in the form of Quick Response (QR) Codes (also known as "quishing"). These links may direct a victim to a credential phishing page.

## Spearphishing Voice
Adversaries may use voice communications to elicit sensitive information that can be used during targeting. Adversaries use phone calls to elicit sensitive information from victims.

Victims may also receive phishing messages that direct them to call a phone number ("callback phishing") where the adversary attempts to collect confidential information.
# Search Closed Sources
Adversaries may search and gather information about victims from closed (e.g., paid, private, or otherwise not freely available) sources that can be used during targeting.

Information about victims may be available for purchase from reputable private sources and databases

Adversaries may search in different closed databases depending on what information they seek to gather.
## Threat Intel Vendors
Adversaries may search private data from threat intelligence vendors for information that can be used during targeting.
## Purchase Technical Data
Adversaries may purchase technical information about victims that can be used during targeting. Information about victims may be available for purchase within reputable private sources and databases, such as paid subscriptions to feeds of scan databases or other data aggregation services.

ncluding but not limited to employee contact information, credentials, or specifics regarding a victim’s infrastructure.
# Search Open Technical Databases
Adversaries may search freely available technical databases for information about victims that can be used during targeting. Information about victims may be available in online databases and repositories, such as registrations of domains/certificates as well as public collections of network data/artifacts gathered from traffic and/or scans.
## DNS/Passive DNS
DNS information may include a variety of details, including registered name servers as well as records that outline addressing for a target’s subdomains, mail servers, and other hosts.

Threat actors can query nameservers for a target organization directly, or search through centralized repositories of logged DNS query responses.
## WHOIS
WHOIS data is stored by regional Internet registries (RIR) responsible for allocating and assigning Internet resources such as domain names. Anyone can query WHOIS servers for information about a registered domain, such as assigned IP blocks, contact information, and DNS nameservers.
## Digital Certificates
 Digital certificates are issued by a certificate authority (CA) in order to cryptographically verify the origin of signed content. These certificates, such as those used for encrypted web traffic (HTTPS SSL/TLS communications), contain information about the registered organization such as name and location.
## CDNs (content delivery network)
CDNs allow an organization to host content from a distributed, load balanced array of servers. CDNs may also allow organizations to customize content delivery based on the requestor’s geographical region.

dversaries may also seek and target CDN misconfigurations that leak sensitive information not intended to be hosted and/or do not have the same protection mechanisms (ex: login portals) as the content hosted on the organization’s website.
## Scan Databases
Various online services continuously publish the results of Internet scans/surveys, often harvesting information such as active IP addresses, hostnames, open ports, certificates, and even server banners.
# Search Open Websites/Domains
Information about victims may be available in various online sites, such as social media, new sites, or those hosting information about business operations such as hiring or requested/rewarded contracts.
## Mitigations
Application developers uploading to public code repositories should be careful to avoid publishing sensitive information such as credentials and API keys.

Scan public code repositories for exposed credentials or other sensitive information before making commits. Ensure that any leaked credentials are removed from the commit history, not just the current latest version of the code.
## Social Media
Social media sites may contain various information about a victim organization, such as business announcements as well as information about the roles, locations, and interests of staff.
## Search Engines
Search engine services typical crawl online sites to index context and may provide users with specialized syntax to search for specific keywords or specific types of content

as well as use specialized queries to look for spillages/leaks of sensitive information such as network details or credentials.
## Code Repositories
Victims may store code in repositories on various third-party websites such as GitHub, GitLab, SourceForge, and BitBucket. Users typically interact with code repositories through a web application or command-line utilities such as git.

Adversaries may also identify more sensitive data, including accidentally leaked credentials or API keys.
# Search Victim-Owned Websites
Victim-owned websites may contain a variety of details, including names of departments/divisions, physical locations, and data about key employees such as names, roles, and contact info (ex: Email Addresses). These sites may also have details highlighting business operations and relationships.

In addition to manually browsing the website, adversaries may attempt to identify hidden directories or files that could contain additional sensitive information or vulnerable functionality.





 
