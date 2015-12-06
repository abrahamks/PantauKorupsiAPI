object @organization

attributes :id, :name, :description, :organization_url

child :issues, object_root: false do
  extends('api/v1/issues/_flatten_object')
end