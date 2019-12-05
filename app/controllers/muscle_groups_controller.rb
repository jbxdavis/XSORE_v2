class MuscleGroupsController < ApplicationController
  def index
    @muscle_groups = MuscleGroup.all.order({ :created_at => :desc })

    render({ :template => "muscle_groups/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @muscle_group = MuscleGroup.where({:id => the_id }).at(0)

    render({ :template => "muscle_groups/show.html.erb" })
  end

  def create
    @muscle_group = MuscleGroup.new
    @muscle_group.name = params.fetch("name_from_query")

    if @muscle_group.valid?
      @muscle_group.save
      redirect_to("/muscle_groups", { :notice => "Muscle group created successfully." })
    else
      redirect_to("/muscle_groups", { :notice => "Muscle group failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @muscle_group = MuscleGroup.where({ :id => the_id }).at(0)

    @muscle_group.name = params.fetch("name_from_query")

    if @muscle_group.valid?
      @muscle_group.save
      redirect_to("/muscle_groups/#{@muscle_group.id}", { :notice => "Muscle group updated successfully."} )
    else
      redirect_to("/muscle_groups/#{@muscle_group.id}", { :alert => "Muscle group failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @muscle_group = MuscleGroup.where({ :id => the_id }).at(0)

    @muscle_group.destroy

    redirect_to("/muscle_groups", { :notice => "Muscle group deleted successfully."} )
  end
end
