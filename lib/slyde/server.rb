require "liquid"
require "sinatra/base"

module Slyde
  class Server < Sinatra::Base
    attr_reader :presentation

    set :root, File.expand_path(File.join(__FILE__, %W[.. .. .. app]))

    def initialize(presentation)
      super()

      @presentation = presentation
    end

    # TODO: This isn't working right at all. The intention is to easily get the
    # root url, especially when using Rack#map
    def root_url
      request.url.split(request.path_info)[0]
    end

    get "/" do
      liquid :index, locals: {
        root_url: root_url,
        presentation: presentation.to_html,
        title: presentation.title
      }
    end

    get "/:slide" do
      slide = presentation.slide_with_id(params[:slide])
      next_slide = presentation.slide_after(slide)
      previous_slide = presentation.slide_before(slide)
      next_slide_url = next_slide && root_url + "/" + next_slide.id
      previous_slide_url = previous_slide && root_url + "/" + previous_slide.id

      liquid :slide, locals: {
        title: slide.title,
        slide: slide.to_html,
        root_url: root_url,
        next_slide_url: next_slide_url,
        previous_slide_url: previous_slide_url,
        page: slide.page,
        presentation_title: presentation.title
      }
    end
  end
end
