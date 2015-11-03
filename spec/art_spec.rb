require "spec_helper"

describe Vamp::Art do
  it "has a vampire" do
    expect(subject::VAMPIRE).not_to be nil
    puts "\n#{subject::VAMPIRE}"
  end

  it "has a homoglobin" do
    expect(subject::HOBOGLOBIN_COLOR).not_to be nil
    puts "\n#{subject::HOBOGLOBIN_COLOR}"
  end
  it "has a scull" do
    expect(subject::SCULL_COLOR).not_to be nil
    puts "\n#{subject::SCULL_COLOR}"
  end
end
