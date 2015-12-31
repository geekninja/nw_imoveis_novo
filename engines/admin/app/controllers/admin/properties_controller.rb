require_dependency "admin/application_controller"

module Admin
  class PropertiesController < ApplicationController
    before_action :set_property, only: [:show, :edit, :update, :destroy]
    before_action :set_nav
    # GET /properties
    def index
      @properties = Property.includes(:project).includes(:client).all
    end

    # GET /properties/1
    def show
    end

    # GET /properties/new
    def new
      @property = Property.new
    end

    # GET /properties/1/edit
    def edit
    end

    def update_images
      @property = Property.find(params[:property_id])
      @property.update(set_params_images)
      redirect_to property_property_images_path(@property)
    end

    # POST /properties
    def create
      @property = Property.new(property_params)

      if @property.save
        flash[:success] = t :success
        redirect_to new_property_property_image_path(@property)
      else
        render :new
      end
    end

    # PATCH/PUT /properties/1
    def update
      if @property.update(property_params)
        flash[:success] = t :success
        redirect_to action: "index"
      else
        render :edit
      end
    end

    # DELETE /properties/1
    def destroy
      if @property.destroy
        flash[:success] = t :success
      else
        flash[:danger]  = t :danger
      end

      redirect_to action: "index"
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_property
        @property = Property.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def property_params
        params.require(:property).permit(:situation, :thumb, :featured, :type_property, :status, :iptu,
                                         :client_id, :project_id, :cep, :region, :district, :group,
                                         :block, :number, :address, :complement, :reference_point,
                                         :address_link_visible, :rooms, :unit, :value, :value_m2,
                                         :area, :suit, :parking_spaces, :floor, :sun_position,
                                         :link_tour, :value_rent,:description, :commercial, :elevator, :coverage,
                                         :expiration_date, :name, image_path: [], construction_companies_id: [], sellers_id: [], property_attribute_id: [])
      end

      def set_params_images
        params.require(:property).permit!
      end

      def set_nav
        @nav = "property"
      end
  end
end
