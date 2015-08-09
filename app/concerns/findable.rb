module Findable
  def find_by_name(name)
    all.find { |e| e.name == name }
  end
end
