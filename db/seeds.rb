kiana = User.create!(username: "Kiana", password: "kiana")
zoey = User.create!(username: "Zoey", password: "zoey")
kiana.tattoos.create!(name: "Flower", client: "Liz", placement: "wrist", description: "black rose outline")
kiana.tattoos.create!(name: "Portrait", client: "Alexis", placement: "arm", description: "sketch")
zoey.tattoos.create!(name: "Star", client: "Tara", placement: "foot", description: "geometric color block")
zoey.tattoos.create!(name: "Lyrics", client: "Sam", placement: "bicep", description: "minimal cursive")
puts "success"