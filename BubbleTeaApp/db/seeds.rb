# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
def seed_quotes
    50.times do 
        Quote.create(quote: Faker::TvShows::BojackHorseman.quote,author:"Bojack Horseman")
        Quote.create(quote: Faker::TvShows::BojackHorseman.tongue_twister,author:"Bojack Horseman")
        Quote.create(quote: Faker::TvShows::NewGirl.quote,author:"New Girl")
        Quote.create(quote: Faker::TvShows::MichaelScott.quote,author:"Michael Scott, The Office")
        Quote.create(quote: Faker::TvShows::RickAndMorty.quote,author:"Rick and Morty")
        Quote.create(quote: Faker::TvShows::Simpsons.quote, author:"The Simpsons")
    end
end

Tea.create(name: "Jasmine Tea" description: "Jasmine tea is tea scented with the aroma of jasmine blossoms. Typically, jasmine tea has green tea as the tea base; however, white tea and black tea are also used. The resulting flavour of jasmine tea is subtly sweet and highly fragrant. It is the most famous scented tea in China.", origin: "The jasmine plant is grown at high elevations in the mountains. Jasmine tea produced in the Chinese province of Fujian has the best reputation. Jasmine tea is also produced in the provinces of Hunan, Jiangsu, Jiangxi, Guangdong, Guangxi, and Zhejiang. Japan is also known for the production of jasmine tea, especially in Okinawa Prefecture, where it is called Sanpin-cha",benefits:"Modern biological studies have shown that drinking jasmine tea can have health and immunity benefits. Jasmine tea contains several different kinds of antioxidants that provide protection to the membranes of red blood cells; this added protection helps fend off free radical-induced oxidation of the red blood cells.")

Tea.create(name: "Matcha Tea" description: "Jasmine tea is tea scented with the aroma of jasmine blossoms. Typically, jasmine tea has green tea as the tea base; however, white tea and black tea are also used. The resulting flavour of jasmine tea is subtly sweet and highly fragrant. It is the most famous scented tea in China.", origin: "The jasmine plant is grown at high elevations in the mountains. Jasmine tea produced in the Chinese province of Fujian has the best reputation. Jasmine tea is also produced in the provinces of Hunan, Jiangsu, Jiangxi, Guangdong, Guangxi, and Zhejiang. Japan is also known for the production of jasmine tea, especially in Okinawa Prefecture, where it is called Sanpin-cha",benefits:"Modern biological studies have shown that drinking jasmine tea can have health and immunity benefits. Jasmine tea contains several different kinds of antioxidants that provide protection to the membranes of red blood cells; this added protection helps fend off free radical-induced oxidation of the red blood cells.")

Tea.create(name: "Thai Tea" 
description: "Jasmine tea is tea scented with the aroma of jasmine blossoms. Typically, jasmine tea has green tea as the tea base; however, white tea and black tea are also used. The resulting flavour of jasmine tea is subtly sweet and highly fragrant. It is the most famous scented tea in China.", 
origin: "Tea is a relatively new phenomenon in Thailand, brought in by the Chinese in the 1980s to supplant opium as a cash crop and thereby curb drug trafficking. It's unclear, exactly, when Thai tea (known in Thailand as Cha Yen)—a mixture of black tea, condensed milk, and sometimes ice—was invented, though many suspect it was a lingering influence from Field Marshal Pibul Songkram, a Thai leader with a penchant for western culture (hence the ice and milk). The tea became a staple of Thai street food culture, sometimes spiced with star anise and orange blossom water, but more often than not, served without any additional flavorings.",benefits:"Modern biological studies have shown that drinking jasmine tea can have health and immunity benefits. Jasmine tea contains several different kinds of antioxidants that provide protection to the membranes of red blood cells; this added protection helps fend off free radical-induced oxidation of the red blood cells.")

def generate_memes
    api_response = RestClient.get("https://api.imgflip.com/get_memes")
    meme_json = JSON.parse(api_response)
    meme_json["data"]["memes"].each do |meme|
        Topping.create(name:meme[:name],img_url:meme[:url])
    end
end


seed_quotes
generate_memes
