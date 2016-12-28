require "vamp/animator"
require "vamp/art"
require "vamp/colorize"
require "vamp/ply"
require "vamp/version"

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
      " of both great covens for many years to come.",
      "Whether you like it or not, you are in middle of a war that has been raging for the better part of a" \
      " thousand years.",
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
      "Please forgive me, but I desperately need your guidance. I apologize for breaking the chain and awakening you" \
      " ahead of schedule, but I fear we may all be in grave danger.",
      "I just feel like all the sand is at the bottom of the hour glass or something.",
      "Only those prepared to die will find eternal life.",
      "I remember everything. It's a burden.",
      "I am teaching you something you don't want to know.",
      "Death is not the worst. There are things more horrible than death.",
      "I'll protect you from the hooded claw; Keep the vampires from your door.",
      "It's about power and it's about women and you just hate those two words in the same sentence, don't you?",
      "I saw you last night, and I see you working here today. You're not special; you're extraordinary.",
      "What I want from you I can never have. You don't need me to take care of you anymore. So I'm gonna go.",
      "This world is a vampire, she eats her kids, let's hide the bodies under the bridge.",
      "Your mouth is open, sound is coming from it. This is never good.",
      "It looks dead. It smells dead. Yet it's moving around. That's interesting.",
      "Stop touching my magic bone!",
      "She could be anywhere. Even here, right now, watching, listening to every word we say." \
      " For all we know, she could be one of us.",
      "We're hunted men, driven mad by forces beyond our understanding.",
      "How can you tell me you understand what those vampires are feeling? You aren't a passion to them," \
      " you are a snack! A willing, idiotic snack.",
      "You want credit for not feeding on bleeding disaster victims?",
      "So, what I'm wondering is, does this always happen? Sleep with a guy and he goes all evil?",
      "I may be dead, but I'm still pretty. Which is more than I can say for you.",
      "I'm going through some ... changes.",
      "I'm gonna ask you something, and you gotta promise you'll be honest and not spare my feelings just 'cause" \
      " I could kill you. You promise?",
      "Are you nuts? Of course it's working! Observe my bitter ranting. Hear the shrill edge of hysteria in my voice.",
      "Testosterone is a great equalizer. It turns all men into morons.",
      "I've been alive a bit longer than you, and dead a lot longer than that. I've seen things you couldn't" \
      " imagine, and done things I prefer you didn't. I don't exactly have a reputation for beeing a thinker." \
      " I follow my blood, which doesn't exactly rush in the direction of my brain. So I make a lot of mistakes," \
      " a lot of wrong bloody calls. A hundred plus years, and there's only one thing I've been sure of: you.",
      "I have come to redefine the words pain and suffering since I fell in love with you.",
      "It's officially nippy. So say my nips.",
      "What the hell is going on? What's happening to me?",
      "You can never come here again. They'll kill you. Do you understand?",
      "Incoherent thoughts and images, nothing more. Which is precisely why the Awakening is performed by an elder." \
      " You do not possess the necessary skills. ",
      "He comes in, he does his job and then he goes home. Other than that, I really don't know what to tell you.",
      "In one night the lies that had united our kind had been exposed."
    ].sample
  end
end
