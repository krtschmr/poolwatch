require "open-uri"
class Stat < ApplicationRecord
	validates :amtDue, :amtDue, :total, presence: true
	# only the first total amount can be there. all others are no updated stats. problem solved. ezy
	# validates :total, uniqueness: true
	validate :not_in_list, on: :create

	ADDRESSES = [
		"47JUJMoxKkJL2v1iaEx31ngQCQcEGobUpevqtzSzKPTAEAt1Ay7NZrQgU6mnN2mVyWi7yk2ig68KsU8bfXQ45ainEAchp1T", #tim
		"44wue3VUAPzDz7PHQPojBtX235vjLosACM1xESGGmcxqCCtGmdppvXjA97rr3D3btXGKi1mnMmZH3dcf5fguuEoELJ1GR35"
	]

	scope :addr, ->(address) {where address: address }

	def self.clean!(start=nil)
		if start
			valid = where("id > ?", start).order(id: :asc).first
		else
			valid = order(id: :asc).first
		end

		where.not(id: valid.id).where(total: valid.total).destroy_all

		clean!(valid.id)
	end

	def self.import_all!
		ADDRESSES.map do |addr|
			import!(addr)
		end
	end

	def self.import!(address)
		url = "https://supportxmr.com/api/miner/#{address}/stats"
		begin
			Stat.create JSON.parse(open(url).read).slice("amtPaid", "amtDue").merge(address: address)
		rescue
			p "failed"
		end

	end

	def amtPaid=(val) super; set_total; end
	def amtDue=(val) super; set_total; end


	def display_payment
		XMR.new(payment).format
	end

	def display_total
		XMR.new(total).format
	end

	def display_amtPaid
		XMR.new(amtPaid).format
	end

	def display_amtDue
		XMR.new(amtDue).format
	end

	# private

	def set_total
		self.total = (amtDue + amtPaid)
		self.payment = (total||0) - (Stat.addr(address).last.total rescue 0)
	end

	def not_in_list
		self.errors.add(:total, :uniqueness) if Stat.addr(address).find_by(total: total)
	end
end
