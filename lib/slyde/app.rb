module Slyde
  class App
    attr_reader :presentation, :server

    def initialize(path)
      @presentation = Presentation.new(path)
      @server = Server.new(presentation)
    end

    def call(env)
      @server.call(env)
    end
  end
end
