Broken Website
==============

This is an example broken website to use for testing purposes.

It currently generates the following conditions:

* High latency / low Apdex web pages
* Error web pages

It currently includes built-in New Relic Browser monitoring support.

## Installation

### Heroku Installation

Retrieve your New Relic application ID and license key. For Browser apps, this can be located at the end of the embedded JavaScript.

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

### Local Installation

```bash
$ git clone https://github.com/grokify/broken-website
$ cd broken-website
$ bundle
$ NEWRELIC_APP_ID=<MY_APP_ID> NEWRELIC_LICENSE_KEY=<MY_LICENSE_KEY> ruby app.rb
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

### New Relic

To use this app with New Relic, you need to configure it with your New Relic Browser `licenseKey` and `applicationId`. These two values can be retrieved from the JavaScript in `Application settings` > `Settings`.

To test New Relic alerts, you can use the latency generator with the Apdex T value setting in New Relic.

This is set in `Settings` > `Application Settings`

## Links

Apdex

* https://en.wikipedia.org/wiki/Apdex
