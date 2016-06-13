class Game
  attr_accessor :tribes

  def initialize *tribes
    @tribes = tribes
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
    clear_tribes
    add_tribe(Tribe.new(name: name, members: contestants))
    @tribes[0]
  end

  def individual_immunity_challenge
    @tribes.sample.members.sample
  end

end
