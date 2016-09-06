require 'rails_helper'

RSpec.describe Project, :type => :model do
  it 'has a valid factory' do
    expect(build(:project)).to be_valid
  end

  describe '#attributes' do
    it 'has a description' do
      expect(build(:project)).to respond_to(:description)
    end
  end

  describe '#attributes.validations' do
    it 'is not valid without a description' do
      project = build(:project, description: nil)
      expect(project).to_not be_valid
    end

    it 'is valid with a description' do
      project = build(:project, description: 'Hey check out this super project.')
      expect(project).to be_valid
    end
  end

  describe '#tasks' do
    before :each do
      @project = create(:project)
    end

    it 'provides a collection of tasks associated with the project' do
      @project.tasks.each { |t| expect(t).to be_kind_of(TdTask) }
    end

    it 'sorts in ascending order if needed' do
      tasks = @project.tasks(priority: "ascending")
      expect(tasks[0].priority <= tasks[1].priority).to eq(true)
    end

    it 'sorts in descending order if needed' do
      tasks = @project.tasks(priority: "descending")
      expect(tasks[0].priority >= tasks[1].priority).to eq(true)
    end
  end

  describe '#completed_tasks' do
    it 'provides a collection of completed_tasks' do
      project = create(:project)
      project.tasks[0].update(completed: true)
      project.tasks[1].update(completed: true)
      expect(project.completed_tasks.length).to eq(2)
      project.completed_tasks.each do |t|
        expect(t.completed).to eq(true)
      end
    end
  end
end
