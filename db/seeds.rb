Company.destroy_all
Job.destroy_all

COMPANIES = %w[ESPN Aetra United Airlines Denver Public Schools Shopiy Starbucks Pivotal Las Captain]
JOBS = %w[Engineering Development DevOps Quality Assurance Teacher Product Manager Consultant Community Manager]
CITIES = %w[Seatte Denver Portlad Indianapols Madisn Orlano San Dieo Austn Las Vegs Little Rok Boie Eugee Oaklad]
COMMENTS = ['First', 'Job sucks', 'Fake review', 'Bad management']
CATEGORIES = %w[Marketing Engineering Sales Management ]
NAMES = ['Lex Luthor', 'Bruce Wayne', 'Clark Kent', 'John Johnson', 'Barry Allen', 'Hal Something', 'Kal El', 'Slade Wilson']
EMAILS = %w[badguy@evildomain.com bruce@wayneenterprises.com fast@google.com douchebag@myspace.com]
POSITIONS = %w[Hero Villain Alien Pilot]

CATEGORIES.each do |name|
  Category.create!(name: name)
end

COMPANIES.each do |name|
  company = Company.create!(name: name)
  puts "Created #{company.name}"
  10.times do |num|
    company.jobs.create!(category: Category.all.sample,title: JOBS.sample, description: "What a great position!", level_of_interest: rand(100), city: CITIES.sample)
    puts "  Created #{company.jobs[num].title}"
  end
end

Company.all.each do |company|
  company.contacts.create!(name: NAMES.sample, position: POSITIONS.sample, email: EMAILS.sample)
end

Job.all.each do |job|
  job.comments.create!(content: COMMENTS.sample)
  job.category = Category.all.sample
end

