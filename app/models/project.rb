class Project < ApplicationRecord
  def completed_tasks
    tasks.where(completed: true)
  end

  def incompleted_tasks
    tasks.where(completed: false)
  end

  def tasks(options={})
    tasks = TdTask.where(project_id: id)
    if options[:priority] == "ascending"
      #Lower numbers are considered higher priority
      tasks.order(:priority)
    elsif options[:priority] == "descending"
      tasks.order(priority: :desc)
    else
      tasks
    end
  end
end
