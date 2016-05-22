# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ps = {
	"what is $1+1$?\nAnswer: []" => ['2', 'add them up'],
	"which is good?\n[r:apple]\n[r:orange]\n[r:steak]" => ['grapes', 'sure']
}

if Problem.count == 0
	ps.each do |content, solutions|
		p = Problem.new
		p.content = content
		p.solutions = solutions
		p.save!
	end
end

