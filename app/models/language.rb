class Language
	include Mongoid::Document
	include Mongoid::Timestamps
	include Mongoid::Paranoia
	include CommonMeta
end
