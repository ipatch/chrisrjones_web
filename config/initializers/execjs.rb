# frozen_string_literal: true

# NOTE: ipatch,
# define & experiment with custom non default JS runtimes
# https://www.rubydoc.info/gems/execjs/2.8.1

# TODO: ipatch, presently this does not work

module ExecJS
  module Runtimes
    if ENV['EXECJS_BUN']
      Bun = ExternalRuntime.new(
        name: 'bun',
        command: ['bun run'],
        # runner_path: ExecJS.root + "/home/capin/.bun/bin/bun",
        encoding: 'UTF-8'
      )
    end
  end
end
