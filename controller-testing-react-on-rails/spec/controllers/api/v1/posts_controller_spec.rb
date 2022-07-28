require 'rails_helper'



RSpec.describe Api::V1::PostsController, type: :controller do
  let!(:first_floof) {Floof.create(
    name: "Milo",
    floofiness: 4,
    image: "http://cdn1-www.cattime.com/assets/uploads/gallery/sphynx-cats-and-kittens/sphynx-cats-and-kittens-9.jpg"
  )}
  let!(:first_floof) {Floof.create(
    name: "Milo",
    floofiness: 4,
    image: "http://cdn1-www.cattime.com/assets/uploads/gallery/sphynx-cats-and-kittens/sphynx-cats-and-kittens-9.jpg"
  )}
describe "POST#create" do

  it "returns the json of the newly posted floof" do
    
    post_json1 = {
      post:{
          body: "Pickles",
          floof_id: 1
      }}
    post_json = {
      post:{
          body: "Pickles",
          floof_id: 1
      }}

    post(:create, params: post_json, format: :json)
    returned_json = JSON.parse(response.body)
        
        binding.pry
        
    expect(response.status).to eq 200
    expect(response.content_type).to eq("application/json; charset=utf-8")

    expect(returned_json).to be_kind_of(Hash)
    expect(returned_json).to_not be_kind_of(Array)
    expect(returned_json["body"]).to eq post_json[:post][:body]

  end
end
end