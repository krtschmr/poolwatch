class XMR

  attr_accessor :amount

  def initialize(amount)
    self.amount = amount
  end

  def format
    Money.new(amount, :xmr)
  end

  def to_s
    Money.new(amount, :xmr).format
  end

  def quick
    "#{short} XMR"
  end

  def short
    "#{(amount / 1000000000000.0).round(3)}"
  end
end
