class SettingsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :skip_authorization
  def change
  end
end
