[![Build Status](https://travis-ci.org/ipatch/crj.com.svg?branch=master)](https://travis-ci.org/ipatch/crj.com)

This is the code repository that maintains the [chrisrjones.com](http://www.chrisrjones.com) site.

## Deployment
This app will bind to the local port of `7777` on the deployed server using puma and nginx.  See `deploy.rb` for more details.

## Security
To update a vulnerable gem present within the bundled gems

```fish
bundle update [mr-fancy-vulnerable-gem]
```

### Security **Updating vulnerable gems example**

```fish
bundle update loofah
```

> The above command is useful for updating gems bundled in the gemset but aren't defined within the `Gemfile`.

## TODO
- [x] ~~figure out why app isn't running in dev environment ¯\\_(ツ)_/¯~~
