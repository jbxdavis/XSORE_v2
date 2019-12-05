class LiftsController < ApplicationController
  def index
    @lifts = Lift.all.order({ :created_at => :desc })

    render({ :template => "lifts/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @lift = Lift.where({:id => the_id }).at(0)

    render({ :template => "lifts/show.html.erb" })
  end

  def create
    @lift = Lift.new
    @lift.lift_name = params.fetch("lift_name_from_query")
    @lift.category = params.fetch("category_from_query")
    @lift.prim_mg = params.fetch("prim_mg_from_query")
    @lift.sec_mg = params.fetch("sec_mg_from_query")
    @lift.def_sets = params.fetch("def_sets_from_query")
    @lift.def_reps = params.fetch("def_reps_from_query")
    @lift.image = params.fetch("image_from_query")

    if @lift.valid?
      @lift.save
      redirect_to("/lifts", { :notice => "Lift created successfully." })
    else
      redirect_to("/lifts", { :notice => "Lift failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @lift = Lift.where({ :id => the_id }).at(0)

    @lift.lift_name = params.fetch("lift_name_from_query")
    @lift.category = params.fetch("category_from_query")
    @lift.prim_mg = params.fetch("prim_mg_from_query")
    @lift.sec_mg = params.fetch("sec_mg_from_query")
    @lift.def_sets = params.fetch("def_sets_from_query")
    @lift.def_reps = params.fetch("def_reps_from_query")
    @lift.image = params.fetch("image_from_query")

    if @lift.valid?
      @lift.save
      redirect_to("/lifts/#{@lift.id}", { :notice => "Lift updated successfully."} )
    else
      redirect_to("/lifts/#{@lift.id}", { :alert => "Lift failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @lift = Lift.where({ :id => the_id }).at(0)

    @lift.destroy

    redirect_to("/lifts", { :notice => "Lift deleted successfully."} )
  end
end
