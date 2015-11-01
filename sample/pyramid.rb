require "vamp"

animator = Vamp::Animator.new(File.join(Gem.loaded_specs["vamp"].gem_dir, "files", "pyramid.txt"), 31, 7, 27, nil, 2)
animator.play
