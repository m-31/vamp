require "spec_helper"

describe Vamp::Art do
  it "has a vampire" do
    expect(subject::VAMPIRE).not_to be nil
    puts "\n#{subject::VAMPIRE}"
  end
  it "has a colorful hobgoblin" do
    expect(subject::HOBGOBLIN_COLOR).not_to be nil
    puts "\n#{subject::HOBGOBLIN_COLOR}"
  end
  it "has a hobgoblin" do
    expect(subject::HOBGOBLIN).not_to be nil
    puts "\n#{subject::HOBGOBLIN}"
  end
  it "has a colorful shark" do
    expect(subject::SHARK_COLOR).not_to be nil
    puts "\n#{subject::SHARK_COLOR}"
  end
  it "has a shark" do
    expect(subject::SHARK).not_to be nil
    puts "\n#{subject::SHARK}"
  end
  it "has a colorful skull" do
    expect(subject::SKULL_COLOR).not_to be nil
    puts "\n#{subject::SKULL_COLOR}"
  end
  it "has a skull" do
    expect(subject::SKULL).not_to be nil
    puts "\n#{subject::SKULL}"
  end
  it "has a colorful lizard" do
    expect(subject::LIZARD_COLOR).not_to be nil
    puts "\n#{subject::LIZARD_COLOR}"
  end
  it "has a lizard" do
    expect(subject::LIZARD).not_to be nil
    puts "\n#{subject::LIZARD}"
  end
  it "has a colorful dragon" do
    expect(subject::DRAGON_COLOR).not_to be nil
    puts "\n#{subject::DRAGON_COLOR}"
  end
  it "has a dragon" do
    expect(subject::DRAGON).not_to be nil
    puts "\n#{subject::DRAGON}"
  end
  it "has a running man" do
    expect(subject::RUNNING).not_to be nil
    puts "\n#{subject::RUNNING}"
  end
  it "has a declaring woman" do
    expect(subject::DECLARING).not_to be nil
    puts "\n#{subject::DECLARING}"
  end
end
