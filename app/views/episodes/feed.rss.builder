#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => '2.0', 'xmlns:atom' => 'http://www.w3.org/2005/Atom' do
  xml.channel do
    xml.atom:link, href:"http://www.hardwareclub.io/feed", rel:"self", type:"application/rss+xml"
    xml.title "Hardwareclub"
    xml.description "Hardware Club - Cupcake ipsum dolor sit amet."
    xml.link "http://www.hardwareclub.io"
    xml.language "en"

    for article in @episodes
      xml.item do
        if article.title
          xml.title article.title
        else
          xml.title ""
        end
        url = "http://www.hardwareclub.io/#{article.friendly_id}"
        xml.description article.description
        xml.pubDate article.published_at.to_s(:rfc822)
        xml.link url
        xml.guid url
      end
    end
  end
end
