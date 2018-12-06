[![Build Status](https://travis-ci.org/ipatch/crj.com.svg?branch=master)](https://travis-ci.org/ipatch/crj.com)

The code repository maintaining [chrisrjones.com](http://www.chrisrjones.com)

<a id="usage"></a>

## Usage

When working with attachments using this CMS visit `http://tld.com/attachments` to manage and upload new attachments to be stored with the Postgres DB using this CMS.

> Must be logged in to CMS in order to manage attachments.

<a id="deployment"></a>

## Deployment

This app will bind to the local port of `7777` on the deployed server using puma and nginx.  See `deploy.rb` for more details.

<a id="security"></a>

## Security

To update a vulnerable gem present within the bundled gems

```shell
bundle update [mr-fancy-vulnerable-gem]
```

### Security Updating vulnerable gems example

```shell
bundle update loofah
```

> The above command is useful for updating gems bundled in the gemset but aren't defined within the `Gemfile`.

<a id="todo"></a>

## TODO

- [x] ~~figure out why app isn't running in dev environment ¯\\_(ツ)_/¯~~
