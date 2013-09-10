require 'net/http'

module ApplicationHelper
  def faye_path
    "#{ Settings[:faye][:host] }:#{ Settings[:faye][:port] }"
  end
end
