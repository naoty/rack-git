module Rack
  class Git
    def initialize(app = nil)
      @app = app
    end

    def call(env)
      return [200, { "Content-Type" => "text/plain" }, [commit]] if @app.nil?

      response = @app.call(env)
      response[1]["X-Git-Commit"] = commit
      response
    end

    private

    def commit
      `git rev-parse HEAD`.chomp
    end
  end
end
