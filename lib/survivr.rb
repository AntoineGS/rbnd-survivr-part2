require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"
require_relative "colorizr"

# After your tests pass, uncomment this code below
# =========================================================
# Create an array of twenty hopefuls to compete on the island of Borneo
@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!

# Create two new tribes with names
@coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
@hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))

# Create a new game of Survivor
@borneo = Game.new(@coyopa, @hunapu)
# =========================================================


#This is where you will write your code for the three phases
def phase_one
  phase_output("one")
  8.times do
    loser_index = @borneo.tribes.find_index(@borneo.immunity_challenge)
    voted_out = @borneo.tribes[loser_index].tribal_council(nil: nil)
  end
end

def phase_two
  phase_output("two")
  3.times do
    immune = @borneo.individual_immunity_challenge
    @merge_tribe.tribal_council(immune: immune)
  end
end

def phase_three
  phase_output("three")
  7.times do
    immune = @borneo.individual_immunity_challenge
    voted_out = @merge_tribe.tribal_council(immune: immune)
    @jury.add_member(voted_out)
  end
end

def phase_output(phase)
  puts
  puts "---------------"
  puts "  Phase #{phase}"
  puts "---------------"
end


# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
phase_one #8 eliminations
@merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
phase_two #3 more eliminations
@jury = Jury.new
phase_three #7 elminiations become jury members
finalists = @merge_tribe.members #set finalists
vote_results = @jury.cast_votes(finalists) #Jury members report votes
@jury.report_votes(vote_results) #Jury announces their votes
@jury.announce_winner(vote_results) #Jury announces final winner
