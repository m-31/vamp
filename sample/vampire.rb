require "vamp"

animator = Vamp::Animator.new(File.join(Gem.loaded_specs["vamp"].gem_dir, "files", "vampire.txt"), 31, 24,
  " " * 80 +
      "No man knows till he has suffered from the night how sweet and how dear to his heart and eye the morning can be." \
  " When the sun grew so high this morning that it struck the top of the great gateway opposite my window," \
  " the high spot which it touched seemed to me as if the dove from the ark had lighted there. My fear fell from me" \
  " as if it had been a vaporous garment which dissolved in the warmth." +
  " " * 80)
16.times { animator.play }
