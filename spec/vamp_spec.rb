require "spec_helper"

describe Vamp do
  it "has a version number" do
    expect(Vamp::VERSION).not_to be nil
  end

  it "has a vampire" do
    expect(Vamp::VAMPIRE).not_to be nil
  end

  it "gives string quote" do
    expect(quote).to be_a(String)
  end

  it "gives quote with 10 < length < 1000" do
    expect(quote.length).to be_between(11, 999)
  end

  subject(:messages) do
    messages = Set.new
    maximum = 10
    minimum = maximum / 1
  end
  it "gives different quotes" do
    messages = Set.new
    maximum = 10
    minimum = maximum / 1
    maximum.times { messages << quote }
    let()
    begin
      expect(messages.size).to be_between(minimum, maximum)
    rescue
      puts messages
      fail "we expected at least #{minimum} different messages for #{maximum}" \
           " calls. But we just got #{messages.size}: #{messages}"
    end
  end
end
