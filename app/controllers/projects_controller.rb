class ProjectsController < ApplicationController

  # 共通処理を定義（各Actionでは'set_project'が呼ばれますよ、という宣言)
  # 別途'set_project'という関数を定義する
  # 全Actionに適用するわけではないので、'only'で実行するActionを限定する
  before_action :set_project, only: [:show, :edit, :updsate, :destroy]

  # indexアクションを追加
  def index
   # @をつけた変数はviewでそのまま使用可能
   # Projectの全データを引っ張ってくる
    @projects = Project.all
  end

  # showアクションを追加
  def show
    @project = Project.find(params[:id])
  end

  # newアクションを追加
  def new
    @project = Project.new
  end

  # createアクションを追加
  def create
    # Formからの入力値を受け取る
    @project = Project.new(project_params)
    # データの保存
    if @project.save
    # saveがtrueだったらHOMEへ移動
      redirect_to projects_path
    else
    # saveがfalseだったら入力フォームに戻る
      render 'new'
    end
  end

    # editアクションを追加
    def edit
      @project = Project.find(params[:id])
    end

    # updateアクションを追加
    def update
      @project = Project.find(params[:id])
      if @project.update(project_params)
        redirect_to projects_path
      else
        render 'edit'
      end
    end

    # Destroyアクションを追加
    def destroy
      @project = Project.find(params[:id])
      # 削除
      @project.destroy
      # Homeへリダイレクト
      redirect_to projects_path
    end

  # project_params を定義
  private
   def project_params
     # projectでわたってきたもののうち、titleだけ使用
     params[:project].permit(:title)
   end
     # before_actionで定義した処理の実装
   def set_project
    @project = Project.find(params[:id])
   end

end
