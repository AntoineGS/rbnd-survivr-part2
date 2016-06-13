class Tribe
  attr_accessor :name, :members

  def initialize(options=[])
    @name = options[:name]
    @members = options[:members]
    puts "Welcome to tribe #{@name.yellow}!"
  end

  def to_s
    @name
  end

  def tribal_council(options=[])
    immune = options[:immune]
    voted_out = @members.reject{|member| member == immune}.sample
    @members.delete(voted_out)
    puts "#{voted_out.to_s.capitalize.green} from tribe #{@name.to_s.yellow} has been eliminated!"
    voted_out
  end
end
