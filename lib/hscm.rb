require "hscm/version"
require "hscm/manpage"
require "hscm/configure"
require "hscm/utility"

module Hscm
  #!/usr/bin/env ruby

     require 'optparse'

     options = {}

     option_parser = OptionParser.new do |opts|

      # Configure switch
      opts.on("-c","--configure-datapath") do
        options[:config] = true
      end

      # New switch
      opts.on("-n","--new") do
        options[:newrec] = true
      end

      # List switch
      opts.on("-l","--list") do
        options[:list]= true
      end

      # Help switch
      opts.on("-h","--help") do
        options[:help]= true
      end

      # Version switch
      opts.on("-v","--version") do
        options[:version]= true
      end

      # Set username
      opts.on("-u USER") do |user|
        options[:user] = user
      end

      # Set datafilepath
      opts.on("-d DATAFILEPATH") do |datafilepath|
        options[:datafilepath] = datafilepath
      end

      # Set hostname
      opts.on("-h HOST") do |host|
        options[:host]= host
      end

      # Set product
      opts.on("-p PRODUCT") do |product|
        options[:product]= product
      end

      # Set version
      opts.on("-v VERSION") do |version|
        options[:version]= version
      end

    end  # end do opts

    option_parser.parse!

    # use switch

    if options[:help] == true
      puts manpage
    end
    if options[:version] == true
      abort("hscm version " + :VERSION)
    end

    if options[:newrec] == true

      if options[:user].nil?
        puts("Usage: hscm -n -u username -h hostname -p product -v version (More info available with --help option)")
        abort("   [WARN] - username (-u) option must be provided with -n or --new configuration")
      end

      if options[:host].nil?
        puts("Usage: hscm -n -u username -h hostname -p product -v version (More info available with --help option)")
        abort("   [WARN] - hostname (-h) option must be provided with -n or --new configuration")
      end

  	  if options[:product].nil?
        puts("Usage: hscm -n -u username -h hostname -p product -v version (More info available with --help option)")
        abort("   [WARN] - software product (-p <PRODUCT>) option must be provided")
      end

  	  if options[:version].nil?
        puts("Usage: hscm -n -u username -h hostname -p product -v version (More info available with --help option)")
        abort("   [WARN] - version (-v <VERSION>) option must be provided")
      end

      # all options loaded, now verify that configuration has been set up
      # check configuration in place?
      if validateConfiguration(options[:user]) != true
        abort("First-time Usage: hscm -c [--configure] -d <dateFilePath> -u <username>")
      end

      # go time!
      File.open("/Users/dlwhitehurst/Data/#{options[:host]}.txt",'a') do |file|
        file.puts "#{options[:product]}, #{options[:version]}, #{Time.now}"
        puts "Product and version added."
      end

  	  puts ("Created new host software configuration item")

    end

    if options[:config] == true
      # First-time Usage: hscm -c [--configure] -d <dateFilePath> -u <username>
      if options[:user].nil?
        puts("Usage: hscm -c -d <dataFilePath> -u <username> (More info available with --help option)")
        abort("   [WARN] - username (-u) option must be provided with -c or --configure-datapath configuration")
      end

      if options[:datafilepath].nil?
        puts("Usage: hscm -c -d <dataFilePath> -u <username> (More info available with --help option)")
        abort("   [WARN] - datafilepath (-d) option must be provided with -c or --configure-datapath configuration")
      end

      setupFilePath(options[:datafilepath],options[:user])
      abort("data directory path has been configured for user home in file .hscm.")
    end

    if options[:list] == true
        if options[:host].nil?
      	  abort("hostname (-h) option must be provided with -l or --list configuration")
        end

        File.open("/Users/dlwhitehurst/Data/#{options[:host]}.txt",'r') do |file|
          counter = 1
          printf("#########################################################################################\n")
            puts "Software Products for #{options[:host]}"
          printf("#########################################################################################\n")
          file.readlines.each do |line|
            product, version, reviewed = line.chomp.split(/,/)
            printf("Product: %-25s %20s %s\n", product, version, reviewed)
            printf("_________________________________________________________________________________________\n")
            counter += 1
          end
       end
    end

   if options == {}
       puts manpage
   end
end
