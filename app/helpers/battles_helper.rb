module BattlesHelper
  def text_with_images(text)
    video_regex = /https?:\/\/\S+\.(?:gifv|webm|mp4)/i
    image_regex = /https?:\/\/\S+\.(?:gif|jpg|jpeg|png)/i
    text.split(/(?<=\s)/).map do |match|
      if match.match(video_regex)
        substitution = match.sub(/gifv$/, "webm")
        "<br>#{video_tag(substitution, autoplay:"autoplay", loop:"loop")}<br>"
      elsif match.match(image_regex)
        "<br>#{image_tag(match)}<br>"
      else
        html_escape(match)
      end
    end.join.html_safe
  end
end
