class Jury
attr_accessor :members
attr_accessor :votes

  def initialize
    @members = []
    @votes = Hash.new(0)
  end

  def add_member(member)
    @members.push(member)
  end

  def cast_votes(finalists)
    index = 0
    @members.length.times do
      finalist = finalists.sample
      @votes[finalist] +=1
      puts "#{@members[index].to_s.capitalize.pink} votes for #{finalist.to_s.capitalize.green}"
      index += 1
    end
    @votes
  end

  def report_votes(final_votes)
    final_votes.each{|finalist,i| puts "#{finalist.to_s.capitalize.green}: #{i}"}
  end

  def announce_winner(final_votes)
    puts
    puts "And the winner is..... #{final_votes.keys.first.to_s.capitalize.red}"
    final_votes.keys.first
  end
end
