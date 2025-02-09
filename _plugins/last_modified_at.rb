module Jekyll
	class LastModifiedTag < Liquid::Tag
	  def render(context)
		page_path = context.registers[:page]["path"]
		git_date = `git log -1 --format="%ad" --date=iso "#{page_path}"`.strip
		git_date.empty? ? "N/A" : git_date
	  end
	end
  end
  
  Liquid::Template.register_tag("last_modified_at", Jekyll::LastModifiedTag)
  