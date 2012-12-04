class Api::V1::Certificate::RecommendationsController < ApplicationController
  before_filter :api_auth

  def index
  end

  def show
    begin
      @response = CrtRecommendations.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      @response = {:status => 'error', :message=> e.message}
    end

    respond_to do |format|
      format.json {render json: @response }
      format.js {render json: @response }
      format.xml {render xml: @response }
    end
  end
end
