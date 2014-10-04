class EntryTypesController < ApplicationController
  before_action :set_entry_type, only: [:show, :edit, :update, :destroy]

  # GET /entry_types
  def index
    @entry_types = EntryType.all
  end

  # GET /entry_types/1
  def show
  end

  # GET /entry_types/new
  def new
    @entry_type = EntryType.new
  end

  # GET /entry_types/1/edit
  def edit
  end

  # POST /entry_types
  def create
    @entry_type = EntryType.new(entry_type_params)

      if @entry_type.save
        redirect_to @entry_type, notice: 'Entry type was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /entry_types/1
  def update
      if @entry_type.update(entry_type_params)
        redirect_to @entry_type, notice: 'Entry type was successfully updated.'
      else
        render :edit
      end
    end
  end

  # DELETE /entry_types/1
  def destroy
    @entry_type.destroy
      redirect_to entry_types_url, notice: 'Entry type was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry_type
      @entry_type = EntryType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_type_params
      params.require(:entry_type).permit(:name, :description, :slug)
    end