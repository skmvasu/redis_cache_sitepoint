# Mongoid JSON Serialization renders the following output for the id attribute
#       _id\':{\'$oid\':\'527269d06a756d78c1090000\'}
# This cant be used with backbone objects and existing mobile apps.
# This pacth creates new field called id and stores the sting version of the _id.
#       id:'527269d06a756d78c1090000'
=begin
=end


module Mongoid
	module Serializable

		def serializable_hash(options=nil)
			options.merge!({:except => '_id'})
			attrs = {}

			names = field_names(options)
			#enable this only for API
			#names = names.select {|x| x!='html'}
			#select the fields only in the result set
			#this is to avoid null fields serialized
			names = names.select do |name|
				!self.attributes.find {|k,v| k==name}.nil?
			end
			names.push 'id'

			method_names = Array.wrap(options[:methods]).map do |name|
				name.to_s if respond_to?(name)
			end.compact

			(names + method_names).each do |name|
				without_autobuild do
					serialize_attribute(attrs, name, names, options)
				end
			end
			serialize_relations(attrs, options) if options[:include]
			attrs

		end


	end
end


module BSON
	class ObjectId
		def as_json(options = {})
			to_s
		end
	end
end

