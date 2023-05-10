class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  def render_not_found
    flash[:error] = "Elemento não encontrado"

    redirect_to root_path
  end
end
