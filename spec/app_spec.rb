require 'spec_helper'

describe LicenseGenerator::App do
  before do
    @app = LicenseGenerator::App.new
  end
  
  describe '#bsd' do
    it "creates a LICENSE file from the bsd.erb template" do
      @app.should_receive(:template).with("bsd.erb", "LICENSE")
      @app.bsd
    end
  end
end