ActionController::Routing::Routes.draw do |map|
  map.resources :numbers

  map.resources :campaigns,:sites,:roles,:rights,:account,:users
  
  map.login 'login', :controller => 'account', :action => 'login'
  map.logout 'logout', :controller => 'account', :action => 'logout'
  map.signup 'signup', :controller => 'account', :action => 'signup'
  
  map.customer 'customer', :controller => 'sites', :action => 'customer'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
