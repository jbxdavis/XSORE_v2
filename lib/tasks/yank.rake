namespace :yank do
  desc "TODO"
  task mgs: :environment do
    csv_text = File.read(Rails.root.join("lib", "csvs", "XSORE_data_v1_MuscleGroups.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      t = MuscleGroup.new
      t.id = row["id"]
      t.name = row["mg_name"]
      t.save
      puts "#{t.name} saved"
    end
    puts "All muscle groups saved. There are now #{MuscleGroup.count} groups in the table."
  end

end