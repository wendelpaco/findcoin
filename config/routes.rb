Rails.application.routes.draw do
  root to: 'coin#index' # página de início
  # get ':slug', controller: 'coin', action: 'slug'
  get 'search', to: 'search#coins'
end
