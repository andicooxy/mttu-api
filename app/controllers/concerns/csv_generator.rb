module CsvGenerator
  extend ActiveSupport::Concern

  # Used in generating a CSV record
  # TODO: send report generation to background
  # @params data - ActiveRecord data
  # @params fields - Array of fields
  # @return csv file
  def generate_csv(records,fields,from,to)
    if fields.present?
      csvFile = CSV.generate(headers: true) do |csv|
        header = fields.map{|field| field}
        row = ["#"] + header
        csv << row

        # Initialize counter
        cnt = 0
        records.each do |record|
          # select fields from the attributes and create
          # csv file
          row = ["#{cnt+=1}"] + fields.map do |attrib| 
                if attrib.to_s == "Create By"          
                   record.user.full_name
                else
                    record.send(attrib) 
                end
              end
          csv << row
        end
        3.times { csv.add_row [] }
        csv.add_row ['DATE RANGE',"FROM-#{from}","To-#{to}"]
        csv.add_row ['REPORT SUMMARY', "TOTAL"]
        csv.add_row ['OFFENSES ', Offense.count]
        csv.add_row ['FILTERED OFFENSES ', records.count]
      end
    end

    send_data csvFile, filename: "Report-Generated-At-#{Date.today}.csv"
  end

end
