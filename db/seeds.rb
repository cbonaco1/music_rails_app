# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Band.destroy_all
band1 = Band.create!(name:"The Beatles")
band2 = Band.create!(name:"Stoned Temple Pilots")
band3 = Band.create!(name:"Foo Fighters")

Album.destroy_all
album1 = Album.create!(band_id: band1.id, name:'The Beatles', album_type: 'studio')
album2 = Album.create!(band_id: band1.id, name:'Second Beatles', album_type: 'live')
album3 = Album.create!(band_id: band2.id, name:'Greatest Hits', album_type: 'studio')
album4 = Album.create!(band_id: band2.id, name:'More Hits', album_type: 'live')
album5 = Album.create!(band_id: band3.id, name:'The One', album_type: 'live')

Track.destroy_all
track1 = Track.create!(album_id: album1.id, name: 'Tomorrow Never Knows', lyrics:'Sone one lyrics', track_type: 'regular')
track2 = Track.create!(album_id: album1.id, name: 'Hey Jude',lyrics:'Song two lyrics', track_type: 'regular')
track3 = Track.create!(album_id: album1.id, name: 'Revolution',lyrics:'Song three lyrics', track_type: 'regular')
