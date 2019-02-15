module Rack
  class Git
    def call(env)
      [200, { "Content-Type" => "text/plain" }, [commit]]
    end

    private

    def commit
      `git rev-parse HEAD`.chomp
    end
  end
end
