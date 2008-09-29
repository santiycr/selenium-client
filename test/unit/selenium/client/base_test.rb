require File.expand_path(File.dirname(__FILE__) + '/../../unit_test_helper')

unit_tests do
  
  test "default_timeout_in_seconds returns the client driver default timeout in seconds" do
    client = Class.new { include Selenium::Client::Base }.new :host, :port, :browser, :url, :the_timeout
    assert_equal :the_timeout, client.default_timeout_in_seconds
  end

  test "default_timeout_in_seconds is 5 minutes by default" do
    client = Class.new { include Selenium::Client::Base }.new :host, :port, :browser, :url
    assert_equal 5 * 60, client.default_timeout_in_seconds
  end

  test "session_started? returns false when no session has been started" do
    client = Class.new { include Selenium::Client::Base }.new :host, :port, :browser, :url
    assert_false client.session_started?
  end

  test "session_started? returns true when session has been started" do
    client = Class.new { include Selenium::Client::Base }.new :host, :port, :browser, :url
    client.stubs(:string_command).returns("A Session Id")
    client.start    
    assert_true client.session_started?
  end

  test "session_started? returns false when session has been stopped" do
    client = Class.new { include Selenium::Client::Base }.new :host, :port, :browser, :url
    client.stubs(:string_command).returns("A Session Id")
    client.stubs(:remote_control_command)
    client.start    
    client.stop
    assert_false client.session_started?
  end

  test "chrome_backend? returns true when the browser string is *firefox" do
    client = Class.new { include Selenium::Client::Base }.new :host, :port, "*firefox", :url
    assert_true client.chrome_backend?
  end
  
  test "chrome_backend? returns true when the browser string is *iexplore" do
    client = Class.new { include Selenium::Client::Base }.new :host, :port, "*iexplore", :url
    assert_false client.chrome_backend?
  end

  test "chrome_backend? returns true when the browser string is *safari" do
    client = Class.new { include Selenium::Client::Base }.new :host, :port, "*safari", :url
    assert_false client.chrome_backend?
  end

  test "chrome_backend? returns true when the browser string is *opera" do
    client = Class.new { include Selenium::Client::Base }.new :host, :port, "*opera", :url
    assert_false client.chrome_backend?
  end

  test "chrome_backend? returns true when the browser string is *chrome" do
    client = Class.new { include Selenium::Client::Base }.new :host, :port, "*chrome", :url
    assert_true client.chrome_backend?
  end

  test "chrome_backend? returns true when the browser string is *firefox2" do
    client = Class.new { include Selenium::Client::Base }.new :host, :port, "*firefox2", :url
    assert_true client.chrome_backend?
  end

  test "chrome_backend? returns true when the browser string is *firefox3" do
    client = Class.new { include Selenium::Client::Base }.new :host, :port, "*firefox3", :url
    assert_true client.chrome_backend?
  end

  test "chrome_backend? returns true when the browser string is *firefoxproxy" do
    client = Class.new { include Selenium::Client::Base }.new :host, :port, "*firefoxproxy", :url
    assert_false client.chrome_backend?
  end

  test "chrome_backend? returns true when the browser string is *pifirefox" do
    client = Class.new { include Selenium::Client::Base }.new :host, :port, "*pifirefox", :url
    assert_false client.chrome_backend?
  end

    
end
