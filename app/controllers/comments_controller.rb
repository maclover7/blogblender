class CommentsController < ApplicationController

  def index
  	@comments = Comment.all
  end

  def new
  	@comment = current_user.entry.comments.build #Comment.new
  end

  def create
    @comment = current_user.comments.build(comment_params)
      #@comment.entry_id = @entry.id
    @entry = Entry.find(@comment.entry_id)
      #@entry = @comment.entries
      #@comment = @entry.comments.build(comment_params) #Comment.new(comment_params)
		 if @comment.save
       redirect_to @entry, notice: "Comment created."
     else
		    ender :new
      end
    end
  end

  private

  	def comment_params
    	params.require(:comment).permit(:content, :user_id, :entry_id)
  	end