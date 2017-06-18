class V1::WidgetsController < ApplicationController
  before_action :set_widget, only: [:show, :edit, :update, :destroy]

  # GET /v1/widgets
  # GET /v1/widgets.json
  def index
    @widgets = Widget.all
  end

  # GET /v1/widgets/1
  # GET /v1/widgets/1.json
  def show
  end

  # GET /v1/widgets/new
  def new
    @widget = Widget.new
  end

  # GET /v1/widgets/1/edit
  def edit
  end

  # POST /v1/widgets
  # POST /v1/widgets.json
  def create
    @widget = Widget.new(widget_params)

    respond_to do |format|
      if @widget.save
        format.html { redirect_to [:v1, @widget], notice: 'Widget was successfully created.' }
        format.json { render :show, status: :created, location: @widget }
      else
        format.html { render :new }
        format.json { render json: @widget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /v1/widgets/1
  # PATCH/PUT /v1/widgets/1.json
  def update
    respond_to do |format|
      if @widget.update(widget_params)
        format.html { redirect_to [:v1, @widget], notice: 'Widget was successfully updated.' }
        format.json { render :show, status: :ok, location: @widget }
      else
        format.html { render :edit }
        format.json { render json: @widget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /v1/widgets/1
  # DELETE /v1/widgets/1.json
  def destroy
    @widget.destroy
    respond_to do |format|
      format.html { redirect_to v1_widgets_url, notice: 'Widget was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_widget
      @widget = Widget.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def widget_params
      params.require(:widget).permit(:name, :description, :price_cents, :upc)
    end
end
