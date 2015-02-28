require 'spec_helper'
describe 'fact_geoip' do

  context 'with defaults for all parameters' do
    it { should contain_class('fact_geoip') }
  end
end
