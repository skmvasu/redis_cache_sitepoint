module CommonMeta
	extend ActiveSupport::Concern
	included do
		field :name, :type => String
		field :desc, :type => String
		field :page_title, :type => String
	end
end
