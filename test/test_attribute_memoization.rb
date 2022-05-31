# frozen_string_literal: true

require "test_helper"
require 'mocha/minitest'

class TestAttributeMemoization < Minitest::Test
  attr_reader(:time) { Time.now }

  def test_that_it_has_a_version_number
    refute_nil ::AttributeMemoization::VERSION
  end

  def test_it_works
    mock_time = 123

    Time.expects(:now).once.returns(mock_time)

    assert_nil instance_variable_get(:@time)

    2.times { assert_equal mock_time, time }

    assert_equal mock_time, instance_variable_get(:@time)
  end
end
