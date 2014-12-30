class WelcomeController < ApplicationController

def index
  render html: '<h1>Welcome</h1>'.html_safe
end

end
