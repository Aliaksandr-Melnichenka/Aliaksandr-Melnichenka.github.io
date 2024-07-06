module Jekyll
  class FigureTag < Liquid::Tag
    def initialize(tag_name, markup, tokens)
      super
      @alt = markup.strip
      @url = markup.strip.split('](').last.split(')').first
    end

    def render(context)
      "<center><figure><img src='#{@url}' loading='lazy' alt='#{@alt}' width='500' /><figcaption>#{@alt}</figcaption></figure></center>"
    end
  end
end

Liquid::Template.register_tag('figure', Jekyll::FigureTag)
