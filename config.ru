require "./lib/rack/git"

use Rack::Git
run lambda { |env| [200, { "Content-Type" => "text/plain" }, ["OK"]] }
