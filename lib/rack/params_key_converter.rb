require "rack/params_key_converter/version"
require "active_support"
require "json"

module Rack
  class ParamsKeyConverter
    def initialize(app)
      @app = app
    end

    def call(env)
      # GET
      env["action_dispatch.request.query_parameters"] = convert_key(:underscore, env["action_dispatch.request.query_parameters"])
      # POST
      env["rack.request.form_hash"] = convert_key(:underscore, env["rack.request.form_hash"])
      # JSON
      env["action_dispatch.request.request_parameters"] = convert_key(:underscore, env["action_dispatch.request.request_parameters"])

      status, headers, body = @app.call(env)

      str = body.shift
      h = JSON.parse(str)
      body = [convert_key(:camelize, h).to_json]

      [status, headers, body]
    end

    def convert_key(strategy, hash)
      return hash if hash.blank?
      return hash unless [Hash, Array].include?(hash.class)
      converted_hash = {}

      hash.each do |k, v|
        k = k.to_s
        case v
        when Array
          converted_hash[make_key(k, strategy)] = v.grep(Hash) { |x| convert_key(strategy, x) }
        when Hash
          converted_hash[make_key(k, strategy)] = convert_key(strategy, v)
        else
          converted_hash[make_key(k, strategy)] = v
        end
      end

      converted_hash
    end

    def make_key(k, strategy)
      if strategy == :camelize
        return k.send(strategy, :lower)
      end
      k.send(strategy)
    end
  end
end
