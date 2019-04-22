[![Build Status](https://travis-ci.org/ipatch/crj.com.svg?branch=master)](https://travis-ci.org/ipatch/crj.com)

> The code repository maintaining [chrisrjones.com](http://www.chrisrjones.com)

<div align="center">

<a id="contents"></a>

## Contents

• [Usage](#usage) • [Deployment](#deployment) • [Deployment Use Case](#deployment-use-case) • [Security](#security) • [TODOs](#todos) •

</div>

<a id="usage"></a>

## Usage

When working with attachments using this CMS visit `http://tld.com/attachments` to manage attachments stored in the Postgres DB for this app.

> ⚠️ Must be logged in to manage attachments.

<a id="usage-testing-api-endpoints"></a>

### Usage > Manually Testing API endpoints

[httpie](https://httpie.org) is a useful utility for accessing endpoints, and even those exposed through an API.  That said, I half ass setup SSL a while back, and test certain API endpoints on the remote box, ie. chrisrjones.com, pass the `--verify=no` flag to **http** to manually access / test an endpoint.

<strong>Ex</strong>

```shell
http --verbose --verify=no https://chrisrjones.com/api/hello
```

The above command is an exposed API endpoint that does not require an auth token to access, and should return a **200** HTTP status code.

> The URL **must** be http**s** and NOT _http_ or else a **302** response will be returned from the server.

<a id="deployment"></a>

## Deployment

This app will bind to the local port of `7777` on the deployed server using puma and nginx.  See `deploy.rb` for more details.

<a id="deployment-use-case"></a>

### Deployment Use Case

For my particular use case, I manage many different Rubies on my system using various different tools such as asdf, homebrew, and RVM, that said, I chose to use RVM to manage the bundled gems used within this app because RVM integrates with Capistrano less painful then other Ruby managers, ie. asdf.  One caveat with using fish shell with RVM is that by default I use asdf Rubies on the daily, and need to switch to RVM when I want to manage gems contained with this app, and also need to start and ssh-agent when deploying this app using fish shell with RVM.

```shell
echo "rvm use [RUBY_VERSION_DEFINED_FOR_THIS APP]"
echo "as of Apr 5, 2019, 👇"
rvm ues 2.6.3
ssh-agent
ssh-add ~/.ssh/id_rsa
cap production deploy
```

<a id="security"></a>

## Security

To update a vulnerable gem bundled within the app

```shell
bundle update [mr-fancy-vulnerable-gem]
echo "Example"
bundle update loofah
```

> The above command is useful for updating gems bundled in the gemset but aren't defined within the `Gemfile`.

<a id="todo"></a>

## TODO

- [ ] fix contact form time permitting
- [ ] make certain that only the **owner** of an attachment can delete an attachment, ie. don't allow other peeps to delete other peeps attachments.
- [ ] figure out why _seed_ data isn't properly inserting into the test database
- [ ] experiment with versioning API, ie. create a V1 & V2
- [ ] update string formatting with those defined in the Rubocop style guidelines for Ruby
- [x] ~~figure out why app isn't running in dev environment ¯\\_(ツ)_/¯~~
