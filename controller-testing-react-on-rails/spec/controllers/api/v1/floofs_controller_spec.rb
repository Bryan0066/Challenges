require 'rails_helper'

RSpec.describe Api::V1::FloofsController, type: :controller do

  let!(:first_floof) {Floof.create(
    name: "Milo",
    floofiness: 4,
    image: "http://cdn1-www.cattime.com/assets/uploads/gallery/sphynx-cats-and-kittens/sphynx-cats-and-kittens-9.jpg"
  )}

describe "GET#show" do
  it "should return an individual floof with all its attributes" do

    get :show, params: {id:first_floof.id}
    returned_json = JSON.parse(response.body)

    expect(response.status).to eq 200
    expect(response.content_type).to eq ("application/json; charset=utf-8")

    expect(returned_json['floof']["name"]).to eq first_floof.name
    expect(returned_json['floof']["floofiness"]).to eq first_floof.floofiness
    expect(returned_json['floof']["image"]).to eq first_floof.image
    
    end
  end

 
  
end
