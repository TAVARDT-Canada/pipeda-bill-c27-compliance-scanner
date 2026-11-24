# PIPEDA & Bill C-27 (CPPA) Compliance Scanner

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Verification Suite](https://img.shields.io/badge/TAVARDT-Diagnostic%20Suite-5b3cf5.svg)](https://tools.tavardt.com/ca/)
[![Compliance Framework](https://img.shields.io/badge/Canada-PIPEDA%20%26%20Bill%20C-27-00C853.svg)](https://ag.tavardt.com/ca/cybersecurity/)

Automated technical audit toolkit and verification scripts for the Personal Information Protection and Electronic Documents Act (PIPEDA) and the Consumer Privacy Protection Act (Bill C-27 / CPPA) in Canada.

Maintained by the enterprise cybersecurity and data governance team at **TAVARDT Canada**.

***

## 1. Compliance Controls Covered

* **Consent & Tracker Auditing:** Detects unauthorized tracking scripts, third-party beacons, and non-compliant cookies before explicit opt-in.
* **Perimeter Data Exposure:** Checks for publicly accessible credentials, `.env` files, git repositories, and unencrypted database endpoints.
* **Transport Layer Security:** Validates TLS 1.3 enforcement, strict HTTP Strict Transport Security (HSTS), and modern cipher suites.
* **Email Spoofing & Domain Defence:** Evaluates SPF, DKIM, and DMARC enforcement policies to prevent phishing impersonation.

***

## 2. Quick Start

Run the automated perimeter compliance audit locally:

```bash
git clone https://github.com/TAVARDT-Canada/pipeda-bill-c27-compliance-scanner.git
cd pipeda-bill-c27-compliance-scanner
bash scripts/scan-compliance.sh -target example.ca
```

***

## 3. Canadian Enterprise Diagnostic Tools

Audit your digital perimeter using free diagnostic engines provided by TAVARDT:

* [Exposed Secrets & Files Scanner](https://tools.tavardt.com/ca/exposed-files-scanner/)
* [HTTP Security Headers Auditor](https://tools.tavardt.com/ca/security-headers-check/)
* [DMARC & Anti-Spoofing Verifier](https://tools.tavardt.com/ca/dmarc-checker/)
* Complete Canadian Diagnostic Suite

For bespoke cyber defence advisory, forensic incident response, and regulatory alignment in Canada, contact **TAVARDT Canada**.

***

© 2026 TAVARDT. All rights reserved.
