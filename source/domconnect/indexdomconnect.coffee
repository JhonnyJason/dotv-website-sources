indexdomconnect = {name: "indexdomconnect"}

############################################################
indexdomconnect.initialize = () ->
    global.code = document.getElementById("code")
    global.mission = document.getElementById("mission")
    global.company = document.getElementById("company")
    global.upbuttonContainer = document.getElementById("upbutton-container")
    global.backgroundlogo = document.getElementById("backgroundlogo")
    return
    
module.exports = indexdomconnect