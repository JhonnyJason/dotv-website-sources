indexdomconnect = {name: "indexdomconnect"}

############################################################
indexdomconnect.initialize = () ->
    global.messagebox = document.getElementById("messagebox")
    global.upbuttonContainer = document.getElementById("upbutton-container")
    global.upbutton = document.getElementById("upbutton")
    global.backgroundimage = document.getElementById("backgroundimage")
    global.backgroundlogo = document.getElementById("backgroundlogo")
    global.s = document.getElementById("s")
    return
    
module.exports = indexdomconnect