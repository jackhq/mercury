class MercuryConfig
  JQUERY = "jquery"
  SENCHA = "sencha"
  
  attr_accessor :project, :stack

  def initialize(args)
    @project = args.first
    @stack = JQUERY
    if args.first and args.first.split(':')[0] == "stack"
      @project = args.last
      @stack = args.first.split(':')[1] == SENCHA ? SENCHA : JQUERY
    end
  end
  
  def create_project
    # Build Directory and add setup files
    FileUtils.mkdir_p @project
    FileUtils.mkdir_p File.join(@project, 'wwwroot')
    FileUtils.mkdir_p File.join(@project, 'tmp')

    config_ru = ["require 'mercury'","log = File.new('tmp/mercury.log', 'a+')", "$stdout.reopen(log)", "$stderr.reopen(log)", "run Mercury"].join("\n")
    File.open(File.join(@project, 'config.ru'),'w').write(config_ru)
    gemfile = ['source :gemcutter', "gem 'thin'", "gem 'mercury'"].join("\n")
    File.open(File.join(@project, 'Gemfile'),'w').write(gemfile)
  end
  
  def apply_stack
    
    if @stack == SENCHA
      FileUtils.cp_r File.dirname(__FILE__) + '/../lib/sencha/.', FileUtils.pwd + "/#{@project}/wwwroot"
    elsif @stack == BLANK
      # dont do anything
    else 
      FileUtils.cp_r File.dirname(__FILE__) + '/../lib/public/.', FileUtils.pwd + "/#{@project}/wwwroot"
    end
  end
  
end
