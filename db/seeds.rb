# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
  user_types = UserType.create([{ designation: 'Administrator' }, { designation: 'Officer' }])
  user_types = Department.create([{ name: 'Crimes' }, { name: 'Trafic And Road Safety' }]) 
  regions = Region.create([{ name: "Oti Region - Dambai" }, 
                             { name: "Bono East Region - Techiman" },
                             { name: "Ahafo Region - Goaso" },
                             { name: "Bono Region - Sunyani" },
                             { name: "North East Region - Nalerigu" },
                             { name: "Savannah Region - Damango" },
                             { name: "Western North Region- Sefwi Wiawso" },
                             { name: "Volta Region - Ho" },
                             { name: "Western Region - Sekondi" },
                             { name: "Ashanti Region - Kumasi" },
                             { name: "Central Region - Cape Coast" },
                             { name: "Upper East Region - Bolgatanga" },
                             { name: "Upper West Region - Wa" },
                             { name: "Northern Region - Tamale" },
                             { name: "Greater Accra Region - Accra" },
                             { name: "Eastern Region - Koforidua" }
                          ])
#   Character.create(name: 'Luke', movie: movies.first)
