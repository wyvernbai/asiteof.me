xml.instruct! :xml, :version => '1.0'
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "aSiteOfMe"
    xml.description "Wyvernbai Blog RSS XML"
    xml.link "http://www.asiteof.me/feed"

    @posts.each do |post|
      xml.item do
        xml.title post.title
        xml.link "http://www.asiteof.me/archives/#{post.id}"
        xml.description post.full_text
        xml.pubDate post.created_at
        xml.guid "http://www.asiteof.me/archives/#{post.id}"
      end
    end
  end
end
