############################################################
#region debug
import { createLogFunctions } from "thingy-debug"
{log, olog} = createLogFunctions("smoothscrolleffectmodule")
#endregion

############################################################
import *  as v from "./vanillautilmodule.js"

############################################################
#region internal variables
headerHeight = 0

############################################################
slideinMenu = null
upButton = null

############################################################
offsetForFooter = 0
footerShown = false

#endregion

############################################################
export initialize = ->
    log "initialize"
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
#region internal functions
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