require "test_helper"
require "capybara/cuprite"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  def setup
    Capybara.server_host = "0.0.0.0"
    Capybara.app_host = "http://#{IPSocket.getaddress(Socket.gethostname)}" if ENV["CHROMIUM_REMOTE_URL"].present?
    super
  end
  driven_by :cuprite, options: { browser: :remote, url: ENV["CHROMIUM_REMOTE_URL"] }
end