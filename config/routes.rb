# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#show'

  devise_for :users, controllers: { registrations: 'registrations' }

  authenticate :user do
    mount Motor::Admin => '/motor_admin'
    mount DelayedJobWeb, at: '/delayed_job'
  end
end
