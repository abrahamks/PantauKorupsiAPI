object @actor

attributes :id, :name, :description, :image_url

child :involvements, object_root: false do
	attributes :id, :actor_status
	child :issue do
		extends('api/v1/issues/_flatten_object')
	end
	child :actor_status do
		attributes :id, :name
	end
end