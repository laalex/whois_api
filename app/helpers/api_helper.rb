module ApiHelper

  def get_whois_raw(dns)
    `whois #{dns}`
  end

  def get_whois_data(dns)
    data= {}
    if Record.where(dns: dns).empty?
      response = `whois #{dns}`
      parsed_response = response.split("\n")
      parsed_response.each do |line|
        next if line.empty?
        result = line.split(": ")
        if result.length == 2 && !result[1].empty?
          result[0] = result[0].gsub(" ","_")
          result[0] = result[0].downcase
          next if [">>>_last_update_of_whois_database", "notice", "terms_of_use", "by_the_following_terms_of_use" ,"to", "url_of_the_icann_whois_data_problem_reporting_system", "the_data_in_the_name.com,_inc._whois_database_is_provided_by_name.com,_inc._for_information_purposes,_and_to_assist_persons_in_obtaining_information_about_or_related_to_a_domain_name_registration_record.__name.com,_inc._does_not_guarantee_its_accuracy.__by_submitting_a_whois_query,_you_agree_that_you_will_use_this_data_only_for_lawful_purposes_and_that,_under_no_circumstances_will_you_use_this_data_to", "please_note"].include? result[0]
          data[result[0]] = result[1]
        end
      end
      Record.new(dns: dns, response: data.to_json).save!
      data.to_json

    # If not exists
    else
      rec = Record.where(dns: dns).last
      rec.response
    end
  end
end
