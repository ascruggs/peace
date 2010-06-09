class GitWriter
  
  def initialize    
    @dir = "#{Rails.root}/tmp/gitcrime"        
    FileUtils.rm_rf(@dir) if File.directory? @dir
    @git = Git.init(@dir)
  end
    
  def self.write_crimes
    GitWriter.new.write_crimes       
  end        
  
  def write_crimes                           
    crimes = Crime.order("occurred_at").joins(:crime_type).all 
    puts "total crimes: #{crimes.size}"
    crimes.each_with_index do |crime, index|
      begin                     
        puts "writing #{index+1} of #{crimes.size}"           
        CrimeWriter.new(@git, crime, @dir).write
      rescue 
        puts $!.message
      end
    end
  end              
  
  
end