# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Trap.create([
    #{name: 'Trap1'},
    #{name: 'Trap2'},
    #{{name: 'Trap3'}
#])}

Request.create(trap_id: 1, remote_ip: '111.111')