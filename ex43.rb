class Scene
  def enter()
    puts "You've entered #{self}"
    self.des
  end
end


class Engine

  def initialize(scene_map)
    @scene_map = ["CentralCorridor", 'LaserWeaponArmory', 'TheBridge', 'EscapePod']
  end

  def play()
    puts "Aliens invaded a space ship. You ahve to defeat them so you can escape.\n Where would you like to go?"
    @scene_map.each {|x| puts x}
    answer = false
    while answer == false
      choice = gets.chomp
      @scene_map.each {|x| 
        if choice == x; answer = true; x.new.enter
        end}
        puts answer == false ? "try again" : "good luck!"
    end
end

class Death < Scene

  def enter()
    super
    puts "your leg fell off."
  end
end

class CentralCorridor < Scene
  def CentralCorridor.des
    puts "This is a light-filled corridor with a Gothon standing there. \nYou may have to defeat him with a joke."
  end

  def enter()
    super
  end
end

class LaserWeaponArmory < Scene

  def LaserWeaponArmory.des
    puts "This is where you can get a neutron bomb o blow the ship before getting to the escape pod. It has a keypad the hero has to guess the number for."
  def enter()
    super
  end
end

class TheBridge < Scene
  def TheBridge.des
    puts "Another battle scene with a Gothon where the hero places the bomb."
  def enter()
    super
  end
end

class EscapePod < Scene
  def EscapePod.des
    puts "Where the hero escapes but only after guessing the right escape pod."
  def enter()
    super
    
    #the following code is for choices
    puts "You see an escape pod on the left and the right. Which will you choose?"
    choice = $stdin.gets.chomp
    if choice == "left"
      puts "SUCCESS!"
      break
    else
      escape_fail = Death.new
      escape_fail.enter
    end
    
    
  end
end


class Map

  def initialize( start_scene)
  end

  def next_scene( scene_name)
  end

  def opening_scene()
  end
end


a_map = Map.new('central_corridor')
a_game = Engine.new(a_map)
a_game.play()
