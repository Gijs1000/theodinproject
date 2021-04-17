# Capybara.configure do |config|
#   server_port = ENV["HOST_PORT"].to_i
#   config.server_port = server_port
#   config.app_host = "http://#{ENV['HOST_DOMAIN']}:#{server_port}"
#   config.server = :puma, { Silent: true }
#   config.test_id = "data-test"
#   config.automatic_label_click = true
# end

Capybara.default_max_wait_time = 2

Capybara.default_normalize_ws = true

Capybara.save_path = ENV.fetch("CAPYBARA_ARTIFACTS", "./tmp/capybara")

Capybara.singleton_class.prepend(Module.new do
  attr_accessor :last_used_session

  def using_session(name, &block)
    self.last_used_session = name
    super
  ensure
    self.last_used_session = nil
  end
end)

Capybara.add_selector(:test_id) do
  css { |value| "[data-test-id='#{value}']" }
end
