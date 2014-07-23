module.exports = (robot) ->
  robot.hear /^https?:\/\/.*gyazo.com\/[0-9a-f]{32}\/?$/i, (msg) ->
    msg.send "#{msg.message.text}/raw#.png"
