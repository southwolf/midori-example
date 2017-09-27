require 'bundler'
Bundler.require
require 'erb'
require 'tilt'

Midori::Configure.before = proc do
  Dir[File.dirname(__FILE__) + '/models/*.rb'].each { |file| require file }
end

class App < Midori::API
  get '/' do
    me = Person.new
    me.name = 'Midori'
    me.age = '1 year'
    me.gender = 'girl'
    me.photo = 'https://github.com/heckpsi-lab/em-midori/raw/master/.resources/midori_logo.png'

    template = Tilt.new('views/hello.html.erb')
    Midori::Response.new(
      status: 200,
      header: { 'Content-Type': 'text/html' },
      body: template.render(me)
    )
  end
end

Midori::Configure.set :bind, '0.0.0.0'
Midori::Configure.set :port, ENV['PORT'] ? ENV['PORT'] : 8080

Midori::Runner.new(App).start