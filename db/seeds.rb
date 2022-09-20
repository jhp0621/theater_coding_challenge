# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

dates = ['2022-10-01', '2022-10-02']
times = ['10:00:00.000', '18:00:00.000']

movies = Movie.create([{ title: 'The Godfather' },
                       { title: 'The Sound of Music' }])

auditoria = Auditorium.create([{ capacity: 15 }, { capacity: 20 }])

showtimes = Showtime.create([
                              { movie: movies[0], start_time: "#{dates[0]} #{times[0]}", auditorium: auditoria[0],
                                availability: 10 },
                              { movie: movies[0], start_time:  "#{dates[0]} #{times[1]}", auditorium: auditoria[1],
                                availability: 18 },
                              { movie: movies[0], start_time:  "#{dates[1]} #{times[0]}", auditorium: auditoria[0],
                                availability: 13 },
                              { movie: movies[0], start_time:  "#{dates[1]} #{times[1]}", auditorium: auditoria[1],
                                availability: 20 },
                              { movie: movies[1], start_time: "#{dates[0]} #{times[0]}", auditorium: auditoria[1],
                                availability: 18 },
                              { movie: movies[1], start_time:  "#{dates[0]} #{times[1]}", auditorium: auditoria[0],
                                availability: 15 },
                              { movie: movies[1], start_time:  "#{dates[1]} #{times[0]}", auditorium: auditoria[1],
                                availability: 10 },
                              { movie: movies[1], start_time:  "#{dates[1]} #{times[1]}", auditorium: auditoria[0],
                                availability: 5 }
                            ])
