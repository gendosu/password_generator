require 'spec_helper'

describe Password do
  it '10桁の100回生成してパスワードがランダムなことを保証' do
    passwords = (1..100).collect{Password.generate(10)}
    
    passwords.uniq!
    
    expect(passwords.size).to eq(100)
  end
end
