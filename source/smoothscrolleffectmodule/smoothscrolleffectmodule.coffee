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
upButton = null

offsetForFooter = 0
footerShown = false


############################################################
smoothscrolleffectmodule.initialize = () ->
    log "smoothscrolleffectmodule.initialize"
    v = allModules.vanillautilmodule
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
    switch(anchorname)
        when "company" then link.addEventListener("click", scrollToCompany)
        when "mission" then link.addEventListener("click", scrollToMission)
        when "code" then link.addEventListener("click", scrollToCode)
        else log "unknown anchorname: " + anchorname
    return


############################################################
#region eventListeners
weScrolled = (evt) ->
    offset = window.scrollY
    if offset > 500 then upButton.show()
    else upButton.hide()

    if !footerShown and offset > offsetForFooter
        backgroundimage.classList.add("footer")
        footerShown = true
    return

############################################################
scrollToCompany = (evt) ->
    # log company.offsetTop
    v.scrollTo(company.offsetTop+headerHeight)
    return

scrollToMission = (evt) ->
    # log mission.offsetTop
    # realoffset = mission.offsetTop - 
    v.scrollTo(mission.offsetTop+headerHeight)
    return

scrollToCode = (evt) ->
    # log code.offsetTop
    v.scrollTo(code.offsetTop+headerHeight)
    return
#endregion

module.exports = smoothscrolleffectmodule