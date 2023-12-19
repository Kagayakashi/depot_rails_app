# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Product.delete_all

Product.create!(
  title: "Captain Blood",
  description:
    %(<p>
    PPeter Blood, an Irish physician and soldier in England in the 1680's,
    is wrongly convicted of treason and sentenced to indentured slavery
    in the Caribbean. He escapes and becomes the most feared pirate captain
    on the Spanish Main, but all the glory of his adventures cannot help him,
    for the woman he loves cannot love a thief and pirate. Even when he
    destroys England's enemies, even at his most triumphant...but wait! What's that...
    </p>),
  image_url: "captain_blood.jpeg",
  price: 19.95
)

Product.create!(
  title: "The Count Monte Cristo",
  description:
    %(<p>
    The Count of Monte Cristo is a novel by Alexander Dumas that tells
    the story of Edmond Dantès, who transforms himself into the Count of Monte Cristo
    to enact revenge on the three men responsible for sending him to prison
    and preventing his marriage to Mercédès Herrera12. He escapes after fourteen
    years of imprisonment and uses his hidden treasure and his cunning to ruin the
    lives of his enemies in the corrupt and decadent society of France at the time of the Bourbon Restoration
    </p>),
  image_url: "monte_cristo.jpg",
  price: 24.95
)

Product.create!(
  title: "Disgardium Class-A Threat",
  description:
    %(<p>
    Our future. Noncitizens and individuals of low social standing can only
    find work in one place – the virtual world of Disgardium. And that might
    mean mining ore; it could just as well mean cleaning pigsties or washing
    dishes in a tavern, but that’s about as glamorous as it gets.
    </p>
    <p>
    Fifteen-year-old schoolboy Alex has dreams of working as a space guide.
    All he can think about is the stars, but life gets in the way and now
    his only path to achieving that goal is through the game.
    </p>),
  image_url: "disgardium.jpg",
  price: 24.95
)
