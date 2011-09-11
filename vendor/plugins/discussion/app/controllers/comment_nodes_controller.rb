class CommentNodesController < ApplicationController
  # GET /comment_nodes
  # GET /comment_nodes.json
  def index
    @comment_nodes = CommentNode.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @comment_nodes }
    end
  end

  # GET /comment_nodes/1
  # GET /comment_nodes/1.json
  def show
    @comment_node = CommentNode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @comment_node }
    end
  end

  # GET /comment_nodes/new
  # GET /comment_nodes/new.json
  def new
    @comment_node = CommentNode.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @comment_node }
    end
  end

  # GET /comment_nodes/1/edit
  def edit
    @comment_node = CommentNode.find(params[:id])
  end

  # POST /comment_nodes
  # POST /comment_nodes.json
  def create
    @comment_node = CommentNode.new(params[:comment_node])

    respond_to do |format|
      if @comment_node.save
        format.html { redirect_to @comment_node, :notice => 'Comment node was successfully created.' }
        format.json { render :json => @comment_node, :status => :created, :location => @comment_node }
      else
        format.html { render :action => "new" }
        format.json { render :json => @comment_node.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comment_nodes/1
  # PUT /comment_nodes/1.json
  def update
    @comment_node = CommentNode.find(params[:id])

    respond_to do |format|
      if @comment_node.update_attributes(params[:comment_node])
        format.html { redirect_to @comment_node, :notice => 'Comment node was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @comment_node.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comment_nodes/1
  # DELETE /comment_nodes/1.json
  def destroy
    @comment_node = CommentNode.find(params[:id])
    @comment_node.destroy

    respond_to do |format|
      format.html { redirect_to comment_nodes_url }
      format.json { head :ok }
    end
  end
end
