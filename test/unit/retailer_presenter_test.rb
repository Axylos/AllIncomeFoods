require 'test_helper'

describe RetailerPresenter do

  before do
    @retailer_presenter = RetailerPresenter.new("22314")
  end

  test "should return retailers" do
    assert_equal @retailer_presenter.retailers, [retailers(:one), retailers(:two)]
  end

  test "should return lat and long" do
    assert_equal @retailer_presenter.origin, [38.7999723, -77.0506896]
  end

  test "should return array of distances from origin" do
    assert_equal @retailer_presenter.distances, [{:dist=>452.98, :unit=>"mi"}, {:dist=>5627.86, :unit=>"mi"}]
  end

end