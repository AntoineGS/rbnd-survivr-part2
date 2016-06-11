class Tribe
  attr_accessor :name, :members

  def initialize(options=[])
    @name = options[:name]
    @members = options[:members]
    puts "created"
  end

  def to_s
    @name
  end

  def tribal_council(options=[])
    immune = options[:immune]
    if immune then
      @members.reject{|member| member == immune}.sample
    else @members.sample
    end
  end
end
