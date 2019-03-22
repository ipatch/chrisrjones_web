# CREDIT:https://stackoverflow.com/a/51232774/708807
# NOTE: this file is useful for resolving deprecation warnings when using the pg gem at version 0.21.0 with rails 4.2.x
# NOTE: drop this file in ./config/initializers/

if ('0.21.0' == PG::VERSION)
  # update PG constants if `pg` gem  equals v0.21.0 to avoid deprecation warnings when working with with the `pg` gem..
  # An alternative solution is to lock the `pg` gem  in at v0.20.0 in the `Gemfile` to avoid displaying deprecation warnings.

  # NOTE: be sure to load this file and dir before the `pg` gem is loaded via the $LOAD_PATH or issues will arrise if sourcing this file from the `./lib/pg` dir.
  #
  # FILE: ./config/application.rb
  # config.autoload_paths << Rails.root.join('lib')
  PGconn    = PG::Connection
  PGresult  = PG::Result
  PGError   = PG::Error
end
