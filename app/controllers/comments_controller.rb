class CommentsController < ApplicationController
	before_filter :load_commentable

  def index
  	@comments = @commentable.comments
  end

  def new
  	@comment = @commentable.comments.new
  end

  def create
    	@comment = @commentable.comments.new(comment_params)
		    if @comment.save
		      redirect_to @commentable, notice: "Comment created."
		    else
		      render :new
		    end
  		end
  end

  private
  	def load_commentable
  		resource, id = request.path.split('/')[1,2] #/entries/1
  		@commentable = resource.singularize.classify.constantize.find(id) # Entry.find(1)
  	end

  	def comment_params
    	params.require(:comment).permit(:content, :commentable_id, :commentable_type)
  	end