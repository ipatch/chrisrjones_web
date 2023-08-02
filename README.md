> The code repository maintaining [chrisrjones.com](http://www.chrisrjones.com)

<div align="center">

## Contents

<a name="contents"></a>

• [Usage](#usage) • [Deployment](#deployment) • [Deployment Use Case](#deployment-use-case) • [Security](#security) • [TODOs](#todos) •

</div>

## Usage

<a name="usage"></a>

When working with attachments using this CMS visit `http://tld.com/attachments` to manage attachments stored in the Postgres DB for this app.

> ⚠️ Must be logged in to manage attachments.


### Usage / Manually Testing API endpoints

<a id="usage-testing-api-endpoints"></a>

[httpie](https://httpie.org) is a useful utility for accessing endpoints, and even those exposed through an API.  That said, I half ass setup SSL a while back, and test certain API endpoints on the remote box, ie. chrisrjones.com, pass the `--verify=no` flag to **http** to manually access / test an endpoint.

<strong>Ex</strong>

```shell
http --verbose --verify=no http://localhost:3000/api/hello
http --verbose --verify=no https://chrisrjones.com/api/hello
```

The above command is an exposed API endpoint that does not require an auth token to access, and should return a **200** HTTP status code.

> The URL **must** be http**s** and NOT _http_ or else a **302** response will be returned from the server.

## Deployment

<a id="deployment"></a>

This app will bind to the local port of `7777` on the deployed server using puma and nginx.  See `deploy.rb` for more details.

### Deployment Use Case

<a id="deployment-use-case"></a>

For my particular use case, I manage many different Rubies on my system using various different tools such as asdf, homebrew, and RVM, that said, I chose to use RVM to manage the bundled gems used within this app because RVM integrates with Capistrano less painful then other Ruby managers, ie. asdf.  One caveat with using fish shell with RVM is that by default I use asdf Rubies on the daily, and need to switch to RVM when I want to manage gems contained with this app, and also need to start and ssh-agent when deploying this app using fish shell with RVM.

```shell
echo "rvm use [RUBY_VERSION_DEFINED_FOR_THIS APP]"
echo "as of March 4, 2020 👇"
rvm ues 2.7.0
ssh-agent
ssh-add ~/.ssh/id_rsa
cap production deploy
```

## Security

<a id="security"></a>

To update a vulnerable gem bundled within the app

```shell
bundle update [mr-fancy-vulnerable-gem]
echo "Example"
bundle update loofah
```

> The above command is useful for updating gems bundled in the gemset but aren't defined within the `Gemfile`.

## Maintenance

<a id="maintenance"></a>

### maintenance / march 2023

> it appears a rails 5.x app will not work with ruby 3.x so use ruby 2.7.x to work with rails 5.x

1. install rvm for local `$USER`
2. install latest ruby 2.7.x

  2a. if using archlinux, install openssl 1.x via rvm

  ```shell
  rvm pkg install openssl
  ```

  2b. reinstall ruby 2.7.x via rvm, use rvm defined openssl

  ```
  rvm install 2.7.7 --with-openssl-dir=$HOME/.rvm/usr
  echo "install ruby with local openssl and jemalloc"
  rvm reinstall 2.7.8 --with-openssl-dir="$HOME/.rvm/usr" --with-jemalloc
  ```

3. if using fish shell, setup `rvm.fish` from dotfiles repo
4. if working locally with a arch linux box, install postgres

  4a. post postgres setup steps

  ```
  sudo -iu postgres
  initdb -D /var/lib/postgres/data
  createuser --interactive
  ```

5. then run rails tasks

  ```
  rails db:create
  rails db:migrate
  ```

To update gems listed within a **Gemfile**

```shell
bundle update --all
```

❗️ The are sub commands for performing different levels of updates ie.

- major
- minor
- patch

to name a few.  For more info on granular updating of gems [see](https://bundler.io/v2.0/man/bundle-update.1.html)


## scratchpad

<a id="scratchpad"></a>

## scratchpad / fe / react

> just some thought / notes working with react experimenting building out a frontend

- styling CSS pseduo class elements like hover becomes **non trivial** when using inline styles 👎️

i came across the below neovim LSP error message today appearing as virtual text, the quick solution is to install the `@types/react` npm package for my react starter project because i initialzed a `tsconfig.js` in the root of the project.

```
nvim native lsp tsserver could not find a declaration file for module 'react'.
```

## useful links

<a id="useful-links"></a>

- https://github.com/microsoft/TypeScript/blob/main/src/compiler/diagnosticMessages.json

## TODO

<a id="todo"></a>

- [ ] #fe #react only show logout button if a user is logged in
- [x] #fe #react need to preserve state through hot reloads, will be useful later on
- [ ] #fe #react what's a good way to see the code of the actual components in my browser dev tools?
    - as of right now when opening the debugger tab i'm seeing the entire app bundle ie. `app.bundle.js` 👎️
- [x] if using app as an API only how can i authenticate with the app using a frontend framework such as react
- [x] fix the user registration process, ie. when i register an account the app throws and error as seen below
    ```
    SocketError in UsersController#create

    getaddrinfo: Name or service not known

    Rails.root: /opt/code/git/github/chrisrjones_rails
    Application Trace | Framework Trace | Full Trace

    app/models/user.rb:36:in `send_confirmation'
    app/controllers/users_controller.rb:28:in `create'
    ```
- [ ] work on figuring out how i can setup an intializer to experiment with the bun & deno javascript runtimes
- [x] updating my `boot.rb` file to use next avail port broke accessing my app on my LAN, should be easy fix
- [ ] fix contact form time permitting
- [ ] make certain that only the **owner** of an attachment can delete an attachment, ie. don't allow other peeps to delete other peeps attachments.
- [ ] figure out why _seed_ data isn't properly inserting into the test database
- [ ] experiment with versioning API, ie. create a V1 & V2
- [ ] update string formatting with those defined in the Rubocop style guidelines for Ruby
- [x] ~~figure out why app isn't running in dev environment ¯\\_(ツ)_/¯~~
