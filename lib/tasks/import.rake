require 'csv'

namespace :import do
  desc "Personal_Information.csvを読み込む"

  task personal_informations: :environment do
    csv_file = File.join(Rails.root, "db/csv/personal_infomation.csv")

    puts "path: #{csv_file}"

    personal_information = []
    CSV.foreach(csv_file, headers: true) do |row|
      personal_information << {
        id: row['no'],
        name: row['namae'],
        ruby: row['rubi'],
        sex: row['seibetu'] == '男' ? "1" : row['seibetu'] == '女' ? "2" : nil,
        tel: row['denwa'],
        mobile: row['keitai'],
        mail: row['mairu'],
        zip: row['yuubinbango'],
        address1: row['jusho1'],
        address2: row['jusho2'],
        address3: row['jusho3'],
        address4: row['jusho4'],
        address5: row['jusho5'],
        birthday: row['tanjobi']
      }
    end

    puts "start to create personal informations"
    begin
      User.create!(personal_information)
      puts "completed!!"
    rescue ActiveModel::UnknownAttributeError => invalid
      puts "raised error: Unknown attribute - #{invalid.message}"
    rescue StandardError => e
      puts "raised error: #{e.message}"
    end
  end
end