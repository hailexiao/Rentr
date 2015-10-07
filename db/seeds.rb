# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Neighborhood.create(
    [{ name: 'Chinatown' }, { name: 'Back Bay' }, { name: 'Financial District' },
    { name: 'North End' }, { name: 'South End' }, { name: 'West End' },
    { name: 'South Boston' }, { name: 'East Boston' }, { name: 'Charlestown' },
    { name: 'Allston' }, { name: 'Brighton' }, { name: 'Fenway' },
    { name: 'Jamaica Plain' }, { name: 'Roxbury' }, { name: 'Dorchester' },
    { name: 'Cambridge' }, { name: 'Somerville' }
    ])

GasUtility.create([{ name: 'National Grid' }, { name: 'Eversource' }])

ElectricUtility.create([{ name: 'National Grid' }, { name: 'Eversource' }])
