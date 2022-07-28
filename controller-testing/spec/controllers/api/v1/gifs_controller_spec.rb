require "rails_helper"

RSpec.describe Api::V1::GifsController, type: :controller do

  let!(:first_gif) {Gif.create(
    name: "Hello this is Dog",
    url: "https://media.giphy.com/media/pSpmpxFxFwDpC/giphy.gif",
    likes: 250
  )}
    
  let!(:second_gif) {Gif.create(
    name: "Pug Swimming",
    url: "https://media.giphy.com/media/r6ALgGVKLg93O/giphy.gif",
    likes: 47
  )}

  describe "GET#index" do
    it "should return a list of all the gifs" do

        get :index
        returned_json = JSON.parse(response.body)

        expect(response.status).to eq 200
        expect(response.content_type).to eq("application/json; charset=utf-8")

        expect(returned_json[0]["name"]).to eq "Hello this is Dog"
        expect(returned_json[0]["url"]).to eq "https://media.giphy.com/media/pSpmpxFxFwDpC/giphy.gif"
        
        expect(returned_json.length).to eq 2
        expect(returned_json[1]["name"]).to eq "Pug Swimming"
        expect(returned_json[1]["url"]).to eq "https://media.giphy.com/media/r6ALgGVKLg93O/giphy.gif"

    end
  end

    describe "GET#show" do
      it "should return an inidividual gif with all its attributes" do
          get :show, params: {id:first_gif.id}
          returned_json = JSON.parse(response.body)

          expect(response.status).to eq 200
          expect(response.content_type).to eq ("application/json; charset=utf-8")

          expect(returned_json.length).to eq 4
          expect(returned_json["name"]).to eq first_gif.name
          expect(returned_json["url"]).to eq first_gif.url
          expect(returned_json["likes"]).to eq first_gif.likes
        
      end
    end

    describe "POST#create" do
      it "creates a new Gif" do
        post_json = {
          gif: {
            name: "Basset Hound Shakes Off",
            url: "https://media.giphy.com/media/WjjXDenYaxQys/giphy.gif"
          }
        }
    
        prev_count = Gif.count
        post(:create, params: post_json, format: :json)
        expect(Gif.count).to eq(prev_count + 1)
      end

      it "returns the json of the newly posted gif" do
        post_json = {
          gif: {
            name: "Basset Hound Shakes Off",
            url: "https://media.giphy.com/media/WjjXDenYaxQys/giphy.gif"
          }
        }
    
        post(:create, params: post_json, format: :json)
        returned_json = JSON.parse(response.body)
    
        expect(response.status).to eq 200
        expect(response.content_type).to eq("application/json; charset=utf-8")
    
        expect(returned_json).to be_kind_of(Hash)
        expect(returned_json).to_not be_kind_of(Array)
        expect(returned_json["name"]).to eq "Basset Hound Shakes Off"
        expect(returned_json["url"]).to eq "https://media.giphy.com/media/WjjXDenYaxQys/giphy.gif"
      end
    
    end

end
