class Booking < ActiveRecord::Base
	belongs_to :room
	belongs_to :user

	validate :check_dates
	validate :check_availability

	private

	def check_dates
		if !self.start_date.nil?
		if self.end_date < self.start_date || self.start_date < Date.today
			errors.add(:base, "Invalid Date Selected")
		end
	end
	end

	def check_availability
		bookings = Booking.where('room_id = ? AND end_date >= ?',self.room_id,Date.today)

		bookings.each do |booking|
			if self.start_date >= booking.start_date && self.start_date <= booking.end_date
				errors.add(:start_date, "Room Already Booked")
			elsif self.end_date >= booking.start_date && self.end_date <= booking.end_date
				errors.add(:end_date, "Room Already Booked")
			elsif self.start_date <= booking.start_date && self.end_date >= booking.end_date
				errors.add(:base, "Room Already Booked")
			end
		end	
	end	
end

