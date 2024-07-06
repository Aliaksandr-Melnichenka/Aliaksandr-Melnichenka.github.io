module Jekyll
  class CenteredFigureTag < Liquid::Tag
    def initialize(tag_name, markup, tokens)
      super
      @markup = markup
    end

    def render(context)
      # Splitting the markup to extract image alt text and URL
      parts = @markup.split("](")
      alt_text = parts[0].delete_prefix('!')
      img_url = parts[1].delete_suffix(')')
      img_name = File.basename(img_url, '.*')

      # Constructing the HTML output
      <<-HTML
      <center>
        <figure>
          <img src="#{img_url}" loading="lazy" alt="#{img_name}" width="30%" />
          <figcaption>
            #{alt_text}
          </figcaption>
        </figure>
      </center>
      HTML
    end
  end
end

Liquid::Template.register_tag('centered_figure', Jekyll::CenteredFigureTag)
