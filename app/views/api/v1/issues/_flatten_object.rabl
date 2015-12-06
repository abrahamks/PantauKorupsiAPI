attributes :id, :title, :description, :financial_cost, :started_at, :created_at, :updated_at, :verified_at

child :status do
	attributes :id, :name
end

child :user do
	attributes :id, :name
end