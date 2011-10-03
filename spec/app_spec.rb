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
  
  it "can list available templates" do
    LicenseGenerator::App.stub!(:source_root).and_return("template path")
    Dir.should_receive(:foreach).with("template path").
      and_yield(".").
      and_yield("..").
      and_yield("bsd").
      and_yield("gpl")
    @app.should_receive(:say).with(/bsd/).once
    @app.should_receive(:say).with(/gpl/).once
    @app.list
  end
  
  it "has proper specs for the help task"
end
