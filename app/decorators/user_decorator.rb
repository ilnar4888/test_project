class UserDecorator < ApplicationDecorator
  delegate_all

  def full_name_with_email
    "#{object.full_name} (#{object.email})"
  end
end
