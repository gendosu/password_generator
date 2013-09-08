class TopController < ApplicationController
  
  class PasswordOptions
    include ActiveModel::Model

    attr_accessor :include_sharp
  end

  class PasswordResult
    include ActiveModel::Model

    attr_accessor :password
  end
  
  # = ランダム文字生成器(Ruby v2.0)
  #
  # eachで回す際に、サイズを気にせずに無限に回せます。
  # 無限に回すと止まらないので、first(10)という感じに制限をつけてやるといい感じです。
  #
  # === 使い方
  # rundom_generator.first(10).each do |a|
  # p a
  # end
  #
  @@rundom_generator = Enumerator.new{|yielder|
    # キーに出現する文字を定義
    key_chars = (('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a)
    random = Random.new
    1.upto(Float::INFINITY) do |n|
      yielder << key_chars[random.rand(key_chars.size)]
    end
  }

  def index
    @password_options = PasswordOptions.new(params[:password_options])
    
    if request.post?
      @password_result = PasswordResult.new
      @password_result.password = @@rundom_generator.first(10).join
    end
  end
end
