class CommentsController < ApplicationController
  before_action :set_commentable
  before_action :set_comment, only: %i[ show edit update destroy ]

  # GET /comments or /comments.json
  def index
    @comments = @commentable.comments
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = @commentable.comments.build
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
    @comment = @commentable.comments.build(comment_params)

    # respond_to do |format|
    #   if @comment.save
    #     format.html { redirect_to @comment, notice: "Comment was successfully created." }
    #     format.json { render :show, status: :created, location: @comment }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @comment.errors, status: :unprocessable_entity }
    #   end
    # end
    if @comment.save
      redirect_to [@commentable, @comment], notice: "Comment wassuccessfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    # respond_to do |format|
    #   if @comment.update(comment_params)
    #     format.html { redirect_to @comment, notice: "Comment was successfully updated." }
    #     format.json { render :show, status: :ok, location: @comment }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @comment.errors, status: :unprocessable_entity }
    #   end
    # end
    if @comment.update(comment_params)
      redirect_to [@commentable, @comment], notice: "Comment was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      # format.html { redirect_to comments_url, notice: "Comment was successfully destroyed." }
      # format.json { head :no_content }
      redirect_to [@commentable, :comments], notice: "Comment was successfully destroyed."
    end
  end

  private

  # def set_report
  #   @report = Report.find(params[:report_id])
  # end

  def set_commentable
    resource, id = request.path.split("/")[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:body)
  end
end
