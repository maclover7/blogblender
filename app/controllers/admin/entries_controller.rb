class Admin::EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /entries
  def index
    @entries = Entry.all.order("created_at DESC")
  end

  # GET /entries/new
  #def new
    #if params[:entry_type] == 'article'
      #@entry = current_user.entries.build(entry_type: params[:entry_type]) #Entry.new

      #else
      #render :file => 'public/404.html', :status => :not_found, :layout => false
      #end
  #end
  
  def new
    @entry = current_user.entries.build(entry_type: params[:entry_type], community_id: params[:community_id]) #Entry.new
  end

  # GET /entries/1/edit
  def edit
  end

  # POST /entries
  def create
    @entry = current_user.entries.build(entry_params.merge(entry_type: params[:entry_type], community_id: params[:community_id])) #Entry.new(entry_params)
      if @entry.save
        redirect_to @entry, notice: 'Entry was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /entries/1
  def update
      if @entry.update(entry_params)
        redirect_to @entry, notice: 'Entry was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /entries/1
  def destroy
    @entry.destroy
      redirect_to entries_url, notice: 'Entry was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:title, :body, :entry_type, :community_id, :tag_list)
    end
  end