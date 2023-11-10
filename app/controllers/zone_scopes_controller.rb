class ZoneScopesController < ApplicationController
  before_action :set_zone_scope, only: [:show, :update, :destroy]

  # GET /zone_scopes
  def index
    @zone_scopes = ZoneScope.all

    render json: @zone_scopes
  end

  # GET /zone_scopes/1
  def show
    render json: @zone_scope
  end

  # POST /zone_scopes
  def create
    render json: CreateZoneScopeInteractor.new(zone_scope_params).create_zones, status: :ok
  end

  # PATCH/PUT /zone_scopes/1
  def update
    zone_scope = ZoneScope.find(update_zone_scope_params[:id])
    zone_scope.update(update_zone_scope_params)
    render json: { response: TrackInteractor.new(@zone_scope.id).calculate}, status: :ok

  end

  # DELETE /zone_scopes/1
  def destroy
    @zone_scope.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zone_scope
      @zone_scope = ZoneScope.find(params[:id])
    end

    def update_zone_scope_params
      params.permit(
        :id,
        :zone_scope,
        :name,
        :green_zone,
        :yellow_zone,
        :red_zone,
        :expended_hours,
        :total_hours,
        :progress
      )
    end

    def zone_scope_params
      params.permit(
        :name,
        :turns
      )
    end
end
