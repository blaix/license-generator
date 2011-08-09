require 'spec_helper'

describe LicenseGenerator::App do
  before do
    @app = LicenseGenerator::App.new
  end
  
  it "finds template dynamically" do
    %w(bsd gpl mit).each do |license|
      @app.should_receive(:template).with("#{license}.erb", "LICENSE")
      @app.send(license)
    end
  end
end
