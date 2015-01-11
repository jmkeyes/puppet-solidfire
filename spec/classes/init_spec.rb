require 'spec_helper'

describe 'solidfire' do
  context 'by default' do
    it { expect { should compile.with_all_deps }.to raise_error(Puppet::Error, /Don't use the ::solidfire class directly./) }
  end
end
