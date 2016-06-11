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

  def cast_votes(finalist)
    @members.length.times{ puts @votes[finalist.sample] +=1 }
    @votes
  end

  def report_votes(final_votes)
    final_votes.each{|finalist,i| puts "#{finalist}: #{i}"}
  end

  def announce_winner(final_votes)
    final_votes.keys.first
  end
end
