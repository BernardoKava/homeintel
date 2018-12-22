Rails.application.routes.draw do
  get 'follow_up/index'
  resources :issue_managements
  resources :loan_managements
  resources :loan_registrations
  resources :rent_managements
  resources :service_providers
  resources :rules
  resources :resources
  resources :cashflow_recons
  resources :saving_recons
  resources :bankaccounts
  resources :inflows
  get 'passwordrepositories/index'
  get 'passwordrepo/index'
  get 'withdrawals/index'
  get 'lodgements/index'
  get 'legacy_ulsterbanks/index'
  get 'expenses/index'
  get 'outflows/index'
  get 'incomes/index'


  resources :deliveries
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'inflows/index'
  resources :ledgers
  resources :savings
  resources :cashflows
  resources :budgets
  resources :employments
  resources :qualifications
  resources :addresses
  resources :telephones
  resources :emails
  resources :people
  resources :departments
  resources :passwordrepositories do
    collection do
      match 'search' => 'passwordrepositories#search', via: [:get, :post], as: :search
    end
  end
  resources :inventories
  resources :withdrawals do
    collection do
      match 'search' => 'withdrawals#search', via: [:get, :post], as: :search
    end
  end


  resources :lodgements do
    collection do
      match 'search' => 'lodgements#search', via: [:get, :post], as: :search
    end
  end
  resources :incomes do
    collection do
      match 'search' => 'incomes#search', via: [:get, :post], as: :search
    end
  end
  resources :inflows do
    collection do
      match 'search' => 'inflows#search', via: [:get, :post], as: :search
    end
  end
  resources :outflows do
    collection do
      match 'search' => 'outflows#search', via: [:get, :post], as: :search
    end
  end
  resources :expenses do
    collection do
      match 'search' => 'expenses#search', via: [:get, :post], as: :search
    end
  end
  resources :legacy_ulsterbanks do
    collection do
      match 'search' => 'legacy_ulsterbanks#search', via: [:get, :post], as: :search
    end
  end


  get 'dashboard/passwords'
  get 'dashboard/financial'
  get 'dashboard/index'
  get 'user/index'
  get 'user/gravatar'
  devise_for :users
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
