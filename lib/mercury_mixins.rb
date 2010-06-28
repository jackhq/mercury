module MercuryMixins

  def open_file(full_path_and_filename)
    open(full_path_and_filename,'r') { |file| file.read }  
  end

  def brew(coffee)
    command = ['coffee', '-p', '--no-wrap'].join(' ')
    IO.popen("#{command} #{coffee}")
  end
end
