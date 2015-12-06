object @actor

attributes :id, :name, :description, :image_url

child :involvements, object_root: false do
	attributes :id, :actor_status
	child :issue do
		attributes :id, :title, :description
	end
	child :actor_status do
		attributes :id, :name
	end
end