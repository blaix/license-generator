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
    template_path = File.join(File.expand_path('../', File.dirname(__FILE__)), 'templates')
    templates = Dir.glob("#{template_path}/**/*.erb").map { |t| File.basename t, '.erb' }
    @app.list.should == templates
  end

  it "has proper specs for the help task"
end
