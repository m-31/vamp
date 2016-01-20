require_relative "vamp/animator"
require_relative "vamp/art"
require_relative "vamp/colorize"
require_relative "vamp/ply"
require_relative "vamp/version"

module Vamp

  # ascii art: vampire
  VAMPIRE = Vamp::Art::VAMPIRE

  # return random quote
  def quote
    [
      "Twilight, again. Another ending. No matter how perfect the day is, it always has to end.",
      "I decided as long as I was going to hell, I might as well do it thoroughly.",
      "Don't run! I never liked fast food.",
      "I've been wondering ever since before why do you always look so sad whenever you're with me?",
      "Hey, what's your blood type?",
      "The strength of the vampire is that people will not believe in him.",
      "Death is Peaceful, Life is Harder.",
      "You're still waiting for the running and the screaming, aren't you?",
      "Your number was up the first time I met you.",
      "You really should stay away from me.",
      "Thats the beautiful thing about being human: Things change.",
      "I've never tried to keep a specific person alive before, and it's much more troublesome" \
      " than I would have believed.",
      "Hasn't anyone ever told you? Life isn't fair.",
      "No blood, no foul.",
      "Go sit down and look pale.",
      "It's not the end. It's the beginning.",
      "I'd rather know what you're thinking - even if what you're thinking is insane.",
      "Don't be offended, but you seem to be one of those people who just attract accidents like a magnet.",
      "Without the dark, we'd never see the stars.",
      "I warned you that you didn't want to know everything I was thinking.",
      "Our relationship couldn't continue to balance, as it did, on the point of a knife.",
      "Why do people always assume that volume will succeed when logic won't?",
      "I hope you enjoyed your visit. You never know. You may want to join forever.",
      "If you are a vampire, then a vampire is not the creature of the legends.",
      "Not all vampires are created equal.",
      "According to my research, in a vampire-werewolf love triangle, the vampire always gets the girl.",
      "Some things aren't meant for sunlight. The only place for them is in the shadows.",
      "Is that all I was to you, a one-bite stand?",
      "Though I cannot predict the future, the consequences of this night will reverberate through the halls" \
      " of both great covens for many years to come",
      "Whether you like it or not, you are in middle of a war that has been raging for the better part of a" \
      " thousand years",
      "There is a good reason why these rules were created, and they are the only reason we have survived this long!",
      "First rule about vampires, don`t believe anything you read.",
      "Stupid, unreliable vampire.",
      "Which is tempting you more, my blood or my body?",
      "You can have my soul. I don't want it without you - it's yours already!",
      "It appears we have a lot to learn about each other.",
      "You have nothing to worry about. You are completely safe here.",
      "One thing vampire children are taught is, never run with a wooden stake.",
      "The unknown is now my reality, for I do not yet understand what I have become." \
      " The future brings so many questions, so many fears. But the first step, the first day, has arrived.",
      "Please forgive me, but I desperately need your guidance. I apologise for breaking the Chain and awakening you" \
      " a head of schedule, but I fear we may all be in grave danger.",
      "I just feel like all the sand is at the bottom of the hour glass or something.",
      "Only those prepared to die will find eternal life.",
      "I remember everything. It's a burden.",
      "I am teaching you something you don't want to know.",
      "Death is not the worst. There are things more horrible than death.",
      "I'll protect you from the hooded claw; Keep the vampires from your door."
    ].sample
  end
end
