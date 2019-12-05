class ExecutionsController < ApplicationController
  def index
    @executions = Execution.all.order({ :created_at => :desc })

    render({ :template => "executions/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @execution = Execution.where({:id => the_id }).at(0)

    render({ :template => "executions/show.html.erb" })
  end

  def create
    @execution = Execution.new
    @execution.date = params.fetch("date_from_query")
    @execution.user_id = params.fetch("user_id_from_query")
    @execution.lift_id = params.fetch("lift_id_from_query")
    @execution.sets = params.fetch("sets_from_query")
    @execution.reps = params.fetch("reps_from_query")
    @execution.weight = params.fetch("weight_from_query")

    if @execution.valid?
      @execution.save
      redirect_to("/executions", { :notice => "Execution created successfully." })
    else
      redirect_to("/executions", { :notice => "Execution failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @execution = Execution.where({ :id => the_id }).at(0)

    @execution.date = params.fetch("date_from_query")
    @execution.user_id = params.fetch("user_id_from_query")
    @execution.lift_id = params.fetch("lift_id_from_query")
    @execution.sets = params.fetch("sets_from_query")
    @execution.reps = params.fetch("reps_from_query")
    @execution.weight = params.fetch("weight_from_query")

    if @execution.valid?
      @execution.save
      redirect_to("/executions/#{@execution.id}", { :notice => "Execution updated successfully."} )
    else
      redirect_to("/executions/#{@execution.id}", { :alert => "Execution failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @execution = Execution.where({ :id => the_id }).at(0)

    @execution.destroy

    redirect_to("/executions", { :notice => "Execution deleted successfully."} )
  end
end
