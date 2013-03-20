require "nokogiri"

module Slyde
  class Presentation::Parser
    SLIDE_TAG = "article"

    attr_reader :html

    def self.collect_until(pointer, stop)
      [].tap do |results|
        until pointer == stop
          results << pointer
          pointer = pointer.next
        end
      end
    end

    def self.collect_rest(pointer)
      [pointer].tap do |results|
        while pointer = pointer.next
          results << pointer
        end
      end
    end

    def initialize(html)
      @html = html
    end

    def slides
      @slides ||= slide_headers.each_with_index.inject([]) do |slides, (header, i)|
        next_header = slide_headers[i + 1]

        nodes = next_header ?
          self.class.collect_until(header, next_header) :
          self.class.collect_rest(header)

        content = nodes.map(&:to_html).join

        slides.push({
          title: header.content,
          body: "<#{SLIDE_TAG}>#{content}</#{SLIDE_TAG}>"
        })

        slides
      end
    end

    def title
      @title ||= document.at_css("h1").content
    end

    def slide_headers
      @slide_headers ||= document.css("h1, h2, h3")
    end

    def document
      @document ||= Nokogiri::HTML::DocumentFragment.parse(html)
    end
  end
end
