require 'bundler'
Bundler.require

class App < Midori::API
  get '/' do
    'Hello Midori' 
  end
end

Midori::Configure.set :bind, '0.0.0.0'
Midori::Configure.set :port, ENV['PORT'] ? ENV['PORT'] : 8080

Midori::Runner.new(App).start