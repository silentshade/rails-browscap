require 'test_helper'

class BrowscapTest < ActiveSupport::TestCase

  setup do
    @@browscap ||= ::Browscap.new 'config/browscap.ini'
  end

  test "can read a browscap file" do
    assert_true(@@browscap!=nil)
  end

end
