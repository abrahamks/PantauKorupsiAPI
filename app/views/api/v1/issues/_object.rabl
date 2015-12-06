extends('api/v1/issues/_flatten_object')

child ({:verifier => :verifier}) do
	attributes :id, :name
end

child :organizations, object_root: false do
	attributes :id, :name, :description
end

child :involvements, object_root: false do
	attributes :id
	child :actor_status do
		attributes :id, :name
	end
	child :actor do
		attributes :id, :name, :image_url, :description
	end
end

child :feeds, object_root: false do
	attributes :id, :title, :summary, :url, :occured_at
	child :user do
		attributes :id, :name
	end
end