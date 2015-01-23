require "bundler/gem_tasks"

# The assumption is that this file is picked up when "rake" is called
# within the hscm project (just under root). The executable was not
# written to /usr/bin using the gem commands as noted in the README.

# The README was modified to remove the calls to the gem commands
# directly. The import or require to pull bundler/gem_tasks still will
# use gem to package this project as a rubygem. And, sudo rake install
# will install the gem locally and create an executable in /usr/bin.

# The sequence of build and package commands should be:
# 1. build - build gem in project package directory
# 2. install - (sudo - permission) install gem into system gem repo
# 3. release - create tag, build, and release to rubygems.org

