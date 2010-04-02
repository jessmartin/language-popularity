class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :load_languages
  
  def load_languages
    @languages = Language.all
  end
end
