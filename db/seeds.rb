# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

mj = Artist.create!(name: "Michael Jackson")

mj_band = Band.create!(name: "Michael Jackson")

BandArtist.create!(artist_id: mj.id, band_id: mj_band.id)

s1 = Single.create!(title: "Wanna Be Startin' Somethin'", writer_id: mj.id, release_date: "1983-05-08")
s2 = Single.create!(title: "Billie Jean", writer_id: mj.id, release_date: "1983-01-03")
s3 = Single.create!(title: "Beat It", writer_id: mj.id, release_date: "1983-02-14")

Recording.create!(band_id: mj_band.id, single_id: s1.id)
Recording.create!(band_id: mj_band.id, single_id: s2.id)
Recording.create!(band_id: mj_band.id, single_id: s3.id)
