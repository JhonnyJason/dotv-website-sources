indexdomconnect = {name: "indexdomconnect"}

############################################################
indexdomconnect.initialize = () ->
    global.code = document.getElementById("code")
    global.mission = document.getElementById("mission")
    global.company = document.getElementById("company")
    global.donateBitcoinButton = document.getElementById("donate-bitcoin-button")
    global.donateEthereumButton = document.getElementById("donate-ethereum-button")
    global.donateSepaButton = document.getElementById("donate-sepa-button")
    global.donationInformation = document.getElementById("donation-information")
    global.copyBitcoinAddressButton = document.getElementById("copy-bitcoin-address-button")
    global.bitcoinAddress = document.getElementById("bitcoin-address")
    global.copyEthereumAddressButton = document.getElementById("copy-ethereum-address-button")
    global.ethereumAddress = document.getElementById("ethereum-address")
    global.copyIbanAddressButton = document.getElementById("copy-iban-address-button")
    global.ibanAddress = document.getElementById("iban-address")
    global.messagebox = document.getElementById("messagebox")
    global.upbuttonContainer = document.getElementById("upbutton-container")
    global.backgroundimage = document.getElementById("backgroundimage")
    global.backgroundlogo = document.getElementById("backgroundlogo")
    return
    
module.exports = indexdomconnect