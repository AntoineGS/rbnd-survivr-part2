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
    @members.length.times do |index|
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
    winner = final_votes.max_by{|name,votes| votes}[0]
    puts
    puts "And the winner is..... #{winner.to_s.capitalize.red}"
    winner
  end
end
