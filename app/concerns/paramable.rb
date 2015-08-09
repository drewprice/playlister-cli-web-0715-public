module Paramable
  def to_param
    name.downcase.tr(' ', '-')
  end
end
