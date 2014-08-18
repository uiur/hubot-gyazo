# Description:
#   Expand a gyazo url.
#   You can see its image content in your chat window (Hipchat etc.).
#
# Commands:
#   <text including a gyazo url> - <a direct image url>
#
# Author:
#   uiureo

module.exports = (robot) ->
  GYAZO_REGEXP = /(https?:\/\/(?:[^\.]+\.)?gyazo.com\/[0-9a-f]{32})\/?(?:\s|$)/gi

  extractGyazoUrls = (text) ->
    urls = []
    while (match = GYAZO_REGEXP.exec(text)) != null
      urls.push(match[1])

    urls

  robot.hear GYAZO_REGEXP, (msg) ->
    urls = extractGyazoUrls(msg.message.text)

    msg.send "#{url}/raw#.png" for url in urls
