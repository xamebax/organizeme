class Task < ActiveRecord::Base
	validates :title,	:priority, :presence => true
	validates_numericality_of :priority, :less_than_or_equal_to => 5
	has_many :tags

	accepts_nested_attributes_for :tags, :allow_destroy => :true,
		:reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end
