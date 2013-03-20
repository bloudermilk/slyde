module Slyde
  class Slide
    attr_reader :title, :body, :page

    def initialize(attributes)
      @title = attributes[:title]
      @body = attributes[:body]
      @page = attributes[:page]
    end

    def to_html
      body
    end

    def id
      title.gsub(/\W+/, "-").downcase
    end

    def ==(another_slide)
      id == another_slide.id
    end
  end
end
