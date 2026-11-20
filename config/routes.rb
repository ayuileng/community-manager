Rails.application.routes.draw do

  # 1. 认证（bcrypt 自己实现，Devise 没装）
  get    "login",  to: "sessions#new"
  post   "login",  to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  # 2. 楼栋：列表 / 单元录入表单 / 创建楼栋+生成单元 / 状态看板
  resources :buildings, only: [:index, :new, :create, :show, :destroy]

  # 3. 单元：弹窗内容（Turbo Frame）；走访日志嵌套在单元下创建
  resources :units, only: [:show] do
    resources :visit_logs, only: [:create]
  end

  # 4. 走访日志：编辑 / 删除（不需 unit_id）
  resources :visit_logs, only: [:update, :destroy]

  # 5. 走访规则配置：普通 user 权限，所有登录用户可用
  resources :visit_schedules, only: [:index, :new, :create, :edit, :update]

  # 6. 数据导出（二期，可先注释）
  resources :exports, only: [:new, :create] do
    get :download, on: :member
  end

  # 首页
  root "buildings#index"
end
