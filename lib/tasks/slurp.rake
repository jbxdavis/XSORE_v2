namespace :slurp do
  desc "TODO"
  task lifts: :environment do
    csv_text = File.read(Rails.root.join("lib", "csvs", "XSORE_data_v1_Lifts.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      t = Lift.new
      t.id = row["id"]
      t.lift_name = row["lift_name"]
      t.category = row["category"]
      t.prim_mg = row["prim_mg"]
      t.sec_mg = row["sec_mg"]
      t.def_sets = row["def_sets"]
      t.def_reps = row["def_reps"]
      t.image = row["image"]
      t.save
      puts "#{t.lift_name} saved"
    end
    puts "All lifts saved. There are now #{Lift.count} lifts in the table."
  end

end