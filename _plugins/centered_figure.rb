module Jekyll
  class CenteredImageTag < Liquid::Tag
    def initialize(tag_name, markup, tokens)
      super
      @url, @alt = markup.strip.split(/\s+/, 2)
    end

    def render(context)
      "<center>
        <figure>
          <img src=\"#{@url}\" loading=\"lazy\" alt=\"#{@alt}\" width=\"500\" />
          <figcaption>#{@alt}</figcaption>
        </figure>
      </center>"
    end
  end
end

Liquid::Template.register_tag('centered_image', Jekyll::CenteredImageTag)
