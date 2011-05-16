class JobPostsController < ApplicationController
  load_and_authorize_resource

  # GET /job_posts
  def index
    @job_posts = JobPost.where({}).order("updated_at DESC")

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /job_posts/1
  def show
    @job_post = JobPost.find(params[:id])
    @job_response = @job_post.my_first_response(current_user.id) if user_signed_in?

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /job_posts/new
  def new
    @job_post = JobPost.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /job_posts/1/edit
  def edit
    @job_post = JobPost.find(params[:id])
  end

  # POST /job_posts
  def create
    @job_post = JobPost.new(params[:job_post])
    @job_post.user = current_user

    respond_to do |format|
      if @job_post.save
        format.html { redirect_to(@job_post, :notice => 'Job post was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /job_posts/1
  def update
    @job_post = JobPost.find(params[:id])

    respond_to do |format|
      if @job_post.update_attributes(params[:job_post])
        format.html { redirect_to(@job_post, :notice => 'Job post was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /job_posts/1
  def destroy
    @job_post = JobPost.find(params[:id])
    @job_post.destroy

    respond_to do |format|
      format.html { redirect_to(job_posts_url, :notice => 'Job post was successfully destroyed.') }
    end
  end
end
