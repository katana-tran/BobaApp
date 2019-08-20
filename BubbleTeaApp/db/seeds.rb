# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'faker'
require 'rest-client'

Quote.destroy_all
Tea.destroy_all
Topping.destroy_all

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

def create_teas
Tea.create(name: "Jasmine Tea",description: "Jasmine tea is tea scented with the aroma of jasmine blossoms. Typically, jasmine tea has green tea as the tea base; however, white tea and black tea are also used. The resulting flavour of jasmine tea is subtly sweet and highly fragrant. It is the most famous scented tea in China.", 
origin: "The jasmine plant is grown at high elevations in the mountains. Jasmine tea produced in the Chinese province of Fujian has the best reputation. Jasmine tea is also produced in the provinces of Hunan, Jiangsu, Jiangxi, Guangdong, Guangxi, and Zhejiang. Japan is also known for the production of jasmine tea, especially in Okinawa Prefecture, where it is called Sanpin-cha",
benefits:"Modern biological studies have shown that drinking jasmine tea can have health and immunity benefits. Jasmine tea contains several different kinds of antioxidants that provide protection to the membranes of red blood cells; this added protection helps fend off free radical-induced oxidation of the red blood cells.")

Tea.create(name: "Taro Milk Tea",
origin: "Taro is the underground tuber section of a plant called Aracaea who also grows edible heart shaped leaves. Depending on where it is grown, the taro can be white, pink or purple in color. It originated from the tropical regions of South India and South Asia but has been cultivated all over the world: Hawai'i, Venezuela, Brazil and even Egypt. It has a long history in international cuisine: its naturally sweet and nutty flavor makes it extremely popular across the world and can be found in a variety of dishes. Many would compare Taro to a potato as they are both starchy and can be eaten the same ways: fried, mashed, boiled, baked, and roasted.",
description: "Taro is a starchy plant that's common in the Asia-Pacific region. Although taro itself is rich in nutrients such as potassium and fiber, the highly processed taro powders found in bubble teas are generally not. For example, one brand of taro powder lists sugar as the first ingredient, then nondairy creamer, milk and natural and artificial flavors. Another lists nondairy creamer, two types of sugar, taro powder and extract, and artificial colors. Therefore, taro bubble teas may have some of the flavor of taro, but little of the nutritional boost. In addition, taro bubble teas are generally high in calories -- one brand's powder contains 65 calories per serving, and that doesn't include the milk typically used as a mixer.",
benefits:"")

Tea.create(name: "Thai Tea", 
description: "In Thailand, the classic base for Thai iced tea is a strong black tea. Nowadays, the most popular local brand is the Number One Hand Brand, which incorporates a light amount of crushed spices in addition to tea leaves. The drink is made by placing the tea in a pot lined with a pantyhose filter (used commonly in Hong Kong milk tea), brewing the leaves for a long time, then adding condensed milk and crushed (never cubed) ice.", 

origin: "Tea was brought in by the Chinese in the 1980s to supplant opium as a cash crop and thereby curb drug trafficking. It's unclear, exactly, when Thai tea— a mixture of black tea, condensed milk, and sometimes ice—was invented, though many suspect it was a lingering influence from Field Marshal Pibul Songkram, a Thai leader with a penchant for western culture (hence the ice and milk). The tea became a staple of Thai street food culture, sometimes spiced with star anise and orange blossom water, but more often than not, served without any additional flavorings.",

benefits:"")
end

def generate_memes
    api_response = RestClient.get("https://api.imgflip.com/get_memes")
    meme_json = JSON.parse(api_response)
    meme_json["data"]["memes"].each do |meme|
        Topping.create(name:meme["name"],img_url:meme["url"])
    end
end

<<<<<<< HEAD
=======
def make_straws
    Straw.create(color:"Lavender")
    Straw.create(color:"Baby Blue")
    Straw.create(color:"Sunshine")
end

def user_generator
    20.times do 
        User.create(name:Faker::Faker::Name.name)
        #Faker::Internet.email
    end
end

def create_cups
    20.times do
        Cup.create(name:Faker::Coffee.blend_name,straw_id:Straw.all.sample.id,tea_id: Tea.all.sample.id,user_id:User.all.sample.id)
    end
end


>>>>>>> 4ae58368798a17438bb7a9a3192d737f52472382
seed_quotes
generate_memes
create_teas
make_straws
user_generator
create_cups
