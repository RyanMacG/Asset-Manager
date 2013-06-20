namespace :haml_convert do
  desc "Convert ERB to Haml"
  task convert: :environment do

    #Go through all the views
    Dir["#{Rails.root}/app/views/**/*.erb"].each do |file_name|
      puts "Converting: #{file_name}"

      #creates new file path for haml export
      haml_file_name = file_name.gsub(/erb$/) { "haml" }

      #If haml doesn't exist create it and delete erb
      if !File.exist?(haml_file_name)
        #read from file
        erb_string = File.open(file_name).read

        #convert to haml
        haml_string = Haml::HTML.new(erb_string, erb: true).render

        #writes
        f = File.new(haml_file_name, "w")
        f.write(haml_string)

        #Delete the erb
        File.delete(file_name)
      end
    end
  end
end