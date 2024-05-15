class Api::V1::SearchBuffetController < Api::V1::ApiController


  def show
    buffets = Buffet.where("brand_name LIKE ?", "%#{params[:id]}%")
    render status: 200, json: buffets.as_json(except: [:created_at, :updated_at])
  end

  private

  def return_404
    render status: 404
  end

  def return_500
    render status: 500
  end
end
