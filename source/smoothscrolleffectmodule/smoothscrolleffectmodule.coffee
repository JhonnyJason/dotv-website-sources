smoothscrolleffectmodule = {name: "smoothscrolleffectmodule"}
############################################################
#region printLogFunctions
log = (arg) ->
    if allModules.debugmodule.modulesToDebug["smoothscrolleffectmodule"]?  then console.log "[smoothscrolleffectmodule]: " + arg
    return
ostr = (obj) -> JSON.stringify(obj, null, 4)
olog = (obj) -> log "\n" + ostr(obj)
print = (arg) -> console.log(arg)
#endregion

############################################################
v = null
headerHeight = 0

slideinMenu = null
upButton = null

offsetForFooter = 0
footerShown = false


############################################################
smoothscrolleffectmodule.initialize = () ->
    log "smoothscrolleffectmodule.initialize"
    v = allModules.vanillautilmodule
    slideinMenu = allModules.slideinmenumodule
    upButton = allModules.upbuttonmodule

    allLinks = document.getElementsByTagName("a")
    for link,i in allLinks
        ref = link.getAttribute("href")
        anchorname = getAnchorName(ref)
        if anchorname then addScrollEffect(link, anchorname)
    document.addEventListener("scroll", weScrolled)
    getHeaderHeight()

    fullHeight = document.body.offsetHeight
    offsetForFooter = fullHeight - 1.8 * screen.height
    return
    
############################################################
getHeaderHeight = ->
    main = document.getElementsByTagName("header")[0]
    headerHeight = main.offsetHeight
    return

getAnchorName = (ref) ->
    # log ref
    if ref[0] == '#' then return ref.slice(1)
    return

addScrollEffect = (link, anchorname) ->
    # olog {link,anchorname}
    el = document.getElementById(anchorname)
    return unless el?
    scrollFunction = -> v.scrollTo(el.offsetTop+headerHeight)
    link.addEventListener("click", scrollFunction)
    return


############################################################
#region eventListeners
weScrolled = (evt) ->
    offset = window.scrollY
    if offset > 500
        upButton.show()
        slideinMenu.show()
    else 
        upButton.hide()
        slideinMenu.hide()

    if !footerShown and offset > offsetForFooter
        backgroundimage.classList.add("footer")
        footerShown = true
    return

#endregion

module.exports = smoothscrolleffectmodule