class TopController < ApplicationController

  # パスワード生成用のフォーム項目
  class PasswordOptions
    include ActiveModel::Model

    attr_accessor :password_size
    attr_accessor :include_sharp
  end

  # パスワード生成後の結果
  class PasswordResult
    include ActiveModel::Model

    attr_accessor :password
  end
  
  # === トップページ
  def index
    # パスワード生成用フォームの項目インスタンスを生成
    @password_options = PasswordOptions.new(params[:password_options])

    # リクエストがポストだったら、パスワードを生成して返す
    if request.post?
      @password_result = PasswordResult.new
      @password_result.password = Password.generate(@password_options.password_size.to_i)
    end
  end
end
