# frozen_string_literal: true

class Example < Patterns::Service
  def initialize(user)
    @user = user
  end

  def call
    some_example_logic
  end

  private

  def some_example_logic
    @user.created_at
  end
end
