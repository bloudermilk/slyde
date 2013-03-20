require "redcarpet"

module Slyde
  class Presentation
    attr_reader :path

    autoload :Parser, "slyde/presentation/parser"

    def self.renderer
      @renderer ||= Redcarpet::Markdown.new(HTMLRenderer, {
        tables: true,
        fenced_code_blocks: true,
        autolink: true,
        strikethrough: true,
        space_after_headers: true,
        superscript: true
      })
    end

    def initialize(path)
      @path = path
    end

    def slide_with_id(id)
      slides.find { |s| s.id == id }
    end

    def slides
      @slides ||= parser.slides.each_with_index.map do |slide, index|
        slide_attributes = slide.merge(page: index + 1)

        Slide.new(slide_attributes)
      end
    end

    def parser
      @parser ||= Parser.new(raw_html)
    end

    def title
      parser.title
    end

    def to_html
      @to_html ||= slides.map(&:to_html).join
    end

    def raw_html
      self.class.renderer.render(to_s)
    end

    def to_s
      File.read(path)
    end

    def slide_after(slide)
      slides[index_for_slide(slide) + 1]
    end

    def slide_before(slide)
      index = index_for_slide(slide)
      index == 0 ? nil : slides[index - 1]
    end

    def index_for_slide(slide)
      slides.index(slide)
    end
  end
end
