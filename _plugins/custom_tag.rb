module Jekyll
  class CustomTag < Liquid::Tag
    def render(context)
      "<div class='custom-tag'>Hello, Custom Tag!</div>"
    end
  end
end

Liquid::Template.register_tag('custom_tag', Jekyll::CustomTag)
