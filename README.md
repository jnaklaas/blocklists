# Blocklists

![Maintained](https://img.shields.io/badge/status-maintained-brightgreen) ![Last update](https://img.shields.io/github/last-commit/jnaklaas/blocklists)

Custom blocklists to reduce tracking, ads, telemetry and browser fingerprinting.

These lists are designed for:

- uBlock Origin (Firefox-based browsers)
- Brave Shields

They mainly target:

- Google tracking infrastructure (including reCAPTCHA)
- Ads and analytics
- Telemetry endpoints
- Fingerprinting scripts

The goal is a **more private browsing experience**.

## Current lists

### Google Ultra Strict

Blocks Google ads, telemetry, analytics, YouTube tracking, Recaptcha and CDN tracking.

```
https://raw.githubusercontent.com/jnaklaas/blocklists/refs/heads/main/blocklists/google-ultra-strict.txt
```

### Anti Fingerprinting

Blocks common browser fingerprinting services and behavioral tracking scripts.

```
https://raw.githubusercontent.com/jnaklaas/blocklists/refs/heads/main/blocklists/anti-fingerprinting.txt
```

## Add to uBlock Origin

1. Open **uBlock Origin Dashboard**
2. Go to **Filter Lists**
3. Scroll to **Custom**
4. Click **Import**
5. Paste the raw URL of the blocklist (see current lists)
6. Click **Apply changes**

## Add to Brave Shields

1. Open Brave
2. Go to:

```
brave://settings/shields/filters
```

3. Click **Add custom filter list**
4. Paste the raw URL of the blocklist (see current lists)
5. Save and update filters

## Strictness Disclaimer

These blocklists are **extremely strict by design**.

Because of this:

- Contact forms protected with Google reCAPTCHA may **not work**.
- Google-hosted fonts (e.g., Google Fonts, CDN libraries) **will not load**.
- YouTube embeds and other Google media may **not function**.

This strict approach is **exactly why many other filter lists fall short** — they often leave these services unblocked to avoid breaking websites.

> ⚠ Some web forms may use the Google reCAPTCHA service. Submitting information through these forms may share the submitted data with Google, along with other interactions on pages that load the reCAPTCHA service — even if the page itself doesn’t have a form. The "Google Ultra Strict" blocklist may prevent form submission or break functionality on these forms. Temporarily disable filters if needed, or use an alternative service that respects privacy.

If you have **specific use-cases** or need less aggressive blocking, you are welcome to **open an issue or pull request**. I might consider creating a **split version** with milder rules for compatibility while keeping the main lists ultra-strict.

## Privacy Disclaimer

These blocklists are designed to significantly reduce tracking, telemetry, ads, and browser fingerprinting. The primary privacy benefits come from blocking tracking scripts, analytics endpoints, ads, and behavioral fingerprinting services.

**Potential theoretical risk:**
Some highly targeted, self-hosted fingerprinting scripts could detect the absence of certain fonts or external resources and use this as a minor signal. However, this risk is small compared to the overall reduction in tracking and fingerprinting achieved by the blocklists. Privacy-focused browsers like Brave and Mullvad further mitigate such signals.

**Conclusion:**
One could say that the privacy gains outweigh any theoretical unique signal caused by font or CDN blocking. Using these blocklists could provide a safer, more private browsing experience by dramatically reducing exposure to trackers and fingerprinting vectors.

## Contributions

Pull requests and improvements are welcome.

Focus areas:

- new tracking endpoints
- fingerprinting protection
- privacy-friendly exceptions
