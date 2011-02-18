require 'test_helper'
require 'rails/generators'

class InstallGeneratorTest <  Rails::Generators::TestCase

  tests RailsBrowscap::Generators::InstallGenerator
  destination File.expand_path("../tmp", File.dirname(__FILE__))
  setup :prepare_destination

  test "install_browscap" do
    run_generator
    assert_file "config/initializers/browscap.rb"
    assert_file "config/browscap.ini"
  end

end
