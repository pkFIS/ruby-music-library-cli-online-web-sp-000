module Concerns::Findable
  # Module code here
  def find_by_name(name)
    self.all.detect{|k| k.name == name }
  end

  def find_or_create_by_name(name)
    self.find_by_name(name) || create(name)
  end

end
