class CrimeWriter
  def initialize(git, crime, dir)
    @git, @crime, @dir = git, crime, dir
  end             
  
  def write    
    set_user  
    create_dir 
    write_file 
    commit
  end      
  
  private

  def set_user
    @git.config('user.name', @crime.crime_type.name)
  end              
  
  def create_dir
    FileUtils.mkdir(city_dir) unless File.directory? city_dir
  end       
  
  def write_file 
    File.open(file_name, 'a+') {|f| f.write("#{@crime.attributes.to_s}\n") }
    @git.add(file_name)
  end         
  
  def commit    
    ENV['GIT_AUTHOR_DATE'] = @crime.occurred_at.rfc2822
    ENV['GIT_COMMITTER_DATE'] = @crime.occurred_at.rfc2822
    @git.commit("Commited crime: #{@crime.id}")
  end
  
  def city_dir
    "#{@dir}/#{@crime.city.upcase}" 
  end     
  
  def file_name
    "#{city_dir}/#{@crime.street.upcase}"
  end
  
  
end