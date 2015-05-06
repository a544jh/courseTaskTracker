class TaskSetsController < ApplicationController
  before_action :set_task_set, only: [:show, :edit, :update, :destroy]

  # GET /task_sets
  # GET /task_sets.json
  def index
    @task_sets = TaskSet.all
  end

  # GET /task_sets/1
  # GET /task_sets/1.json
  def show
  end

  # GET /task_sets/new
  def new
    @task_set = TaskSet.new
    @task_set.course_id = params[:course_id]
  end

  # GET /task_sets/1/edit
  def edit
  end

  # POST /task_sets
  # POST /task_sets.json
  def create
    @task_set = TaskSet.new(task_set_params)

    respond_to do |format|
      if params[:taskcount].to_i > 0
        if @task_set.save
          if @task_set.tasks.empty?
              @task_set.populate_with_empty_tasks(params[:taskcount])
              redirect_to edit_task_set_path(id:@task_set.id)
              return
            end
          format.html { redirect_to @task_set, notice: 'Task set was successfully created.' }
          format.json { render :show, status: :created, location: @task_set }
        else
          format.html { render :new }
          format.json { render json: @task_set.errors, status: :unprocessable_entity }
        end
      else
        flash.now[:error] = "Invalid number of tasks"
        render :new
        return
      end
    end
  end

  # PATCH/PUT /task_sets/1
  # PATCH/PUT /task_sets/1.json
  def update
    respond_to do |format|
      if @task_set.update(task_set_params)
        format.html { redirect_to @task_set, notice: 'Task set was successfully updated.' }
        format.json { render :show, status: :ok, location: @task_set }
      else
        format.html { render :edit }
        format.json { render json: @task_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_sets/1
  # DELETE /task_sets/1.json
  def destroy
    @task_set.destroy
    respond_to do |format|
      format.html { redirect_to task_sets_url, notice: 'Task set was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_set
      @task_set = TaskSet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_set_params
      params.require(:task_set).permit(:course_id, :name, :deadline, tasks_attributes: [:id, :description])
    end
end
