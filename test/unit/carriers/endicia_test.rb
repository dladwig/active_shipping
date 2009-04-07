require File.dirname(__FILE__) + '/../../test_helper'

class EndiciaTest < Test::Unit::TestCase
  def setup
    @packages  = TestFixtures.packages
    @locations = TestFixtures.locations
    @carrier = Endicia.new(:partner_id => '123456')
    @shipper = @locations[:real_google_as_commercial].dup
    @shipper.number = '123456'
    @shipper.passphrase = 'foobar'
  end

  def test_build_change_passphrase_request
    request = @carrier.send(:build_change_passphrase_request, @shipper, 'xyzzy')
    assert_nothing_raised do
      REXML::Document.new(request)
    end
  end

  def test_build_recredit_request
    request = @carrier.send(:build_recredit_request, @shipper, Money.new(5000))
    assert_nothing_raised do
      REXML::Document.new(request)
    end
  end
end
