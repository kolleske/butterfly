class StaticGenerator < RubiGen::Base
  
  attr_reader :name, :author, :gitinit
  
  def initialize(runtime_args, runtime_options = {})
    super
    usage
    @destination_root = File.expand_path(args.shift)
    @name = base_name
    @author = ENV['USER']
    @gitinit = runtime_options[:gitinit]
  end

  def manifest
    record do |m|

      # installation skeleton (intermediate directories are automatically created).
      %w(
        public/css
        public/js
        public/images
      ).each { |path| m.directory path }

      # Create file stubs
      %w(
        config.ru
        README.md
        public/index.html
        public/css/main.css
        public/js/app.js
      ).each { |file| m.template file, file }
    end
  end

end