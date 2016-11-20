Broken Website
==============

This is an example broken website to use for testing purposes.

It currently generates the following conditions:

* High latency / low Apdex web pages
* Error web pages

It currently includes built-in New Relic Browser monitoring support.

## Prerequisites

## New Relic

### App Id and License Key

To use this app with New Relic, you need to configure it with your New Relic Browser app `licenseKey` and `applicationId`. These two values can be retrieved from the JavaScript in `Application settings` > `Settings`. You should not use the license key in the `Account Settings` page as it is different than the one provided in the embeddable JavaScript.

### Apdex T-value

To test New Relic alerts, you can use the latency generator with the Apdex T value setting in New Relic. You can set this to a low value for testing, e.g. 1 second, and then generate requests >= 5 seconds to trigger test alerts. This is set in `Settings` > `Application Settings`.

## Installation

### Heroku Installation

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

### Local Installation

```bash
$ git clone https://github.com/grokify/broken-website
$ cd broken-website
$ bundle
$ NEWRELIC_LICENSE_KEY=<MY_LICENSE_KEY> NEWRELIC_APP_ID=<MY_APP_ID> ruby app.rb
```

## Latency Testing

### Apdex levels

Apdex tracks three response counts:

* Satisfied: The response time is less than or equal to T.
* Tolerating: The response time is greater than T and less than or equal to 4T. In this example, 4 x 1.2 = 4.8 seconds as the maximum tolerable response time.
* Frustrated: The response time is greater than 4T.
The Time calculation will change based on your own app's T setting. In the following example, T = 1.2 seconds.

| Level | Multiplier | Time (T Example = 1.2) |
|-------|------------|------------------------|
| Satisfied | T or less | <= 1.2 seconds |
| Tolerated | >T, <= 4T | Between 1.2 and 4.8 seconds |
| Frustrated | > 4T | Greater than 4.8 seconds |

## Links

Apdex

* https://en.wikipedia.org/wiki/Apdex

New Relic Alert Policy API docs

* https://docs.newrelic.com/docs/alerts/alert-policies/rest-api-alert-policies/maintain-apps-servers-alert-policies-v2
