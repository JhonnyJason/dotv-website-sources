import Modules from "./allmodules"
import domconnect from "./indexdomconnect"
domconnect.initialize()

global.allModules = Modules

utl = Modules.utilmodule

############################################################
showBitcoinInformation = ->
    donationInformation.classList.remove("sepa-information-shown")
    donationInformation.classList.remove("ethereum-information-shown")
    donationInformation.classList.add("bitcoin-information-shown")
    return

showEthereumInformation = ->
    donationInformation.classList.remove("sepa-information-shown")
    donationInformation.classList.add("ethereum-information-shown")
    donationInformation.classList.remove("bitcoin-information-shown")
    return

showSepaInformation = ->
    donationInformation.classList.add("sepa-information-shown")
    donationInformation.classList.remove("ethereum-information-shown")
    donationInformation.classList.remove("bitcoin-information-shown")
    return

copyBitcoinAddress = ->
    address = bitcoinAddress.textContent
    utl.copyToClipboard(address)
    return

copyEthereumAddress = ->
    address = ethereumAddress.textContent
    utl.copyToClipboard(address)
    return

copyIbanAddress = ->
    address = ibanAddress.textContent
    utl.copyToClipboard(address)
    return


############################################################
appStartup = ->
    donateBitcoinButton.addEventListener("click", showBitcoinInformation)
    donateEthereumButton.addEventListener("click", showEthereumInformation)
    donateSepaButton.addEventListener("click", showSepaInformation)
    
    copyBitcoinAddressButton.addEventListener("click", copyBitcoinAddress)
    copyEthereumAddressButton.addEventListener("click", copyEthereumAddress)
    copyIbanAddressButton.addEventListener("click", copyIbanAddress)
    return

############################################################
run = ->
    promises = (m.initialize() for n,m of Modules when m.initialize?) 
    await Promise.all(promises)
    appStartup()

############################################################
run()