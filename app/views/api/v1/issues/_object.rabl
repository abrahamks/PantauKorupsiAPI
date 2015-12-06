attributes :id, :title, :description, :financial_cost, :started_at, :updated_at

child :status do
	attributes :id, :name
end