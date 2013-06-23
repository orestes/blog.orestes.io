module Jekyll
  module MonthNameFilter
    def month_name(input)
      Date::MONTHNAMES[input.to_i]
    end
  end
end

Liquid::Template.register_filter(Jekyll::MonthNameFilter)