class TasksController < ApplicationController

  # createアクションを追加
  def create
    # 画面からわたってきたIDからprojectをfindする
    @project = Project.find(params[:project_id])
    # taskを登録
    @task = @project.tasks.create(tasks_params)
    # 遷移先はプロジェクト詳細画面
    redirect_to project_path(@project.id)
  end

  # destroyアクションを追加
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to project_path(params[:project_id])
  end
  
  # toggleアクションを追加
  def toggle
    render nothing: true
    @task = Task.find(params[:id])
  # タスクのdoneの値をひっくり返す
    @task.done = !@task.done
    @task.save

private
   # task_paramsを定義
   def tasks_params
   # taskでわたってきたもののうち、titleだけ使用
    params[:task].permit(:title)
   end
end