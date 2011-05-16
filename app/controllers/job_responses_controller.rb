class JobResponsesController < ApplicationController
  load_and_authorize_resource :job_post
  load_and_authorize_resource :job_response, :through => :job_post, :shallow => true

  # GET /job_responses
  def index
    @job_responses = @job_post.job_responses.order("updated_at DESC")

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /job_responses/mine
  def mine
    set_tab :my_responses
    @job_responses = JobResponse.where({:user_id => current_user}).order("updated_at DESC")

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /job_responses/1
  def show
    @job_response = JobResponse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /job_responses/new
  def new
    @job_response = JobResponse.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # POST /job_responses
  def create
    @job_response = JobResponse.new(params[:job_response])
    @job_response.job_post = @job_post
    @job_response.user = current_user

    respond_to do |format|
      if @job_response.save
        format.html { redirect_to(@job_post, :notice => 'Job response was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # DELETE /job_responses/1
  def destroy
    @job_response = JobResponse.find(params[:id])
    @job_response.destroy

    respond_to do |format|
      format.html { redirect_to(job_post_job_responses_path(@job_response.job_post), :notice => 'Job deleted.') }
    end
  end
end
