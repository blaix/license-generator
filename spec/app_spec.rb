require 'spec_helper'

describe LicenseGenerator::App do

  before do
    # suppress console output to keep
    # from interfering with test output
    @_stdout = $stdout
    $stdout = @stdout = StringIO.new
    @app = LicenseGenerator::App.new
  end

  after :each do
    # restore $stdout
    $stdout = @_stdout
  end

  it "has a class-wide source_root" do
    LicenseGenerator::App.source_root.should == File.expand_path('../templates', File.dirname(__FILE__))
  end

  it "has templates" do
    @app.templates.empty?.should be false
  end

  it "parses full template file names into template names" do
    @app.templates.should include('apache-2.0')
  end

  it "lists available templates" do
    @app.should_receive(:say).exactly(@app.templates.size).times
    @app.list
  end

  it "generates a template with a valid template name" do
    @app.should_receive(:template).with('mit.erb', 'LICENSE')
    @app.mit('Justin Blake')
  end

end
