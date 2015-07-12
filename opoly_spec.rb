#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require 'json'
require_relative 'opoly'

class OpolyTest < Minitest::Test
  def setup
    @players = 3
    @spaces = 10
    @prop_fields = 3
    @opo = Opoly.new
    @new_game_out = JSON.parse(@opo.update('_test_games/new_game.json'))
  end
 
  def test_outputs_valid_game_state
    assert_equal @new_game_out['cash'].length, @players
    assert_equal @new_game_out['spaces'].length, @spaces 
    @new_game_out['spaces'].each do |n|
      assert_equal n.length, @prop_fields
      assert n['owner'].is_a? String
      assert [true, false].include? n['lien']
      assert n['developed'] <= 6 && n['developed'] >= 0
    end
  end
end
