<p align="center">
  <a href="https://ag.tavardt.com/ca/">
    <img src="https://ag.tavardt.com/img/tavardt-banner.png" alt="TAVARDT" width="1024" />
  </a>
</p>

# PIPEDA & Bill C-27 (CPPA) Compliance Scanner

[![Verification Suite](https://img.shields.io/badge/TAVARDT-Diagnostic%20Suite-5b3cf5.svg)](https://tools.tavardt.com/ca/)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

Automated technical audit toolkit and perimeter security verification engine for the Personal Information Protection and Electronic Documents Act (PIPEDA) and the Consumer Privacy Protection Act (Bill C-27 / CPPA) in Canada.

Maintained by the cybersecurity and data governance team at **TAVARDT**.

***

## 1. Compliance Architecture and Technical Audit Controls

Canadian statutory privacy regulations mandate reasonable technical safeguards to protect personal information against loss, unauthorized access, and disclosure. The scanner implements automated network inspections to audit critical perimeter controls across two primary defense layers:

* **Transport Layer Security & Header Validation**: Verifies that web servers actively enforce encryption and security directives. It queries target domains over TLS to inspect `Strict-Transport-Security` (HSTS), `Content-Security-Policy` (CSP), and `X-Frame-Options` headers.
* **Perimeter Secret Exposure Detection**: Systematically probes web root paths for sensitive assets. It checks for exposed environment configuration files (`.env`), source code metadata repositories (`.git/HEAD`), and unencrypted database backups (`backup.sql`).

***

## 2. Threat Vectors and Operational Risk Mitigation

Unprotected web applications and exposed administrative assets introduce severe regulatory liabilities under PIPEDA and Bill C-27 enforcement frameworks. The compliance engine identifies and mitigates four critical operational attack vectors:

* **Insecure Transport and Protocol Downgrades**: Absence of HSTS enables man-in-the-middle interception and session hijacking. Enforcing strict transport policies ensures all user communications remain encrypted over TLS channels.
* **Credential and Environment Key Exfiltration**: Publicly readable `.env` files expose database credentials, encryption salts, and third-party API tokens. Attackers leverage these keys to compromise backend infrastructure and exfiltrate customer personal data.
* **Source Code and Version Control Exposure**: Accessible `.git/HEAD` directories permit adversaries to rebuild entire source code repositories. This reconnaissance exposes proprietary application logic and undocumented internal API endpoints.
* **Database Dump and Mass Data Spillage**: Exposed `backup.sql` files permit direct download of unencrypted database dumps. This represents a catastrophic breach event triggering mandatory Office of the Privacy Commissioner (OPC) reporting and severe financial penalties.

***

## 3. Quick Start and Operational Verification

Run the automated perimeter compliance audit locally against target Canadian domains using POSIX Bash:

```bash
git clone https://github.com/TAVARDT-Canada/pipeda-bill-c27-compliance-scanner.git
cd pipeda-bill-c27-compliance-scanner
bash scripts/scan-compliance.sh -target example.ca
```

### Execution Diagnostics and Output Evaluation

The inspection script returns deterministic HTTP status classifications for each audited control:

* **Resource Protection Confirmed (`[PASS]`)**: Non-200 responses (such as HTTP 403 Forbidden or HTTP 404 Not Found) indicate that sensitive paths are inaccessible to unauthorized external requests.
* **Critical Perimeter Exposure (`[FAIL]`)**: An HTTP 200 OK status indicates that sensitive files are publicly exposed and require immediate web server access restriction.

***

## 4. Frequently Asked Technical Questions (FAQ)

### What specific security controls does the scanner audit to support PIPEDA compliance?
The utility validates transport layer encryption headers and verifies the absence of publicly accessible system assets. Enforcing strict transport policies and restricting sensitive endpoints protects personal data against interception and unauthorized disclosure.

### What perimeter assets are evaluated during the exposed file inspection?
The scanner probes for configuration secrets in `.env`, version control trees in `.git/HEAD`, and database dumps in `backup.sql`. Detecting an HTTP 200 response flags an immediate security failure that requires urgent server-level remediation.

### Why does Bill C-27 (CPPA) require stringent safeguards against credential and database exposure?
Bill C-27 mandates that organizations maintain reasonable physical, organizational, and technological safeguards proportional to data sensitivity. Unprotected environment keys or database files expose personal records to catastrophic breaches subject to statutory regulatory penalties.

### How does the script handle execution reliability and continuous integration pipelines?
The audit script runs in POSIX-compliant Bash with strict error handling flags set to guarantee deterministic and reproducible execution. It outputs distinct status classifications for each evaluated control, enabling engineering teams to incorporate the checks into automated deployment workflows.

### What remediation steps should engineering teams implement if an asset fails validation?
Web server configurations must immediately be updated to block external access to dotfiles, administrative directories, and database archives. Any exposed credentials or access tokens identified during the audit must be revoked and rotated without delay.

***

## Useful Links

* **Corporate Portal:** https://ag.tavardt.com/ca/
* **Diagnostic Suite:** https://tools.tavardt.com/ca/
* **Technical Contact:** https://ag.tavardt.com/ca/contact/

***

© 2026 TAVARDT. All rights reserved.
