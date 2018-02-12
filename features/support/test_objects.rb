class TestObjects
  def initialize(endpoints)
    @endpoints = endpoints
  end

  def test_request_creation
    @test_request_creation ||= TestRequestCreation.new(@endpoints)
    @test_request_creation
  end

  def test_case_creation
    @test_case_creation ||= TestCaseCreation.new(@endpoints)
    @test_case_creation
  end

  def afterhook
    @afterhook ||= Afterhook.new(@endpoints)
    @afterhook
  end
end
