class JobResponsesController < ApplicationController
  load_and_authorize_resource :job_post
  load_and_authorize_resource :job_response, :through => :job_post, :shallow => true

  # GET /job_responses
  # GET /job_responses.xml
  def index
    @job_responses = JobResponse.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @job_responses }
    end
  end

  # GET /job_responses/1
  # GET /job_responses/1.xml
  def show
    @job_response = JobResponse.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @job_response }
    end
  end

  # GET /job_responses/new
  # GET /job_responses/new.xml
  def new
    @job_response = JobResponse.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @job_response }
    end
  end

  # POST /job_responses
  # POST /job_responses.xml
  def create
    @job_response = JobResponse.new(params[:job_response])
    @job_response.job_post = @job_post
    @job_response.user = current_user

    respond_to do |format|
      if @job_response.save
        format.html { redirect_to(@job_response, :notice => 'Job response was successfully created.') }
        format.xml  { render :xml => @job_response, :status => :created, :location => @job_response }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @job_response.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /job_responses/1
  # DELETE /job_responses/1.xml
  def destroy
    @job_response = JobResponse.find(params[:id])
    @job_response.destroy

    respond_to do |format|
      format.html { redirect_to(job_responses_url) }
      format.xml  { head :ok }
    end
  end
end
