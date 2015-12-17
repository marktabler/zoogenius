json.array!(@taxonomies) do |taxonomy|
  json.extract! taxonomy, :id, :genus, :family, :order, :tclass, :phylum
  json.url taxonomy_url(taxonomy, format: :json)
end
