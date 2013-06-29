class StreamObserver < ActiveRecord::Observer
  observe :project, :workitem, :comment

  def after_create(model)
    id = model.id if model.is_a?(Project)  
    id = model.project_id if model.is_a?(Workitem)  
    id = model.workitem.project_id if model.is_a?(Comment)  
    Stream.add(model.as_json(root: true), id)
  end

  def after_update(model)
    id = model.id if model.is_a?(Project)  
    id = model.project_id if model.is_a?(Workitem)  
    id = model.workitem.project_id if model.is_a?(Comment)  
    puts model.as_json(:root => true)
    Stream.add(model.as_json(root: true), id)
  end
end
