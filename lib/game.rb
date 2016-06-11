class Game
  attr_accessor :tribes

  def initialize(tribe1, tribe2)
    @tribes = [tribe1, tribe2]
  end

  def add_tribe(tribe)
    @tribes.push(tribe)
  end

  def immunity_challenge
    @tribes.sample
  end

  def clear_tribes
    @tribes = []
  end

  def merge(name)
    # Solution taken from
    # https://discussions.udacity.com/t/trouble-with-merge-in-game-class/164225
    contestants = @tribes.map(&:members).flatten
    Tribe.new(name: name, members: contestants)
  end

  def individual_immunity_challenge
    @tribes.sample.members.sample
  end

end
