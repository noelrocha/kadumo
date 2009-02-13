class CdrsController < ApplicationController
  # GET /cdrs
  # GET /cdrs.xml
  def index
    @cdrs = Cdr.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cdrs }
    end
  end

  # GET /cdrs/1
  # GET /cdrs/1.xml
  def show
    @cdr = Cdr.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cdr }
    end
  end

  # GET /cdrs/new
  # GET /cdrs/new.xml
  def new
    @cdr = Cdr.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cdr }
    end
  end

  # GET /cdrs/1/edit
  def edit
    @cdr = Cdr.find(params[:id])
  end

  # POST /cdrs
  # POST /cdrs.xml
  def create
    @cdr = Cdr.new(params[:cdr])

    respond_to do |format|
      if @cdr.save
        flash[:notice] = 'Cdr was successfully created.'
        format.html { redirect_to(@cdr) }
        format.xml  { render :xml => @cdr, :status => :created, :location => @cdr }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cdr.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cdrs/1
  # PUT /cdrs/1.xml
  def update
    @cdr = Cdr.find(params[:id])

    respond_to do |format|
      if @cdr.update_attributes(params[:cdr])
        flash[:notice] = 'Cdr was successfully updated.'
        format.html { redirect_to(@cdr) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cdr.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cdrs/1
  # DELETE /cdrs/1.xml
  def destroy
    @cdr = Cdr.find(params[:id])
    @cdr.destroy

    respond_to do |format|
      format.html { redirect_to(cdrs_url) }
      format.xml  { head :ok }
    end
  end
end
