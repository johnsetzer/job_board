class JobPostsController < ApplicationController
  load_and_authorize_resource

  # GET /job_posts
  # GET /job_posts.xml
  def index
    @job_posts = JobPost.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @job_posts }
    end
  end

  # GET /job_posts/1
  # GET /job_posts/1.xml
  def show
    @job_post = JobPost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @job_post }
    end
  end

  # GET /job_posts/new
  # GET /job_posts/new.xml
  def new
    @job_post = JobPost.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @job_post }
    end
  end

  # GET /job_posts/1/edit
  def edit
    @job_post = JobPost.find(params[:id])
  end

  # POST /job_posts
  # POST /job_posts.xml
  def create
    @job_post = JobPost.new(params[:job_post])
    @job_post.user = current_user

    respond_to do |format|
      if @job_post.save
        format.html { redirect_to(@job_post, :notice => 'Job post was successfully created.') }
        format.xml  { render :xml => @job_post, :status => :created, :location => @job_post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @job_post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /job_posts/1
  # PUT /job_posts/1.xml
  def update
    @job_post = JobPost.find(params[:id])

    respond_to do |format|
      if @job_post.update_attributes(params[:job_post])
        format.html { redirect_to(@job_post, :notice => 'Job post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @job_post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /job_posts/1
  # DELETE /job_posts/1.xml
  def destroy
    @job_post = JobPost.find(params[:id])
    @job_post.destroy

    respond_to do |format|
      format.html { redirect_to(job_posts_url) }
      format.xml  { head :ok }
    end
  end
end
