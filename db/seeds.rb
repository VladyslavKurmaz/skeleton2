# frozen_string_literal: true

User.where(email: 'test@sloboda-studio.com', name: 'First User')
    .first_or_create!(password: 'password', password_confirmation: 'password')
