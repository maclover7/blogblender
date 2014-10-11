class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /entries
  def index
    if params[:tag]
      @entries = Entry.tagged_with(params[:tag])
    else
      @entries = Entry.all
    end
  end

  # GET /entries/1
  def show
    @commentable = @entry
    @comments = @commentable.comments
    @comment = @commentable.comments.new
  end

  # GET /entries/new
  def new
    if params[:entry_type] == 'article' or 'feature'
      @entry = current_user.entries.build(entry_type: params[:entry_type]) #Entry.new

    else
      render :file => 'public/404.html', :status => :not_found, :layout => false
    end
  end

  # GET /entries/1/edit
  def edit
  end

  # POST /entries
  def create
    @entry = current_user.entries.build(entry_params.merge(entry_type: params[:entry_type])) #Entry.new(entry_params)
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