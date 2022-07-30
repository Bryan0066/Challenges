require 'pry'
nasa_data = {
  'Direct Marketing News' => {
    'computed_region_cbhk_fwbd' => 46,
    'computed_region_nnqa_25f4' => 2095,
    'country' => 'USA',
    'domain' => 'com',
    'email_hosts' => 'dmnews.com',
    'location_1' =>
      {
        'type' => 'Point',
        'coordinates' => [-74.005941, 40.712784]
      },
    'location_1_city' => 'New York',
    'location_1_state' => 'NY',
    'position' => 'Special Features Editor'
  },
  'Amoeba Culture' => {
    'computed_region_cbhk_fwbd' => 32,
    'computed_region_nnqa_25f4' => 9005,
    'country' => 'SOUTH KOREA',
    'domain' => nil,
    'email_hosts' => 'me.com',
    'location_1' =>
      {
        'type' => 'Dot',
        'coordinates' => [126.977969, 37.566535]
      },
    'location_1_city' => 'Seoul',
    'position' => 'Music Producer'
  },
  'Intrepid Solutions' => {
    'computed_region_cbhk_fwbd' => 23,
    'computed_region_nnqa_25f4' => 2924,
    'country' => 'USA',
    'domain' => 'com',
    'email_hosts' => 'gmail.com',
    'location_1' =>
      {
        'type' => 'Point',
        'coordinates' => [-97.743061, 30.267153]
      },
    'location_1_city' => 'Austin',
    'location_1_state' => 'TX',
    'position' => 'Owner'
  },
  'The Van Blargan Groups' => {
    'computed_region_cbhk_fwbd' => 23,
    'computed_region_nnqa_25f4' => 3162,
    'country' => 'USA',
    'domain' => nil,
    'email_hosts' => 'gmail.com',
    'location_1' =>
      {
        'type' => 'Point',
        'coordinates' => [-96.796988, 32.776664]
      },
    'location_1_city' => 'Dallas',
    'location_1_state' => 'TX',
    'position' => 'Consultant'
  },
  'Telewander' => {
    'computed_region_cbhk_fwbd' => 17,
    'computed_region_nnqa_25f4' => 3867,
    'country' => 'CHILE',
    'domain' => 'com',
    'email_hosts' => 'telewander.com',
    'location_1' =>
      {
        'type' => 'Dot',
        'coordinates' => [-70.669265, -33.44889]
      },
    'location_1_city' => 'Santiago de Chile',
    'position' => 'Jose Manuel Lizama Gonzalez'
  },
  'Folk' => {
    'computed_region_cbhk_fwbd' => 68,
    'computed_region_nnqa_25f4' => 8243,
    'country' => 'CANADA',
    'domain' => 'com',
    'email_hosts' => 'gmail.com',
    'location_1' =>
      {
        'type' => 'Point',
        'coordinates' => [-73.567256, 45.501689]
      },
    'location_1_city' => 'Montreal',
    'location_1_state' => 'QC',
    'position' => 'Co-Founder/Brand Strategist'
  },
  'National Instruments' => {
    'computed_region_cbhk_fwbd' => 23,
    'computed_region_nnqa_25f4' => 2924,
    'country' => 'USA',
    'domain' => nil,
    'email_hosts' => 'ni.com',
    'location_1' =>
      {
        'type' => 'Point',
        'coordinates' => [-97.743061, 30.267153]
      },
    'location_1_city' => 'Austin',
    'location_1_state' => 'TX',
    'position' => 'Staff Software Engineer'
  },
  'Nottingham Spirk' => {
    'computed_region_cbhk_fwbd' => 38,
    'computed_region_nnqa_25f4' => 2515,
    'country' => 'USA',
    'domain' => 'com',
    'email_hosts' => 'nottinghamspirk.com',
    'location_1' =>
      {
        'type' => 'Point',
        'coordinates' => [-81.917917, 41.455323]
      },
    'location_1_city' => 'Westlake',
    'location_1_state' => 'OH',
    'position' => 'Principal'
  },
  'ANG Marketing and Advertising' => {
    'computed_region_cbhk_fwbd' => 45,
    'computed_region_nnqa_25f4' => 1815,
    'country' => 'USA',
    'domain' => nil,
    'email_hosts' => 'mail.mil',
    'location_1' =>
      {
        'type' => 'Point',
        'coordinates' => [-76.883626, 38.79652]
      },
    'location_1_city' => 'Joint Base Andrews',
    'location_1_state' => 'MD',
    'position' => 'Chief, ANG Mktg & Advertising'
  },
  'Garmin International' => {
    'computed_region_cbhk_fwbd' => 17,
    'computed_region_nnqa_25f4' => 1237,
    'country' => 'USA',
    'domain' => 'com',
    'email_hosts' => 'garmin.com',
    'location_1' =>
      {
        'type' => 'Point',
        'coordinates' => [-94.819128, 38.881396]
      },
    'location_1_city' => 'Olathe',
    'location_1_state' => 'KS',
    'position' => 'Product Architect, Mobile & Wearable Devices'
  },
  'Arlington Economic Development' => {
    'computed_region_cbhk_fwbd' => 23,
    'computed_region_nnqa_25f4' => 2919,
    'country' => 'USA',
    'domain' => nil,
    'email_hosts' => 'arlingtonva.us',
    'location_1' =>
      {
        'type' => 'Point',
        'coordinates' => [-97.108066, 32.735687]
      },
    'location_1_city' => 'Arlington',
    'location_1_state' => 'VA',
    'position' => 'Business Dev Mgr'
  },
  'VCU Brandcenter' => {
    'computed_region_cbhk_fwbd' => 40,
    'computed_region_nnqa_25f4' => 2947,
    'country' => 'USA',
    'domain' => 'edu',
    'email_hosts' => 'mymail.vcu.edu',
    'location_1' =>
      {
        'type' => 'Dot',
        'coordinates' => [-77.436048, 37.540725]
      },
    'location_1_city' => 'Richmond',
    'location_1_state' => 'VA',
    'position' => 'Student'
  }
}

# 1. Create a method called company_name that takes in two arguments, an array and a company name. The method must return the entire hash for the given company.

def company_name(array, name)
  array.each do |company, info|
    puts name, info if company.to_s == name
  end
end

puts 'part 1'
company_name(nasa_data, 'Garmin International')
puts ''
# 2. Create a method called location that takes in an array and returns the city and state for every company.

def location(array)
  array.each do |company, info|
    puts ''
    puts company
    info.each do |x, y|
      puts y if %w[location_1_city location_1_state].include? x.to_s
    end
  end
end

puts 'part 2'
location(nasa_data)
puts ''

# 3. Create a method called id_number that takes in an array and returns each company name and its computed_region_cbhk_fwbd id number.

def id_number(array)
  array.each do |company, info|
    info.each do |x, y|
      puts company, y if x.to_s == 'computed_region_cbhk_fwbd'
    end
  end
end

puts 'part 3'
id_number(nasa_data)
puts ''
# 4. Create a method called position that returns each company name and their listed position.

def position(array)
  array.each_with_index do |company_name, index|
    puts "Name: #{company_name[0]}, index: #{index}"
  end
end

puts 'part 4'
position(nasa_data)
puts ''
# 5. Create a method called type that takes in an array and returns each company name followed by their location_1 type.

def type(array)
  array.each do |company, info|
    info.each do |x, y|
      puts "Company: #{company}, Location Type: #{y['type']}" if x.to_s == 'location_1'
    end
  end
end

puts 'part 5'
type(nasa_data)
puts ''
# 6. Create a method called number that takes in an array and returns the name of the company that has the highest computed_region_nnqa_25f4 number.

def number(array)
  highest_region = 0
  highest_company = ''

  array.each do |company, info|
    region_nnqa = info['computed_region_nnqa_25f4']
    if region_nnqa > highest_region
      highest_region = region_nnqa
      highest_company = company
    end
  end

  puts "COMPANY:#{highest_company}, REGION #:#{highest_region}"
end

puts 'part 6'
number(nasa_data)
puts ''
# 7. Create a method called gmail that takes in an array and returns the amount of companies that have gmail.com as their email_hosts.

def gmail(array)
  number_of_companies = 0

  array.each do |_company, info|
    host = info['email_hosts']
    number_of_companies += 1 if host.include? 'gmail'
  end
  puts number_of_companies
end

puts 'part 7'
gmail(nasa_data)
puts ''

# 8. Create a method called no_domain that takes in an array and returns the number of companies that **do not** have a domain listed in nasa_data.

def no_domain(array)
  number_of_companies = 0
  array.each do |_company, info|
    domain = info['domain']
    number_of_companies += 1 unless domain
  end
  puts number_of_companies
end

puts 'part 8'
no_domain(nasa_data)
puts ''
