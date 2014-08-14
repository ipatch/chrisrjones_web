class SubjectsController < ApplicationController
  
  # layout false
  # to use the newly created admin layout
  layout "admin"

  before_action :confirm_logged_in

  def index
    @subjects = Subject.sorted
    # the below line will work, but there is a created function / method that sort
    # @subjects = Subject.order("position ASC")
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => "Default"})
    @subject_count = Subject.count + 1
  end

  def create
    # Instantiate a new object using form parameters
    
    # the below line should work with rails v3.x
    # @subject = Subject.new(params[:subject])

    # the below line should work with rails v4.x
    @subject = Subject.new(subject_params)

    # Save the object
    if @subject.save
      # add flash hash
      flash[:notice] = "Subject created successfully."
      # if save succeeds, redirect to the index action
      redirect_to(:action => 'index')
    else
      # if save fails, redisplay the form so user can fix problems
      @subject_count = Subject.count + 1
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end

  def update
    # Find an existing object using form parameters
    
    # the below line should work with rails v3.x
    # @subject = Subject.new(params[:subject])

    @subject = Subject.find(params[:id])
    # update_attributes uses strong parameters for mass assignment
    
    # the below line should work with Rails 4
    if @subject.update_attributes(subject_params)
    
    # the below line should work with Rails v3.x
    # if @subject.update_attributes(params[:subject])
      
      # If update succees, redirect to the index action
      flash[:notice] = "Subject updated successfully."
      redirect_to(:action => 'show', :id => @subject.id)
    else
      # if save fails, redisplay the form so user can fix problems
      @subject_count = Subject.count
      render('edit')
    end
  end

  def delete
    # step 1, find an object to delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    subject = Subject.find(params[:id]).destroy
    flash[:notice] = "Subject destroyed successfully."
    redirect_to(:action => 'index')

    # another way to destroy a record
    # subject = Subject.find(params[:id]).destroy
    # redirect_to(:action => 'index')
  end


  private

    def subject_params
      # same as using "params[:subject]", except that it:
      # - raises an error if :subject is not present
      # - allows listed attributes to be mass-assigned
      params.require(:subject).permit(:subject_id, :name, :permalink, :position, :visible, :created_at)
    end
end
