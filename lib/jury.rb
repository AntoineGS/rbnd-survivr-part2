class Jury

  def initialize
    @members_list=[]
  end

  def add_member(member)
    @members_list.push(member)
  end

  def members
    @members_list
  end
end
