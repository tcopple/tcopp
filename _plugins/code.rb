require 'coderay'

module Jekyll
  class CodeBlock < Liquid::Block

    def initialize(tag_name, lang, tokens)
      @lang = lang.strip.downcase.to_sym
      super
    end

    def render(context)
      "<notextile>#{CodeRay.scan(super.strip, @lang).div(:css => :class, :line_numbers => :inline)}</notextile>"
    end
  end
end

Liquid::Template.register_tag('code', Jekyll::CodeBlock)
