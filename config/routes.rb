Rails.application.routes.draw do
  resources :products, except: :destroy

  resources(
    :passwords,
    controller: "clearance/passwords",
    only: [:create, :new]
  )

  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, only: [:create] do
    resource(
      :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
    )
  end

  root to: "homes#show"
end
