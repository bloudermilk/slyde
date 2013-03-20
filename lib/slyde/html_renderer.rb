require "redcarpet"

module Slyde
  class HTMLRenderer < Redcarpet::Render::HTML
    include Rack::Utils

    def block_code(code, language)
      "<pre><code data-language=\"#{language}\">#{escape_html code}</code></pre>"
    end
  end
end
