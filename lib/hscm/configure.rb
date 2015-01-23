module Hscm
  # later
  def Hscm.validateConfiguration(user)
      #Check if file exits (will contain /Users/dlwhitehurst/Data)
      userhome = Dir.home
      File.exist?(userhome + '/.hscm')
  end

end