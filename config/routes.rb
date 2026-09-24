Rails.application.routes.draw do
  # When someone visits http://localhost:3000/inventories, look at the InventoriesController's index action
  get "/inventories", to: "inventories#index"
  
  # Optional: Make this dashboard the homepage of your application
  root "inventories#index"

  # New route: Sends the inventory ID to a controller action named 'adjust'
  patch "/inventories/:id/adjust", to: "inventories#adjust", as: "adjust_inventory"

  # Static pages routes
  get "/about", to: "pages#about", as: "about"
  get "/problems", to: "pages#problems", as: "problems"
  get "/interview_questions", to: "pages#interview_questions", as: "interview_questions"
end
