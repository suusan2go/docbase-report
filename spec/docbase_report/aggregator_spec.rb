require 'json'

RSpec.describe DocBaseReport::Aggregator do
  describe "#fetch_posts" do
    let(:client) { double("docbase-client") }
    let(:response) { double("client-response") }
    let(:aggregator) { DocBaseReport::Aggregator.new(client) }
    let(:summary) { aggregator.fetch_posts("2020-08-01", "2020-09-01") }
    let(:raw_json) do
      <<~EOS
        {
          "posts": [
            {
              "id": 4,
              "title": "メモのタイトル",
              "body": "メモの本文",
              "draft": false,
              "archived": false,
              "url": "https://kray.docbase.io/posts/4",
              "created_at": "2016-04-15T18:19:03+09:00",
              "updated_at": "2016-04-15T18:19:03+09:00",
              "scope": "everyone",
              "sharing_url": "https://docbase.io/posts/1/sharing/abcdefgh-0e81-4567-9876-1234567890ab",
              "tags": [
                { "name": "日報"}
              ],
              "user": {
                "id": 3,
                "name": "user3",
                "profile_image_url": "https://image.docbase.io/uploads/aaa.gif"
              },
              "stars_count": 1,
              "good_jobs_count": 2,
              "comments": [
                {
                  "id": 7,
                  "body": "コメント本文",
                  "created_at": "2016-05-13T17:07:18+09:00",
                  "user": {
                    "id": 2,
                    "name": "user2",
                    "profile_image_url": "https://image.docbase.io/uploads/aaa.gif"
                  }
                }
              ],
              "groups": []
            }
          ],
          "meta": {
            "previous_page": null,
            "next_page": "https://api.docbase.io/teams/kray/posts?page=2&per_page=20",
            "total": 39
          }
        }
      EOS
    end
    let(:response_body) { JSON.load(raw_json) }

    context "when docbase api returns json with http success" do
      before do
        allow(response).to receive(:status).and_return(200)
        allow(response).to receive(:body).and_return(response_body)
        expect(client).to receive(:posts).with(q: "created_at:2020-08-01~2020-09-01", page: 1, per_page: 100).and_return(response)
      end

      it "returns summary with posts" do
        expect(summary.posts).to eq (response_body["posts"])
      end
    end

    context "when docbase api returns HTTP error" do
      before do
        allow(response).to receive(:status).and_return(401)
        allow(response).to receive(:body).and_return("error")
        expect(client).to receive(:posts).with(q: "created_at:2020-08-01~2020-09-01", page: 1, per_page: 100).and_return(response)
      end

      it "returns summary with posts" do
        expect{ summary }.to raise_error(RuntimeError, "request failed status:401 body: error")
      end
    end
  end
end
