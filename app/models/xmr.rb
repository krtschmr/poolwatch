class XMR

  def self.new(amount)
    Money.new(amount, :xmr)
  end

  def to_s
    Money.new(amount, :xmr).format
  end
end
