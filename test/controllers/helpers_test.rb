require 'test_helper'

class ControllerTest < ActiveSupport::TestCase

  class FakeController < ActionController::Base
  end

  test "can read a browscap file" do
    mock = FakeController.new
    assert_true(mock.methods.include?(:current_browser))
  end

end
