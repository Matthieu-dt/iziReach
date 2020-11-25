class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard
    if current_user.company
      redirect_to campaigns_path
    else
      redirect_to solicitations_path
    end
  end
end
