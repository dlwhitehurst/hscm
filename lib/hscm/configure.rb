# Hscm module dependency configure.rb (require hscm/configure)
module Hscm

  # This method is used to determine if the data directory has been configured
  # for the command "hscm". Each system user should have a ~/.hscm hidden
  # file with a directory path where the software versions will be stored.
  def Hscm.validateConfiguration(user)
      userhome = Dir.home
      File.exist?(userhome + '/.hscm')
  end

end