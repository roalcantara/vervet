module RouteHelper
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in route_steps.rb
  #
  def route_to(page_name)
    case page_name
    when /the home\s?page/
      root_path
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))
    else
      default_route_to page_name
    end
  end

  private

  def default_route_to(page_name)
    page_name =~ /the (.*) page/
    path_components = page_name.split(/\s+/)
    send(path_components.push('path').join('_').to_sym)
  rescue Object => e
    raise "Can't find mapping from \"#{page_name}\" to a route.\n"\
          "Now, go and add a mapping in `#{__FILE__}`. Message: `#{e}`"
  end
end

World(RouteHelper)
