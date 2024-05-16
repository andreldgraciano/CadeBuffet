class Api::V1::BuffetsController < Api::V1::ApiController
  def index
    buffets = Buffet.all#.order(:brand_name)
    render status: 200, json: buffets.as_json(except: [:corporate_name, :registration_number, :created_at, :updated_at])
  end

  def show
    buffet = Buffet.find(params[:id])
    render status: 200, json: buffet.as_json(except: [:created_at, :updated_at, :registration_number, :corporate_name])
  end

  private

  def return_404
    render status: 404
  end

  def return_500
    render status: 500
  end
end
