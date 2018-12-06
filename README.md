[![Build Status](https://travis-ci.org/ipatch/crj.com.svg?branch=master)](https://travis-ci.org/ipatch/crj.com)

The code repository maintaining [chrisrjones.com](http://www.chrisrjones.com)

<a id="usage"></a>

## Usage

When working with attachments using this CMS visit `http://tld.com/attachments` to manage and upload new attachments to be stored with the Postgres DB using this CMS.

> Must be logged in to CMS in order to manage attachments.

<a id="deployment"></a>

## Deployment

This app will bind to the local port of `7777` on the deployed server using puma and nginx.  See `deploy.rb` for more details.

<a id="deployment-use-case"></a>

### Deployment Use Case

For my particular use case, I manage many different Rubies on my system using various different tools such as asdf, homebrew, and RVM, that said, I chose to use RVM to manage the bundled gems used within this app because RVM integrates with Capistrano less painful then other Ruby managers, ie. asdf.  One caveat with using fish shell with RVM is that by default I use asdf Rubies on the daily, and need to switch to RVM when I want to manage gems contained with this app, and also need to start and ssh-agent when deploying this app using fish shell with RVM.

```shell
# rvm use [RUBY_VERSION_DEFINED_FOR_THIS APP]
# as of Dec 6, 2018, 👇
rvm ues 2.5.3
ssh-agent
ssh-add ~/.ssh/id_rsa
cap production deploy
```

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
