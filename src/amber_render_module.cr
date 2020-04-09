require "./amber_render_module/*"
require "./amber/controller/**"

module AmberRenderModule
  # TODO Put your code here
end

# patch the ApplicationController class to include the render_module macro
class ApplicationController < Amber::Controller::Base
  include Amber::Controller::Helpers::RenderModule
end

# patch the Quartz::Composer class to include the render_module macro
class Quartz::Composer
  include Amber::Controller::Helpers::RenderModule
end

