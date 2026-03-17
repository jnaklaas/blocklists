# Changelog

All notable changes to this project will be documented in this file.

The format is based on **Keep a Changelog** https://keepachangelog.com/en/1.1.0/,
and this project uses **date-based versioning**.

<!-- HEADER_END -->

## [2026.03.17]

### anti-fingerprinting.txt

- Better 3rd party font blocking.
- Added CSS blocking for known providers.
- Generic font blocking less strict (blocked 1p fonts in some edge cases).

#### Added

- `||*$font,third-party`
- `||use.typekit.net^`
- `||p.typekit.net^`
- `||fast.fonts.net^`
- `||cdn.jsdelivr.net/npm/@fontawesome^`
- `||fonts.cdnfonts.com^`
- `||brick.freetype.org^`
- `||fonts.webtype.com^`
- `||cdn.materialdesignicons.com^`
- `||cdnjs.cloudflare.com/ajax/libs/font-awesome^`

#### Removed

- `*$font,third-party`

## [2026.03.16]

### anti-fingerprinting.txt

#### Added

- `||cdn.fingerprint.com^`
- `||collector.fingerprint.com^`
- `||devicefingerprint.com^`
- `||metrics.fpjs.io^`
- `||api.fpjs.io^`
- `||fp-cdn.azureedge.net^`
- `||fingerprint-cdn.azureedge.net^`
- `||fp-ns.azureedge.net^`
- `||collector-px.perimeterx.net^`
- `||fingerprint-client.arkoselabs.com^`
- `||client-api.arkoselabs.com^`
- `||identity.riskified.com^`
- `||device.iovation.com^`
- `||mpsnare.iesnare.com^`
- `||coveryourtracks.eff.org^`
- `||whoer.net^`
- `||ipleak.net^`
- `||browserprint.info^`
- `||browseraudit.com^`
- `||panopticlick.eff.org^`
- `||ipdata.co^`
- `||ipregistry.co^`
- `||ipqualityscore.com^`
- `||ipgeolocation.io^`
- `||ip2location.com^`
- `||db-ip.com^`
- `||ipstack.com^`
- `||ipwhois.io^`
- `||proxycheck.io^`
- `||getipintel.net^`
- `||vpnapi.io^`
- `||iphub.info^`
- `||perimeterx.net^`
- `||px-cloud.net^`
- `||pxchk.net^`
- `||px-client.net^`
- `||pximg.net^`
- `||datadome.co^`
- `||captcha-delivery.com^`
- `||kasada.io^`
- `||arkoselabs.com^`
- `||sift.com^`
- `||riskified.com^`
- `||forter.com^`
- `||seon.io^`
- `||iovation.com^`
- `||kount.net^`
- `||shape.security^`
- `||fingerprint.com^`
- `||contentsquare.net^`
- `||smartlook.com^`
- `||inspectlet.com^`
- `||sessioncam.com^`
- `||glassboxdigital.io^`
- `||quantummetric.com^`
- `||decibelinsight.net^`
- `||clicktale.net^`
- `||logrocket-assets.io^`
- `||heap.io^`
- `||heapanalytics.com^`
- `||amplitude.com^`
- `||cdn.amplitude.com^`
- `||api.amplitude.com^`
- `||posthog.com^`
- `||posthog.io^`
- `||rudderstack.com^`
- `||cdn.rudderlabs.com^`
- `||analytics.rudderstack.com^`
- `||events.launchdarkly.com^`
- `||app.launchdarkly.com^`
- `||clientstream.launchdarkly.com^`
- `||statsigapi.net^`
- `||statsig.com^`
- `||ingest.sprig.com^`
- `||sprig.com^`
- `||pendo.io^`
- `||cdn.pendo.io^`
- `||rum.browser-intake-datadoghq.com^`
- `||browser-intake.logs.datadoghq.com^`
- `||cdn.datadoghq.com^`
- `||browser.sentry-cdn.com^`
- `||ingest.sentry.io^`
- `||sentry.io^`
- `||o33249.ingest.sentry.io^`
- `||bam.nr-data.net^`
- `||js-agent.newrelic.com^`
- `||collector.newrelic.com^`
- `||rum-http-intake.logs.datadoghq.com^`
- `||api.honeycomb.io^`
- `||browser-intake-honeycomb.io^`
- `||/events?$third-party`
- `||/metrics?$third-party`
- `||/analytics?$third-party`
- `||/log?$third-party`
- `||/capture?$third-party`
- `||/record?$third-party`
- `||/session?$third-party`
- `||webrtc.ecl.ntt.com^`
- `||webrtc.exposed^`
- `||test.webrtc.org^`
- `||browserrtc.com^`
- `||diafygi.github.io/webrtc-ips^`

### google-ultra-strict.txt

#### Added

- `||googleadservices.com/pagead/conversion^`
- `||ad.doubleclick.net^`
- `||ads.google.com^`
- `||adssettings.google.com^`
- `||stats.g.doubleclick.net^`
- `||pubads.g.doubleclick.net^`
- `||securepubads.g.doubleclick.net^`
- `||adservice.google.*^`
- `||adservice.google.be^`
- `||adservice.google.nl^`
- `||adservice.google.de^`
- `||adservice.google.fr^`
- `||adservice.google.co.uk^`
- `||adservice.google.ca^`
- `||adservice.google.com.au^`
- `||adservice.google.es^`
- `||adservice.google.it^`
- `||googletagmanager.com/gtm.js$third-party`
- `||googletagmanager.com/gtag/js$third-party`
- `||google-analytics.com/collect^`
- `||google-analytics.com/r/collect^`
- `||google-analytics.com/g/collect^`
- `||region1.google-analytics.com^`
- `||region2.google-analytics.com^`
- `||region3.google-analytics.com^`
- `||optimize.google.com^`
- `||experiments.google.com^`
- `||clientservices.googleapis.com^`
- `||analytics.googleusercontent.com^`
- `||update.googleapis.com^`
- `||tools.google.com/service/update2^`
- `||logging.googleapis.com^`
- `||playlogging.googleapis.com^`
- `||measurement.googleapis.com^`
- `||play.googleapis.com/log^`
- `||play.googleapis.com/batchexecute^`
- `||android-checkin.googleapis.com^`
- `||android.clients.google.com/checkin^`
- `||safebrowsing.googleapis.com^`
- `||sb-ssl.google.com^`
- `||play-fe.googleapis.com^`
- `||people-pa.googleapis.com^`
- `||photos-pa.googleapis.com^`
- `||android.googleapis.com^`
- `||variations.googleapis.com^`
- `||chrome.googleapis.com^`
- `||content-autofill.googleapis.com^`
- `||history.googleapis.com^`
- `||deviceintegrity.googleapis.com^`
- `||connectivitycheck.gstatic.com/generate_204`
- `||clients3.google.com/generate_204`
- `||www.google.com/generate_204^`
- `||www.gstatic.com/generate_204^`
- `||clients4.google.com/generate_204^`
- `||cdn.ampproject.org^`
- `||ssl.gstatic.com^$third-party`
- `||lh3.googleusercontent.com^$third-party`
- `||lh4.googleusercontent.com^$third-party`
- `||lh5.googleusercontent.com^$third-party`
- `||lh6.googleusercontent.com^$third-party`
- `||lh7.googleusercontent.com^$third-party`
- `||lh8.googleusercontent.com^$third-party`
- `||youtube.com/api/stats/watchtime^`
- `||youtube.com/api/stats/playback^`
- `||youtube.com/api/stats/ads^`
- `||youtube.com/api/stats/qoe^`
- `||youtube.com/api/stats/engagement^`
- `||youtube.com/api/stats/delayplay^`
- `||youtube.com/api/stats/endscreen^`
- `||youtube.com/api/stats/annotations^`
- `||youtube.com/api/stats/cards^`
- `||youtube.com/api/stats/interaction^`
- `||youtube.com/api/stats/atr^`
- `||youtube.com/api/stats/error^`
- `||youtube.com/ad_data^`
- `||youtube.com/pagead/interaction^`
- `||youtube.com/adsense^`
- `||redirector.googlevideo.com^`
- `||yt5.ggpht.com^$third-party`
- `||yt6.ggpht.com^$third-party`
- `||accounts.google.com/gsi/$xhr`
- `||play.google.com/log^`
- `||play.google.com/log?^`
- `||accounts.google.com/gsi/client$third-party`
- `||accounts.google.com/gsi/$third-party`
- `||accounts.google.com/ListAccounts^`
- `||accounts.google.com/_/lookup/accountlookup^`
- `||accounts.google.com/_/signin/sl/lookup^`
- `||cdn.ampproject.org/v0/amp-analytics^`
- `||cdn.ampproject.org/rtv/*/v0/amp-analytics^`
- `||ampcid.google.com^`
- `||amp-error-reporting.appspot.com^`
- `||fcm.googleapis.com^`
- `||fcmregistrations.googleapis.com^`
- `||firebase.googleapis.com^`
- `||csi.gstatic.com^`
- `||www.gstatic.com/csi^`
- `||www.gstatic.com/og/_/js^`
- `||ssl.gstatic.com/og/_/ss^`
- `||ssl.gstatic.com/og/_/rs^`
- `||ssl.gstatic.com/og/_/js/k^`
- `||ogs.google.com^`
- `||ogs-pa.googleapis.com^`
- `||play.googleapis.com/experiments^`
- `||www.recaptcha.net^`
- `||gstaticadssl.l.google.com^`
- `||www-google-analytics.l.google.com^`
- `||www-googletagmanager.l.google.com^`
- `@@||google.com^$domain=google.com|youtube.com`
- `@@||gstatic.com^$domain=google.com|youtube.com`
- `@@||googleapis.com^$domain=google.com|youtube.com`

#### Removed

- `||generate_204^`
- `||googleapis.com^$third-party`

## [2026.03.13]

### Added

- Initial repository structure
- Google Ultra Strict blocklist
- Anti-Fingerprinting blocklist
- GitHub workflow for blocklist validation
- README with documentation for uBlock Origin and Brave Shields

### Notes

First public release of the privacy blocklists.
