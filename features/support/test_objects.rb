class TestObjects
  def initialize(endpoints)
    @endpoints = endpoints
  end

  def test_request_creation
    @test_request_creation ||= TestRequestCreation.new(@endpoints)
    @test_request_creation
  end
end
