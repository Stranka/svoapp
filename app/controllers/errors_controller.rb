class ErrorsController < ApplicationController
  # GET /baskets
  # GET /baskets.xml
  def show_error_page
    flash[:error] = t('ups')
  end

end

