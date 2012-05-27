# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


puts 'SETTING UP DEFAULT USER LOGIN'
editor = Editor.create! :username => 'admin', :email => 'admin@example.com', :first_name => 'John', :last_name => 'Doe', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << editor.username
editor.add_role :admin

puts "ADDING AN UPCOMING ISSUE"
Issue.create(volume: 9, issue: 1, printing_deadline: Date.new(2012, 9, 15), distribution: Date.new(2012, 9, 26))

puts "ADDING A FEW WRITERS"
Writer.create(name: "DJ LoBraico", email: "dlobraico@uchicago.edu")
Writer.create(name: "Stephen Lurie", email: "slurie@uchicago.edu")
Writer.create(name: "Sam Spiegel", email: "spiegel@uchicago.edu")

puts "ADDING SOME IDEAS FROM VOL 8, ISSUE 9"
Idea.create(headline: "Congress Initiates Emergency Recess to Follow Phish Reunion Tour", issue_id: 1)
Idea.create(headline: "A Caged Egg-Datorial", issue_id: 1)
Idea.create(headline: "Summer Breeze 2013 to Feature V.P. Joe Biden", issue_id: 1)
Idea.create(headline: "Why I Bit Newt Gingrich: A Penguin Perspective", issue_id: 1)
Idea.create(headline: "Study Finds Rich People More Insane; Public Mental Health Clinics Unnecessary", issue_id: 1)
Idea.create(headline: "Area Woman Quarantined After Spawning Human-Like Creature", issue_id: 1)
Idea.create(headline: "Mitt Romney Endorses Gay Marriage for Corporations", issue_id: 1)
Idea.create(headline: "Romney Announces Running Mate", issue_id: 1)
Idea.create(headline: "Five Killed Segway Showdown", issue_id: 1)
Idea.create(headline: "Poll: Is It Weirder to Rediscover that People have Legs in the Spring, or Feet?", issue_id: 1)
Idea.create(headline: "New Courses in the Arts Available Fall 2012", issue_id: 1)
Idea.create(headline: "Paleolithic Man Adjusting Well to Modern Life", issue_id: 1)
Idea.create(headline: "Point: I had a crazy dream last night; Counterpoint: I, Too, Have Dreamt Crazily", issue_id: 1)

puts "ASSIGN SOME ARTICLES"
Assignment.create(writer_id: 1, idea_id: 1, issue_id: 1)
Assignment.create(writer_id: 2, idea_id: 2, issue_id: 1)
Assignment.create(writer_id: 3, idea_id: 3, issue_id: 1)
Assignment.create(writer_id: 2, idea_id: 4, issue_id: 1)
Assignment.create(writer_id: 1, idea_id: 5, issue_id: 1)
