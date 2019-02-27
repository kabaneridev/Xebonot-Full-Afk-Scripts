local print = print
local pairs = pairs
local ipairs = ipairs
local setfenv = setfenv
local tonumber = tonumber
local tostring = tostring
local assert = assert
local type = type
local collectgarbage = collectgarbage
local unpack = unpack
local pcall = pcall
local next = next
local pnext = function(t, i) return pcall(function() return next(t, i) end) end
local os = os
local io = io
local string = string
local math = math
local table = table

local xeno = {}
xeno.isRealTibia = isRealTibia
xeno.showConfigEditor = showConfigEditor
xeno.getVersionNumber = getVersionNumber
xeno.ping = Self.Ping
xeno.delayWalker = delayWalker
xeno.gotoLabel = function(name, relative) gotoLabel(name, relative and 1 or 0) end
xeno.loadSettings = loadSettings
xeno.sendScriptSignal = sendScriptSignal
xeno.getWalkerStuck = getWalkerStuck
xeno.getWalkerLuring = getWalkerLuring
xeno.getTargetingIgnoring = getTargetingIgnoring
xeno.getXenoBotStatus = getXenoBotStatus
xeno.registerNativeEventListener = registerNativeEventListener
xeno.getContainerOpen = getContainerOpen
xeno.getContainerName = getContainerName
xeno.getContainerID = getContainerID
xeno.getContainerSpotData = getContainerSpotData
xeno.getContainerItemCount = getContainerItemCount
xeno.getContainerItemCapacity = getContainerItemCapacity
xeno.getItemNameByID = getItemNameByID
xeno.getItemIDByName = getItemIDByName
xeno.minimizeContainer = minimizeContainer
xeno.closeContainer = closeContainer
xeno.containerUseItem = containerUseItem
xeno.containerUseWithContainer = containerUseWithContainer
xeno.containerUseItemWithGround = containerUseItemWithGround
xeno.containerUseItemWithCreature = containerUseItemWithCreature
xeno.containerMoveItemToSlot = containerMoveItemToSlot
xeno.containerMoveItemToGround = containerMoveItemToGround
xeno.containerMoveItemToContainer = containerMoveItemToContainer
xeno.containerBack = containerBack
xeno.isItemContainer = isItemContainer
xeno.isItemCorpse = isItemCorpse
xeno.isItemStackable = isItemStackable
xeno.isItemUseWithable = isItemUseWithable
xeno.isItemFood = isItemFood
xeno.isItemWalkable = isItemWalkable
xeno.isItemFurniture = isItemFurniture
xeno.isItemField = isItemField
xeno.getTileUseTargetID = getTileUseTargetID
xeno.getTileUseID = getTileUseID
xeno.getTileIsWalkable = getTileIsWalkable
xeno.getItemWeight = getItemWeight
xeno.getItemValue = getItemValue
xeno.getItemCost = getItemCost
xeno.setWalkerEnabled = setWalkerEnabled
xeno.setLooterEnabled = setLooterEnabled
xeno.setTargetingEnabled = setTargetingEnabled
xeno.getSelfID = getSelfID
xeno.getSelfTargetID = getSelfTargetID
xeno.getSelfFollowID = getSelfFollowID
xeno.getSelfPosition = getSelfPosition
xeno.getSelfLookDirection = getSelfLookDirection
xeno.getSelfMaxHealth = getSelfMaxHealth
xeno.getSelfMaxMana = getSelfMaxMana
xeno.getSelfMana = getSelfMana
xeno.getSelfHealth = getSelfHealth
xeno.getSelfStamina = getSelfStamina
xeno.getSelfCap = getSelfCap
xeno.getSelfLevel = getSelfLevel
xeno.getSelfExperience = getSelfExperience
xeno.getSelfFlag = getSelfFlag
xeno.getSelfSpellCooldown = getSelfSpellCooldown
xeno.getSelfSpellRequirementsMet = getSelfSpellRequirementsMet
xeno.selfSay = selfSay
xeno.selfYell = selfYell
xeno.selfWhisper = selfWhisper
xeno.selfNpcSay = selfNpcSay
xeno.selfPrivateMessage = selfPrivateMessage
xeno.selfUseItem = selfUseItem
xeno.selfUseItemFromGround = selfUseItemFromGround
xeno.selfUseItemWithGround = selfUseItemWithGround
xeno.selfUseItemWithCreature = selfUseItemWithCreature
xeno.selfBrowseField = selfBrowseField
xeno.doSelfTurn = doSelfTurn
xeno.doSelfStep = doSelfStep
xeno.doSelfWalkTo = doSelfWalkTo
xeno.doSelfLogout = doSelfLogout
xeno.slotUseItem = slotUseItem
xeno.slotMoveItemToContainer = slotMoveItemToContainer
xeno.shopBuyItemByName = shopBuyItemByName
xeno.shopBuyItemByID = shopBuyItemByID
xeno.shopSellItemByName = shopSellItemByName
xeno.shopSellItemByID = shopSellItemByID
xeno.shopGetItemBuyPriceByName = shopGetItemBuyPriceByName
xeno.shopGetItemBuyPriceByID = shopGetItemBuyPriceByID
xeno.shopGetItemSaleCountByName = shopGetItemSaleCountByName
xeno.shopGetItemSaleCountByID = shopGetItemSaleCountByID
xeno.luaOpenCustomChannel = luaOpenCustomChannel
xeno.luaCloseCustomChannel = luaCloseCustomChannel
xeno.luaSendChannelMessage = luaSendChannelMessage
xeno.HUDGetDimensions = HUDGetDimensions
xeno.HUDGetContainerDimensions = HUDGetContainerDimensions
xeno.HUDCreateItemImage = HUDCreateItemImage
xeno.HUDCreateText = HUDCreateText
xeno.HUDUpdateLocation = HUDUpdateLocation
xeno.HUDUpdateTextText = HUDUpdateTextText
xeno.HUDUpdateTextColor = HUDUpdateTextColor
xeno.HUDUpdateItemImageID = HUDUpdateItemImageID
xeno.HUDUpdateItemImageSize = HUDUpdateItemImageSize
xeno.HUDUpdateItemImageCount = HUDUpdateItemImageCount
xeno.getHeadSlotData = getHeadSlotData
xeno.getArmorSlotData = getArmorSlotData
xeno.getLegsSlotData = getLegsSlotData
xeno.getFeetSlotData = getFeetSlotData
xeno.getAmuletSlotData = getAmuletSlotData
xeno.getWeaponSlotData = getWeaponSlotData
xeno.getRingSlotData = getRingSlotData
xeno.getBackpackSlotData = getBackpackSlotData
xeno.getShieldSlotData = getShieldSlotData
xeno.getAmmoSlotData = getAmmoSlotData
xeno.getSelfCreatureKillCount = getSelfCreatureKillCount
xeno.resetSelfCreatureKillCount = resetSelfCreatureKillCount
xeno.doSelfSelectTrainingMode = doSelfSelectTrainingMode
xeno.getCreatureName = getCreatureName
xeno.getCreatureSkull = getCreatureSkull
xeno.getCreaturePartyStatus = getCreaturePartyStatus
xeno.getCreaturePvPIcon = getCreaturePvPIcon
xeno.getCreatureHealthPercent = getCreatureHealthPercent
xeno.getCreatureVisible = getCreatureVisible
xeno.getCreatureListIndex = getCreatureListIndex
xeno.getCreatureIDFromIndex = getCreatureIDFromIndex
xeno.getCreaturePosition = getCreaturePosition
xeno.isCreaturePlayer = isCreaturePlayer
xeno.isCreatureNpc = isCreatureNpc
xeno.isCreatureMonster = isCreatureMonster
xeno.isCreatureSummon = isCreatureSummon
xeno.isCreatureSelfSummon = isCreatureSelfSummon
xeno.isCreatureStrangeSummon = isCreatureStrangeSummon
xeno.isCreatureMother = isCreatureMother
xeno.attackCreature = attackCreature
xeno.followCreature = followCreature
xeno.screenshot = screenshot
xeno.getUserName = getUserName
xeno.getCreatureSpectators = getCreatureSpectators
xeno.enterCriticalMode = veryUnsafeFunctionEnterCriticalMode
xeno.exitCriticalMode = veryUnsafeFunctionExitCriticalMode
xeno.setDiagnosticsEnabled = setDiagnosticsEnabled
xeno.setTargetingIgnoreEnabled = setTargetingIgnoreEnabled
xeno.alert = alert
local MINIMUM_XENO_VERSION = 1169
local LIB_REVISION = 'v1.3.17'

-- Configure the script in the folder: Documents/XenoBot/Configs
-- Do NOT edit this file. If you do, don't make a support thread about it.
-- Regards, Syntax <3
local LIB_CONFIG = string.reverse([[?emit dessap fo daetsni animats desu rep stiforp dna pxe ylruoh erusaem ot tnaw uoy oD ;       eslaf = tnemerusaeM-animatS-reP
?SS-MM-HH-DD fo daetsni MM-HH ni emit yalpsid ot tnaw uoy oD ;            eslaf = tamroF-emiT-elpmiS
)elprup ,eulb ,neerg ,knip ,egnaro ,krad ,thgil( .DUH eht rof snoitpo emeht roloC ;                         thgil = emehT
)eslaf/eurt( .DUH eht ni snoci tool eht wohs ot rehtehW ;                     eurt = snocI-wohS
)eslaf/eurt( ?tool laudividni wohs ot ekil uoy dluoW ;                      eurt = tooL-wohS
)eslaf/eurt( ?seilppus laudividni wohs ot ekil uoy dluoW ;                  eurt = seilppuS-wohS
)eslaf/eurt( ?seman reniatnoc wohs ot ekil uoy dluoW ;                eurt = sreniatnoC-wohS
)eslaf/eurt( ?DUH eht elbane ot ekil uoy dluoW ;                        eurt = delbanE
]DUH[

)eslaf/eurt( .tixe lliw tneilc ,gniniart ton & tuo gniggol nehW ;                      eslaf = goL-tixE
)cigam ,raeps ,bulc ,exa ,drows ,enon( .esu ot eutats gniniart ehT ;                    enon = llikS-niarT
)elbasid ot 0( .tnuh ot sruoh rebmun mumixam ehT ;                        0 = timiL-emiT
)elbasid ot 0( ?tuogol ot ekil uoy dluow evas revres erofeb sruoh ynam woH ;                       0 = evaS-revreS
)elbasid ot 0( ?tuogol ot ekil uoy dluow level tahw tA ;                             0 = leveL
)sruoh ni( ?tuo gol ot ekil uoy dluow animats hcum woh tA ;                          41 = animatS
]tuogoL[

)elbasid ot 0( .dlog pord lliw tpircs ,eulav siht woleb seog yticapac fI ;                        08 = dloG-porD
)elbasid ot 0( .sksalf pord lliw tpircs ,eulav siht woleb seog yticapac fI ;                     001 = sksalF-porD
)elbasid ot 0( .nwaps eht tixe lliw tpircs ,eulav siht woleb seog yticapac fI ;                     05 = muminiM-tnuH
]yticapaC[

?anam gnirotser erofeb serutaerc redisnoc ot tnaw uoy od egnar tahW ;                             7 = egnaR
)elbasid ot 0( .neercs-no era serutaerc on elihw ot pu anam erotser ot tnecrep anaM ;                   0 = tnecreP-erotseR
]rerotseR anaM[

)elbasid ot 0( ?stoobtfos gnisu nigeb ot anam fo tnecrep tahW ;                      0 = tnecreP-anaM
]stooB tfoS[

)elbasid ot 0( .mrala na reggirt ot srevomer tsur fo tnuoma ehT ;                        0 = mralAksalF
)elbasid ot 0( .wardhtiw ot tnaw uoy srevomer tsur fo tnuoma ehT ;                          0 = xaMksalF
)elbasid ot 0( .llifer og ot evael lliw uoy hcihw ta srevomer tsur fo tnuoma ehT ;                          0 = niMksalF
.revomer tsur eht fo ,di meti ro ,emaN ;     revomer tsur fo ksalf = emaNksalF
]seilppuS[

)elbasid ot 0( .teluma eht piuqe ot serutaerc fo tnuoma ehT ;               0 = tnuoCerutaerCtelumA
nomed karubahs ,ecnirp karubahs ,drol karubahs ,nomed karaksa ,ecnirp karaksa ,drol karaksa = serutaerCtelumA
)elbasid ot 0( .teluma eht piuqe ot anam fo tnecrep ehT ;                      01 = PMniMtelumA
)elbasid ot 0( .teluma eht piuqe ot htlaeh fo tnecrep ehT ;                      03 = PHniMtelumA
)elbasid ot 0( .toped eht morf wardhtiw ot tnaw uoy steluma fo tnuoma ehT ;                         0 = xaMtelumA
)elbasid ot 0( .llifer og ot evael uoy hcihw ta steluma fo tnuoma ehT ;                         0 = niMtelumA
.teluma eht fo ,di meti ro ,emaN ;        teluma noitcetorp = emaNtelumA
]telumA[

)elbasid ot 0( .gnir eht piuqe ot serutaerc fo tnuoma ehT ;                 0 = tnuoCerutaerCgniR
nomed karubahs ,ecnirp karubahs ,drol karubahs ,nomed karaksa ,ecnirp karaksa ,drol karaksa = serutaerCgniR
)elbasid ot 0( .mrala na reggirt ot sgnir fo tnuoma ehT ;                         0 = mralAgniR
)elbasid ot 0( .gnir eht piuqe ot anam fo tnecrep ehT ;                        01 = PMniMgniR
)elbasid ot 0( .gnir eht piuqe ot htlaeh fo tnecrep ehT ;                        03 = PHniMgniR
)elbasid ot 0( .toped eht morf wardhtiw ot tnaw uoy sgnir fo tnuoma ehT ;                           0 = xaMgniR
)elbasid ot 0( .llifer og ot evael uoy hcihw ta sgnir fo tnuoma ehT ;                           0 = niMgniR
.gnir eht fo ,di meti ro ,emaN ;                 gnir drows = emaNgniR
]gniR[

naicigam krad ,namahs cro ,ssetseirp ,reklats ,roirraw dliw ,retnuh ,draug ruatonim ,tsinacra fle ,knom ,gnilhctah nogard ,nogard ,oreh ,noteleks nomed = stegraTekirtSI
.lleps siht tsac ot ,woleb tsil eht ni ,serutaerc fo htlaeh muminim ehT ;                      0 = PHniMekirtSI
.lleps siht tsac ot ,woleb tsil eht ni ,serutaerc fo htlaeh mumixam ehT ;                    001 = PHxaMekirtSI
)elbasid ot 0( .gnikcatta nigeb ot ,woleb tsil eht ni ,serutaerc fo tnuoma muminim ehT ;                  1 = niMtegraTekirtSI
)tnatropmi erom si rewol( .slleps dna senur rehto ot derapmoc ytiroirP ;                   8 = ytiroirPekirtSI
)eslaf/eurt( ?lleps siht esu ot tnaw uoy oD ;                 eurt = delbanEekirtSI
.lleps eht fo emaN ;             ogirf iroxe = emaNekirtSI

emils ,drolenob ,nomed karaksa ,ecnirp karaksa ,drol karaksa = stegraTekirtSF
.lleps siht tsac ot ,woleb tsil eht ni ,serutaerc fo htlaeh muminim ehT ;                      0 = PHniMekirtSF
.lleps siht tsac ot ,woleb tsil eht ni ,serutaerc fo htlaeh mumixam ehT ;                    001 = PHxaMekirtSF
)elbasid ot 0( .gnikcatta nigeb ot ,woleb tsil eht ni ,serutaerc fo tnuoma muminim ehT ;                  1 = niMtegraTekirtSF
)tnatropmi erom si rewol( .slleps dna senur rehto ot derapmoc ytiroirP ;                   7 = ytiroirPekirtSF
)eslaf/eurt( ?lleps siht esu ot tnaw uoy oD ;                 eurt = delbanEekirtSF
.lleps eht fo emaN ;              malf iroxe = emaNekirtSF

nomed karubahs ,ecnirp karubahs ,drol karubahs = stegraTekirtS
.lleps siht tsac ot ,woleb tsil eht ni ,serutaerc fo htlaeh muminim ehT ;                       0 = PHniMekirtS
.lleps siht tsac ot ,woleb tsil eht ni ,serutaerc fo htlaeh mumixam ehT ;                     001 = PHxaMekirtS
)elbasid ot 0( .gnikcatta nigeb ot ,woleb tsil eht ni ,serutaerc fo tnuoma muminim ehT ;                   1 = niMtegraTekirtS
)tnatropmi erom si rewol( .slleps dna senur rehto ot derapmoc ytiroirP ;                    6 = ytiroirPekirtS
)eslaf/eurt( ?lleps siht esu ot tnaw uoy oD ;                  eurt = delbanEekirtS
.lleps eht fo emaN ;               aret iroxe = emaNekirtS

nomed karubahs ,ecnirp karubahs ,drol karubahs = stegraTekirtSgnortS
.lleps siht tsac ot ,woleb tsil eht ni ,serutaerc fo htlaeh muminim ehT ;                 0 = PHniMekirtSgnortS
.lleps siht tsac ot ,woleb tsil eht ni ,serutaerc fo htlaeh mumixam ehT ;               001 = PHxaMekirtSgnortS
)elbasid ot 0( .gnikcatta nigeb ot ,woleb tsil eht ni ,serutaerc fo tnuoma muminim ehT ;             1 = niMtegraTekirtSgnortS
)tnatropmi erom si rewol( .slleps dna senur rehto ot derapmoc ytiroirP ;              5 = ytiroirPekirtSgnortS
)eslaf/eurt( ?lleps siht esu ot tnaw uoy oD ;           eslaf = delbanEekirtSgnortS
.lleps eht fo emaN ;    aret narg iroxe = emaNekirtSgnortS

nomed karubahs ,ecnirp karubahs ,drol karubahs = stegraTevaWgnortS
.lleps siht tsac ot ,woleb tsil eht ni ,serutaerc fo htlaeh muminim ehT ;                   0 = PHniMevaWgnortS
.lleps siht tsac ot ,woleb tsil eht ni ,serutaerc fo htlaeh mumixam ehT ;                 001 = PHxaMevaWgnortS
)elbasid ot 0( .gnikcatta nigeb ot ,woleb tsil eht ni ,serutaerc fo tnuoma muminim ehT ;               3 = niMtegraTevaWgnortS
)tnatropmi erom si rewol( .slleps dna senur rehto ot derapmoc ytiroirP ;                2 = ytiroirPevaWgnortS
)eslaf/eurt( ?lleps siht esu ot tnaw uoy oD ;             eslaf = delbanEevaWgnortS
.lleps eht fo emaN ;       ruh aret ovexe = emaNevaWgnortS

nomed karubahs ,ecnirp karubahs ,drol karubahs = stegraTetamitlU
.lleps siht tsac ot ,woleb tsil eht ni ,serutaerc fo htlaeh muminim ehT ;                     0 = PHniMetamitlU
.lleps siht tsac ot ,woleb tsil eht ni ,serutaerc fo htlaeh mumixam ehT ;                   001 = PHxaMetamitlU
)elbasid ot 0( .gnikcatta nigeb ot ,woleb tsil eht ni ,serutaerc fo tnuoma muminim ehT ;                 4 = niMtegraTetamitlU
)tnatropmi erom si rewol( .slleps dna senur rehto ot derapmoc ytiroirP ;                  1 = ytiroirPetamitlU
)eslaf/eurt( ?lleps siht esu ot tnaw uoy oD ;               eslaf = delbanEetamitlU
.lleps eht fo emaN ;    aret sam narg ovexe = emaNetamitlU
]sllepS[

nomed karubahs ,ecnirp karubahs ,drol karubahs = stegraTaerAS
.lleps siht tsac ot ,woleb tsil eht ni ,serutaerc fo htlaeh muminim ehT ;                        0 = PHniMaerAS
.lleps siht tsac ot ,woleb tsil eht ni ,serutaerc fo htlaeh mumixam ehT ;                      001 = PHxaMaerAS
)elbasid ot 0( .gnikcatta nigeb ot ,woleb tsil eht ni ,serutaerc fo tnuoma muminim ehT ;                    2 = niMtegraTaerAS
)tnatropmi erom si rewol( .slleps dna senur rehto ot derapmoc ytiroirP ;                     4 = ytiroirPaerAS
)elbasid ot 0( .mrala na reggirt ot senur fo tnuoma ehT ;                        0 = mralAaerAS
)elbasid ot 0( .yub ro wardhtiw ot tnaw uoy senur fo tnuoma ehT ;                        052 = xaMaerAS
.llifer og ot evael lliw uoy hcihw ta senur fo tnuoma ehT ;                         05 = niMaerAS
)eslaf/eurt( ?enur siht esu ot tnaw uoy oD ;                   eurt = delbanEaerAS
.enur eht fo ,di meti ro ,emaN ;         enur rewohs enots = emaNaerAS

knom ,namahs cro ,reklats ,naicigam krad ,retnuh ,tsitneics dam ,oreh ,ssetseirp ,nomed karaksa ,ecnirp karaksa ,drol karaksa = stegraTaerA
.lleps siht tsac ot ,woleb tsil eht ni ,serutaerc fo htlaeh muminim ehT ;                         0 = PHniMaerA
.lleps siht tsac ot ,woleb tsil eht ni ,serutaerc fo htlaeh mumixam ehT ;                       001 = PHxaMaerA
)elbasid ot 0( .gnikcatta nigeb ot ,woleb tsil eht ni ,serutaerc fo tnuoma muminim ehT ;                     3 = niMtegraTaerA
)tnatropmi erom si rewol( .slleps dna senur rehto ot derapmoc ytiroirP ;                      3 = ytiroirPaerA
)elbasid ot 0( .mrala na reggirt ot senur fo tnuoma ehT ;                         0 = mralAaerA
)elbasid ot 0( .yub ro wardhtiw ot tnaw uoy senur fo tnuoma ehT ;                         052 = xaMaerA
.llifer og ot evael lliw uoy hcihw ta senur fo tnuoma ehT ;                          05 = niMaerA
)eslaf/eurt( ?enur siht esu ot tnaw uoy oD ;                    eurt = delbanEaerA
.enur eht fo ,di meti ro ,emaN ;        enur llaberif taerg = emaNaerA
]senuR[

)elbasid ot 0( .mrala na reggirt ot snoitop fo tnuoma ehT ;                         0 = mralAanaM
)elbasid ot 0( .yub ro wardhtiw ot tnaw uoy snoitop fo tnuoma ehT ;                         004 = xaManaM
.llifer og ot evael lliw uoy hcihw ta snoitop fo tnuoma ehT ;                         571 = niManaM
)!siht egnahc uoy fi troppuS ruoy etadpU( .noitop eht fo ,di meti ro ,emaN ;          noitop anam taerg = emaNanaM
]snoitoP[

)elbasid ot 0( .mrala na reggirt ot doof fo tnuoma ehT ;                         0 = mralAdooF
)elbasid ot 0( .yub ro wardhtiw ot tnaw uoy doof fo tnuoma ehT ;                          08 = xaMdooF
.llifer og ot evael lliw uoy hcihw ta doof fo tnuoma ehT ;                          02 = niMdooF
.doof eht fo ,di meti ro ,emaN ;             moorhsum nworb = emaNdooF
]dooF[

)elbasid ot 0( .niaga gnirul trats ot serutaerc delliknu fo tnuoma ehT ;                             0 = litnU
)9-0( .redisnoc ot stegrat eht fo ytiroirp muminiM ;                       1 = ytiroirPniM
)eslaf/eurt( .serutaerc erul uoy sa tool dna tegrat ,delbane nehW ;               eslaf = eruLelihWkcattA
)elbasid ot 0( .edom erul etavitca ot serutaerc fo tnuoma ehT ;                            0 = tnuomA
]eruL[

)eslaf/modnar/eurt( .etuor roolf driht tsae eht hguorht seunitnoc retcarahc eht rehtehW ;              eslaf = roolF-drihT-tsaE
)eslaf/modnar/eurt( .etuor roolf dnoces tsae eht hguorht seunitnoc retcarahc eht rehtehW ;             eslaf = roolF-dnoceS-tsaE
)eslaf/modnar/eurt( .etuor roolf driht tsew eht hguorht seunitnoc retcarahc eht rehtehW ;              eslaf = roolF-drihT-tseW
)eslaf/modnar/eurt( .etuor roolf dnoces tsew eht hguorht seunitnoc retcarahc eht rehtehW ;             eslaf = roolF-dnoceS-tseW
]etuoR[

gnir thgim ,remmah raw ,koobeton llams ,eryl ,drows dednah owt ,gnir gniddew ,epor ,cinut neerg ,exa elbuod ,elacs nogard neerg ,rehtael nogard neerg ,sgel etalp ,drowsdaorb ,temleh leets ,drowsgnol ,liat s'nogard ,wobssorc ,dleihs leets ,etulf nedoow ,dleihs kcalb ,llab latsyrc ,ecalkcen latsyrc ,ebor hsitluc ,moorhsum doow ,breh gnils ,breh redwop ,ssarg taog ,dooh kcalb ,yrasor krad ,ecalkcen nogard ,temleh ssarb ,reviuq s'retnuh ,romra ssarb ,wob ,gnir ygrene ,dleihs leets ,temleh leets = tsiLkcalB-tooL
htolc fo eceip der ,nolat ,sevolg repins ,yhport flow ,yhport noil ,tohsgnils ,yhport reed ,ybur llams ,knab yggip ,rats nissassa ,rolav fo drows ,temleh nedlog = tsiLetihW-tooL
)elbasid ot 0( .tool ot ,meti rep ,thgiew mumixam ehT ;                   0 = thgieW-xaM-tooL
)elbasid ot 0( .tool ot ,meti rep ,eulav muminim ehT ;                   01 = eulaV-niM-tooL
)eslaf/eurt( ?dlog tool ot tnaw uoy oD ;                      eurt = dloG-tooL
)tsal/tsrif( .serutaerc tool uoy hcihw ni redro ehT ;                     tsal = elytS-tooL
)eslaf/eurt( ?tool lles yllacitamotua ot tnaw uoy oD ;                       eurt = lleS-cpN
]tooL[

)eslaf/eurt( ?erutaerc elbisivni na yb kcuts nehw lleps a tsac yllacitamotua ot tnaw uoy oD ;              eslaf = kcutS-itnA-sivnI
)eslaf/eurt( ?nwot ot gninruter nehw snoitidnoc lufmrah eruc yllacitamotua ot tnaw uoy oD ;               eslaf = snoitidnoC-eruC
)eslaf/eurt( .TSBX eht ni retoohs edirrevo ton lliw tpircs ,yllaunam retoohScigaM toBoneX eht erugifnoc ot elbanE ;                eslaf = retoohS-launaM
)eslaf/eurt( ?hcnual no skcapkcab ruoy fo stnetnoc eht ezinagro yllacitamotua ot tnaw uoy oD ;             eurt = skcapkcaB-ezinagrO
)eslaf/eurt( ?skcapkcab ruoy eziminim ot tnaw uoy oD ;             eurt = skcapkcaB-eziminiM
)eslaf/eurt( ?toped eziminim ot tnaw uoy oD ;                 eurt = topeD-eziminiM
)eslaf/eurt( ?slawardhtiw ecnalab knab CPN no yler ro ,stsoc ylppus rof knab eht ot klaW ;                 eslaf = sknaB-oT-klaW
]lareneG[

173fc4df999c7c40ab61ee60f69215da:: ;
toBoneX rof raW nomeD nordE ;]])
local LIB_PRICES_CONFIG = [[; Market prices for official XenoBot scripts
; ::a9d428293c579bc4f8ca9f45bad18249

; These prices are loaded by every char
[Default]
"golden helmet" = 250
"dragon scale legs" = 3000

; These prices are loaded only if your character name is "Character One".
; Change the name to your character name.
[Character One]
"longsword" = 25

[Character Two]
"pickaxe" = 2
]]
local FOLDER_SETTINGS_PATH = '..\\Settings\\'
local FOLDER_LOGS_PATH = '..\\Log\\'
local FOLDER_CONFIG_PATH = '..\\Configs\\'
local MASTER_CONFIG_PATH = '..\\Scripts.ini'
local PRICES_CONFIG_PATH = '..\\Prices.ini'

local NORTH = NORTH
local EAST = EAST
local SOUTH = SOUTH
local WEST = WEST
local SOUTHWEST = SOUTHWEST
local SOUTHEAST = SOUTHEAST
local NORTHWEST = NORTHWEST
local NORTHEAST = NORTHEAST

local CREATURES_LOW = CREATURES_LOW
local CREATURES_HIGH = CREATURES_HIGH

local TIMER_TICK = TIMER_TICK
local WALKER_SELECTLABEL = WALKER_SELECTLABEL
local ERROR_MESSAGE = ERROR_MESSAGE
local LOOT_MESSAGE = LOOT_MESSAGE
local BATTLE_MESSAGE = BATTLE_MESSAGE
local EVENT_SELF_CHANNELSPEECH = EVENT_SELF_CHANNELSPEECH
local LOGOUT_COMMAND = LOGOUT_COMMAND
local EVENT_SELF_CHANNELCLOSE = EVENT_SELF_CHANNELCLOSE
local PRIVATE_MESSAGE = PRIVATE_MESSAGE
local NPC_MESSAGE = NPC_MESSAGE
local CONTAINER_OPEN = CONTAINER_OPEN

local CHANNEL_ORANGE = CHANNEL_ORANGE
local CHANNEL_YELLOW = CHANNEL_YELLOW
local CHANNEL_RED = CHANNEL_RED

local EVENT_LABEL = 'label'
local EVENT_ERROR = 'error'
local EVENT_BATTLE = 'battle'
local EVENT_LOOT = 'loot'
local EVENT_NPC = 'npc'
local EVENT_COMMAND = 'command'
local EVENT_PATH_END = 'pathend'
local EVENT_DEPOT_END = 'depotend'
local EVENT_CONTAINER = 'container'

local DELAY = {}
DELAY.WALKER_TIMEOUT = 2 * 60 * 1000
DELAY.USE_EQUIPMENT = 800
DELAY.CONTAINER_MOVE_ITEM = 500
DELAY.CONTAINER_USE_ITEM = 1000
DELAY.CONTAINER_USEWITH = 1500
DELAY.MAP_USE_ITEM = {1000, 1200}
DELAY.CONTAINER_BACK = 300
DELAY.BROWSE_FIELD = 800
DELAY.FOLLOW_WAIT = 2000
DELAY.TRADE_TRANSACTION = 500
DELAY.RANGE_TALK = {700, 1200}
DELAY.CLEAN_CONTAINERS_INTERVAL = 5 * 60 * 1000
DELAY.AlARM_INTERVAL = 10 * 1000
DELAY.CONTAINER_TIMEOUT = 3000
DELAY.CONTAINER_WAIT = {100, 1000}
DELAY.ANTILURE_DELAY = {6000, 10000}

local THROTTLE_CLEAR_PATH = {limit=2000, last=0}
local THROTTLE_CAP_DROP = {limit=7000, last=0}

local ERROR_CONTAINER_FULL = 'You cannot put more objects in this container.'
local ERROR_NOT_POSSIBLE = 'Sorry, not possible.'

local ITEMID = {
	SPIDER_WEB = 182,
	SOFTBOOTS_ACTIVE = 3549,
	SOFTBOOTS = 6529,
	SOFTBOOTS_WORN = 6530,
	OBSIDIAN_KNIFE = 5908,
	BLESSED_STAKE = 5942,
	FISHING_ROD = 3483,
	MECHANICAL_ROD = 9306,
	ADVENTURERS_STONE = 16277,
	GOLDEN_MUG = 2903,
	RUST_REMOVER = 9016
}

local PRICE = {}
PRICE.SOFTBOOTS_REFILL = 10000
PRICE.BACKPACK = 20

local PATTERN = {
	XML_ATTR = "(%w+)=([\"'])(.-)%2",
	XML_TAG = "<(%/?)([%w:]+)(.-)(%/?)>",
	LABEL_PATH = "(.+)%~(.+)"
}

local CONT_NAME_LOCKER = "Locker"
local CONT_NAME_DEPOT = "Depot Chest"

local SUPPLY_CHECK_THRESHOLD = 3

local LOG_STATUS = 'STATUS'
local LOG_WARNING = 'WARNING'
local LOG_ERROR = 'ERROR'
local LOG_PROMPT = 'PROMPT'

local TOWN_POSITIONS = {
	{name='Venore', x=32940, y=32081},
	{name='Edron', x=33209, y=31829},
	{name='Carlin', x=32350, y=31799},
	{name='Ankrahmun', x=33151, y=32825},
	{name='Darashia', x=33236, y=32431},
	{name='Liberty Bay', x=32314, y=32828},
	{name='Thais', x=32367, y=32223},
	{name='Svargrond', x=32248, y=31145},
	{name='Ab\'dendriel', x=32675, y=31651},
	{name='Port Hope', x=32628, y=32770},
	{name='Yalahar', x=32802, y=31204},
	{name='Farmine', x=33022, y=31513},
	{name='Gray Island', x=33458, y=31320},
	{name='Kazordoon', x=32630, y=31923},
	{name='Gnomebase', x=32797, y=31776},
	{name='Rathleton', x=33626, y=31894}
}

local THEME = {
	light = {
		title = {255, 255, 255},
		primary = {255, 243, 204},
		secondary = {206, 206, 206}
	},
	dark = {
		title = {255, 255, 255},
		primary = {135, 135, 135},
		secondary = {206, 206, 206}
	},
	orange = {
		title = {255, 255, 255},
		primary = {240, 199, 166},
		secondary = {206, 206, 206}
	},
	pink = {
		title = {255, 255, 255},
		primary = {242, 193, 193},
		secondary = {206, 206, 206}
	},
	green = {
		title = {255, 255, 255},
		primary = {193, 240, 183},
		secondary = {206, 206, 206}
	},
	blue = {
		title = {255, 255, 255},
		primary = {135, 210, 207},
		secondary = {206, 206, 206}
	},
	purple = {
		title = {255, 255, 255},
		primary = {247, 225, 252},
		secondary = {206, 206, 206}
	}
}

-- True = 'town|depot~loot'
-- Name = 'town|depot~loot.name'
local SELLABLE_LOOT = {
	['thais'] = {
		[3274] = true, -- axe
		[3266] = true, -- battle axe
		[3305] = true, -- battle hammer
		[3413] = true, -- battle shield
		[3337] = true, -- bone club
		[3338] = true, -- bone sword
		[3359] = true, -- brass armor
		[3354] = true, -- brass helmet
		[3372] = true, -- brass legs
		[3411] = true, -- brass shield
		[3283] = true, -- carlin sword
		[3358] = true, -- chain armor
		[3352] = true, -- chain helmet
		[3558] = true, -- chain legs
		[3270] = true, -- club
		[3562] = true, -- coat
		[3430] = true, -- copper shield
		[3304] = true, -- crowbar
		[3267] = true, -- dagger
		[3275] = true, -- double axe
		[3379] = true, -- doublet
		[3425] = true, -- dwarven shield
		[3269] = true, -- halberd
		[3268] = true, -- hand axe
		[3276] = true, -- hatchet
		[3353] = true, -- iron helmet
		[3561] = true, -- jacket
		[3300] = true, -- katana
		[3361] = true, -- leather armor
		[3552] = true, -- leather boots
		[3355] = true, -- leather helmet
		[3559] = true, -- leather legs
		[3374] = true, -- legion helmet
		[3285] = true, -- long sword
		[3286] = true, -- mace
		[3282] = true, -- morning star
		[3316] = true, -- orcish axe
		[3357] = true, -- plate armor
		[3557] = true, -- plate legs
		[3410] = true, -- plate shield
		[3272] = true, -- rapier
		[3273] = true, -- sabre
		[3377] = true, -- scale armor
		[3294] = true, -- short sword
		[3293] = true, -- sickle
		[3462] = true, -- small axe
		[3375] = true, -- soldier helmet
		[3409] = true, -- steel shield
		[3378] = true, -- studded armor
		[3336] = true, -- studded club
		[3376] = true, -- studded helmet
		[3362] = true, -- studded legs
		[3426] = true, -- studded shield
		[17824] = true, -- swampling club
		[3264] = true, -- sword
		[3298] = true, -- throwing knife
		[3265] = true, -- two handed sword
		[3367] = true, -- viking helmet
		[3412] = true -- wooden shield
	},
	['svargrond'] = {
		[3274] = true, -- axe
		[3266] = true, -- battle axe
		[3305] = true, -- battle hammer
		[3413] = true, -- battle shield
		[3337] = true, -- bone club
		[3338] = true, -- bone sword
		[3350] = true, -- bow
		[3359] = true, -- brass armor
		[3354] = true, -- brass helmet
		[3372] = true, -- brass legs
		[3411] = true, -- brass shield
		[3283] = true, -- carlin sword
		[3358] = true, -- chain armor
		[3352] = true, -- chain helmet
		[3558] = true, -- chain legs
		[3270] = true, -- club
		[3562] = true, -- coat
		[3430] = true, -- copper shield
		[3349] = true, -- crossbow
		[3304] = true, -- crowbar
		[3267] = true, -- dagger
		[3275] = true, -- double axe
		[3379] = true, -- doublet
		[3425] = true, -- dwarven shield
		[3269] = true, -- halberd
		[3268] = true, -- hand axe
		[3276] = true, -- hatchet
		[3353] = true, -- iron helmet        
		[3561] = true, -- jacket
		[3300] = true, -- katana
		[3361] = true, -- leather armor
		[3552] = true, -- leather boots
		[3355] = true, -- leather helmet
		[3559] = true, -- leather legs
		[3374] = true, -- legion helmet
		[3285] = true, -- long sword
		[3286] = true, -- mace
		[3282] = true, -- morning star
		[3316] = true, -- orcish axe
		[3357] = true, -- plate armor
		[3557] = true, -- plate legs
		[3410] = true, -- plate shield
		[3272] = true, -- rapier
		[3273] = true, -- sabre
		[3377] = true, -- scale armor
		[3294] = true, -- short sword
		[3293] = true, -- sickle
		[3462] = true, -- small axe
		[3375] = true, -- soldier helmet
		[3277] = true, -- spear
		[3351] = true, -- steel helmet
		[3409] = true, -- steel shield
		[3378] = true, -- studded armor
		[3336] = true, -- studded club
		[3376] = true, -- studded helmet
		[3362] = true, -- studded legs
		[3426] = true, -- studded shield
		[17824] = true, -- swampling club
		[3264] = true, -- sword
		[3298] = true, -- throwing knife
		[3265] = true, -- two handed sword
		[3367] = true, -- viking helmet
		[3431] = true, -- viking shield
		[3412] = true -- wooden shield
	},
	['port hope'] = {
		[3274] = true, -- axe
		[11511] = true, -- banana sash
		[3266] = true, -- battle axe
		[3305] = true, -- battle hammer
		[3413] = true, -- battle shield
		[3337] = true, -- bone club
		[3338] = true, -- bone sword
		[3350] = true, -- bow
		[3359] = true, -- brass armor
		[3354] = true, -- brass helmet
		[3372] = true, -- brass legs
		[3411] = true, -- brass shield
		[3283] = true, -- carlin sword
		[3358] = true, -- chain armor
		[3352] = true, -- chain helmet
		[3558] = true, -- chain legs
		[3407] = true, -- charmer's tiara
		[3270] = true, -- club
		[3562] = true, -- coat
		[3430] = true, -- copper shield
		[3556] = true, -- crocodile boots
		[3349] = true, -- crossbow
		[3304] = true, -- crowbar
		[3267] = true, -- dagger
		[3275] = true, -- double axe
		[3379] = true, -- doublet
		[3425] = true, -- dwarven shield
		[3406] = true, -- feather headdress
		[3269] = true, -- halberd
		[3268] = true, -- hand axe
		[3276] = true, -- hatchet
		[3405] = true, -- horseman helmet
		[3353] = true, -- iron helmet        
		[3561] = true, -- jacket
		[3300] = true, -- katana
		[11471] = true, -- kongra's shoulderpad
		[3361] = true, -- leather armor
		[3552] = true, -- leather boots
		[3355] = true, -- leather helmet
		[3559] = true, -- leather legs
		[3374] = true, -- legion helmet
		[3285] = true, -- long sword
		[3286] = true, -- mace
		[3282] = true, -- morning star
		[3316] = true, -- orcish axe
		[3357] = true, -- plate armor
		[3557] = true, -- plate legs
		[3410] = true, -- plate shield
		[3272] = true, -- rapier
		[3346] = true, -- ripper lance
		[3273] = true, -- sabre
		[3445] = true, -- salamander shield
		[3377] = true, -- scale armor
		[3444] = true, -- sentinel shield
		[3294] = true, -- short sword
		[3293] = true, -- sickle
		[3462] = true, -- small axe
		[3375] = true, -- soldier helmet
		[3351] = true, -- steel helmet
		[3409] = true, -- steel shield
		[3378] = true, -- studded armor
		[3336] = true, -- studded club
		[3376] = true, -- studded helmet
		[3362] = true, -- studded legs
		[3426] = true, -- studded shield
		[17824] = true, -- swampling club
		[3264] = true, -- sword
		[3345] = true, -- templar scytheblade
		[3298] = true, -- throwing knife
		[3265] = true, -- two handed sword
		[3367] = true, -- viking helmet
		[3431] = true, -- viking shield
		[3412] = true -- wooden shield
	},
	['liberty bay'] = {
		[3274] = true, -- axe
		[3266] = true, -- battle axe
		[3305] = true, -- battle hammer
		[3413] = true, -- battle shield
		[3337] = true, -- bone club
		[3338] = true, -- bone sword
		[3350] = true, -- bow
		[3359] = true, -- brass armor
		[3354] = true, -- brass helmet
		[3372] = true, -- brass legs
		[3411] = true, -- brass shield
		[3283] = true, -- carlin sword
		[3358] = true, -- chain armor
		[3352] = true, -- chain helmet
		[3558] = true, -- chain legs
		[3270] = true, -- club
		[3562] = true, -- coat
		[3430] = true, -- copper shield
		[3349] = true, -- crossbow
		[3304] = true, -- crowbar
		[3267] = true, -- dagger
		[3275] = true, -- double axe
		[3379] = true, -- doublet
		[3425] = true, -- dwarven shield
		[3269] = true, -- halberd
		[3268] = true, -- hand axe
		[3276] = true, -- hatchet
		[3353] = true, -- iron helmet        
		[3561] = true, -- jacket
		[3300] = true, -- katana
		[3361] = true, -- leather armor
		[3552] = true, -- leather boots
		[3355] = true, -- leather helmet
		[3559] = true, -- leather legs
		[3374] = true, -- legion helmet
		[3285] = true, -- long sword
		[3286] = true, -- mace
		[3282] = true, -- morning star
		[3316] = true, -- orcish axe
		[3357] = true, -- plate armor
		[3557] = true, -- plate legs
		[3410] = true, -- plate shield
		[3272] = true, -- rapier
		[3273] = true, -- sabre
		[3377] = true, -- scale armor
		[3294] = true, -- short sword
		[3293] = true, -- sickle
		[3462] = true, -- small axe
		[3375] = true, -- soldier helmet
		[3409] = true, -- steel shield
		[3378] = true, -- studded armor
		[3336] = true, -- studded club
		[3376] = true, -- studded helmet
		[3362] = true, -- studded legs
		[3426] = true, -- studded shield
		[17824] = true, -- swampling club
		[3264] = true, -- sword
		[3298] = true, -- throwing knife
		[3265] = true, -- two handed sword
		[3367] = true, -- viking helmet
		[3431] = true, -- viking shield
		[3412] = true -- wooden shield
	},
	['edron'] = {
		[3274] = true, -- axe
		[3317] = true, -- barbarian axe
		[3266] = true, -- battle axe
		[3305] = true, -- battle hammer
		[3413] = true, -- battle shield
		[3337] = true, -- bone club
		[3338] = true, -- bone sword
		[3350] = true, -- bow
		[3359] = true, -- brass armor
		[3354] = true, -- brass helmet
		[3372] = true, -- brass legs
		[3411] = true, -- brass shield
		[3283] = true, -- carlin sword
		[3358] = true, -- chain armor
		[3352] = true, -- chain helmet
		[3558] = true, -- chain legs
		[3311] = true, -- clerical mace
		[3270] = true, -- club
		[3562] = true, -- coat
		[3430] = true, -- copper shield
		[3349] = true, -- crossbow
		[3304] = true, -- crowbar
		[3267] = true, -- dagger
		[3275] = true, -- double axe
		[3379] = true, -- doublet
		[3425] = true, -- dwarven shield
		[3269] = true, -- halberd
		[3268] = true, -- hand axe
		[3276] = true, -- hatchet
		[3353] = true, -- iron helmet
		[3561] = true, -- jacket
		[3300] = true, -- katana
		[3361] = true, -- leather armor
		[3552] = true, -- leather boots
		[3355] = true, -- leather helmet
		[3559] = true, -- leather legs
		[3374] = true, -- legion helmet
		[3285] = true, -- long sword
		[3286] = true, -- mace
		[3282] = true, -- morning star
		[3316] = true, -- orcish axe
		[3357] = true, -- plate armor
		[3557] = true, -- plate legs
		[3410] = true, -- plate shield
		[3272] = true, -- rapier
		[3273] = true, -- sabre
		[3377] = true, -- scale armor
		[3294] = true, -- short sword
		[3293] = true, -- sickle
		[3462] = true, -- small axe
		[3375] = true, -- soldier helmet
		[3277] = true, -- spear
		[3351] = true, -- steel helmet
		[3409] = true, -- steel shield
		[3378] = true, -- studded armor
		[3336] = true, -- studded club
		[3376] = true, -- studded helmet
		[3362] = true, -- studded legs
		[3426] = true, -- studded shield
		[17824] = true, -- swampling club
		[3264] = true, -- sword
		[3298] = true, -- throwing knife
		[3265] = true, -- two handed sword
		[3367] = true, -- viking helmet
		[3412] = true -- wooden shield
	},
	['venore'] = {
		[3274] = 'romella', -- axe
		[3266] = 'romella', -- battle axe
		[3305] = 'romella', -- battle hammer
		[3337] = 'romella', -- bone club
		[3338] = 'romella', -- bone sword
		[3283] = 'romella', -- carlin sword
		[3270] = 'romella', -- club
		[3304] = 'romella', -- crowbar
		[3267] = 'romella', -- dagger
		[3275] = 'romella', -- double axe
		[3269] = 'romella', -- halberd
		[3268] = 'romella', -- hand axe
		[3276] = 'romella', -- hatchet
		[3300] = 'romella', -- katana
		[3285] = 'romella', -- long sword
		[3286] = 'romella', -- mace
		[3282] = 'romella', -- morning star
		[3316] = 'romella', -- orcish axe
		[3272] = 'romella', -- rapier
		[3273] = 'romella', -- sabre
		[3294] = 'romella', -- short sword
		[3462] = 'romella', -- small axe
		[3293] = 'romella', -- sickle
		[3336] = 'romella', -- studded club
		[17824] = 'romella', -- swampling club
		[3264] = 'romella', -- sword
		[3298] = 'romella', -- throwing knife
		[3265] = 'romella', -- two handed sword

		[3413] = 'yanni', -- battle shield
		[3359] = 'yanni', -- brass armor
		[3354] = 'yanni', -- brass helmet
		[3372] = 'yanni', -- brass legs
		[3411] = 'yanni', -- brass shield
		[3358] = 'yanni', -- chain armor
		[3352] = 'yanni', -- chain helmet
		[3558] = 'yanni', -- chain legs
		[3562] = 'yanni', -- coat
		[3430] = 'yanni', -- copper shield
		[3379] = 'yanni', -- doublet
		[3425] = 'yanni', -- dwarven shield
		[3353] = 'yanni', -- iron helmet
		[3561] = 'yanni', -- jacket
		[3361] = 'yanni', -- leather armor
		[3552] = 'yanni', -- leather boots
		[3355] = 'yanni', -- leather helmet
		[3559] = 'yanni', -- leather legs
		[3374] = 'yanni', -- legion helmet
		[3357] = 'yanni', -- plate armor
		[3557] = 'yanni', -- plate legs
		[3410] = 'yanni', -- plate shield
		[3377] = 'yanni', -- scale armor
		[3375] = 'yanni', -- soldier helmet
		[3409] = 'yanni', -- steel shield
		[3378] = 'yanni', -- studded armor
		[3376] = 'yanni', -- studded helmet
		[3362] = 'yanni', -- studded legs
		[3426] = 'yanni', -- studded shield
		[3367] = 'yanni', -- viking helmet
		[3412] = 'yanni' -- wooden shield
	},
	['darashia'] = {
		[3274] = 'habdel', -- axe
		[3266] = 'habdel', -- battle axe
		[3305] = 'habdel', -- battle hammer
		[3337] = 'habdel', -- bone club
		[3338] = 'habdel', -- bone sword
		[3283] = 'habdel', -- carlin sword
		[3270] = 'habdel', -- club
		[3304] = 'habdel', -- crowbar
		[3267] = 'habdel', -- dagger
		[3275] = 'habdel', -- double axe
		[3269] = 'habdel', -- halberd
		[3268] = 'habdel', -- hand axe
		[3276] = 'habdel', -- hatchet
		[3300] = 'habdel', -- katana
		[3285] = 'habdel', -- long sword
		[3286] = 'habdel', -- mace
		[3282] = 'habdel', -- morning star
		[3316] = 'habdel', -- orcish axe
		[3272] = 'habdel', -- rapier
		[3273] = 'habdel', -- sabre
		[3294] = 'habdel', -- short sword
		[3462] = 'habdel', -- small axe
		[3293] = 'habdel', -- sickle
		[3336] = 'habdel', -- studded club
		[17824] = 'habdel', -- swampling club
		[3264] = 'habdel', -- sword
		[3298] = 'habdel', -- throwing knife
		[3265] = 'habdel', -- two handed sword

		[3413] = 'azil', -- battle shield
		[3359] = 'azil', -- brass armor
		[3354] = 'azil', -- brass helmet
		[3372] = 'azil', -- brass legs
		[3411] = 'azil', -- brass shield
		[3358] = 'azil', -- chain armor
		[3352] = 'azil', -- chain helmet
		[3558] = 'azil', -- chain legs
		[3562] = 'azil', -- coat
		[3430] = 'azil', -- copper shield
		[3379] = 'azil', -- doublet
		[3425] = 'azil', -- dwarven shield
		[3353] = 'azil', -- iron helmet
		[3561] = 'azil', -- jacket
		[3361] = 'azil', -- leather armor
		[3552] = 'azil', -- leather boots
		[3355] = 'azil', -- leather helmet
		[3559] = 'azil', -- leather legs
		[3374] = 'azil', -- legion helmet
		[3357] = 'azil', -- plate armor
		[3557] = 'azil', -- plate legs
		[3410] = 'azil', -- plate shield
		[3377] = 'azil', -- scale armor
		[3375] = 'azil', -- soldier helmet
		[3409] = 'azil', -- steel shield
		[3378] = 'azil', -- studded armor
		[3376] = 'azil', -- studded helmet
		[3362] = 'azil', -- studded legs
		[3351] = 'azil', -- steel helmet
		[3426] = 'azil', -- studded shield
		[3367] = 'azil', -- viking helmet
		[3431] = 'azil', -- viking helmet
		[3412] = 'azil' -- wooden shield
	},
	['ankrahmun'] = {
		[3274] = true, --axe
		[3266] = true, --battle axe
		[3305] = true, --battle hammer
		[3413] = true, --battle shield
		[3337] = true, --bone club
		[3338] = true, --bone sword
		[3359] = true, --brass armor
		[3354] = true, --brass helmet
		[3372] = true, --brass legs
		[3411] = true, --brass shield
		[3283] = true, --carlin sword
		[3358] = true, --chain armor
		[3352] = true, --chain helmet
		[3558] = true, --chain legs
		[3270] = true, --club
		[3562] = true, --coat
		[3430] = true, --copper shield
		[3304] = true, --crowbar
		[3267] = true, --dagger
		[3275] = true, --double axe
		[3379] = true, --doublet
		[3425] = true, --dwarven shield
		[3280] = true, --fire sword
		[3269] = true, --halberd
		[3268] = true, --hand axe
		[3276] = true, --hatchet
		[3353] = true, --iron helmet
		[3561] = true, --jacket
		[3300] = true, --katana
		[3361] = true, --leather armor
		[3552] = true, --leather boots
		[3355] = true, --leather helmet
		[3559] = true, --leather legs
		[3374] = true, --legion helmet
		[3285] = true, --longsword
		[3286] = true, --mace
		[3282] = true, --morning star
		[3316] = true, --orcish axe
		[3357] = true, --plate armor
		[3557] = true, --plate legs
		[3410] = true, --plate shield
		[3272] = true, --rapier
		[3273] = true, --sabre
		[3377] = true, --scale armor
		[3294] = true, --short sword
		[3293] = true, --sickle
		[3462] = true, --small axe
		[3375] = true, --soldier helmet
		[3351] = true, --steel helmet
		[3409] = true, --steel shield
		[3378] = true, --studded armor
		[3336] = true, --studded club
		[3376] = true, --studded helmet
		[3362] = true, --studded legs
		[3426] = true, --studded shield
		[17824] = true, --swampling club
		[3264] = true, --sword
		[3298] = true, --throwing knife
		[3265] = true, --two handed sword
		[3367] = true, --viking helmet
		[3431] = true, --viking shield
		[3412] = true, --wooden shield
		[3287] = true --throwing star
	},
	['yalahar'] = {
		[3274] = 'morpel', -- axe
		[3317] = 'morpel', -- barbarian axe
		[3266] = 'morpel', -- battle axe
		[3305] = 'morpel', -- battle hammer
		[3413] = 'morpel', -- battle shield
		[3337] = 'morpel', -- bone club
		[3338] = 'morpel', -- bone sword
		[3359] = 'morpel', -- brass armor
		[3354] = 'morpel', -- brass helmet
		[3372] = 'morpel', -- brass legs
		[3411] = 'morpel', -- brass shield
		[3283] = 'morpel', -- carlin sword
		[3358] = 'morpel', -- chain armor
		[3352] = 'morpel', -- chain helmet
		[3558] = 'morpel', -- chain legs
		[3311] = 'morpel', -- clerical mace
		[3270] = 'morpel', -- club
		[3562] = 'morpel', -- coat
		[3430] = 'morpel', -- copper shield
		[3304] = 'morpel', -- crowbar
		[3267] = 'morpel', -- dagger
		[3275] = 'morpel', -- double axe
		[3379] = 'morpel', -- doublet
		[3425] = 'morpel', -- dwarven shield
		[3269] = 'morpel', -- halberd
		[3268] = 'morpel', -- hand axe
		[3276] = 'morpel', -- hatchet
		[3353] = 'morpel', -- iron helmet
		[3561] = 'morpel', -- jacket
		[3300] = 'morpel', -- katana
		[3361] = 'morpel', -- leather armor
		[3552] = 'morpel', -- leather boots
		[3355] = 'morpel', -- leather helmet
		[3559] = 'morpel', -- leather legs
		[3374] = 'morpel', -- legion helmet
		[3285] = 'morpel', -- longsword
		[3286] = 'morpel', -- mace
		[3282] = 'morpel', -- morning star
		[3316] = 'morpel', -- orcish axe
		[3357] = 'morpel', -- plate armor
		[3557] = 'morpel', -- plate legs
		[3410] = 'morpel', -- plate shield
		[3272] = 'morpel', -- rapier
		[3273] = 'morpel', -- sabre
		[3377] = 'morpel', -- scale armor
		[3294] = 'morpel', -- short sword
		[3293] = 'morpel', -- sickle
		[3462] = 'morpel', -- small axe
		[3375] = 'morpel', -- soldier helmet
		[3351] = 'morpel', -- steel helmet
		[3409] = 'morpel', -- steel shield
		[3378] = 'morpel', -- studded armor
		[3336] = 'morpel', -- studded club
		[3376] = 'morpel', -- studded helmet
		[3362] = 'morpel', -- studded legs
		[3426] = 'morpel', -- studded shield
		[17824] = 'morpel', -- swampling club
		[3264] = 'morpel', -- sword
		[3298] = 'morpel', -- throwing knife
		[3265] = 'morpel', -- two handed sword
		[3367] = 'morpel', -- viking helmet
		[3431] = 'morpel', -- viking shield
		[3412] = 'morpel', -- wooden shield

		[3027] = 'oiriz', --black pearl
		[16119] = 'oiriz', --blue crystal shard
		[16124] = 'oiriz', --blue crystal splinter
		[16123] = 'oiriz', --brown crystal splinter
		[16125] = 'oiriz', --cyan crystal fragment
		[281] = 'oiriz', --giant shimmering pearl
		[282] = 'oiriz', --giant shimmering pearl
		[9058] = 'oiriz', --gold ingot
		[16127] = 'oiriz', --green crystal fragment
		[16121] = 'oiriz', --green crystal shard
		[16122] = 'oiriz', --green crystal splinter
		[16126] = 'oiriz', --red crystal fragment
		[3033] = 'oiriz', --small amethyst
		[3028] = 'oiriz', --small diamond
		[3032] = 'oiriz', --small emerald
		[3030] = 'oiriz', --small ruby
		[3029] = 'oiriz', --small sapphire
		[9057] = 'oiriz', --small topaz
		[16120] = 'oiriz', --violet crystal shard
		[3004] = 'oiriz', --wedding ring
		[3026] = 'oiriz' --white pearl
	},
	['farmine'] = {
		[3274] = 'esrik', --axe
		[3266] = 'esrik', --battle axe
		[3305] = 'esrik', --battle hammer
		[3413] = 'esrik', --battle shield
		[3337] = 'esrik', --bone club
		[10404] = 'esrik', --bone shoulderplate
		[3338] = 'esrik', --bone sword
		[3359] = 'esrik', --brass armor
		[3354] = 'esrik', --brass helmet
		[3372] = 'esrik', --brass legs
		[3411] = 'esrik', --brass shield
		[11660] = 'esrik', --broken draken mail
		[10418] = 'esrik', --broken halberd
		[11661] = 'esrik', --broken slicer
		[3283] = 'esrik', --carlin sword
		[3358] = 'esrik', --chain armor
		[3352] = 'esrik', --chain helmet
		[3558] = 'esrik', --chain legs
		[3270] = 'esrik', --club
		[3562] = 'esrik', --coat
		[3430] = 'esrik', --copper shield
		[3304] = 'esrik', --crowbar
		[10410] = 'esrik', --cursed shoulder spikes
		[3267] = 'esrik', --dagger
		[3275] = 'esrik', --double axe
		[3379] = 'esrik', --doublet
		[10391] = 'esrik', --drachaku
		[4033] = 'esrik', --draken boots
		[11659] = 'esrik', --draken wristbands
		[10388] = 'esrik', --drakinata
		[3425] = 'esrik', --dwarven shield
		[10323] = 'esrik', --guardian boots
		[3269] = 'esrik', --halberd
		[3268] = 'esrik', --hand axe
		[3276] = 'esrik', --hatchet
		[10416] = 'esrik', --high guard shoulderplates
		[3353] = 'esrik', --iron helmet
		[3561] = 'esrik', --jacket
		[3300] = 'esrik', --katana
		[3361] = 'esrik', --leather armor
		[3552] = 'esrik', --leather boots
		[3355] = 'esrik', --leather helmet
		[3559] = 'esrik', --leather legs
		[3374] = 'esrik', --legion helmet
		[3285] = 'esrik', --longsword
		[3286] = 'esrik', --mace
		[3282] = 'esrik', --morning star
		[3316] = 'esrik', --orcish axe
		[3357] = 'esrik', --plate armor
		[3557] = 'esrik', --plate legs
		[3410] = 'esrik', --plate shield
		[3272] = 'esrik', --rapier
		[10289] = 'esrik', --red lantern
		[3273] = 'esrik', --sabre
		[10386] = 'esrik', --sai
		[3377] = 'esrik', --scale armor
		[3294] = 'esrik', --short sword
		[3293] = 'esrik', --sickle
		[3462] = 'esrik', --small axe
		[3375] = 'esrik', --soldier helmet
		[10408] = 'esrik', --spiked iron ball
		[3271] = 'esrik', --spike sword
		[3351] = 'esrik', --steel helmet
		[3409] = 'esrik', --steel shield
		[3378] = 'esrik', --studded armor
		[3336] = 'esrik', --studded club
		[3376] = 'esrik', --studded helmet
		[3362] = 'esrik', --studded legs
		[3426] = 'esrik', --studded shield
		[17824] = 'esrik', --swampling club
		[3264] = 'esrik', --sword
		[3298] = 'esrik', --throwing knife
		[11657] = 'esrik', --twiceslicer
		[10392] = 'esrik', --twin hooks
		[3265] = 'esrik', --two handed sword
		[3367] = 'esrik', --viking helmet
		[3431] = 'esrik', --viking shield
		[10412] = 'esrik', --wailing widow's necklace
		[10405] = 'esrik', --warmaster's wristguards
		[3412] = 'esrik', --wooden shield
		[10384] = 'esrik', --zaoan armor
		[10406] = 'esrik', --zaoan halberd
		[10385] = 'esrik', --zaoan helmet
		[10387] = 'esrik', --zaoan legs
		[10386] = 'esrik', --zaoan shoes
		[10390] = 'esrik', --zaoan sword
		[10414] = 'esrik', --zaogun shoulderplates

		[3350] = 'pompan', --bow
		[10409] = 'pompan', --corrupted flag
		[3349] = 'pompan', --crossbow
		[10415] = 'pompan', --high guard flag
		[10417] = 'pompan', --legionnaire flags
		[10413] = 'pompan' --zaogun flag
	}
}

local TRAVEL_ROUTES = {
	['thais~venore'] = {
		cost = 170,
		transcript = {
			['Captain Bluebear'] = {'hi', 'venore', 'yes'}
		}
	},
	['thais~edron'] = {
		cost = 160,
		transcript = {
			['Captain Bluebear'] = {'hi', 'edron', 'yes'}
		}
	},
	['thais~carlin'] = {
		cost = 110,
		transcript = {
			['Captain Bluebear'] = {'hi', 'carlin', 'yes'}
		}
	},
	['thais~ab\'dendriel'] = {
		cost = 130,
		transcript = {
			['Captain Bluebear'] = {'hi', 'ab\'dendriel', 'yes'}
		}
	},
	['thais~port hope'] = {
		cost = 160,
		transcript = {
			['Captain Bluebear'] = {'hi', 'port hope', 'yes'}
		}
	},
	['thais~liberty bay'] = {
		cost = 330,
		transcript = {
			['Captain Bluebear'] = {'hi', 'edron', 'yes'},
			['Captain Seahorse'] = {'hi', 'thais', 'yes'}
		}
	},
	['thais~svargrond'] = {
		cost = 180,
		transcript = {
			['Captain Bluebear'] = {'hi', 'svargrond', 'yes'}
		}
	},
	['thais~yalahar'] = {
		cost = 200,
		transcript = {
			['Captain Bluebear'] = {'hi', 'yalahar', 'yes'}
		}
	},
	['thais~roshamuul'] = {
		cost = 210,
		transcript = {
			['Captain Bluebear'] = {'hi', 'roshamuul', 'yes'}
		}
	},
	['thais~oramond'] = {
		cost = 150,
		transcript = {
			['Captain Bluebear'] = {'hi', 'oramond', 'yes'}
		}
	},
	['thais~darashia'] = {
		cost = 340,
		transcript = {
			['Captain Bluebear'] = {'hi', 'port hope', 'yes'},
			['Charles'] = {'hi', 'darashia', 'yes'}
		}
	},
	['thais~ankrahmun'] = {
		cost = 270,
		transcript = {
			['Captain Bluebear'] = {'hi', 'port hope', 'yes'},
			['Charles'] = {'hi', 'ankrahmun', 'yes'}
		}
	},
	['thais~gray island'] = {
		cost = 320,
		transcript = {
			['Captain Bluebear'] = {'hi', 'edron', 'yes'},
			['Captain Seahorse'] = {'hi', 'gray island', 'yes'}
		}
	},
	['venore~thais'] = {
		cost = 170,
		transcript = {
			['Captain Fearless'] = {'hi', 'thais', 'yes'}
		}
	},
	['venore~carlin'] = {
		cost = 130,
		transcript = {
			['Captain Fearless'] = {'hi', 'carlin', 'yes'}
		}
	},
	['venore~ab\'dendriel'] = {
		cost = 90,
		transcript = {
			['Captain Fearless'] = {'hi', 'ab\'dendriel', 'yes'}
		}
	},
	['venore~port hope'] = {
		cost = 160,
		transcript = {
			['Captain Fearless'] = {'hi', 'port hope', 'yes'}
		}
	},
	['venore~edron'] = {
		cost = 40,
		transcript = {
			['Captain Fearless'] = {'hi', 'edron', 'yes'}
		}
	},
	['venore~darashia'] = {
		cost = 340,
		transcript = {
			['Captain Fearless'] = {'hi', 'port hope', 'yes'},
			['Charles'] = {'hi', 'darashia', 'yes'}
		}
	},
	['venore~liberty bay'] = {
		cost = 180,
		transcript = {
			['Captain Fearless'] = {'hi', 'liberty bay', 'yes'}
		}
	},
	['venore~svargrond'] = {
		cost = 150,
		transcript = {
			['Captain Fearless'] = {'hi', 'svargrond', 'yes'}
		}
	},
	['venore~yalahar'] = {
		cost = 185,
		transcript = {
			['Captain Fearless'] = {'hi', 'yalahar', 'yes'}
		}
	},
	['venore~gray island'] = {
		cost = 160,
		transcript = {
			['Captain Fearless'] = {'hi', 'gray island', 'yes'}
		}
	},
	['venore~oramond'] = {
		cost = 320,
		transcript = {
			['Captain Fearless'] = {'hi', 'thais', 'yes'},
			['Captain Bluebear'] = {'hi', 'oramond', 'yes'}
		}
	},
	['venore~roshamuul'] = {
		cost = 380,
		transcript = {
			['Captain Fearless'] = {'hi', 'thais', 'yes'},
			['Captain Bluebear'] = {'hi', 'roshamuul', 'yes'}
		}
	},
	['venore~ankrahmun'] = {
		cost = 150,
		transcript = {
			['Captain Fearless'] = {'hi', 'ankrahmun', 'yes'}
		}
	},
	['darashia~edron'] = {
		route = 'carpet',
		cost = 40,
		transcript = {
			['Chemar'] = {'hi', 'edron', 'yes'}
		}
	},
	['darashia~svargrond'] = {
		route = 'carpet',
		cost = 60,
		transcript = {
			['Chemar'] = {'hi', 'svargrond', 'yes'}
		}
	},
	['darashia~ankrahmun'] = {
		cost = 100,
		transcript = {
			['Petros'] = {'hi', 'ankrahmun', 'yes'}
		}
	},
	['darashia~liberty bay'] = {
		cost = 200,
		transcript = {
			['Petros'] = {'hi', 'liberty bay', 'yes'}
		}
	},
	['darashia~port hope'] = {
		cost = 180,
		transcript = {
			['Petros'] = {'hi', 'port hope', 'yes'}
		}
	},
	['darashia~venore'] = {
		cost = 60,
		transcript = {
			['Petros'] = {'hi', 'venore', 'yes'}
		}
	},
	['darashia~yalahar'] = {
		cost = 210,
		transcript = {
			['Petros'] = {'hi', 'yalahar', 'yes'}
		}
	},
	['darashia~thais'] = {
		cost = 230,
		transcript = {
			['Petros'] = {'hi', 'venore', 'yes'},
			['Captain Fearless'] = {'hi', 'thais', 'yes'}
		}
	},
	['darashia~roshamuul'] = {
		cost = 440,
		transcript = {
			['Petros'] = {'hi', 'venore', 'yes'},
			['Captain Fearless'] = {'hi', 'thais', 'yes'},
			['Captain Bluebear'] = {'hi', 'roshamuul', 'yes'}
		}
	},
	['darashia~oramond'] = {
		cost = 380,
		transcript = {
			['Petros'] = {'hi', 'venore', 'yes'},
			['Captain Fearless'] = {'hi', 'thais', 'yes'},
			['Captain Bluebear'] = {'hi', 'oramond', 'yes'}
		}
	},
	['darashia~ab\'dendriel'] = {
		cost = 150,
		transcript = {
			['Petros'] = {'hi', 'venore', 'yes'},
			['Captain Fearless'] = {'hi', 'ab\'dendriel', 'yes'}
		}
	},
	['darashia~carlin'] = {
		cost = 190,
		transcript = {
			['Petros'] = {'hi', 'venore', 'yes'},
			['Captain Fearless'] = {'hi', 'carlin', 'yes'}
		}
	},
	['darashia~gray island'] = {
		cost = 160,
		transcript = {
			['Petros'] = {'hi', 'gray island', 'yes'}
		}
	},
	['svargrond~darashia'] = {
		route = 'carpet',
		cost = 60,
		transcript = {
			['Iyad'] = {'hi', 'darashia', 'yes'}
		}
	},
	['svargrond~edron'] = {
		route = 'carpet',
		cost = 60,
		transcript = {
			['Iyad'] = {'hi', 'edron', 'yes'}
		}
	},
	['svargrond~venore'] = {
		cost = 150,
		transcript = {
			['Captain Breezelda'] = {'hi', 'venore', 'yes'}
		}
	},
	['svargrond~thais'] = {
		cost = 180,
		transcript = {
			['Captain Breezelda'] = {'hi', 'thais', 'yes'}
		}
	},
	['svargrond~carlin'] = {
		cost = 110,
		transcript = {
			['Captain Breezelda'] = {'hi', 'carlin', 'yes'}
		}
	},
	['svargrond~yalahar'] = {
		cost = 335,
		transcript = {
			['Captain Breezelda'] = {'hi', 'venore', 'yes'},
			['Captain Fearless'] = {'hi', 'yalahar', 'yes'}
		}
	},
	['svargrond~ab\'dendriel'] = {
		cost = 240,
		transcript = {
			['Captain Breezelda'] = {'hi', 'venore', 'yes'},
			['Captain Fearless'] = {'hi', 'ab\'dendriel', 'yes'}
		}
	},
	['svargrond~ankrahmun'] = {
		cost = 300,
		transcript = {
			['Captain Breezelda'] = {'hi', 'venore', 'yes'},
			['Captain Fearless'] = {'hi', 'ankrahmun', 'yes'}
		}
	},
	['svargrond~gray island'] = {
		cost = 310,
		transcript = {
			['Captain Breezelda'] = {'hi', 'venore', 'yes'},
			['Captain Fearless'] = {'hi', 'gray island', 'yes'}
		}
	},
	['svargrond~liberty bay'] = {
		cost = 330,
		transcript = {
			['Captain Breezelda'] = {'hi', 'venore', 'yes'},
			['Captain Fearless'] = {'hi', 'liberty bay', 'yes'}
		}
	},
	['svargrond~port hope'] = {
		cost = 310,
		transcript = {
			['Captain Breezelda'] = {'hi', 'venore', 'yes'},
			['Captain Fearless'] = {'hi', 'port hope', 'yes'}
		}
	},
	['svargrond~roshamuul'] = {
		cost = 390,
		transcript = {
			['Captain Breezelda'] = {'hi', 'thais', 'yes'},
			['Captain Bluebear'] = {'hi', 'roshamuul', 'yes'}
		}
	},
	['svargrond~oramond'] = {
		cost = 330,
		transcript = {
			['Captain Breezelda'] = {'hi', 'thais', 'yes'},
			['Captain Bluebear'] = {'hi', 'oramond', 'yes'}
		}
	},
	['svargrond~nibelor'] = {
		cost = 0,
		transcript = {
			['Iskan'] = {'hi', 'passage', 'yes'}
		}
	},
	['nibelor~svargrond'] = {
		cost = 0,
		transcript = {
			['Nilsor'] = {'hi', 'passage', 'yes'}
		}
	},
	['edron~thais'] = {
		cost = 160,
		transcript = {
			['Captain Seahorse'] = {'hi', 'thais', 'yes'}
		}
	},
	['edron~cormaya'] = {
		cost = 0,
		transcript = {
			['Captain Seahorse'] = {'hi', 'cormaya', 'yes'}
		}
	},
	['cormaya~edron'] = {
		cost = 0,
		transcript = {
			['Pemaret'] = {'hi', 'edron', 'yes'}
		}
	},
	['edron~ab\'dendriel'] = {
		cost = 70,
		transcript = {
			['Captain Seahorse'] = {'hi', 'ab\'dendriel', 'yes'}
		}
	},
	['edron~ankrahmun'] = {
		cost = 160,
		transcript = {
			['Captain Seahorse'] = {'hi', 'ankrahmun', 'yes'}
		}
	},
	['edron~carlin'] = {
		cost = 110,
		transcript = {
			['Captain Seahorse'] = {'hi', 'carlin', 'yes'}
		}
	},
	['edron~darashia'] = {
		route = 'carpet',
		cost = 40,
		transcript = {
			['Pino'] = {'hi', 'darashia', 'yes'}
		}
	},
	['edron~gray island'] = {
		cost = 160,
		transcript = {
			['Captain Seahorse'] = {'hi', 'gray island', 'yes'}
		}
	},
	['edron~liberty bay'] = {
		cost = 170,
		transcript = {
			['Captain Seahorse'] = {'hi', 'liberty bay', 'yes'}
		}
	},
	['edron~port hope'] = {
		cost = 150,
		transcript = {
			['Captain Seahorse'] = {'hi', 'port hope', 'yes'}
		}
	},
	['edron~roshamuul'] = {
		cost = 370,
		transcript = {
			['Captain Seahorse'] = {'hi', 'thais', 'yes'},
			['Captain Bluebear'] = {'hi', 'roshamuul', 'yes'}
		}
	},
	['edron~oramond'] = {
		cost = 310,
		transcript = {
			['Captain Seahorse'] = {'hi', 'thais', 'yes'},
			['Captain Bluebear'] = {'hi', 'oramond', 'yes'}
		}
	},
	['edron~svargrond'] = {
		route = 'carpet',
		cost = 60,
		transcript = {
			['Pino'] = {'hi', 'svargrond', 'yes'}
		}
	},
	['edron~venore'] = {
		cost = 190,
		transcript = {
			['Captain Seahorse'] = {'hi', 'venore', 'yes'},
			['Captain Fearless'] = {'hi', 'svargrond', 'yes'}
		}
	},
	['edron~yalahar'] = {
		cost = 225,
		transcript = {
			['Captain Seahorse'] = {'hi', 'venore', 'yes'},
			['Captain Fearless'] = {'hi', 'yalahar', 'yes'}
		}
	},
	['goroma~liberty bay'] = {
		cost = 0,
		transcript = {
			['Jack Fate'] = {'hi', 'liberty bay', 'yes'}
		}
	},
	['liberty bay~goroma'] = {
		cost = 0,
		transcript = {
			['Jack Fate'] = {'hi', 'goroma', 'yes'}
		}
	},
	['liberty bay~edron'] = {
		cost = 170,
		transcript = {
			['Jack Fate'] = {'hi', 'edron', 'yes'}
		}
	},
	['liberty bay~thais'] = {
		cost = 180,
		transcript = {
			['Jack Fate'] = {'hi', 'thais', 'yes'}
		}
	},
	['liberty bay~venore'] = {
		cost = 180,
		transcript = {
			['Jack Fate'] = {'hi', 'venore', 'yes'}
		}
	},
	['liberty bay~darashia'] = {
		cost = 200,
		transcript = {
			['Jack Fate'] = {'hi', 'darashia', 'yes'}
		}
	},
	['liberty bay~ankrahmun'] = {
		cost = 90,
		transcript = {
			['Jack Fate'] = {'hi', 'ankrahmun', 'yes'}
		}
	},
	['liberty bay~yalahar'] = {
		cost = 275,
		transcript = {
			['Jack Fate'] = {'hi', 'yalahar', 'yes'}
		}
	},
	['liberty bay~port hope'] = {
		cost = 50,
		transcript = {
			['Jack Fate'] = {'hi', 'port hope', 'yes'}
		}
	},
	['liberty bay~svargrond'] = {
		cost = 330,
		transcript = {
			['Jack Fate'] = {'hi', 'thais', 'yes'},
			['Captain Fearless'] = {'hi', 'svargrond', 'yes'}
		}
	},
	['liberty bay~ab\'dendriel'] = {
		cost = 270,
		transcript = {
			['Jack Fate'] = {'hi', 'venore', 'yes'},
			['Captain Fearless'] = {'hi', 'ab\'dendriel', 'yes'}
		}
	},
	['liberty bay~carlin'] = {
		cost = 290,
		transcript = {
			['Jack Fate'] = {'hi', 'thais', 'yes'},
			['Captain Bluebear'] = {'hi', 'carlin', 'yes'}
		}
	},
	['liberty bay~gray island'] = {
		cost = 330,
		transcript = {
			['Jack Fate'] = {'hi', 'edron', 'yes'},
			['Captain Seahorse'] = {'hi', 'gray island', 'yes'}
		}
	},
	['liberty bay~roshamuul'] = {
		cost = 320,
		transcript = {
			['Jack Fate'] = {'hi', 'thais', 'yes'},
			['Captain Bluebear'] = {'hi', 'roshamuul', 'yes'}
		}
	},
	['liberty bay~oramond'] = {
		cost = 260,
		transcript = {
			['Jack Fate'] = {'hi', 'thais', 'yes'},
			['Captain Bluebear'] = {'hi', 'oramond', 'yes'}
		}
	},
	['old adall~lorek'] = {
		cost = 0,
		transcript = {
			['Old Adall'] = {'hi', 'east', 'yes'}
		}
	},
	['lorek~banuta'] = {
		cost = 0,
		transcript = {
			['Lorek'] = {'hi', 'banuta', 'yes'}
		}
	},
	['lorek~mountain'] = {
		cost = 0,
		transcript = {
			['Lorek'] = {'hi', 'mountain', 'yes'}
		}
	},
	['mountain~forbidden lands'] = {
		cost = 0,
		transcript = {
			['The Blind Prophet'] = {'hi', 'transport', 'yes'}
		}
	},
	['liberty bay~meriana'] = {
		cost = 0,
		transcript = {
			['Captain Waverider'] = {'hi', 'peg leg', 'yes'}
		}
	},
	['meriana~liberty bay'] = {
		cost = 0,
		transcript = {
			['Sebastian'] = {'hi', 'passage', 'yes'}
		}
	},
	['port hope~ab\'dendriel'] = {
		cost = 250,
		transcript = {
			['Charles'] = {'hi', 'venore', 'yes'},
			['Captain Fearless'] = {'hi', 'ab\'dendriel', 'yes'}
		}
	},
	['port hope~svargrond'] = {
		cost = 310,
		transcript = {
			['Charles'] = {'hi', 'venore', 'yes'},
			['Captain Fearless'] = {'hi', 'svargrond', 'yes'}
		}
	},
	['port hope~roshamuul'] = {
		cost = 370,
		transcript = {
			['Charles'] = {'hi', 'thais', 'yes'},
			['Captain Bluebear'] = {'hi', 'roshamuul', 'yes'}
		}
	},
	['port hope~oramond'] = {
		cost = 310,
		transcript = {
			['Charles'] = {'hi', 'thais', 'yes'},
			['Captain Bluebear'] = {'hi', 'oramond', 'yes'}
		}
	},
	['port hope~carlin'] = {
		cost = 260,
		transcript = {
			['Charles'] = {'hi', 'edron', 'yes'},
			['Captain Seahorse'] = {'hi', 'carlin', 'yes'}
		}
	},
	['port hope~gray island'] = {
		cost = 210,
		transcript = {
			['Charles'] = {'hi', 'edron', 'yes'},
			['Captain Seahorse'] = {'hi', 'gray island', 'yes'}
		}
	},
	['port hope~ankrahmun'] = {
		cost = 110,
		transcript = {
			['Charles'] = {'hi', 'ankrahmun', 'yes'}
		}
	},
	['port hope~darashia'] = {
		cost = 180,
		transcript = {
			['Charles'] = {'hi', 'darashia', 'yes'}
		}
	},
	['port hope~edron'] = {
		cost = 150,
		transcript = {
			['Charles'] = {'hi', 'edron', 'yes'}
		}
	},
	['port hope~liberty bay'] = {
		cost = 50,
		transcript = {
			['Charles'] = {'hi', 'liberty bay', 'yes'}
		}
	},
	['port hope~thais'] = {
		cost = 160,
		transcript = {
			['Charles'] = {'hi', 'thais', 'yes'}
		}
	},
	['port hope~venore'] = {
		cost = 160,
		transcript = {
			['Charles'] = {'hi', 'venore', 'yes'}
		}
	},
	['port hope~yalahar'] = {
		cost = 260,
		transcript = {
			['Charles'] = {'hi', 'yalahar', 'yes'}
		}
	},
	['ankrahmun~darashia'] = {
		cost = 100,
		transcript = {
			['Captain Sinbeard'] = {'hi', 'darashia', 'yes'}
		}
	},
	['ankrahmun~venore'] = {
		cost = 150,
		transcript = {
			['Captain Sinbeard'] = {'hi', 'venore', 'yes'}
		}
	},
	['ankrahmun~liberty bay'] = {
		cost = 90,
		transcript = {
			['Captain Sinbeard'] = {'hi', 'liberty bay', 'yes'}
		}
	},
	['ankrahmun~port hope'] = {
		cost = 80,
		transcript = {
			['Captain Sinbeard'] = {'hi', 'port hope', 'yes'}
		}
	},
	['ankrahmun~yalahar'] = {
		cost = 230,
		transcript = {
			['Captain Sinbeard'] = {'hi', 'yalahar', 'yes'}
		}
	},
	['ankrahmun~edron'] = {
		cost = 150,
		transcript = {
			['Captain Sinbeard'] = {'hi', 'edron', 'yes'}
		}
	},
	['ankrahmun~thais'] = {
		cost = 320,
		transcript = {
			['Captain Sinbeard'] = {'hi', 'edron', 'yes'},
			['Captain Seahorse'] = {'hi', 'thais', 'yes'}
		}
	},

	['ankrahmun~roshamuul'] = {
		cost = 530,
		transcript = {
			['Captain Sinbeard'] = {'hi', 'edron', 'yes'},
			['Captain Seahorse'] = {'hi', 'thais', 'yes'},
			['Captain Bluebear'] = {'hi', 'roshamuul', 'yes'}
		}
	},
	['ankrahmun~oramond'] = {
		cost = 470,
		transcript = {
			['Captain Sinbeard'] = {'hi', 'edron', 'yes'},
			['Captain Seahorse'] = {'hi', 'thais', 'yes'},
			['Captain Bluebear'] = {'hi', 'oramond', 'yes'}
		}
	},
	['port hope~ab\'dendriel'] = {
		cost = 240,
		transcript = {
			['Captain Sinbeard'] = {'hi', 'venore', 'yes'},
			['Captain Fearless'] = {'hi', 'ab\'dendriel', 'yes'}
		}
	},
	['ankrahmun~carlin'] = {
		cost = 270,
		transcript = {
			['Captain Sinbeard'] = {'hi', 'edron', 'yes'},
			['Captain Seahorse'] = {'hi', 'carlin', 'yes'}
		}
	},
	['ankrahmun~gray island'] = {
		cost = 320,
		transcript = {
			['Captain Sinbeard'] = {'hi', 'edron', 'yes'},
			['Captain Seahorse'] = {'hi', 'gray island', 'yes'}
		}
	},
	['ankrahmun~svargrond'] = {
		cost = 300,
		transcript = {
			['Captain Sinbeard'] = {'hi', 'venore', 'yes'},
			['Captain Fearless'] = {'hi', 'svargrond', 'yes'}
		}
	},
	['yalahar~fenrock'] = {
		cost = 0,
		transcript = {
			['Maris'] = {'hi', 'fenrock', 'yes'}
		}
	},
	['fenrock~yalahar'] = {
		cost = 0,
		transcript = {
			['Maris'] = {'hi', 'yalahar', 'yes'}
		}
	},
	['yalahar~mistrock'] = {
		cost = 0,
		transcript = {
			['Maris'] = {'hi', 'mistrock', 'yes'}
		}
	},
	['mistrock~yalahar'] = {
		cost = 0,
		transcript = {
			['Maris'] = {'hi', 'yalahar', 'yes'}
		}
	},
	['yalahar~vengoth'] = {
		cost = 0,
		transcript = {
			['Harlow'] = {'hi', 'vengoth', 'yes'}
		}
	},
	['vengoth~yalahar'] = {
		cost = 0,
		transcript = {
			['Harlow'] = {'hi', 'yalahar', 'yes'}
		}
	},
	['yalahar~quaras'] = {
		cost = 0,
		transcript = {
			['Tarak'] = {'hi', 'trip', 'yes'}
		}
	},
	['quaras~yalahar'] = {
		cost = 0,
		transcript = {
			['Tarak'] = {'hi', 'passage', 'yes'}
		}
	},
	['yalahar~ab\'dendriel'] = {
		cost = 160,
		transcript = {
			['Karith'] = {'hi', 'ab\'dendriel', 'yes'}
		}
	},
	['yalahar~ankrahmun'] = {
		cost = 230,
		transcript = {
			['Karith'] = {'hi', 'ankrahmun', 'yes'}
		}
	},
	['yalahar~carlin'] = {
		cost = 185,
		transcript = {
			['Karith'] = {'hi', 'carlin', 'yes'}
		}
	},
	['yalahar~darashia'] = {
		cost = 210,
		transcript = {
			['Karith'] = {'hi', 'darashia', 'yes'}
		}
	},
	['yalahar~liberty bay'] = {
		cost = 275,
		transcript = {
			['Karith'] = {'hi', 'liberty bay', 'yes'}
		}
	},
	['yalahar~port hope'] = {
		cost = 260,
		transcript = {
			['Karith'] = {'hi', 'port hope', 'yes'}
		}
	},
	['yalahar~thais'] = {
		cost = 200,
		transcript = {
			['Karith'] = {'hi', 'thais', 'yes'}
		}
	},
	['yalahar~venore'] = {
		cost = 185,
		transcript = {
			['Karith'] = {'hi', 'venore', 'yes'}
		}
	},
	['yalahar~edron'] = {
		cost = 360,
		transcript = {
			['Karith'] = {'hi', 'thais', 'yes'},
			['Captain Bluebear'] = {'hi', 'edron', 'yes'}
		}
	},
	['yalahar~roshamuul'] = {
		cost = 410,
		transcript = {
			['Karith'] = {'hi', 'thais', 'yes'},
			['Captain Bluebear'] = {'hi', 'roshamuul', 'yes'}
		}
	},
	['yalahar~oramond'] = {
		cost = 350,
		transcript = {
			['Karith'] = {'hi', 'thais', 'yes'},
			['Captain Bluebear'] = {'hi', 'roshamuul', 'yes'}
		}
	},
	['yalahar~gray island'] = {
		cost = 350,
		transcript = {
			['Karith'] = {'hi', 'thais', 'yes'},
			['Captain Bluebear'] = {'hi', 'gray island', 'yes'}
		}
	},
	['yalahar~svargrond'] = {
		cost = 380,
		transcript = {
			['Karith'] = {'hi', 'thais', 'yes'},
			['Captain Bluebear'] = {'hi', 'roshamuul', 'yes'}
		}
	}
}

local SPAWN_TRAVELLING = {
	-- Script Name = Price (gold)
	['goroma ss (ms)'] = 1000,
	['goroma ss (ed)'] = 1000,
	['goroma ss (rp)'] = 1000,
	['goroma demons (ms)'] = 1000,
	['goroma demons (ed)'] = 1000,
	['goroma demons (rp)'] = 1000,
	['meriana gargoyle cave (ek)'] = 100,
	['meriana gargoyle cave (ms)'] = 100,
	['meriana gargoyle cave (ed)'] = 100,
	['meriana gargoyle cave (rp)'] = 100,
	['cormaya leaf golems (ek)'] = 40,
	['cormaya leaf golems (ms)'] = 40,
	['cormaya leaf golems (ed)'] = 40,
	['cormaya leaf golems (rp)'] = 40,
	['fenrock dragon lords (ek)'] = 200,
	['fenrock dragon lords (ms)'] = 200,
	['fenrock dragon lords (ed)'] = 200,
	['fenrock dragon lords (rp)'] = 200,
	['fenrock turtles (ek)'] = 200,
	['fenrock turtles (ms)'] = 200,
	['fenrock turtles (ed)'] = 200,
	['fenrock turtles (rp)'] = 200,
	['mistrock cyclops (ek)'] = 200,
	['mistrock cyclops (ms)'] = 200,
	['mistrock cyclops (ed)'] = 200,
	['mistrock cyclops (rp)'] = 200,
	['vengoth haunted treelings (ek)'] = 200,
	['vengoth haunted treelings (ms)'] = 200,
	['vengoth haunted treelings (ed)'] = 200,
	['vengoth haunted treelings (rp)'] = 200,
	['yalahar quaras (ek)'] = 100,
	['yalahar quaras (ms)'] = 100,
	['yalahar quaras (ed)'] = 100,
	['yalahar quaras (rp)'] = 100,
	['banuta -2 (ek)'] = 100,
	['forbidden lands behemoths (ms)'] = 100,
	['forbidden lands behemoths (ed)'] = 100,
	['forbidden lands behemoths (rp)'] = 100
}

local MONSTER_LOOT = {
	["Acid Blob"] = {9054},
	["Acolyte of Darkness"] = {9615},
	["Acolyte of the Cult"] = {2828, 3032, 3052, 3065, 3085, 3282, 5810, 6087, 9639, 11455, 11492, 11652},
	["Adept of the Cult"] = {2828, 3030, 3053, 3054, 3067, 3311, 3566, 5810, 6087, 7424, 7426, 9639, 11455, 11492, 11652},
	["Amazon"] = {2920, 3008, 3030, 3114, 3267, 3273, 3602, 11443, 11444},
	["Ancient Scarab"] = {236, 830, 3018, 3025, 3032, 3033, 3042, 3046, 3328, 3357, 3440, 8084, 9631},
	["Apprentice Sheng"] = {2920, 3003, 3046, 3291, 3355, 3457, 3559, 3595, 4000, 5878},
	["Arachir the Ancient One"] = {236, 3098, 3114, 3434, 8192, 11449},
	["Armadile"] = {236, 237, 238, 239, 268, 813, 3053, 3428, 7413, 7428, 8050, 11447, 12600, 16122, 16127, 16138, 16142, 16143},
	["Arthei"] = {236, 3098, 11449},
	["Ashmunrah"] = {238, 3017, 3023, 3048, 3332, 3381, 10290},
	["Askarak Demon"] = {236, 237, 812, 2995, 3032, 3051, 3725, 5904, 7368, 7440, 8084},
	["Askarak Lord"] = {236, 237, 811, 3032, 3051, 3725, 5904, 7368, 7419, 7440, 8084},
	["Askarak Prince"] = {236, 237, 811, 3032, 3049, 3281, 3725, 5904, 7440, 8084, 12541},
	["Assassin"] = {2920, 3028, 3287, 3291, 3292, 3351, 3404, 3405, 3409, 3410, 3413, 7366},
	["Azure Frog"] = {3492},
	["Badger"] = {903, 8017, 10296},
	["Bandit"] = {3274, 3286, 3352, 3353, 3359, 3411, 3559, 3596},
	["Bane Bringer"] = {11982},
	["Bane Lord"] = {11982, 12519, 12548, 12549, 12550, 12802},
	["Bane of Light"] = {9615},
	["Banshee"] = {237, 811, 2917, 2949, 3004, 3007, 3017, 3026, 3027, 3054, 3059, 3061, 3081, 3098, 3122, 3299, 3566, 3567, 3568, 10420, 11446, 12320},
	["Barbaria"] = {2839, 3347, 3358, 7343, 7463},
	["Barbarian Bloodwalker"] = {266, 2914, 3266, 3269, 3344, 3352, 3358, 5911, 7290, 7457},
	["Barbarian Brutetamer"] = {268, 2839, 3289, 3347, 3358, 3597, 7343, 7379, 7457, 7463, 7464},
	["Barbarian Headsplitter"] = {266, 2920, 3052, 3114, 3291, 3354, 3367, 3377, 5913, 7457, 7461},
	["Barbarian Skullhunter"] = {266, 2920, 3052, 3114, 3291, 3354, 3367, 3377, 5913, 7449, 7457, 7462},
	["Bat"] = {5894},
	["Battlemaster Zunzu"] = {3032, 10289, 10384, 10386, 10387, 10413, 10414},
	["Bear"] = {5896, 5902},
	["Behemoth"] = {239, 2893, 3008, 3033, 3058, 3116, 3265, 3275, 3281, 3304, 3342, 3357, 3383, 3456, 3554, 5893, 5930, 7368, 7396, 7413, 11447},
	["Betrayed Wraith"] = {238, 3028, 3057, 3450, 5021, 5741, 5799, 5944, 6299, 6499, 6558, 7368, 7386, 7416, 7643, 10316},
	["Bibby Bloodbath"] = {266, 268, 817, 3049, 3265, 3281, 3287, 3316, 3383, 3391, 3557, 3578, 7395, 7412},
	["Big Boss Trolliver"] = {3054},
	["Black Knight"] = {822, 2995, 3003, 3016, 3079, 3265, 3269, 3275, 3277, 3302, 3305, 3318, 3351, 3357, 3369, 3370, 3371, 3372, 3383, 3384, 3602},
	["Black Sheep"] = {11448},
	["Blazing Fire Elemental"] = {763, 941, 9636, 12600},
	["Blightwalker"] = {238, 281, 647, 811, 812, 3057, 3063, 3067, 3083, 3147, 3306, 3324, 3453, 3605, 5944, 6299, 6499, 7368, 7643, 9058, 9688},
	["Blistering Fire Elemental"] = {941, 3030, 8093, 9636, 12600},
	["Blood Crab"] = {3026, 3358, 3372, 3578, 9633},
	["Blood Hand"] = {237, 3069, 3079, 3574, 5909, 5911, 7456, 8072, 8073, 10320, 18925, 18926, 18928, 18929, 18930},
	["Blood Priest"] = {237, 3030, 3039, 3079, 3324, 3574, 5909, 5911, 8074, 8082, 10320, 18925, 18926, 18928, 18929, 18930},
	["Blue Djinn"] = {268, 2829, 2933, 3029, 3574, 3595, 3659, 5912, 7378, 11456},
	["Boar"] = {12310},
	["Bog Raider"] = {239, 3557, 7642, 7643, 8044, 8063, 8084, 9667},
	["Bolfrim"] = {6571, 6572, 6578, 14672},
	["Bonebeast"] = {266, 3114, 3115, 3337, 3357, 3441, 3732, 5925, 10244, 10277},
	["Bonelord"] = {268, 3059, 3065, 3265, 3282, 3285, 3409, 3418, 5898, 11512},
	["Bones"] = {3029, 3061, 3366, 5741, 5944, 6299, 6499, 6570, 6571},
	["Boogey"] = {9378, 9379, 9384, 9385},
	["Boreth"] = {236, 3434, 11449},
	["Braindeath"] = {3059, 3311, 3338, 3408, 3409, 3418, 5898, 7364, 7407, 7452, 9663},
	["Bretzecutioner"] = {238, 239, 281, 3008, 3028, 3029, 3033, 3281, 3383, 3554, 5741, 6299, 6499, 7368, 7419, 7427, 7452, 7642, 10298},
	["Bride of Night"] = {9615},
	["Brimstone Bug"] = {236, 237, 3032, 3049, 3055, 5904, 9640, 10305, 10315, 11702, 11703},
	["Bruise Payne"] = {3027, 3033, 3051, 3429, 3736, 5894, 7386, 9103, 9662},
	["Brutus Bloodbeard"] = {239, 3114, 3357, 3370, 6099},
	["Bug"] = {3590},
	["Cake Golem"] = {12143},
	["Calamary"] = {3581},
	["Captain Jones"] = {3049},
	["Carniphila"] = {647, 3597, 3728, 3738, 3740, 10300, 12311},
	["Carrion Worm"] = {3492, 10275, 12600},
	["Cave Rat"] = {3492, 3598, 3607},
	["Centipede"] = {3299, 10301},
	["Chakoya Toolshaper"] = {3286, 3441, 3456, 3578, 3580, 7158, 7159, 7381, 7441},
	["Chakoya Tribewarden"] = {3294, 3441, 3578, 3580, 7158, 7159, 7381},
	["Chakoya Windcaller"] = {3354, 3441, 3578, 7158},
	["Charged Energy Elemental"] = {761, 945},
	["Chayenne"] = {281, 6571, 14681, 14682},
	["Chicken"] = {3492, 3606, 5890, 6541, 6542, 6543, 6544, 6545},
	["Chocking Fear"] = {238, 813, 3051, 3052, 3098, 5911, 5913, 5914, 7642, 7643, 8074, 16121, 16123, 16124, 20062, 20202, 20206},
	["Chopper"] = {238, 239, 3010, 3027, 3037, 9057, 14080, 14081, 14083, 14753},
	["Clay Guardian"] = {774, 1781, 3147, 9057, 10305, 10422},
	["Cliff Strider"] = {238, 3026, 3027, 3039, 3041, 3281, 3332, 3371, 3381, 3391, 3554, 5880, 5904, 5944, 7437, 7452, 7643, 9028, 9067, 10310, 16096, 16118, 16119, 16124, 16125, 16133, 16134, 16135, 16141, 16160, 16163},
	["Cobra"] = {9634},
	["Cockroach"] = {7882},
	["Coral Frog"] = {3492},
	["Corym Charlatan"] = {3607, 17809, 17810, 17812, 17813, 17817, 17818, 17819, 17820, 17821, 17846},
	["Corym Skirmisher"] = {3607, 17809, 17810, 17812, 17813, 17817, 17818, 17819, 17820, 17821, 17825, 17846},
	["Corym Vanguard"] = {3607, 17809, 17810, 17812, 17813, 17817, 17818, 17819, 17820, 17821, 17825, 17846, 17859},
	["Count Tofifti"] = {6571, 14681},
	["Countess Sorrow"] = {3049, 3084, 3123, 3312, 3557, 3567, 5944, 6499, 6536},
	["Crab"] = {3578, 10272},
	["Craban"] = {3155, 6571, 8759, 9642, 11609},
	["Crawler"] = {238, 239, 3037, 3279, 8084, 9057, 14079, 14083, 14087},
	["Crazed Beggar"] = {2389, 2950, 3097, 3122, 3459, 3470, 3473, 3601, 3658, 3738, 5552, 6091, 8894},
	["Crimson Frog"] = {3492},
	["Crocodile"] = {3556, 10279},
	["Crustacea Gigantica"] = {236, 237, 12317},
	["Crypt Defiler"] = {3274, 3286, 3353, 3359, 3409, 7533, 8010, 11456, 11492},
	["Crypt Shambler"] = {3028, 3112, 3115, 3265, 3287, 3338, 3353, 3441, 3492, 10283},
	["Crystal Crusher"] = {15793, 16122, 16123, 16124, 16138},
	["Crystal Spider"] = {237, 829, 3007, 3008, 3053, 3055, 3351, 3357, 3370, 3371, 5801, 5879, 7290, 7364, 7437, 7441, 7449},
	["Crystal Wolf"] = {762, 3067, 5897, 8050},
	["Cublarc the Plunderer"] = {3316, 3350, 8029, 10196, 10407, 10421, 11479},
	["Cyclops Drone"] = {236, 3093, 3269, 3294, 3384, 3410, 3413, 7398, 9657},
	["Cyclops Smith"] = {236, 3093, 3266, 3275, 3305, 3330, 3384, 3410, 3413, 7398, 7452, 9657},
	["Cyclops"] = {266, 3012, 3093, 3269, 3294, 3384, 3410, 3413, 7398, 9657},
	["Damaged Worker Golem"] = {953, 3091, 5880, 8894, 9655},
	["Dark Apprentice"] = {266, 268, 3072, 3075, 3147, 5934, 12308},
	["Dark Magician"] = {236, 237, 266, 268, 678, 3069, 3147, 12308},
	["Dark Monk"] = {268, 347, 2885, 2914, 3050, 3061, 3077, 3289, 3551, 3600, 9646, 10303, 11492, 11493},
	["Dark Torturer"] = {238, 239, 3364, 3461, 3554, 5021, 5479, 5801, 5944, 6299, 6499, 6558, 7368, 7388, 7412, 9058},
	["Deadeye Devious"] = {239, 3028, 3114, 3267, 3357, 3370, 5926, 6102},
	["Death Blob"] = {9055},
	["Death Priest"] = {266, 268, 3026, 3042, 3059, 3098, 5021, 12482},
	["Deathbine"] = {647, 813, 814, 3032, 3728, 3740, 5014, 8084, 10300, 12320},
	["Deathstrike"] = {16136, 16155, 16160, 16161, 16162, 16163, 16164, 16175},
	["Deepling Brawler"] = {3578, 5895, 12730, 14017},
	["Deepling Elite"] = {238, 239, 3032, 3052, 5895, 12683, 12730, 14012, 14013, 14040, 14041, 14042, 14085, 14252},
	["Deepling Guard"] = {238, 239, 3029, 12683, 12730, 14010, 14011, 14043, 14044, 14142, 14247, 14248, 14250},
	["Deepling Master Librarian"] = {3029, 3052, 3578, 5895, 12730, 13987, 13990, 14008, 14009, 14085, 14247},
	["Deepling Scout"] = {3032, 3052, 3347, 5895, 8895, 9016, 12683, 12730},
	["Deepling Spellsinger"] = {3029, 3052, 3578, 5895, 12730, 13987, 13990, 14008, 14009, 14085, 14247},
	["Deepling Tyrant"] = {238, 239, 3029, 12683, 12730, 14010, 14011, 14043, 14044, 14142, 14247, 14248, 14250},
	["Deepling Warrior"] = {238, 239, 3032, 3052, 5895, 12683, 12730, 14012, 14013, 14040, 14041, 14042, 14085, 14252},
	["Deepling Worker"] = {3032, 3578, 5895, 12683, 12730, 14017},
	["Deer"] = {10297},
	["Defiler"] = {3028, 3030, 3032, 3034, 3037, 3038, 3039, 3041, 5944, 6299, 6499, 9054, 9055},
	["Delany"] = {3598, 6571, 14671},
	["Demodras"] = {239, 2842, 2903, 3029, 3051, 3280, 3386, 3450, 3732, 5791, 5919, 5948, 7365},
	["Demon Outcast"] = {238, 3028, 3029, 3030, 3032, 3048, 3049, 3055, 3098, 3281, 3284, 3356, 3381, 3391, 3419, 3420, 3731, 5906, 5911, 7368, 7643, 9057, 20062},
	["Demon Skeleton"] = {266, 268, 2920, 3027, 3030, 3062, 3078, 3287, 3305, 3353, 3413, 3415, 9647},
	["Demon"] = {238, 2848, 3030, 3032, 3033, 3034, 3039, 3048, 3049, 3055, 3060, 3063, 3098, 3281, 3284, 3306, 3320, 3356, 3364, 3366, 3414, 3420, 3731, 5954, 6499, 7368, 7382, 7393, 7642, 7643, 9057},
	["Denson Larika"] = {281, 3032, 5875, 5910, 11634},
	["Desperate White Deer"] = {12544, 12545},
	["Destroyer"] = {239, 3008, 3033, 3062, 3281, 3304, 3357, 3383, 3449, 3456, 3554, 5741, 5944, 6299, 6499, 7419, 7427, 10298},
	["Dharalion"] = {238, 3037, 3082, 3103, 3147, 3593, 5922, 9635, 11465},
	["Diabolic Imp"] = {826, 827, 3033, 3049, 3069, 3147, 3275, 3307, 3415, 3451, 3471, 5944, 6299, 6499, 6558},
	["Diamond Servant"] = {236, 237, 816, 3037, 3048, 3061, 3073, 5944, 7428, 7440, 8050, 8775, 9063, 9304, 9655, 12601},
	["Diblis the Fair"] = {236, 3098, 3114, 3434, 8075, 8192, 11449},
	["Dipthrah"] = {238, 3029, 3041, 3051, 3062, 3077, 3241, 3324, 3334, 10290},
	["Dirtbeard"] = {9374, 9375, 9382, 9401},
	["Doctor Perhaps"] = {9372, 9373, 9383, 9399},
	["Doomsday Cultist"] = {9615},
	["Dracola"] = {238, 239, 3052, 3061, 3383, 5741, 5925, 5944, 6299, 6499, 6546, 7420},
	["Dragon Hatchling"] = {266, 11457},
	["Dragon Lord Hatchling"] = {268, 818, 3732},
	["Dragon Lord"] = {236, 2842, 2903, 3029, 3051, 3061, 3280, 3373, 3386, 3392, 3428, 3450, 3732, 5882, 5948, 7378, 7399, 7402},
	["Dragon"] = {236, 3028, 3061, 3071, 3275, 3285, 3297, 3301, 3322, 3349, 3351, 3409, 3416, 3449, 3557, 5877, 5920, 7430, 11457},
	["Dragonling"] = {236, 237, 16131},
	["Draken Abomination"] = {237, 238, 830, 4033, 7642, 7643, 8094, 9057, 10384, 10385, 10387, 11671, 11672, 11673, 11688, 11691, 12549},
	["Draken Elite"] = {238, 3028, 4033, 5904, 7404, 7643, 10384, 10385, 10387, 10390, 11651, 11657, 11658, 11659, 11660, 11661, 11674, 11691, 11693},
	["Draken Spellweaver"] = {238, 3006, 3030, 3038, 3071, 8043, 10386, 10387, 10397, 10398, 10438, 10439, 11454, 11658, 12307, 12549},
	["Draken Warmaster"] = {239, 3006, 3030, 3428, 7643, 10384, 10386, 10387, 10388, 10404, 10405, 10406},
	["Draptor"] = {236, 237, 8039, 12309},
	["Dreadbeast"] = {3114, 3115, 3116, 3337, 3357, 3441, 3732, 5925},
	["Dreadmaw"] = {9058, 10279},
	["Drillworm"] = {814, 3097, 3456, 3492, 5880, 7452, 10305, 10422, 12600, 16122, 16123, 16124, 16126, 16133, 16135, 16142},
	["Dryad"] = {647, 3033, 3723, 3726, 9013, 9014, 9015, 9017, 12311},
	["Duskbringer"] = {9615},
	["Dwarf Geomancer"] = {813, 3029, 3046, 3059, 3097, 3147, 3311, 3584, 3723, 5880, 11458, 11463},
	["Dwarf Guard"] = {266, 3033, 3092, 3275, 3305, 3351, 3377, 3413, 3552, 3723, 5880, 12600},
	["Dwarf Miner"] = {3097, 3274, 3378, 3456, 3559, 5880},
	["Dwarf Soldier"] = {3092, 3266, 3349, 3358, 3375, 3425, 3446, 3457, 3723, 5880, 7363},
	["Dwarf"] = {3097, 3274, 3276, 3378, 3430, 3456, 3505, 3559, 3723, 5880},
	["Dworc Fleshhunter"] = {2920, 3114, 3299, 3346, 3347, 3361, 3403, 3441, 3471},
	["Dworc Venomsniper"] = {647, 2920, 3114, 3298, 3299, 3361, 3403, 3448, 3560},
	["Dworc Voodoomaster"] = {266, 2920, 3002, 3056, 3058, 3114, 3115, 3116, 3299, 3361, 3403},
	["Earth Elemental"] = {237, 774, 1781, 3147, 8894, 9057, 10305, 10422, 12600},
	["Earth Overlord"] = {811, 947, 8052, 10305, 10310, 12600},
	["Eclipse Knight"] = {9615},
	["Efreet"] = {237, 647, 827, 2647, 2933, 3032, 3038, 3071, 3330, 3574, 3584, 5910, 7378, 11470, 11486},
	["Elder Bonelord"] = {237, 3059, 3265, 3408, 3409, 3418, 7364, 10276, 10280, 11512},
	["Elder Mummy"] = {3007, 3017, 3027, 3042, 3045, 3046, 3299, 3492, 9649, 11466, 12482, 12483},
	["Elder Wyrm"] = {236, 237, 816, 820, 822, 825, 3028, 3349, 5944, 7430, 7451, 8027, 8043, 8092, 8093, 9665},
	["Elephant"] = {3044, 3443},
	["Elf Arcanist"] = {237, 266, 347, 2917, 3037, 3061, 3073, 3082, 3147, 3447, 3509, 3551, 3563, 3593, 3600, 3661, 3738, 5922, 9635, 11465},
	["Elf Overseer"] = {3413, 9635},
	["Elf Scout"] = {2901, 3350, 3447, 3448, 3449, 3551, 3592, 5921, 7438, 9635, 11464},
	["Elf"] = {3285, 3376, 3378, 3410, 3447, 3552, 5921, 8011, 9635},
	["Elvira Hammerthrust"] = {13429},
	["Emerald Damselfly"] = {266, 268, 3447, 17458, 17463},
	["Energy Elemental"] = {237, 268, 761, 3007, 3033, 3051, 3054, 3073, 3287, 3313, 3415, 7449},
	["Energy Overlord"] = {948, 8051},
	["Enlightened of the Cult"] = {237, 2828, 2995, 3029, 3051, 3055, 3071, 3084, 3324, 3567, 5668, 5801, 5810, 6087, 7426, 9638, 11455, 11652},
	["Enraged Crystal Golem"] = {236, 237, 7449, 7454, 15793, 16124, 16125, 16138},
	["Enraged Soul"] = {3282, 3292, 3432, 3740, 9690},
	["Enraged Squirrel"] = {836},
	["Enraged White Deer"] = {12544, 12545},
	["Enslaved Dwarf"] = {238, 239, 3032, 3033, 3092, 3279, 3369, 3415, 3428, 3432, 3725, 5880, 7413, 7437, 7452, 7454, 10310, 12600, 16121, 16122, 16123, 16126, 16142},
	["Esmeralda"] = {811, 3030, 3098, 3269, 3326, 3370, 3428, 3735, 9668},
	["Eternal Guardian"] = {1781, 3315, 3428, 5880, 9632, 10310, 10390, 10406, 10408, 10422, 10426, 12600},
	["Ethershreck"] = {238, 239, 281, 6499, 7642, 7643, 9057, 10310, 10323, 10384, 10385, 10386, 10387, 10388, 10389, 10390, 10406, 10438, 10449, 10450, 10451, 12801},
	["Evil Mastermind"] = {9391},
	["Fahim the Wise"] = {237, 647, 827, 2933, 2948, 3041, 3574, 3588, 5912, 7378, 10310, 11470, 11486},
	["Fan"] = {2948, 2949, 2950, 2954, 3178},
	["Fazzrah"] = {236, 239, 3032, 5876, 5881, 10289, 10384, 10386, 10387, 10413, 10414},
	["Fernfang"] = {347, 2885, 2902, 2905, 2914, 3012, 3037, 3050, 3061, 3077, 3105, 3147, 3289, 3551, 3563, 3600, 3661, 3736, 3738, 5786, 9646, 11492, 11493},
	["Feverish Citizen"] = {3115, 3492, 12551, 12552, 12553, 12554, 12555, 12556, 12786, 12787},
	["Feversleep"] = {238, 3030, 3032, 3033, 3567, 7643, 9057, 16124, 16125, 20203, 20204},
	["Filth Toad"] = {3286, 3578, 9640},
	["Fire Devil"] = {2920, 3033, 3069, 3075, 3147, 3275, 3307, 3415, 3471, 11513},
	["Fire Overlord"] = {826, 946, 8049, 9636},
	["Firestarter"] = {763, 3285, 3350, 3592, 5921, 7438, 9635, 12600, 12806},
	["Flameborn"] = {239, 3369, 3371, 3419, 3724, 6499, 7368, 7421, 7439, 7452, 7643, 9034, 9056, 9057, 10304, 12311},
	["Flamecaller Zazrak"] = {238, 3052, 10328, 10386, 10439, 10444},
	["Flamingo"] = {11684},
	["Fleabringer"] = {3492, 10407},
	["Fleshcrawler"] = {236, 811, 3018, 3025, 3032, 3033, 3042, 3370, 3440, 7426, 8084, 9631, 11468},
	["Fleshslicer"] = {238, 3026, 3030, 3039, 3346, 7413, 7643, 14082, 14083, 14753},
	["Fluffy"] = {3115, 3271, 3318, 5944, 6499, 6558, 6570, 6571},
	["Foreman Kneebiter"] = {3351, 3413, 5880},
	["Forest Fury"] = {3349, 3446, 7363, 7438, 9057, 18994, 18995},
	["Frazzlemaw"] = {238, 239, 3104, 3110, 3111, 3114, 3115, 3116, 3125, 3265, 3578, 5880, 5895, 5925, 5951, 7404, 7407, 7418, 9058, 10389, 16120, 16123, 16126, 16279, 20062, 20198, 20199},
	["Frost Dragon Hatchling"] = {266, 8072, 9661},
	["Frost Dragon"] = {2842, 2903, 3029, 3051, 3061, 3284, 3373, 3386, 3392, 3428, 3450, 3732, 7290, 7402, 7441},
	["Frost Giant"] = {266, 3093, 3269, 3294, 3384, 3413, 7290, 7441, 7460, 9658},
	["Frost Giantess"] = {266, 268, 1781, 3093, 3294, 3384, 3413, 7290, 7441, 7460, 9658},
	["Frost Troll"] = {3130, 3272, 3277, 3412, 3562, 3578, 9648},
	["Furious Troll"] = {3279, 9689},
	["Fury"] = {239, 3007, 3033, 3065, 3364, 3554, 5021, 5911, 5944, 6499, 6558, 7368, 7404, 7456, 8016, 8899},
	["Gang Member"] = {3093, 3286, 3362, 3559, 3602},
	["Gargoyle"] = {1781, 3012, 3093, 3282, 3351, 3383, 3413, 3591, 8010, 10278, 10310, 10426},
	["Gazer"] = {11512},
	["General Murius"] = {236, 3275, 3359, 3413, 3450, 3483, 3558, 5878, 7363, 7401, 11472},
	["Ghastly Dragon"] = {238, 812, 813, 3032, 3383, 3557, 5944, 6499, 7642, 7643, 8896, 10310, 10323, 10384, 10385, 10386, 10387, 10388, 10390, 10392, 10406, 10438, 10449, 10450, 10451},
	["Ghost"] = {2828, 3049, 3282, 3292, 3432, 3565, 3740, 5909, 9690},
	["Ghoul"] = {2920, 3052, 3114, 3291, 3367, 3377, 3492, 5913, 10291, 11467, 11484},
	["Ghoulish Hyaena"] = {266, 3030, 3492},
	["Giant Spider"] = {236, 828, 3053, 3055, 3265, 3351, 3357, 3370, 3371, 3372, 3448, 3557, 5879},
	["Gladiator"] = {3264, 3286, 3352, 3353, 3359, 3409, 3410, 8044},
	["Gnarlhound"] = {3492, 10407},
	["Goblin Assassin"] = {1781, 3115, 3120, 3267, 3294, 3337, 3355, 3361, 3462, 3578},
	["Goblin Leader"] = {3115, 3120, 3267, 3294, 3337, 3355, 3361, 3462, 3578},
	["Goblin Scavenger"] = {1781, 3115, 3120, 3267, 3294, 3337, 3355, 3361, 3462, 3578, 11539},
	["Goblin"] = {1781, 3115, 3120, 3267, 3294, 3337, 3355, 3361, 3462, 3578, 11539},
	["Golden Servant"] = {266, 268, 3049, 3063, 3269, 3360, 3732, 8072, 8775, 12601, 12801},
	["Gorgo"] = {238, 811, 812, 814, 3032, 3436, 7413, 7643, 9302, 10309},
	["Gozzler"] = {2885, 3029, 3097, 3266, 3273, 3282, 3297, 3311, 3410},
	["Grand Mother Foulscale"] = {3275, 3322, 3349, 3416, 3557, 5877, 5920, 7430},
	["Grandfather Tridian"] = {237, 2995, 3725, 5801, 6087},
	["Grave Guard"] = {266, 268, 3042, 3328, 3661, 6299, 12482},
	["Grave Robber"] = {3274, 3286, 3353, 3359, 3409, 7533, 8010, 11456, 11492},
	["Gravedigger"] = {236, 237, 3037, 3071, 3155, 3324, 5668, 5925, 6299, 9692, 10316, 11484, 11493},
	["Gravelord Oshuran"] = {237, 3027, 3059, 3098, 3567, 8076},
	["Green Djinn"] = {268, 2831, 2933, 3032, 3574, 3607, 3661, 5910, 7378, 11456},
	["Grim Reaper"] = {238, 823, 3046, 3421, 3453, 5021, 6299, 6499, 6558, 7418, 7643, 8061, 8082, 8896, 9660},
	["Grimrat"] = {6571},
	["Groam"] = {3052, 3347, 8894},
	["Grorlam"] = {1781, 2920, 3007, 3033, 3039, 3050, 3283, 3377, 3409, 3456, 3554, 5880, 10310, 10315},
	["Groupie"] = {2948, 2949, 2950, 2954, 3178},
	["Grynch Clan Goblin"] = {836, 841, 2392, 2875, 2906, 2950, 2983, 2992, 2995, 3003, 3042, 3046, 3147, 3454, 3463, 3572, 3585, 3586, 3590, 3598, 3599, 3606, 4871, 5021, 5792, 5890, 5894, 5902, 6276, 6392, 6393, 6496, 6500},
	["Guzzlemaw"] = {238, 239, 3104, 3110, 3111, 3114, 3115, 3116, 3125, 3265, 3578, 5880, 5895, 5925, 5951, 7404, 7407, 7418, 10389, 16120, 16123, 16126, 16279, 20062, 20198, 20199},
	["Hacker"] = {2914, 3266, 3269, 3274, 3279, 6570, 6571},
	["Hairman The Huge"] = {3093, 3587},
	["Hand of Cursed Fate"] = {238, 3010, 3029, 3036, 3037, 3041, 3051, 3055, 3062, 3071, 3079, 3084, 3155, 3324, 3370, 3381, 5799, 5944, 6299, 6499, 6558, 7368, 7414, 7643, 9058},
	["Hatebreeder"] = {6499, 7642, 7643, 10323, 10385, 10386, 10387, 10388, 10390, 10392, 10406, 10438, 10449, 10450, 10451},
	["Haunted Treeling"] = {236, 266, 3032, 3097, 3723, 3724, 3726, 7443, 9683},
	["Hellfire Fighter"] = {821, 826, 3010, 3019, 3028, 3071, 3124, 3147, 3280, 3320, 5944, 6499, 9636, 9664, 12600},
	["Hellhound"] = {238, 239, 817, 818, 821, 826, 827, 3027, 3038, 3071, 3116, 3271, 3280, 3281, 3318, 4871, 5910, 5914, 5925, 5944, 6499, 6553, 6558, 7368, 7421, 7426, 8896, 9057, 9058, 9636, 9637, 16131},
	["Hellspawn"] = {239, 3282, 3369, 3371, 3413, 3724, 6499, 7368, 7421, 7439, 7452, 7643, 8895, 8896, 9034, 9056, 9057, 10304},
	["Hemming"] = {3027, 3053, 3081, 3725, 3741, 5479, 5897, 7419, 7428, 7439, 7643, 10317, 10389},
	["Herald of Gloom"] = {9615},
	["Hero"] = {239, 347, 2949, 2995, 3003, 3004, 3048, 3265, 3279, 3280, 3350, 3381, 3382, 3385, 3419, 3447, 3563, 3572, 3592, 3658, 5911, 7364, 11450, 11510},
	["Hide"] = {830, 3053, 3351, 3371, 5879},
	["Hideous Fungus"] = {238, 239, 268, 811, 812, 813, 814, 3279, 5909, 5910, 5911, 5912, 16099, 16103, 16117, 16140, 16143, 16164},
	["High Templar Cobrass"] = {3345, 3351, 3357, 3445, 5876, 5881},
	["Hirintror"] = {236, 237, 819, 829, 3028, 3284, 3373, 5912, 7290, 7441, 7449, 19362, 19363},
	["Hive Overseer"] = {238, 281, 3030, 3554, 7643, 9058, 14077, 14083, 14086, 14088, 14089, 14172, 14246},
	["Honour Guard"] = {3042, 3286, 3307, 3725, 11481},
	["Humongous Fungus"] = {236, 237, 238, 239, 268, 811, 812, 813, 814, 5909, 5911, 5912, 5913, 7436, 16099, 16103, 16117, 16139, 16142, 16164},
	["Hunter"] = {2920, 3030, 3085, 3350, 3354, 3359, 3447, 3448, 3449, 3586, 3601, 5875, 5907, 7394, 7397, 7400, 11469},
	["Hyaena"] = {3492},
	["Hydra"] = {237, 3029, 3061, 3079, 3081, 3098, 3369, 3370, 3392, 3436, 4839, 8014, 10282},
	["Ice Golem"] = {236, 237, 829, 3027, 3028, 3029, 3284, 3373, 7290, 7441, 7449, 9661},
	["Ice Overlord"] = {942, 8050},
	["Ice Witch"] = {237, 819, 823, 3067, 3311, 3574, 3732, 7290, 7387, 7441, 7449, 7459},
	["Infected Weeper"] = {12600},
	["Infernalist"] = {238, 239, 676, 818, 2852, 2995, 3051, 3324, 5904, 5911, 8012, 8074, 9045, 9056, 9058, 9067},
	["Insectoid Scout"] = {266, 3093, 3346},
	["Insectoid Worker"] = {266, 3032, 3326, 14083, 14225},
	["Iron Servant"] = {266, 3269, 8775, 8894, 12601},
	["Ironblight"] = {238, 812, 3032, 3033, 3039, 3041, 3326, 3333, 5904, 7437, 7643, 8027, 8084, 9028, 9067, 9654, 10310, 10451, 16118, 16121, 16123, 16126, 16138},
	["Island Troll"] = {901, 3003, 3054, 3268, 3277, 3336, 3355, 3412, 3552, 5096, 5901},
	["Jagged Earth Elemental"] = {647, 940, 1781, 3032, 3130, 5880, 10305, 10422, 12600},
	["Jellyfish"] = {3581},
	["Jesse the Wicked"] = {13429},
	["Juggernaut"] = {238, 239, 281, 3019, 3030, 3032, 3036, 3038, 3039, 3105, 3113, 3322, 3340, 3360, 3364, 3414, 5944, 6499, 6558, 7368, 7413, 7452, 8061, 8896, 9058},
	["Kerberos"] = {238, 817, 3027, 3038, 3280, 3318, 3360, 4871, 6499, 6553, 6558, 9058, 9637},
	["Killer Caiman"] = {281, 3032, 3313, 3556, 10279, 10328},
	["Kollos"] = {238, 281, 3030, 3098, 3554, 7643, 9058, 14077, 14083, 14086, 14088, 14089, 14249, 14251},
	["Kongra"] = {266, 3050, 3084, 3093, 3357, 3587, 5883, 11471},
	["Lancer Beetle"] = {3033, 9640, 9692, 10455, 10457},
	["Latrivan"] = {239, 3026, 3027, 3028, 3029, 3032, 3033, 3038, 3041, 3046, 3048, 3049, 3051, 3054, 3062, 3063, 3066, 3069, 3070, 3076, 3079, 3081, 3098, 3275, 3281, 3284, 3290, 3320, 3324, 3356, 3364, 3414, 3420, 6299, 6499, 7365, 7368, 9058},
	["Lava Golem"] = {236, 237, 238, 268, 817, 818, 826, 3037, 3039, 3071, 3280, 3320, 3419, 5880, 5909, 5911, 5914, 7643, 8074, 9636, 16115, 16120, 16122, 16126, 16130, 16131, 16141},
	["Leaf Golem"] = {3032, 3723, 17824, 19110, 19111},
	["Lersatio"] = {236, 3027, 3098, 3434, 7419, 11449},
	["Lethal Lissy"] = {3028, 3114, 3275, 3357, 3370, 5926, 6100},
	["Leviathan"] = {237, 3029, 7428, 8059, 8895, 8898, 9303, 9604, 9613},
	["Lich"] = {237, 820, 3026, 3027, 3032, 3037, 3055, 3059, 3062, 3098, 3289, 3324, 3373, 3432, 3435, 3567, 9057, 12304},
	["Lion"] = {9691},
	["Lionet"] = {6571, 11681, 12737, 14173},
	["Lizard Chosen"] = {239, 3028, 3428, 5876, 5881, 10384, 10385, 10386, 10387, 10408, 10409, 10410, 11673},
	["Lizard Dragon Priest"] = {237, 238, 3033, 3037, 3052, 3065, 3071, 5876, 5881, 8043, 10328, 10386, 10439, 10444},
	["Lizard Gate Guardian"] = {5881, 7643, 10385, 10387, 10390},
	["Lizard High Guard"] = {236, 239, 3032, 3428, 5876, 5881, 10289, 10328, 10384, 10386, 10387, 10408, 10415, 10416},
	["Lizard Legionnaire"] = {236, 3028, 5876, 5881, 10289, 10328, 10384, 10386, 10388, 10406, 10417, 10418, 10419},
	["Lizard Magistratus"] = {237, 238, 3030, 5881},
	["Lizard Noble"] = {236, 239, 3030, 5876, 3048},
	["Lizard Sentinel"] = {266, 3028, 3269, 3277, 3313, 3347, 3358, 3377, 3444, 5876, 5881},
	["Lizard Snakecharmer"] = {268, 3033, 3037, 3052, 3061, 3065, 3066, 3122, 3407, 3565, 4000, 5876, 5881},
	["Lizard Templar"] = {266, 3032, 3264, 3282, 3294, 3345, 3351, 3357, 3445, 5876, 5881},
	["Lizard Zaogun"] = {236, 239, 3032, 3428, 5876, 5881, 10289, 10384, 10386, 10387, 10413, 10414},
	["Lost Basher"] = {238, 813, 2995, 3097, 3318, 3320, 3342, 3371, 3429, 3725, 5880, 7427, 7452, 7643, 9057, 12600, 16119, 17826, 17827, 17828, 17829, 17830, 17831, 17847, 17855, 17856, 17857},
	["Lost Berserker"] = {238, 239, 813, 2995, 3097, 3318, 3320, 3392, 3415, 3428, 3429, 3725, 5880, 5904, 7427, 7452, 9057, 10422, 12600, 16120, 16123, 16124, 16127, 16142},
	["Lost Husher"] = {236, 238, 812, 813, 3097, 3318, 3320, 3324, 3415, 3428, 3725, 7452, 9057, 10422, 12600, 17829, 17830, 17831, 17847, 17848, 17849, 17850, 17855, 17856, 17857},
	["Lost Soul"] = {238, 239, 3016, 3026, 3027, 3039, 3081, 3147, 3324, 3428, 5741, 5806, 5944, 6299, 6499, 6525, 7407, 7413, 8895, 8896, 10316},
	["Lost Thrower"] = {238, 239, 3725, 5880, 12600, 17827, 17829, 17851, 17852, 17853, 17854, 17855, 17856, 17857},
	["Lyxoph"] = {6571, 14683, 14684, 14685, 14741},
	["Mad Scientist"] = {266, 268, 678, 3046, 3061, 3598, 3723, 3739, 6393, 7440},
	["Mad Technomancer"] = {396},
	["Magma Crawler"] = {238, 239, 817, 818, 3028, 3037, 3051, 3280, 3429, 5880, 5909, 5911, 5914, 8093, 9636, 12600, 15793, 16115, 16119, 16123, 16127, 16130, 16131},
	["Mahrdis"] = {239, 3024, 3030, 3039, 3052, 3240, 3320, 3439, 10290},
	["Mamma Longlegs"] = {239, 3049, 3051, 3053, 3055, 3351, 3370, 3371, 5879, 5886, 7416, 7419},
	["Mammoth"] = {3443, 7381, 7432, 10307, 10321},
	["Man in the Cave"] = {3003, 5913, 7290, 7386, 7458},
	["Marid"] = {237, 647, 827, 2659, 2933, 2948, 3029, 3041, 3067, 3330, 3574, 3588, 3659, 5912, 7378, 11470, 11486},
	["Marsh Stalker"] = {647, 3003, 3285, 3492, 3578, 17461, 17462},
	["Marziel"] = {236, 3098},
	["Massacre"] = {238, 239, 3106, 3116, 3340, 3360, 3422, 5021, 5944, 6104, 6499, 6540, 7403},
	["Massive Earth Elemental"] = {814, 1781, 3028, 3081, 3084, 3097, 7387, 8895, 9057, 10305, 10422, 12600},
	["Massive Energy Elemental"] = {237, 238, 761, 794, 816, 822, 3033, 8073, 8092, 8895, 9304},
	["Massive Fire Elemental"] = {817, 818, 821, 3030, 3071, 3280, 8895},
	["Massive Water Elemental"] = {238, 239, 3028, 3032, 3051, 3052, 7158, 7159},
	["Maw"] = {238, 281, 3027, 3030, 3039, 7643, 9058, 14077, 14083, 14172, 14246, 14753},
	["Medusa"] = {238, 811, 812, 814, 3032, 3370, 3436, 7413, 7643, 8896, 9302, 10309},
	["Mephiles"] = {9376, 9377, 9387, 9400},
	["Mercury Blob"] = {9053},
	["Merikh the Slaughterer"] = {237, 827, 3032, 3038, 3330, 3574, 5910, 7378, 10310, 11470, 11486},
	["Merlkin"] = {268, 3033, 3046, 3072, 3348, 3586, 3587, 5883, 11511},
	["Midnight Panther"] = {3052, 12039, 12040},
	["Midnight Spawn"] = {9615},
	["Midnight Warrior"] = {9615},
	["Mindmasher"] = {238, 239, 3029, 3032, 3097, 3346, 10392, 14083, 14753},
	["Minotaur Archer"] = {3349, 3359, 3377, 3446, 5878, 7363, 11451, 11472, 11483},
	["Minotaur Guard"] = {266, 3275, 3358, 3359, 3413, 3483, 5878, 7401, 11472, 11482},
	["Minotaur Mage"] = {268, 2920, 3073, 3355, 3559, 3595, 5878, 7425, 11472, 11473},
	["Minotaur"] = {3056, 3264, 3274, 3286, 3354, 3358, 3410, 3457, 5878, 11472},
	["Monk"] = {347, 2885, 2914, 3050, 3061, 3077, 3289, 3551, 3600, 9646, 11492, 11493},
	["Monstor"] = {9380, 9381, 9386, 9396},
	["Morguthis"] = {239, 3019, 3027, 3081, 3237, 3318, 3331, 3554, 7368, 10290},
	["Morik the Gladiator"] = {8820},
	["Mornenion"] = {13429},
	["Muddy Earth Elemental"] = {940, 1781, 3129, 10305, 10422, 12600},
	["Mummy"] = {3007, 3017, 3027, 3045, 3046, 3054, 3299, 3429, 3492, 5914, 9649, 10290, 11466},
	["Munster"] = {3337, 3492, 3607, 5792},
	["Mutated Bat"] = {3027, 3033, 3051, 3313, 3413, 3429, 3736, 5894, 7386, 8894, 8895, 9103, 9662},
	["Mutated Human"] = {841, 3045, 3054, 3111, 3264, 3377, 3492, 3607, 3737, 8894, 10308},
	["Mutated Rat"] = {266, 3049, 3114, 3120, 3269, 3410, 3428, 3732, 3735, 8072, 9668},
	["Mutated Tiger"] = {236, 3052, 3415, 7436, 7454, 9046, 10293, 10311},
	["Necromancer Servant"] = {3448, 10320, 11475, 18933},
	["Necromancer"] = {237, 3079, 3311, 3324, 3448, 3574, 3732, 7456, 8073, 10320, 11475},
	["Necropharus"] = {3070, 3079, 3114, 3116, 3311, 3324, 3337, 3441, 3574, 3732, 5809, 10320, 11475},
	["Nightfiend"] = {236, 237, 3010, 3030, 3039, 9685, 11449, 18924},
	["Nightmare Scion"] = {3385, 6299, 6574, 7387, 7451, 8043, 9027, 10306, 10312},
	["Nightmare"] = {3079, 3342, 3371, 3432, 3450, 5668, 5944, 6299, 6499, 6525, 6558, 10306, 10312},
	["Nightslayer"] = {9615},
	["Nightstalker"] = {237, 3007, 3055, 3079, 3084, 3740, 7407, 7427, 8042, 9028},
	["Noble Lion"] = {3582, 3577, 9691},
	["Nomad"] = {3274, 3286, 3353, 3359, 3409, 7533, 8010, 11456, 11492},
	["Novice of the Cult"] = {2828, 3028, 3074, 3083, 3097, 3572, 5810, 6087, 9639, 11492},
	["Ocyakao"] = {3026, 3441, 3578, 3580, 5909, 7381, 7441, 19369},
	["Omnivora"] = {3723, 3582, 3578, 3052, 16123, 6299, 8072, 12311},
	["Omruc"] = {239, 3028, 3049, 3079, 3239, 3332, 3447, 3448, 3449, 3450, 3585, 7365, 10290},
	["Orc Berserker"] = {2914, 3266, 3269, 3347, 3358, 10196, 11477, 11479},
	["Orc Leader"] = {266, 3091, 3285, 3298, 3301, 3307, 3357, 3369, 3372, 3410, 3557, 3578, 3725, 7378, 10196, 11479, 11480},
	["Orc Marauder"] = {3313, 3316, 3349, 3350, 8029, 10196, 10407, 11451, 11479},
	["Orc Rider"] = {2920, 3012, 3313, 3316, 3377, 3413, 10196, 10318, 11479},
	["Orc Shaman"] = {2839, 3072, 3277, 3358, 3597, 10196, 11452, 11478, 11479},
	["Orc Spearman"] = {3277, 3308, 3362, 3376, 10196, 11479},
	["Orc Warlord"] = {266, 818, 3049, 3063, 3084, 3265, 3287, 3307, 3316, 3322, 3347, 3357, 3359, 3384, 3391, 3393, 3394, 3437, 3557, 3578, 7395, 10196, 11453, 11479, 11480},
	["Orc Warrior"] = {3299, 3358, 3430, 10196, 11453, 11479, 11480},
	["Orc"] = {3244, 3273, 3274, 3376, 3378, 3426, 10196, 11479},
	["Orchid Frog"] = {3492},
	["Orewalker"] = {236, 237, 238, 268, 3037, 3097, 3371, 3381, 3385, 5880, 5904, 7413, 7454, 7643, 8050, 9057, 10310, 10315, 16096, 16121, 16124, 16125, 16133, 16135, 16141, 16163},
	["Overcharged Energy Element"] = {239, 945, 3033, 3098, 7439, 8092},
	["Paiz the Pauperizer"] = {238, 239, 3032, 3037, 3038, 3039, 3041, 3386, 5881, 5904, 7642, 8052, 10384, 10389, 10390, 11651, 11657, 11658, 11659, 11660, 11661, 12307},
	["Panda"] = {11445},
	["Penciljack"] = {6571, 14683, 14684, 14685, 14741},
	["Penguin"] = {3578, 7158, 7159},
	["Phantasm"] = {238, 3030, 3032, 3033, 3049, 3147, 3381, 3740, 6299, 6499, 7414, 7451, 7643, 9057},
	["Pig"] = {9693},
	["Pirate Buccaneer"] = {236, 2920, 3123, 3273, 3298, 3357, 3413, 5552, 5706, 5792, 5926, 6095, 6097, 6098, 6126, 10302},
	["Pirate Corsair"] = {236, 2995, 3273, 3287, 3383, 3421, 5461, 5552, 5813, 5926, 6096, 6097, 6098, 6126, 10302},
	["Pirate Cutthroat"] = {3377, 3409, 5552, 5706, 5710, 5792, 5918, 5927, 6097, 6098, 6126, 10302},
	["Pirate Ghost"] = {2814, 3049, 3271, 3566, 9684},
	["Pirate Marauder"] = {2920, 3277, 3358, 3410, 5552, 5706, 5792, 5917, 5927, 5928, 6097, 6098, 6126, 10302},
	["Pirate Skeleton"] = {3114, 3115, 3116, 3264, 3294, 3337, 9642},
	["Plaguesmith"] = {239, 2958, 3010, 3017, 3033, 3092, 3093, 3110, 3120, 3122, 3265, 3279, 3282, 3305, 3332, 3371, 3409, 3554, 5887, 5888, 5889, 5944, 6499, 7365, 8896},
	["Poacher"] = {2920, 3350, 3355, 3447, 3448, 3481, 3559, 3601},
	["Poison Spider"] = {11485},
	["Polar Bear"] = {9650},
	["Priestess"] = {268, 2828, 2948, 2995, 3008, 3034, 3067, 3076, 3311, 3429, 3585, 3674, 3727, 3738, 3739, 9639, 9645, 10303},
	["Primitive"] = {3273, 3274, 3376, 3378, 3426, 6570, 6571},
	["Quara Constrictor Scout"] = {3033, 3285, 3359, 3581, 5895, 11487},
	["Quara Constrictor"] = {3033, 3285, 3359, 3581, 5895, 11487},
	["Quara Hydromancer Scout"] = {3026, 3027, 3032, 3073, 3098, 3313, 3370, 3578, 3581, 5895, 11488},
	["Quara Hydromancer"] = {238, 3026, 3027, 3032, 3073, 3098, 3370, 3581, 5895, 11488},
	["Quara Mantassin Scout"] = {3029, 3049, 3114, 3265, 3358, 5895, 11489},
	["Quara Mantassin"] = {3029, 3049, 3265, 3269, 3373, 3565, 3567, 3581, 5895, 11489},
	["Quara Pincher Scout"] = {3030, 3061, 3269, 3357, 5895, 11490, 12318},
	["Quara Pincher"] = {239, 824, 3030, 3269, 3369, 3381, 3581, 5895, 11490, 12318},
	["Quara Predator Scout"] = {3028, 3265, 3275, 3377, 3581, 5895, 8083, 11491},
	["Quara Predator"] = {239, 824, 3028, 3275, 3581, 5741, 5895, 7368, 7378, 7383, 11491, 12318},
	["Rabbit"] = {3595, 6541, 6542, 6543, 6544, 6545},
	["Rahemos"] = {238, 3033, 3036, 3060, 3068, 3098, 3235, 3335, 3573, 10290},
	["Rat"] = {3607},
	["Renegade Orc"] = {266, 3091, 3285, 3298, 3301, 3307, 3369, 3410, 3557, 3578, 3725, 10196, 11479},
	["Retching Horror"] = {238, 239, 3280, 3344, 3419, 3428, 3725, 7386, 8082, 8092, 20029, 20062, 20205, 20207},
	["Ribstride"] = {3028, 3441, 3732, 5741, 5925, 10244, 10277, 12304},
	["Roaring Lion"] = {3048, 3577, 3582, 9691, 9057, 3033, 3030, 3029, 3077, 3385},
	["Roaring Water Elemental"] = {281, 944, 3029, 8083},
	["Robby the Reckless"] = {13429},
	["Ron the Ripper"] = {239, 3028, 3114, 3267, 3357, 3370, 5926, 6101},
	["Rorc"] = {3012, 3313, 3316, 3410, 18993, 18996, 18997},
	["Rotspit"] = {238, 3033, 3725, 7449, 14078, 14753},
	["Rottie the Rotworm"] = {3264, 3286, 3374, 3430, 3492, 9692},
	["Rotworm Queen"] = {3492, 8143},
	["Rotworm"] = {3264, 3286, 3492, 9692},
	["Rukor Zad"] = {3409, 7366},
	["Sacred Spider"] = {3042, 3357, 8031, 9058},
	["Salamander"] = {266, 3003, 3286, 3307, 3350, 3354, 3447, 17457},
	["Sandcrawler"] = {10456},
	["Sandstone Scorpion"] = {3032, 3327, 3351, 3429, 12546},
	["Scarab"] = {3032, 3033, 3042, 3327, 9641},
	["Scorpion"] = {9651},
	["Sea Serpent"] = {236, 237, 238, 815, 823, 3029, 3049, 3098, 3297, 3557, 8042, 8043, 8050, 8083, 9303, 9666},
	["Serpent Spawn"] = {238, 2903, 3029, 3051, 3052, 3061, 3066, 3369, 3373, 3381, 3392, 3407, 3428, 3450, 3732, 4831, 7386, 7456, 8052, 8074, 9694, 10313},
	["Shaburak Demon"] = {236, 237, 821, 2995, 3030, 3051, 3071, 3725, 5904, 7378, 7443},
	["Shaburak Lord"] = {236, 237, 826, 3030, 3051, 3071, 3554, 3725, 5904, 7443},
	["Shaburak Prince"] = {236, 237, 826, 3030, 3049, 3071, 3554, 3725, 5904, 7412, 7443, 12541},
	["Shadow Hound"] = {9615},
	["Shadow Pupil"] = {237, 3079, 3574, 3725, 8072, 10320, 18926, 18929, 18930},
	["Shadowstalker"] = {238, 239, 3032, 3037, 9057, 14079, 14083, 14753},
	["Shardhead"] = {236, 3027, 3028, 3029, 7290, 7441, 9661},
	["Shark"] = {281, 3029, 3578, 5895, 12730, 14017},
	["Sharptooth"] = {3111},
	["Sheep"] = {10319},
	["Shiversleep"] = {238, 3030, 3032, 3281, 3369, 3370, 3567, 5909, 5911, 7643, 9057, 16119, 16124, 16125, 20203, 20204},
	["Shock Head"] = {3029, 3392, 20205},
	["Sibang"] = {1781, 3586, 3587, 3589, 3593, 5883, 11511},
	["Sight of Surrender"] = {238, 3048, 3081, 3332, 3333, 3366, 3391, 3428, 3554, 7421, 7422, 7642, 7643, 16119, 16120, 16121, 16122, 16123, 16124, 20062, 20183, 20184, 20208},
	["Silencer"] = {239, 812, 813, 3049, 3079, 3421, 7368, 7387, 7407, 7413, 7451, 7454, 20062, 20200, 20201},
	["Silver Rabbit"] = {3595, 6541, 6542, 6543, 6544, 6545, 10292},
	["Sir Valorcrest"] = {236, 3091, 3098, 3114, 3434, 7427, 8192},
	["Siramal"] = {6571, 14673},
	["Skeleton Warrior"] = {3115, 3264, 3286, 3723, 3725, 11481},
	["Skeleton"] = {2920, 3115, 3264, 3276, 3286, 3367, 3411, 11481},
	["Skunk"] = {8197, 10274},
	["Skyrr"] = {6571},
	["Slick Water Elemental"] = {762, 944},
	["Slug"] = {3492},
	["Smuggler Baron Silvertoe"] = {3286, 3294},
	["Smuggler"] = {2920, 3264, 3291, 3292, 3294, 3355, 3559, 7397, 8012},
	["Souleater"] = {238, 3069, 3073, 5884, 6299, 7643, 11679, 11680, 11681},
	["Spectre"] = {238, 2949, 3017, 3019, 3049, 3073, 3147, 5909, 5944, 6299, 6499, 7383, 7451, 10310},
	["Spider"] = {8031},
	["Spidris Elite"] = {238, 281, 3030, 3036, 6299, 7413, 7643, 14082, 14083, 14086, 14088, 14089},
	["Spidris"] = {238, 281, 3030, 3036, 6299, 7413, 7643, 14082, 14083, 14086, 14088, 14089},
	["Spit Nettle"] = {647, 3661, 3738, 3740, 10314, 11476},
	["Spitter"] = {238, 239, 3033, 3038, 3053, 3055, 3391, 3725, 7440, 7449, 14078, 14083, 14086, 14087},
	["Squirrel"] = {836, 841, 10296},
	["Stalker"] = {3147, 3298, 3300, 3313, 3372, 3411, 11474},
	["Stampor"] = {236, 237, 3279, 3370, 7452, 9057, 12312, 12313, 12314},
	["Starving Wolf"] = {3105, 5897},
	["Stone Devourer"] = {236, 237, 238, 268, 3081, 3097, 3281, 3333, 3342, 7437, 7452, 7454, 7643, 9632, 12600, 15793, 16122, 16125, 16137, 16138},
	["Stone Golem"] = {1781, 3007, 3039, 3050, 3283, 5880, 9632, 10310, 10315, 10426, 12600},
	["Stonecracker"] = {3033, 3265, 3275, 3281, 3342, 3554, 5893, 5930, 7368, 7396, 10310},
	["Sulphur Scuttler"] = {236, 237, 3032, 3049, 3055, 5904, 9640, 10305, 10315, 11702, 11703},
	["Swamp Troll"] = {2920, 3120, 3277, 3483, 3552, 3578, 3741, 5901, 9686, 12517},
	["Swampling"] = {3003, 3723, 17822, 17823, 17824},
	["Swarmer"] = {3032, 3326, 14076, 14083},
	["Tarantula"] = {3053, 3351, 3372, 3410, 8031, 10281},
	["Tarnished Spirit"] = {2828, 3282, 3292, 3432, 3565, 3740, 5909, 9690},
	["Teleskor"] = {2920, 3264, 3276, 3286, 3367, 3411, 11481},
	["Terofar"] = {3038, 3415, 3420, 5954, 7642, 7643, 9058, 16121, 20062},
	["Terramite"] = {10452, 10453, 10454},
	["Terrified Elephant"] = {3044, 3443},
	["Terror Bird"] = {266, 647, 3406, 3492, 10273, 11514},
	["Terrorsleep"] = {238, 3030, 3032, 3281, 3369, 3370, 3567, 5909, 5911, 7643, 9057, 16119, 16124, 16125, 20203, 20204},
	["Thalas"] = {239, 3032, 3038, 3049, 3053, 3238, 3297, 3299, 3339, 10290},
	["The Abomination"] = {3027, 3029, 3030, 3032, 3033, 5944, 6499},
	["The Blightfather"] = {3033, 9640, 9692, 10455},
	["The Bloodtusk"] = {3044, 3443, 5911, 7432, 7463, 10321},
	["The Bloodweb"] = {237, 823, 829, 3053, 3370, 3371, 5801, 5879, 7290, 7437, 7441, 10389},
	["The Count"] = {3434, 7924},
	["The Evil Eye"] = {238, 811, 3059, 3265, 3282, 3285, 3409, 3418, 5898, 11512},
	["The Handmaiden"] = {3049, 3050, 3051, 3110, 3116, 3421, 3554, 3567, 5944, 6499, 6539},
	["The Horned Fox"] = {236, 3049, 3275, 3276, 3359, 3396, 3413, 3483, 3558, 5804, 5878, 7363, 11472, 11482},
	["The Imperor"] = {826, 3019, 3030, 3033, 3364, 3382, 3442, 3451, 5944, 6499, 6534},
	["The Keeper"] = {11367},
	["The Many"] = {237, 3029, 3081, 3369, 3370, 3392, 3436, 9058, 9302, 9606},
	["The Mutated Pumpkin"] = {3594, 6491, 6525, 8032, 8177, 8178},
	["The Noxious Spawn"] = {238, 2903, 3032, 3052, 3381, 3392, 3428, 3732, 7368, 7386, 7456, 8052, 8074, 9394, 9694, 10313},
	["The Old Whopper"] = {7398, 9657},
	["The Old Widow"] = {239, 3049, 3051, 3053, 3055, 3351, 3370, 3371, 5879, 5886, 7416, 7419, 12320},
	["The Pale Count"] = {236, 237, 3027, 3029, 3032, 3049, 3098, 3326, 3434, 5909, 5911, 5912, 7419, 7427, 8075, 8192, 9057, 18927, 18935, 18936, 19373, 19374},
	["The Plasmother"] = {3027, 3029, 3032, 3033, 5944, 6499, 6535},
	["The Snapper"] = {266, 3032, 3052, 3357, 3370, 3556, 3557},
	["The Voice of Ruin"] = {10408, 10410},
	["The Weakened Count"] = {7924},
	["The Welter"] = {236, 237, 281, 3029, 3079, 3081, 3284, 3369, 3370, 3392, 3436, 4839, 9058, 9302, 19083, 19356, 19357},
	["Thieving Squirrel"] = {836, 9843},
	["Thornback Tortoise"] = {266, 3026, 3027, 3279, 3578, 3723, 3725, 5678, 5899, 9643},
	["Thornfire Wolf"] = {763, 5897, 9636},
	["Thul"] = {238, 901, 3033, 3381, 3391, 5895, 7383},
	["Tiger"] = {10293},
	["Tiquandas Revenge"] = {647, 3728, 5014, 12311},
	["Toad"] = {3279, 3286, 3578, 9640},
	["Tomb Servant"] = {3042, 3112, 3115, 3285, 3441, 3492, 10283, 12546},
	["Tormentor"] = {3079, 3342, 3371, 5668, 6299, 6499, 6525, 6558, 7418, 10306, 10312},
	["Tortoise"] = {3305, 3410, 3578, 5678, 5899, 6131},
	["Troll Champion"] = {3054, 3277, 3336, 3412, 3447, 3552, 9689, 11515},
	["Troll Guard"] = {3003, 3336},
	["Troll Legionnaire"] = {3049, 3287, 9648},
	["Troll"] = {3003, 3054, 3268, 3277, 3336, 3355, 3412, 3552, 9689},
	["Tromphonyte"] = {236, 237, 3370, 7452, 9057, 12312, 12313, 12314},
	["Tyrn"] = {236, 237, 816, 3028, 3029, 3030, 3032, 3033, 3037, 3039, 3041, 3155, 3415, 5911, 7368, 7430, 9057, 9304, 9665, 19083},
	["Undead Cavebear"] = {266, 12315, 12316},
	["Undead Dragon"] = {238, 239, 2903, 3027, 3029, 3041, 3061, 3342, 3360, 3370, 3392, 3450, 5925, 6299, 6499, 7368, 7402, 7430, 8057, 8061, 9058, 10316, 10438},
	["Undead Gladiator"] = {266, 3049, 3084, 3265, 3287, 3307, 3318, 3347, 3357, 3359, 3372, 3384, 3391, 3557, 5885, 8044, 9656},
	["Undead Jester"] = {123, 651, 900, 901, 2995, 3578, 5909, 5910, 5911, 5912, 5913, 5914, 6574, 7158, 7159, 7377, 8779, 8780, 8781, 8782, 8783, 8784, 8853},
	["Undead Mine Worker"] = {3115, 3264, 3286, 3723, 3725},
	["Undead Minion"] = {3147, 3305, 3413, 3415, 6570, 6571},
	["Undead Prospector"] = {2920, 3052, 3114, 3291, 3354, 3367, 3377, 3492, 5913},
	["Valkyrie"] = {266, 3028, 3084, 3114, 3275, 3277, 3347, 3357, 3358, 3585, 11443, 11444},
	["Vampire Bride"] = {236, 237, 649, 3010, 3028, 3070, 3079, 5668, 8045, 8531, 8895, 8923, 9685, 11449, 12306},
	["Vampire Viscount"] = {236, 237, 3027, 3030, 3039, 3284, 3434, 5911, 9685, 11449, 18924, 18927},
	["Vampire"] = {236, 3010, 3027, 3056, 3114, 3271, 3284, 3300, 3373, 3434, 3661, 9685, 11449},
	["Vashresamun"] = {238, 2950, 2953, 3007, 3022, 3026, 3236, 3333, 3567, 10290},
	["Vicious Squire"] = {3446, 239, 3349, 3003, 3048, 3563, 3415, 3371, 3369, 2995, 3028, 3033, 3029, 3030, 3032},
	["Vulcongra"] = {236, 237, 817, 826, 3071, 3091, 3280, 3587, 9636, 12600, 16123, 16126, 16130, 16131},
	["Wailing Widow"] = {266, 268, 3269, 3410, 3732, 10406, 10411, 10412},
	["War Golem"] = {238, 820, 953, 3061, 3093, 3097, 3265, 3282, 3326, 3410, 3413, 3554, 5880, 7403, 7422, 7428, 7439, 7643, 8895, 9063, 9067, 9654, 12305},
	["War Wolf"] = {5897, 7394, 10318},
	["Warlock"] = {238, 239, 825, 2852, 2917, 2995, 3006, 3007, 3029, 3034, 3051, 3062, 3081, 3299, 3324, 3360, 3509, 3567, 3590, 3600, 3728, 7368, 11454},
	["Warlord Ruzad"] = {818, 3084, 3287, 3307, 3316, 3357, 3372, 3384, 3557, 3578},
	["Wasp"] = {5902},
	["Waspoid"] = {3010, 3027, 3037, 14080, 14081, 14083, 14087, 14088, 14089},
	["Water Elemental"] = {236, 237, 281, 3026, 3028, 3029, 3032, 3051, 3052, 3578, 7158, 7159, 9303},
	["Weak Gloombringer"] = {3029, 3030, 3032, 9058, 9615},
	["Weak Harbinger of Darkness"] = {3028, 3032, 9058, 9615},
	["Weak Spawn of Despair"] = {3028, 3030, 9058, 9615},
	["Weakened Shlorg"] = {238, 3032, 3037, 3038, 3297, 5910, 5911, 5914, 7642, 7643, 8044, 8084, 9057, 9667, 19083, 19371, 19372},
	["Weeper"] = {238, 821, 826, 3030, 3280, 3320, 7643, 9636, 12600, 16115, 16120, 16123, 16126, 16130, 16131, 16132, 16141},
	["Werewolf"] = {236, 3053, 3055, 3081, 3269, 3326, 3410, 3725, 3741, 5897, 7383, 7419, 7428, 7439, 7643, 8895, 10317},
	["White Pale"] = {3028, 3052, 3327, 9692, 10275, 19083, 19358, 19359},
	["White Shade"] = {5909},
	["Wiggler"] = {236, 237, 3065, 3297, 3429, 3723, 5912, 5914, 15793, 16122, 16127, 16142},
	["Wild Warrior"] = {2991, 3274, 3286, 3352, 3353, 3359, 3409, 3411, 3606},
	["Willi Wasp"] = {3054, 5902, 9057},
	["Wilting Leaf Golem"] = {3032, 3723, 17824, 19110, 19111},
	["Winter Wolf"] = {10295},
	["Wisp"] = {9604},
	["Witch"] = {3012, 3069, 3083, 3290, 3293, 3552, 3562, 3565, 3598, 3736, 9652, 9653, 10294, 12548},
	["Wolf"] = {5897},
	["Worker Golem"] = {238, 239, 953, 3028, 3048, 3061, 3279, 5880, 7428, 7439, 7452, 7642, 8775, 8895, 8898, 9063, 9655},
	["Wyrm"] = {236, 237, 816, 3028, 3349, 3449, 7430, 8027, 8043, 8045, 8092, 8093, 9304, 9665},
	["Wyvern"] = {236, 3010, 3029, 3071, 3450, 7408, 9644},
	["Xenia"] = {3114, 3273, 3426},
	["Yaga the Crone"] = {3012, 3069, 3083, 3454, 3562, 3565, 3598, 3736, 8074, 12548},
	["Yakchal"] = {238, 823, 824, 3052, 3079, 3085, 3324, 3333, 3732, 5912, 7290, 7410, 7439, 7440, 7443, 7449, 7459, 9058},
	["Yeti"] = {2992, 3553},
	["Yielothax"] = {236, 237, 816, 822, 3028, 3034, 3048, 3073, 3326, 3725, 7440, 9304, 12737, 12742, 12805},
	["Young Sea Serpent"] = {236, 237, 3029, 3049, 3061, 3266, 3282, 3305, 8894, 8895, 9666},
	["Young Troll"] = {3003, 3277, 3355, 3412, 3552, 9689},
	["Zanakeph"] = {238, 239, 2903, 3029, 3032, 3360, 3370, 3385, 3392, 5741, 5925, 6299, 6499, 7430, 7642, 8057, 8896, 9058, 10316, 10451, 12304},
	["Zarabustor"] = {825, 3006, 3029, 3051, 3299, 3324, 3567, 7368},
	["Zavarash"] = {238, 281, 3038, 3340, 3414, 3415, 3420, 5954, 7387, 7421, 7428, 7642, 8063, 16119, 16120, 16121, 20062, 20276},
	["Zevelon Duskbringer"] = {236, 3098, 3434, 7419, 8192},
	["Zomba"] = {3052, 3084, 9691},
	["Zombie"] = {268, 3052, 3269, 3286, 3305, 3351, 3354, 3568, 8894, 9659},
	["Blood Beast"] = {21195, 9640, 21194, 21146, 236, 7366, 21179, 21158, 21178, 21183, 21180},
	["Bullwark"] = {3028, 3033, 239, 238, 21199, 21200, 5878, 5911, 21219},
	["Death Priest Shargon"] = {238, 239, 9058, 9056, 3069, 8531},
	["Devourer"] = {3028, 3033, 3032, 3030, 9057, 3029, 21182, 21179, 21180, 21178, 21158, 21183, 8084, 3034, 3037, 21164},
	["Execowtioner"] = {9057, 3030, 11472, 21201, 5944, 239, 238, 5911, 3318, 7412, 3381, 21176, 7401},
	["Glooth Anemone"] = {9057, 3032, 21144, 3732, 21197, 236, 237, 21180, 21178, 21179, 21172, 21164, 7643},
	["Glooth Blob"] = {9057, 3033, 21182, 21183, 21180, 21178, 21179},
	["Glooth Fairy"] = {3030, 3033, 3028, 3029, 21158, 21178, 21183, 21180, 21167, 239, 21292, 21144, 21143, 21103, 5880, 8775},
	["Glooth Golem"] = {21103, 21143, 238, 7643, 3032, 9057, 3037, 8775, 21158, 21180, 21179, 21178, 5880, 21170, 21183, 21167, 21165, 3038},
	["Lisa"] = {3028, 3033, 9057, 3030, 239, 238, 7642, 21144, 21146, 21143, 21158, 21197, 21183, 21179, 21180, 21218},
	["Metal Gargoyle"] = {236, 237, 21193, 21171, 21169, 21168, 3051, 3052, 10310, 8082},
	["Minotaur Amazon"] = {7368, 5878, 11472, 3032, 3033, 3030, 9057, 239, 238, 21204, 3098, 5911, 21174, 21175},
	["Minotaur Hunter"] = {11472, 3033, 3030, 237, 236, 7378, 3147, 3347, 5944, 3037, 3039, 5878, 3049, 5912, 5910, 5911, 21175, 7401},
	["Mooh'Tah Warrior"] = {11472, 21202, 3032, 3030, 9057, 3032, 3033, 237, 236, 3091, 5911, 21177, 3415, 3371, 3370, 21166, 7401},
	["Moohtant"] = {21200, 3028, 3030, 238, 3098, 5911, 21199, 3037, 7427, 21173},
	["Rot Elemental"] = {3032, 9057, 3029, 236, 21182, 3052, 237, 21158, 21180, 21183},
	["Rustheap Golem"] = {21196, 3026, 3027, 953, 3279, 236, 237, 5880, 9016, 8894, 8897, 21170, 21171, 7452},
	["The Ravager"] = {238, 239, 3042, 3027, 3025},
	["Walker"] = {3032, 9057, 3033, 239, 7642, 21169, 21170, 21198, 3554},
	["Worm Priestess"] = {11472, 3028, 3033, 3032, 9057, 3029, 3030, 3037, 3039, 11473, 5878, 2920, 3066, 5912, 5911, 5910, 7425, 8082, 7401}
}

local SPELL_RANGE = {
	BIGWAVE = 1, -- Big Wave (flam hur, frigo hur)
	EXORI = 2, -- Adjacent (exori, exori gran)
	WAVE3X3 = 3, -- 3x3 Wave (vis hur, tera hur)
	SMALLAREA = 4, -- Small Area (mas san, exori mas)
	MEDIUMAREA = 5, -- Medium Area (mas flam, mas frigo)
	LARGEAREA = 6, -- Large Area (mas vis, mas tera)
	BEAM5 = 7, -- Short Beam (vis lux)
	BEAM8 = 8, -- Large Beam (gran vis lux)
	SWEEP = 9, -- Sweep (exori min)
	SMALLWAVE = 10 -- Small Wave (gran frigo hur)
}

local RUNE_RANGE = {
	EXPLO = 1, -- Cross (explosion)
	BOMB = 2, -- Bomb (fire bomb)
	THREE = 3, -- 3 Sqm
	BALL = 4, -- Ball (gfb, avalanche)
	FIVE = 5, -- 5 Sqm
	SIX = 6, -- 6 Sqm
	SEVEN = 7, -- 7 Sqm
	EIGHT = 8, -- 8 Sqm
	NINE = 9, -- 9 Sqm
	TEN = 10 -- 10 Sqm
}

local MAGIC_SHOOTER_ITEM = {
	-- Targeted Spells (type=0)

	['exori ico'] = {type=0, srange=1, mana=30},
	['exori gran ico'] = {type=0, srange=1, mana=300},
	['exori hur'] = {type=0, srange=5, mana=40},

	['exori san'] = {type=0, srange=4, mana=20},
	['exori con'] = {type=0, srange=7, mana=25},
	['exori gran con'] = {type=0, srange=7, mana=55},

	['exori moe ico'] = {type=0, srange=3, mana=20},

	['exori mort'] = {type=0, srange=3, mana=20},

	['exori infir vis'] = {type=0, srange=3, mana=6},
	['exori vis'] = {type=0, srange=3, mana=20},
	['exori amp vis'] = {type=0, srange=5, mana=60},
	['exori gran vis'] = {type=0, srange=3, mana=60},
	['exori max vis'] = {type=0, srange=3, mana=100},

	['exori min flam'] = {type=0, srange=3, mana=6},
	['exori flam'] = {type=0, srange=3, mana=20},
	['exori gran flam'] = {type=0, srange=3, mana=60},
	['exori max flam'] = {type=0, srange=3, mana=100},

	['exori frigo'] = {type=0, srange=3, mana=20},
	['exori gran frigo'] = {type=0, srange=3, mana=60},
	['exori max frigo'] = {type=0, srange=3, mana=100},

	['exori infir tera'] = {type=0, srange=3, mana=6},
	['exori tera'] = {type=0, srange=3, mana=20},
	['exori gran tera'] = {type=0, srange=3, mana=60},
	['exori max tera'] = {type=0, srange=3, mana=100},

	-- Area Spells (type=2)

	['exori'] = {type=2, srange=SPELL_RANGE.EXORI, mana=115},
	['exori gran'] = {type=2, srange=SPELL_RANGE.EXORI, mana=340},

	['exori mas'] = {type=2, srange=SPELL_RANGE.SMALLAREA, mana=160},
	['exevo mas san'] = {type=2, srange=SPELL_RANGE.SMALLAREA, mana=160},

	['exori min'] = {type=2, srange=SPELL_RANGE.SWEEP, mana=200},

	['exevo infir flam hur'] = {type=2, srange=SPELL_RANGE.BIGWAVE, mana=8},
	['exevo flam hur'] = {type=2, srange=SPELL_RANGE.BIGWAVE, mana=25},
	['exevo infir frigo hur'] = {type=2, srange=SPELL_RANGE.BIGWAVE, mana=8},
	['exevo frigo hur'] = {type=2, srange=SPELL_RANGE.BIGWAVE, mana=25},

	['exevo vis lux'] = {type=2, srange=SPELL_RANGE.BEAM5, mana=40},

	['exevo gran vis lux'] = {type=2, srange=SPELL_RANGE.BEAM8, mana=110},

	['exevo tera hur'] = {type=2, srange=SPELL_RANGE.WAVE3X3, mana=210},
	['exevo vis hur'] = {type=2, srange=SPELL_RANGE.WAVE3X3, mana=170},

	['exevo gran frigo hur'] = {type=2, srange=SPELL_RANGE.SMALLWAVE, mana=170},

	['exevo gran mas flam'] = {type=2, srange=SPELL_RANGE.MEDIUMAREA, mana=1100},
	['exevo gran mas frigo'] = {type=2, srange=SPELL_RANGE.MEDIUMAREA, mana=1050},

	['exevo gran mas vis'] = {type=2, srange=SPELL_RANGE.LARGEAREA, mana=600},
	['exevo gran mas tera'] = {type=2, srange=SPELL_RANGE.LARGEAREA, mana=700},

	-- Targeted Runes (type=1)
	[3155] = {type=1, srange=7}, -- sudden death
	[3189] = {type=1, srange=7}, -- fireball
	[3182] = {type=1, srange=7}, -- holy missile
	[3158] = {type=1, srange=7}, -- icicle
	[3165] = {type=1, srange=7}, -- paralyze
	[3195] = {type=1, srange=7}, -- soulfire
	[3198] = {type=1, srange=7}, -- heavy magic missle
	[3174] = {type=1, srange=7}, -- light magic missle
	[3179] = {type=1, srange=7}, -- stalagmite

	-- Area Runes (type=3)
	[3200] = {type=3, srange=RUNE_RANGE.EXPLO}, -- explosion

	[3192] = {type=3, srange=RUNE_RANGE.BOMB}, -- fire bomb
	[3149] = {type=3, srange=RUNE_RANGE.BOMB}, -- energy bomb
	[3173] = {type=3, srange=RUNE_RANGE.BOMB}, -- poison bomb

	[3161] = {type=3, srange=RUNE_RANGE.BALL}, -- avalanche
	[3191] = {type=3, srange=RUNE_RANGE.BALL}, -- great fireball
	[3175] = {type=3, srange=RUNE_RANGE.BALL}, -- stone shower
	[3202] = {type=3, srange=RUNE_RANGE.BALL} -- thunderstorm
}

-- TODO: parse items.xml for durations
local ITEM_LIST_DURATIONS = {
	-- Rings
	[3086] = 10 * 60, -- stealth ring
	[3087] = 30 * 60, -- power ring
	[3088] = 10 * 60, -- energy ring
	[3089] = 20 * 60, -- life ring
	[3090] = 10 * 60, -- time ring
	[3094] = 30 * 60, -- sword ring
	[3095] = 30 * 60, -- axe ring
	[3096] = 30 * 60, -- club ring
	[3099] = 60 * 60, -- dwarven ring
	[3100] = 7.5 * 60, -- ring of healing
	[6300] = 8 * 60, -- death ring
	[12670] = 10 * 60, -- star ring
	[16264] = 60 * 60, -- prismatic ring

	-- Boots
	[3549] = 240 * 60, -- soft boots
	[9018] = 60 * 60 -- firewalker boots
}

local ITEM_LIST_POTIONS = {
	[236] = true,
	[237] = true,
	[238] = true,
	[239] = true,
	[266] = true,
	[268] = true,
	[7439] = true,
	[7440] = true,
	[7443] = true,
	[7642] = true,
	[7643] = true
}

local ITEM_LIST_ACTIVE_RINGS = {
	[3092] = 3095,
	[3091] = 3094,
	[3093] = 3096,
	[3052] = 3089,
	[3098] = 3100,
	[3097] = 3099,
	[3051] = 3088,
	[3053] = 3090,
	[3049] = 3086,
	[9593] = 9593,
	[9393] = 9392,
	[3007] = 3007,
	[6299] = 6300,
	[9585] = 9585,
	[3048] = 3048,
	[3050] = 3087,
	[3245] = 3245,
	[3006] = 3006,
	[349] = 349,
	[3004] = 3004,
	[16114] = 16264
}

local ITEM_LIST_RUSTYARMORS = {
	[8895] = true,
	[8896] = true,
	[8897] = true,
	[8898] = true,
	[8899] = true
}

local ITEM_LIST_RUSTYTRASH = {
	[3557] = true,
	[3372] = true,
	[3558] = true,
	[3362] = true,
	[3358] = true,
	[3377] = true,
	[3357] = true,
	[3359] = true
}

local ITEM_LIST_MONEY = {
	[3031] = true,
	[3035] = true,
	[3043] = true
}

local ITEM_LIST_FLASKS = {
	[283] = true,
	[284] = true,
	[285] = true
}

local ITEM_LIST_FURNITURE_DESTROYERS = {
	[3267] = true,
	[3292] = true,
	[3291] = true
}

local ITEM_LIST_SKINNABLE_LOOT = {
	[281] = true,
	[282] = true,
	[3026] = true,
	[3029] = true,
	[3032] = true,
	[5876] = true,
	[5877] = true,
	[5878] = true,
	[5893] = true,
	[5905] = true,
	[5906] = true,
	[5925] = true,
	[5948] = true,
	[9303] = true
}

local ITEM_LIST_BACKPACKS = {
	[2854] = true,
	[2865] = true,
	[2866] = true,
	[2867] = true,
	[2868] = true,
	[2869] = true,
	[2870] = true,
	[2871] = true,
	[2872] = true,
	[5926] = true,
	[5949] = true,
	[7342] = true,
	[8860] = true,
	[9601] = true,
	[9602] = true,
	[9604] = true,
	[9605] = true,
	[10202] = true,
	[10324] = true,
	[10326] = true,
	[10327] = true,
	[10346] = true,
	[14248] = true,
	[14249] = true,
	[16099] = true,
	[16100] = true,
	[21295] = true
}

local RUNES_EXOTIC = {
	[3203] = true, -- animate dead rune
	[3147] = true, -- blank rune
	[3197] = true, -- desintegrate rune
	[3149] = true, -- energy bomb rune
	[3189] = true, -- fireball rune
	[3182] = true, -- holy missile rune
	[3158] = true, -- icicle rune
	[3180] = true, -- magic wall rune
	[3165] = true, -- paralyze rune
	[3173] = true, -- poison bomb rune
	[3195] = true, -- soulfire rune
	[3175] = true, -- stone shower rune
	[3202] = true, -- thunderstorm rune
	[3156] = true  -- wild growth rune
}

local RUNES_NORMAL = {
	[3161] = true, -- avalanche rune
	[3178] = true, -- chameleon rune
	[3177] = true, -- convince creature rune
	[3153] = true, -- cure poison rune
	[3148] = true, -- destroy field rune
	[3164] = true, -- energy field rune
	[3166] = true, -- energy wall rune
	[3200] = true, -- explosion rune
	[3192] = true, -- fire bomb rune
	[3188] = true, -- fire field rune
	[3190] = true, -- fire wall rune
	[3191] = true, -- great fireball rune
	[3198] = true, -- heavy magic missile rune
	[3152] = true, -- intense healing rune
	[3174] = true, -- light magic missile rune
	[3172] = true, -- poison field rune
	[3176] = true, -- poison wall rune
	[3179] = true, -- stalagmite rune
	[3155] = true, -- sudden death rune
	[3160] = true  -- ultimate healing rune
}

local EXOTIC_RUNE_TOWNS = {
	['edron'] = true,
	['gray island'] = true,
	['rathleton'] = true
}

local FISHING_RODS = {
	[3483] = true,
	[9306] = true
}

local ROPE_TOOLS = {
	[3003] = 0,
	[646] = 1,
	[9594] = 2,
	[9596] = 3,
	[9598] = 4
}

local SHOVEL_TOOLS = {
	[3457] = 0,
	[5710] = 1,
	[9594] = 2,
	[9596] = 3,
	[9598] = 4
}

local PICK_TOOLS = {
	[3456] = true,
	[9594] = true,
	[9596] = true,
	[9598] = true
}

local RODS = {
	[3065] = true,
	[3066] = true,
	[3067] = true,
	[3069] = true,
	[3070] = true,
	[8082] = true,
	[8083] = true,
	[8084] = true,
	[16117] = true,
	[16118] = true
}

local WANDS = {
	[3071] = true,
	[3072] = true,
	[3073] = true,
	[3074] = true,
	[3075] = true,
	[8092] = true,
	[8093] = true,
	[8094] = true,
	[12603] = true,
	[16096] = true,
	[16115] = true
}

local DISTANCE_WEAPONS = {
	[3277] = true,
	[7378] = true,
	[3347] = true,
	[7367] = true,
	[1781] = true,
	[3287] = true,
	[3298] = true,
	[7366] = true,
	[7368] = true,
	[20082] = true,
	[20083] = true,
	[20084] = true,
	[20085] = true,
	[20086] = true,
	[20087] = true
}

local NORMAL_BOOTS = {
	[10201] = true,
	[3246] = true,
	[3550] = true,
	[3553] = true,
	[10200] = true,
	[13997] = true,
	[3555] = true,
	[16112] = true,
	[4033] = true,
	[3079] = true,
	[10323] = true,
	[3554] = true,
	[818] = true,
	[813] = true,
	[819] = true,
	[820] = true,
	[10386] = true,
	[5461] = true,
	[7457] = true,
	[9017] = true,
	[3556] = true,
	[3552] = true,
	[3551] = true,
	[21981] = true
}

local DEPOT = {
	SLOT_NONSTACK = 0,
	SLOT_STACK = 1,
	SLOT_SUPPLY = 2
}

-- XenoBot user accounts automatically open the debug channel
local DEBUG_ACCOUNTS = {
	['syntax'] = true,
	['joshwa534'] = true,
	['darkstar'] = true,
	['spectrus'] = true,
	['fatality'] = true,
	['rydan'] = true,
	['shadowart'] = true,
	['jontor'] = true,
	['draadloos'] = true
}
local _script = {
	xenoversion = xeno.getVersionNumber(),
	start = os.time(),
	startStamina = xeno.getSelfStamina(),
	baseExp = xeno.getSelfExperience(),
	round = 1,
	balance = 0,
	unsafeQueue = 0,
	pingSum = 0,
	pingEntries = 0,
	pingLast = 0,
	strangers = 0,

	theme = 'light',

	name = "Edron Demon War (ED)",
	slug = "[ED] Edron Demon War.xbst",
	town = "edron",
	vocation = "Druid",
	configHash = "ad51296f06ee16ba04c7c999fd4cf371",
	pricesConfigHash = "a9d428293c579bc4f8ca9f45bad18249",

	townexit = nil,
	channel = nil,
	historyChannel = nil,
	debugChannel = nil,
	disableWithdraw = false,
	firstResupply = true,
	rope = nil,
	shovel = nil,
	pick = nil,

	ropeCode = 0,
	shovelCode = 0,

	state = 'Setting up backpacks',
	reason = 'Initializing',
	route = '--',
	lastDestination = nil,

	ready = false,
	inSpawn = false,
	stuck = false,
	luring = false,
	dynamicLuring = false,
	ignoring = false,

	logoutQueued = false,
	trainingQueued = false,
	returnQueued = false,
	forceLogoutQueued = false,

	alarmInterval = nil,

	wasted = 0,
	looted = 0,
	profit = 0,
	experience = 0,

	doors = {},

	equipped = {
		['ring'] = false,
		['amulet'] = false,
		['feet'] = false
	}
}

local _timerIndex = 0
local _eventIndex = 0
local _timers = {}              -- execute callbacks at a specific time
local _events = {               -- execute callbacks on events
	[EVENT_LABEL] = {},
	[EVENT_ERROR] = {},
	[EVENT_BATTLE] = {},
	[EVENT_LOOT] = {},
	[EVENT_NPC] = {},
	[EVENT_COMMAND] = {},
	[EVENT_PATH_END] = {},
	[EVENT_DEPOT_END] = {},
	[EVENT_CONTAINER] = {}
}

local _path = {                 -- current path we're taking
	town = nil,                 -- ex: thais
	route = nil,                -- ex: depot~hunt
	from = nil,                 -- ex: depot
	to = nil,                   -- ex: hunt
	dest = nil                  -- ex: startHunt
}

local _settings = {}
local _config = {}
local _supplies = {}
local _backpacks = {
	['Main'] = 0,
	['Loot'] = 1,
	-- remaining dynamically assigned...
}

local _hud = {
	index = {},
	gamewindow = {x=0, y=0, w=0, h=0},
	leftcolumn = {x=10, y=65, w=200, h=0, panels={}},
	rightcolumn = {x=0, y=10, w=200, h=0, panels={}},
	lootSnapshots = {},
	supplySnapshots = {}
}
Core = (function()

	local function debug(message, type)
		xeno.luaSendChannelMessage(_script.debugChannel, type or CHANNEL_YELLOW, ':', message)
	end

	local function overflowText(str, len, ellipsis)
		return #str > len and string.sub(str, 1, len) .. ellipsis or str
	end

	local function formatTime(seconds, simpleFormat)
		local d, h, m, s = math.floor(seconds / 86400),
		                   math.floor(seconds / 3600) % 24,
		                   math.floor(seconds / 60) % 60,
				   seconds % 60
	        return simpleFormat and string.format('%02d:%02d', 24*d+h, m) or string.format('%02d:%02d:%02d:%02d', d, h, m, s)
	end

	local function formatNumber(n)
		local n = tonumber(string.format('%.2f', n))
		if not n then
			return '0'
		end
		local left, num, right = string.match(n,'^([^%d]*%d)(%d*)(.-)$')
		return left .. string.reverse(string.gsub(string.reverse(num), '(%d%d%d)','%1,')) .. right
	end

	local function titlecase(str)
		return string.gsub(str, "(%a)([%w_']*)", function(first, rest)
			return string.upper(first) .. string.lower(rest)
		end)
	end

	local function flattenItemCounts(items)
		-- Iterate through itemid indexed counts
		-- flatten to array with count and itemid combined
		local list = {}
		for itemid, count in pairs(items) do
			list[#list+1] = xeno.getItemNameByID(itemid) .. (count > 1 and ' (x' .. count .. ')' or '')
		end
		return list
	end

	local function formatList(items, delim, prefix)
		prefix = prefix or ''
		local message = nil
		if #items > 1 then
			if delim then
				message = string.rep(prefix .. '%s' .. delim, #items-1) .. prefix .. '%s'
			else
				message = string.rep('%s, ', #items-1) .. 'and %s'
			end
		else
			message = '%s'
		end
		return string.format(message, unpack(items))
	end

	local function getMemoryUsage()
		return collectgarbage('count') * 1024
	end

	local function freeMemory()
		local prev = getMemoryUsage()
		collectgarbage()
		return prev - getMemoryUsage()
	end

	local function pingDelay(delay)
		if type(delay) == 'table' then
			return math.max(math.random(unpack(delay)), xeno.ping())
		end
		return math.max(delay, xeno.ping())
	end

	local function throttle(action, func, ...)
		local currentTime = os.clock() * 1000
		if currentTime - action.last > action.limit then
			action.last = currentTime
			func(...)
		end
	end

	local function clearTimeout(id)
		_timers[id] = nil
	end

	local function clearWhen(event, id)
		_events[event][id] = nil
	end

	local function setTimeout(callback, timeout)
		_timerIndex = _timerIndex + 1
		_timers[_timerIndex] = {callback, (os.clock() * 1000) + timeout, nil, 0}
		return _timerIndex
	end

	local function setInterval(callback, interval, loops)
		_timerIndex = _timerIndex + 1
		_timers[_timerIndex] = {callback, (os.clock() * 1000) + interval, interval, loops}
		return _timerIndex
	end

	local function when(event, condition, callback)
		-- Labels are simpler, simple hash lookup with callback
		if event == EVENT_LABEL then
			_events[EVENT_LABEL][condition] = callback
			return condition
		end

		-- Valid conditions:
		-- string: Message matches string exactly
		-- table: Contains a pattern and optional match comparisons {pattern, firstMatch, secondMatch, ...}
		-- Any other event needs to match a pattern condition
		local id = #_events[event]+1
		_events[event][id] = {
			condition = condition,
			callback = callback,
			timeout = nil
		}

		return id
	end

	local function checkTimers()
		local currentTime = os.clock() * 1000
		local success = nil
		local index = nil
		local timer = nil
		repeat
			success, index, timer = pnext(_timers, index)
			-- Timer is false, must be pending a remove, remove now
			if not timer and index then
				_timers[index] = nil
				return
			end
			if success and index and timer then
				-- Check expiration
				if currentTime >= timer[2] then
					-- Execute
					timer[1](index)
					-- Timer may have killed itself, check if it still exists
					if _timers[index] then
						-- Increase expiration for next interval
						if timer[3] then
							_timers[index][2] = currentTime + timer[3]
						end
						-- Timer expires at some point
						if timer[4] then
							-- Decrement loop
							_timers[index][4] = timer[4] - 1
							-- Loops finished
							if timer[4] < 1 then
								_timers[index] = false
							end
						end
					end
				end
			end
		until not index or not success or not timer
	end

	local function checkEvents(eventType, message, ...)
		local success = nil
		local index = nil
		local event = nil
		if _events[eventType] then
			repeat
				success, index, event = pnext(_events[eventType], index)
				-- Event is false, must be pending a remove, remove now
				if not event and index then
					_events[eventType][index] = nil
					return
				end
				if success and index and event then
					local conditionType = type(event.condition)
					-- Always true
					if conditionType == 'nil' then
						_events[eventType][index] = nil
						event.callback(message, ...)
					-- Exact string check (or wildcard)
					elseif conditionType == 'string' then
						if event.condition == message then
							_events[eventType][index] = nil
							event.callback(message, ...)
						end
					-- Pattern check
					elseif conditionType == 'table' then
						local match = {string.match(event.condition)}
						if match[1] then
							_events[eventType][index] = nil
							event.callback(message, match, ...)
						end
					end
				end
			until not index or not success or not event
		end
	end

	local function split(str, sep)
		local res = {}
		for v in string.gmatch(str, "([^" .. sep .. "]+)") do
			res[#res + 1] = v
		end
		return res
	end

	local function trim(str)
		return string.gsub(str, "^%s*(.-)%s*$", "%1")
	end

	local function isXenoBotBinary()
		return _script.xenoversion:find('Binary') ~= nil
	end

	local function getXenoVersion()
		local data = split(_script.xenoversion, '.')
		return tonumber(data[#data])
	end

	local function getPositionFromDirection(pos, dir, len)
		local n = len or 1
		if (dir == NORTH) then
			pos.y = pos.y - n
		elseif (dir == SOUTH) then
			pos.y = pos.y + n
		elseif (dir == WEST) then
			pos.x = pos.x - n
		elseif (dir == EAST) then
			pos.x = pos.x + n
		elseif (dir == NORTHWEST) then
			pos.y = pos.y - n
			pos.x = pos.x - n
		elseif (dir == NORTHEAST) then
			pos.y = pos.y - n
			pos.x = pos.x + n
		elseif (dir == SOUTHWEST) then
			pos.y = pos.y + n
			pos.x = pos.x - n
		elseif (dir == SOUTHEAST) then
			pos.y = pos.y + n
			pos.x = pos.x + n
		end
		return pos
	end

	local function getSelfLookPosition(range)
		return getPositionFromDirection(xeno.getSelfPosition(), xeno.getSelfLookDirection(), range or 1)
	end

	local function getPosFromString(str)
		local pos = {}
		string.gsub(str, "(%d+)", function(w) return table.insert(pos,tonumber(w)) end)
		return {x=(pos[1] or 0), y=(pos[2] or 0), z=(pos[3] or 0)}
	end

	local function cleanLabel(str)
		-- Transform entity to '>'
		--str = string.gsub(str, '&gt;', '>')
		-- Remove semi-colon
		return string.sub(str, 1, -2)
	end

	local function countPairs(tbl)
		local n = 0
		for k,v in pairs(tbl) do
			n = n + 1
		end
		return n
	end

	function indexTable(tbl, lowercase)
		if not tbl or #tbl == 0 then
			return nil
		end
		if type(tbl) ~= 'table' then
			tbl = {tbl}
		end
		local keyValues = {}
		for i = 1, #tbl do
			local key = tbl[i]
			keyValues[lowercase and key:lower() or key] = true
		end
		return keyValues
	end

	local function getTimeUntilServerSave()
		local curTime = os.time()
		local utc, loc = os.date("!*t", curTime), os.date("*t", curTime)
		loc.isdst = false
		local offset = os.time(loc) - os.time(utc)
		local UTCNow = os.time()
		local UTCTable = os.date("*t", UTCNow)
		local dstValue = UTCTable.isdst and 7200 or 3600
		local targetTime = {year=UTCTable.year, month=UTCTable.month, day=UTCTable.day, hour=9, min=59}  
		local timeDifference = (((os.time(targetTime) - (UTCNow + dstValue)) + offset)/60)/60
		local hoursLeft = timeDifference
		if hoursLeft < 0 then
			hoursLeft = 24 + hoursLeft
		end
		return hoursLeft   
	end

	local function getDistanceBetween(pos1, pos2)
		return math.max(math.abs(pos1.x - pos2.x), math.abs(pos1.y - pos2.y))
	end

	local function sortPositionsByDistance(pos, positions, floorWeight)
		local sorted = positions
		table.sort(sorted, function(a, b)
			local floorA = 0
			local floorB = 0
			if floorWeight and pos.z and a.z and b.z then
				floorA = floorWeight * (math.abs(pos.z - a.z))
				floorB = floorWeight * (math.abs(pos.z - b.z))
			end
			return (getDistanceBetween(pos, a) + floorA) < (getDistanceBetween(pos, b) + floorB)
		end)
		return sorted
	end

	local function talk(messages, callback)
		local msgCount = #messages
		local responses = {}
		local function sayMessage(index)
			-- Delay messages
			local msg = messages[index]
			setTimeout(function()
				-- Last message, callback
				if index == msgCount then
					callback(responses)
				-- Recurse
				else
					sayMessage(index+1)
				end
			end, pingDelay(DELAY.RANGE_TALK))

			-- Record response to this message
			when(EVENT_NPC, nil, function(response, npc)
				-- Update response
				responses[#responses+1] = response
			end)
			
			-- Send a single message to the NPC
			xeno.selfNpcSay(msg)
			debug('NPC:: ' .. msg)
		end

		-- Send the first message and start recursing
		sayMessage(1)
	end

	local function clearWalkerPath()

		local function destroyFurniture(x, y, z)
			local weapon = xeno.getWeaponSlotData().id
			-- Wand, rods, and distance weapons CANNOT destroy furniture
			-- Attempt to detect an item in the main backpack that can
			if weapon == 0 or DISTANCE_WEAPONS[weapon] or RODS[weapon] or WANDS[weapon] then
				weapon = 0
				-- Look through main backpack
				local mainbp = _backpacks['Main']
				for spot = 0, xeno.getContainerItemCount(mainbp) - 1 do
					local item = xeno.getContainerSpotData(mainbp, spot)
					-- This item can kill furniture
					if ITEM_LIST_FURNITURE_DESTROYERS[item.id] then
						-- Save item
						weapon = item.id
						break
					end
				end
			end

			-- TODO: make Nick add moveGroundItemToGround(fromX, fromY, toX, toY) or pushTopObject...
			-- once added, push item to free position if a breaking weapon isn't found
			if weapon > 0 then
				xeno.selfUseItemWithGround(weapon, x, y, z)
			end
		end

		local function attackCreature(cid)
			-- Make sure we're not already attacking the creature
			if cid ~= xeno.getSelfTargetID() then
				xeno.attackCreature(cid)
			end    
			-- TODO: read spell/rune from shooter, apply directly to creature's face
		end

		local function clearTile(x, y, z)
			local item = xeno.getTileUseTargetID(x, y, z)
			local selfPos = xeno.getSelfPosition()
			local distance = getDistanceBetween(selfPos, {x=x,y=y,z=z})

			-- Creature
			if item.id == 99 and distance < 3 then
				local cid = item.count
				local index = xeno.getCreatureListIndex(cid)
				-- Monster
				if xeno.isCreatureMonster(index) then
					attackCreature(cid)
					return true
				end
				-- Not attackable, look at other tiles
				return false
			end

			-- Furniture
			if xeno.isItemFurniture(item.id) then
				destroyFurniture(x, y, z)
				return true
			end

			return false
		end

		-- Attempt to clear tiles in a specific order
		-- There's a better way, I guarantee it.
		local priorities = {
			[NORTH] = {NORTH, NORTHWEST, NORTHEAST, WEST, EAST, SOUTH, SOUTHWEST, SOUTHEAST},
			[EAST] = {EAST, NORTHEAST, SOUTHEAST, NORTH, SOUTH, WEST, NORTHWEST, SOUTHWEST},
			[SOUTH] = {SOUTH, SOUTHWEST, SOUTHEAST, WEST, EAST, NORTH, NORTHWEST, NORTHEAST},
			[WEST] = {WEST, NORTHWEST, SOUTHWEST, NORTH, SOUTH, EAST, NORTHEAST, SOUTHEAST}
		}

		-- Search for valid tiles around player to clear
		local pos = xeno.getSelfPosition()
		local directions = priorities[xeno.getSelfLookDirection()]
		local index = 1
		local valid = false
		repeat
			local tilePos = getPositionFromDirection({x=pos.x, y=pos.y}, directions[index], 1)
			valid = clearTile(tilePos.x, tilePos.y, pos.z)
			index = index + 1
		until valid or index > #directions

		-- Search entire screen if nothing found nearby
		if not valid then
			-- Populate all non-walkable tiles on-screen
			local tiles = {}
			for x = -7, 7 do
				for y = -7, 7 do
					-- Tile not walkable
					if xeno.getTileIsWalkable(pos.x+x, pos.y+y, pos.z) then
						tiles[#tiles+1] = {x=pos.x+x, y=pos.y+y, z=pos.z}
					end
				end
			end
			-- Sort by distance
			tiles = sortPositionsByDistance(pos, tiles)
			-- Find tile to clear
			local screenIndex = 1
			local screenValid = false
			repeat
				local tpos = tiles[screenIndex]
				screenValid = clearTile(tpos.x, tpos.y, tpos.z)
				screenIndex = screenIndex + 1
			until screenValid or screenIndex > #tiles
		end
	end

	local function cast(words)
		return xeno.getSelfSpellCooldown(words) == 0 
			and xeno.getSelfSpellRequirementsMet(words)
			and xeno.selfSay(words)
	end

	local function isSpell(words)
		local spellPrefixes = {'exan', 'exura', 'utan', 'utevo', 'exevo', 'exor', 'utor'}
		local isSpell = false
		for i = 1, #spellPrefixes do
			local prefix = spellPrefixes[i]
			local pattern = ("^%s.*$"):format(prefix)
			if words:match(pattern) then
				isSpell = true
				break
			end
		end
		return isSpell
	end

	local function cureConditions(callback)
		local conditions = {
			poisoned = {
				spell = 'exana pox',
				voc = {druid=true, sorcerer=true, paladin=true, knight=true}
			},
			burning = {
				spell = 'exana flam',
				voc = {druid=true}
			},
			cursed = {
				spell = 'exana mort',
				voc = {paladin=true}
			},
			bleeding = {
				spell = 'exana kor',
				voc = {druid=true, knight=true}
			},
			electrified = {
				spell = 'exana vis',
				voc = {druid=true}
			}
		}

		local casted = false
		for condition, data in pairs(conditions) do
			if xeno.getSelfFlag(condition) and not data.cured then
				-- Only attempt once per condition
				data.cured = true
				-- Cure the condition
				if data.voc[_script.vocation:lower()] then
					casted = true
					cast(data.spell)
					break									
				end
			end
		end

		-- Attempted to heal, recurse to heal more conditions
		if casted then
			setTimeout(function()
				cureConditions(callback)
			end, 1500)
		elseif callback then
			callback()
		end
	end

	local function isCorpseOpen()
		local index = -1
		while (index < 16) do
			index = index + 1
			local container = xeno.getContainerName(index)
			local isCorpse = string.find(container, "The") or 
				string.find(container, "Demonic") or 
				string.find(container, "Dead") or 
				string.find(container, "Slain") or 
				string.find(container, "Dissolved") or 
				string.find(container, "Remains") or 
				string.find(container, "Elemental") or 
				string.find(container, "Split") or 
				xeno.isItemCorpse(xeno.getContainerID(index))
			if(xeno.getContainerOpen(index) and isCorpse)then
				return true
			end
		end
		return false
	end

	local function getWalkableTiles(center, range)
		local walkables = {}
		local base = center
		range = (range > 10) and 10 or range
		for x = -range, range do
			for y = -range, range do
				if xeno.getTileIsWalkable(base.x + x, base.y + y, base.z) then
					walkables[#walkables+1] = {x = base.x + x, y = base.y + y, z = base.z}
				end
			end
		end
		return walkables
	end

	local function getDirectionTo(pos1, pos2)
		local dir = NORTH
		if (pos1.x > pos2.x) then
			dir = WEST
			if (pos1.y > pos2.y) then
				dir = NORTHWEST
			elseif (pos1.y < pos2.y) then
				dir = SOUTHWEST
			end
		elseif (pos1.x < pos2.x) then
			dir = EAST
			if (pos1.y > pos2.y) then
				dir = NORTHEAST
			elseif (pos1.y < pos2.y) then
				dir = SOUTHEAST
			end
		else
			if (pos1.y > pos2.y) then
				dir = NORTH
			elseif (pos1.y < pos2.y) then
				dir = SOUTH
			end
		end
		return dir
	end

	local function getSelfName()
		return xeno.getCreatureName(xeno.getCreatureListIndex(xeno.getSelfID()))
	end
	
	local function checkSoftBoots()
		-- Check softboots
		local playerMana = math.abs((xeno.getSelfMana() / xeno.getSelfMaxMana()) * 100)
		if _config['Soft Boots']['Mana-Percent'] > 0 then
			local playerBoots = xeno.getFeetSlotData().id
			local inProtectionZone = xeno.getSelfFlag('inpz')
			local needSoftBoots = not inProtectionZone and playerMana <= _config['Soft Boots']['Mana-Percent']
			local mainbp = _backpacks['Main']
			-- Needs soft boots
			if needSoftBoots then
				-- Needs to swap normal or worn boots with softboots
				if playerBoots ~= ITEMID.SOFTBOOTS_ACTIVE then
					-- Search for soft boots in main backpack
					for spot = 0, xeno.getContainerItemCount(mainbp) - 1 do
						-- Equip soft boots
						if xeno.getContainerSpotData(mainbp, spot).id == ITEMID.SOFTBOOTS then
							xeno.containerMoveItemToSlot(mainbp, spot, "feet", 1)
							_script.equipped['feet'] = true;
							break
						end
					end
				end
			-- Need to swap active or worn softboots with normal boots
			elseif playerBoots == 0 or playerBoots == ITEMID.SOFTBOOTS_ACTIVE or playerBoots == ITEMID.SOFTBOOTS_WORN then
				-- Search for regular boots
				for spot = 0, xeno.getContainerItemCount(mainbp) - 1 do
					-- Equip regular boots
					if NORMAL_BOOTS[xeno.getContainerSpotData(mainbp, spot).id] then
						xeno.containerMoveItemToSlot(mainbp, spot, "feet", 1)
						_script.equipped['feet'] = false;
						break
					end
				end
			end
		end
	end

	local _delayTimeout = nil
	local function delayWalker()
		if _delayTimeout then
			clearTimeout(_delayTimeout)
			_delayTimeout = nil
		end
		_delayTimeout = setTimeout(function()
			xeno.setWalkerEnabled(false)
			error('Action timed out. Please contact support.')
		end, DELAY.WALKER_TIMEOUT - 100)
		return xeno.delayWalker(DELAY.WALKER_TIMEOUT)
	end

	local function resumeWalker()
		if _delayTimeout then
			clearTimeout(_delayTimeout)
			_delayTimeout = nil
		end
		return xeno.delayWalker(0)
	end

	-- Export global functions
	return {
		debug = debug,
		overflowText = overflowText,
		formatTime = formatTime,
		formatNumber = formatNumber,
		titlecase = titlecase,
		formatList = formatList,
		getMemoryUsage = getMemoryUsage,
		freeMemory = freeMemory,
		pingDelay = pingDelay,
		throttle = throttle,
		clearTimeout = clearTimeout,
		clearWhen = clearWhen,
		setTimeout = setTimeout,
		setInterval = setInterval,
		when = when,
		checkTimers = checkTimers,
		checkEvents = checkEvents,
		split = split,
		trim = trim,
		isXenoBotBinary = isXenoBotBinary,
		getXenoVersion = getXenoVersion,
		getSelfLookPosition = getSelfLookPosition,
		getPosFromString = getPosFromString,
		cleanLabel = cleanLabel,
		countPairs = countPairs,
		indexTable = indexTable,
		getTimeUntilServerSave = getTimeUntilServerSave,
		sortPositionsByDistance = sortPositionsByDistance,
		talk = talk,
		clearWalkerPath = clearWalkerPath,
		cast = cast,
		isSpell = isSpell,
		cureConditions = cureConditions,
		isCorpseOpen = isCorpseOpen,
		getWalkableTiles = getWalkableTiles,
		getDirectionTo = getDirectionTo,
		getPositionFromDirection = getPositionFromDirection,
		getDistanceBetween = getDistanceBetween,
		getSelfName = getSelfName,
		checkSoftBoots = checkSoftBoots,
		flattenItemCounts = flattenItemCounts,
		delayWalker = delayWalker,
		resumeWalker = resumeWalker
	}
end)()
Console = (function()
	
	-- Imports
	local when = Core.when
	local getSelfName = Core.getSelfName

	local _lastConsoleMessage = nil
	
	local function log(message)
		if message == _lastConsoleMessage then
			return
		end
		_lastConsoleMessage = message
		xeno.luaSendChannelMessage(_script.channel, CHANNEL_ORANGE, ':', message)
	end
	
	local function info(message)
		if message == _lastConsoleMessage then
			return
		end
		_lastConsoleMessage = message
		xeno.luaSendChannelMessage(_script.channel, CHANNEL_YELLOW, ':', message)
	end

	local function warn(message)
		if message == _lastConsoleMessage then
			return
		end
		_lastConsoleMessage = message
		xeno.luaSendChannelMessage(_script.channel, CHANNEL_RED, ':', message)
	end

	local function error(message)
		xeno.luaSendChannelMessage(_script.channel, CHANNEL_RED, ':', 'ERROR :: ' .. message)
		xeno.setWalkerEnabled(false)
		xeno.setTargetingEnabled(false)
		xeno.setLooterEnabled(false)
		print(message)
		_script.crashed = true
	end

	local function prompt(message, callback)
		_lastConsoleMessage = nil
		log(message)
		when(EVENT_COMMAND, nil, function(response)
			callback(response)
		end)
	end

	local function openConsole()
		_script.channel = xeno.luaOpenCustomChannel('XenoBot')
		-- Welcome message
		log(string.rep('\n ', 54) .. '\n' .. string.rep(':', 190) .. '\n:::::   X E N O B O T   :::::           ' .. _script.name .. '  ('.. LIB_REVISION ..')\n' .. string.rep(':', 190) .. ' \n ')
		warn('You can control your script from this channel. Type /help for a list of available commands.')
		warn('Configure this script with the command /config or open the file at: Documents/XenoBot/Configs/[' .. getSelfName() .. '] ' .. _script.name .. '.ini')
	end

	local function openPrivateMessageConsole()
		_script.historyChannel = xeno.luaOpenCustomChannel('History')
	end

	local function openDebugChannel()
		_script.debugChannel = xeno.luaOpenCustomChannel('Debug')
	end

	-- Export global functions
	return {
		log = log,
		info = info,
		warn = warn,
		error = error,
		prompt = prompt,
		openConsole = openConsole,
		openDebugChannel = openDebugChannel,
		openPrivateMessageConsole = openPrivateMessageConsole
	}
end)()
Container = (function()
	
	-- Imports
	local pingDelay = Core.pingDelay
	local clearTimeout = Core.clearTimeout
	local clearWhen = Core.clearWhen
	local setTimeout = Core.setTimeout
	local setInterval = Core.setInterval
	local getWalkableTiles = Core.getWalkableTiles
	local when = Core.when
	local formatList = Core.formatList
	local debug = Core.debug
	local log = Console.log
	local info = Console.info
	local error = Console.error
	local prompt = Console.prompt

	local function getLastContainer()
		local last = 0
		for i = 0, 16 do
			if xeno.getContainerOpen(i) then
				last = i
			end
		end
		return last
	end

	local function getContainerByName(name)
		for i = 0, 16 do
			if xeno.getContainerName(i) == name and xeno.getContainerOpen(i) then
				return i
			end
		end
		return false
	end

	local function compareContainers(a, b)
		-- Different item count, return false
		local itemcount = xeno.getContainerItemCount(a)
		local compcount = xeno.getContainerItemCount(b)
		if itemcount ~= compcount then
			return false
		end
		-- Different name, return false
		if xeno.getContainerName(a) ~= xeno.getContainerName(b) then
			return false
		end
		-- Different slot data, return false
		for spot = 0, itemcount do
			local item = xeno.getContainerSpotData(a, spot)
			local compitem = xeno.getContainerSpotData(b, spot)
			if item.id ~= compitem.id or item.count ~= compitem.count then
				return false
			end
		end
		-- Containers are similar (shallow comparison)
		return true
	end

	local function whenContainerUpdates(container, callback)
		local timeout = nil
		local success = nil
		timeout = setTimeout(function()
			clearWhen(EVENT_CONTAINER, success)
			callback(false)
		end, DELAY.CONTAINER_TIMEOUT)
		success = when(EVENT_CONTAINER, tostring(container), function(index, id, name)
			clearTimeout(timeout)
			callback(true)
		end)
	end

	local function resetContainerDepths(source, destination, sDepth, dDepth, callback)
		-- Go back in source container
		if sDepth > 0 then
			xeno.containerBack(source)
			whenContainerUpdates(source, function(success)
				if success then
					resetContainerDepths(source, destination, sDepth-1, dDepth, callback)
				else
					resetContainerDepths(source, destination, sDepth, dDepth, callback)
				end
			end)

		-- Go back in destination container
		elseif dDepth > 0 then
			xeno.containerBack(destination)
			whenContainerUpdates(destination, function(success)
				if success then
					resetContainerDepths(source, destination, sDepth, dDepth-1, callback)
				else
					resetContainerDepths(source, destination, sDepth, dDepth, callback)
				end
			end)
		-- Return
		elseif callback then
			callback()
		end
	end

	local function containerMoveItems(options, callback)
		local fromContainer = options.src
		local toContainer = options.dest
		local toSlot = options.slot

		local whiteList = options.items
		local blackList = options.ignore
		local itemFilter = options.filter

		local disableSourceCascade = options.disableSourceCascade or fromContainer == _backpacks['Main']
		local openWindow = options.openwindow -- open first destination cascade in new window

		local spotOffset = 0
		local sourceDepth = 0
		local destDepth = 0

		local isMovingPaused = false

		local moveItem = nil
		local watchContainerFullError = nil
		local onContainerFull = nil
		local moveInterval = nil
		local fullEvent = nil

		local moveCounts = {}
		local moveHits = {}
		local lastMove = {
			itemid = nil,
			count = nil
		}

		if not fromContainer or not toContainer then
			callback()
			return
		end

		-- Target move slot is last slot in the container by default
		if toSlot == nil then
			toSlot = xeno.getContainerItemCapacity(toContainer) - 1
		end

		-- Registers the error watcher
		watchContainerFullError = function()
			debug('containerMoveItems: container full event')
			return when(EVENT_ERROR, ERROR_CONTAINER_FULL, onContainerFull)
		end

		local item = nil

		-- Called to trigger a single item move
		moveItem = function(self)

			-- Moving is paused, stop recurse
			if isMovingPaused then
				debug('containerMoveItems: moving paused')
				return
			end

			-- Remaining items
			local itemCount = xeno.getContainerItemCount(fromContainer)

			-- No items and cascade OR skipped all filled spots, stop entirely
			if itemCount == 0 or spotOffset >= itemCount then
				-- Kill monitoring container full errors
				if fullEvent then
					clearWhen(EVENT_ERROR, fullEvent)
				end
				-- Kill move event
				if moveInterval then
					clearTimeout(moveInterval)
				end
				-- Reset depths and finish
				resetContainerDepths(fromContainer, toContainer, sourceDepth, destDepth, function()
					debug('containerMoveItems: resetContainerDepths -> callback')
					callback(true, moveHits)
				end)
				return
			end

			-- Das item
			item = xeno.getContainerSpotData(fromContainer, spotOffset)

			-- Amount of this stack to move (defaults to entire stack)
			local moveStackCount = item.count

			-- Cascade backpack, last slot of backpack
			if xeno.isItemContainer(item.id) and (spotOffset + 1 >= itemCount) then 
				-- Cascade source enabled, open it, update source depth, reset spot offset
				if not disableSourceCascade then
					sourceDepth = sourceDepth + 1
					spotOffset = 0
					xeno.containerUseItem(fromContainer, itemCount-1, true, true)
					debug('containerMoveItems: cascade [last slot]')
				else
					spotOffset = spotOffset + 1
					-- Skip to next item immediately
					debug('containerMoveItems: moveItem() [last slot]')
					moveItem(self)
				end
				return
			end

			-- Item is in blacklist, try next spot
			if blackList and blackList[item.id] then
				spotOffset = spotOffset + 1
				-- Skip to next item immediately
				debug('containerMoveItems: moveItem() [blacklist]')
				moveItem(self)
				return
			end

			-- Item not in filter list, try next spot
			if whiteList and not whiteList[item.id] then
				spotOffset = spotOffset + 1
				-- Skip to next item immediately
				debug('containerMoveItems: moveItem() [filter]')
				moveItem(self)
				return
			end

			-- Item filter is set, run function to test validity
			if itemFilter and not itemFilter(item) then
				spotOffset = spotOffset + 1
				-- Skip to next item immediately
				debug('containerMoveItems: moveItem() [filter func]')
				moveItem(self)
				return
			end

			-- Item list, and entry has a number (count) value
			if whiteList and whiteList[item.id] and type(whiteList[item.id]) == 'number' then
				-- Check if we've moved any of this item yet
				if not moveCounts[item.id] then
					moveCounts[item.id] = whiteList[item.id]
				end

				-- We don't need anymore of this item, skip
				if moveCounts[item.id] <= 0 then
					spotOffset = spotOffset + 1
					-- Skip to next item immediately
					debug('containerMoveItems: moveItem() [no need]')
					moveItem(self)
					return
				end

				-- Now we know how much to move, don't go over the needed (smallest value)
				moveStackCount = math.min(item.count, moveCounts[item.id])

				-- Decrease needed (we'll reverse this if we fail)
				moveCounts[item.id] = moveCounts[item.id] - moveStackCount
			end

			-- Track move counts by itemid
			local itemMoves = moveHits[item.id]
			if not itemMoves then itemMoves = 0 end
			moveHits[item.id] = itemMoves + moveStackCount

			-- Track last move
			lastMove.itemid = item.id
			lastMove.count = moveStackCount
			
			-- Move item to destination
			debug(('containerMoveItems: move item %d, %d => %d, %d x%d'):format(fromContainer, spotOffset, toContainer, toSlot, moveStackCount))
			xeno.containerMoveItemToContainer(fromContainer, spotOffset, toContainer, toSlot, moveStackCount)
		end

		-- Triggered when the destination fills up
		onContainerFull = function()
			-- Set flag so we stop moving items
			-- No need to kill fullEvent, it dies after one use
			isMovingPaused = true

			-- Check if we need to reverse a move
			if item and lastMove.itemid and lastMove.count > -1 then
				-- Increase move counts
				if whiteList and moveCounts[lastMove.itemid] then
					moveCounts[item.id] = moveCounts[item.id] + lastMove.count
				end
				-- Decrease total item moves
				local itemMoves = moveHits[item.id]
				if not itemMoves then itemMoves = 0 end
				moveHits[item.id] = math.max(0, itemMoves - lastMove.count)
			end

			setTimeout(function()
				-- We weren't depositing into a backpack, no cascade available
				if not xeno.isItemContainer(xeno.getContainerSpotData(toContainer, toSlot).id) then
					-- Kill move event
					if moveInterval then
						clearTimeout(moveInterval)
					end
					-- Reset depths and finish
					debug('containerMoveItems: reset depths [no bp, no cascade]')
					resetContainerDepths(fromContainer, toContainer, sourceDepth, destDepth, function()
						debug('containerMoveItems: callback() [no bp, no cascade]')
						callback(false, moveHits)
					end)
					return
				end

				local targetContainer = openWindow and getLastContainer() or toContainer
				local function processCascade()
					-- Update toContainer index if we opened in a new window
					if openWindow then
						toContainer = targetContainer
						debug('containerMoveItems: new window = ' .. toContainer)
						-- Reset destination depth, since we're in a new destination
						destDepth = 0
					end

					-- Check if last item is a container
					local lastSlot = xeno.getContainerItemCount(toContainer) - 1
					local cascadeID = xeno.getContainerSpotData(toContainer, lastSlot).id
					if xeno.isItemContainer(cascadeID) then
						-- Found cascade backpack, update slot, update destination depth
						openWindow = false
						destDepth = destDepth + 1
						toSlot = lastSlot

						-- Start moving again
						isMovingPaused = false

						-- Register full event again
						fullEvent = watchContainerFullError()
						debug('containerMoveItems: cascade depth = ' .. destDepth)
						return
					end
					-- No cascade backpack, stop entirely
					-- Reset depths and finish
					debug('containerMoveItems: reset depths [cascaded]')
					resetContainerDepths(fromContainer, toContainer, sourceDepth, destDepth, function()
						debug('containerMoveItems: callback() [cascaded]')
						callback(false, moveHits)
						-- Kill move event
						if moveInterval then
							clearTimeout(moveInterval)
						end
					end)
					return
				end

				debug('containerMoveItems: open destination')
				xeno.containerUseItem(toContainer, toSlot, not openWindow, true)
				whenContainerUpdates(targetContainer, function(success)
					if success then
						processCascade()
					else
						onContainerFull() -- retry
					end
				end)
			end, DELAY.CONTAINER_MOVE_ITEM)
		end

		-- Begin moving
		moveInterval = setInterval(moveItem, DELAY.CONTAINER_MOVE_ITEM)

		-- Start watching for container full errors
		fullEvent = watchContainerFullError()
	end

	local function moveItems(containers, options, callback, dirty)
		local source = table.remove(containers)
		containerMoveItems({
			src = source,
			dest = options.dest,
			items = options.items,
			disableSourceCascade = options.disableSourceCascade,
			openwindow = options.openwindow
		}, function(cascaded, moveCounts)
			-- Count moved items
			local totalCount = 0
			if moveCounts then
				for itemid, count in pairs(moveCounts) do
					totalCount = totalCount + count
				end
			end
			-- Moved items, flag entire move as "dirty"
			-- means cleanContainer will reloop
			-- we do this incase we freed up any slots
			if totalCount > 0 then
				dirty = true
			end

			-- Successfully moved items,
			-- Last container, finish
			if #containers == 0 then
				callback(dirty)
			-- Recurse
			else
				moveItems(containers, options, callback, dirty)
			end
		end)
	end

	local function cleanContainers(destination, itemList, callback, shallow)
		-- Check all backpacks except for destination
		-- for items in the list and move them to the destination
		local containers = {}
		for i = 0, 15 do
			if i ~= destination and xeno.getContainerOpen(i) then
				containers[#containers+1] = i
			end
		end
		moveItems(containers, {
			dest = destination,
			slot = 0,
			items = itemList,
			-- Do not dig into the main backpack
			disableSourceCascade = shallow,
			openwindow = false
		}, function(dirty)
			-- Something was moved
			if dirty then
				cleanContainers(destination, itemList, callback, shallow)
			elseif callback then
				callback()
			end
		end)
	end

	local function openMainBackpack(callback, tries)
		-- Retry attempts
		tries = tries or 3

		-- Wait for Main Backpack
		xeno.slotUseItem(3)
		whenContainerUpdates(0, function(success)
			if success then
				if _config['General']['Minimize-Backpacks'] then
					xeno.minimizeContainer(0)
				end
				callback(true)
			elseif tries <= 0 then
				error('Unable to open main backpack. Check your equipment slot.')
			else
				tries = tries - 1
				openMainBackpack(callback, tries)
			end
		end)
	end

	local function resetContainers(callback)
		_script.openingContainers = true

		-- Close all containers
		for i = 0, 16 do
			xeno.closeContainer(i)
		end

		local minimizeBackpacks = _config['General']['Minimize-Backpacks']
		openMainBackpack(function()
			_script.openingContainers = nil
			local backpacks = {}
			local function openChild(index)
				local spot = backpacks[index]
				local newcontainer = getLastContainer() + 1

				-- Wait for child to open
				xeno.containerUseItem(0, spot, false, true)
				whenContainerUpdates(newcontainer, function(success)
					if not success then
						openChild(index)
						return
					end

					-- Minimize all containers
					if minimizeBackpacks then
						for i = 1, 16 do
							if xeno.getContainerOpen(i) then
								xeno.minimizeContainer(i)
							end
						end
					end
					-- Open next child
					if #backpacks > index then
						openChild(index+1)
					-- Complete, main callback
					else
						callback()
					end
				end)
			end

			-- Loop through all items, add containers to list
			local itemcount = xeno.getContainerItemCount(0)
			for spot = 0, itemcount - 1 do
				local item = xeno.getContainerSpotData(0, spot)
				if xeno.isItemContainer(item.id) then
					backpacks[#backpacks+1] = spot
					debug('resetContainers - found bp: ' .. spot)
				end
			end

			-- Call openChild for every backpack
			openChild(1)
		end)
	end

	local function setupContainers(callback)
		local needGoldContainer = false
		local needPotionContainer = false
		local needRuneContainer = false
		local needAmmoContainer = false
		local needSuppliesContainer = false

		-- Pause the bot
		xeno.attackCreature(0)
		xeno.followCreature(0)
		xeno.setWalkerEnabled(false)
		xeno.setLooterEnabled(false)
		xeno.setTargetingEnabled(false)

		log('Setting up your backpacks, please wait...')
		local function finishSetup()
			log('Your backpacks have been setup. Do NOT rearrange containers!')

			-- Resume the bot
			xeno.setWalkerEnabled(true)
			xeno.setLooterEnabled(true)
			xeno.setTargetingEnabled(true)

			callback()
		end

		-- Move items in main backpack to the correct backpacks
		local function organizeMainBackpack()
			local destinations = {}
			local itemLists = {}

			-- Move gold to gold backpack
			local goldBackpack = _backpacks['Gold']
			destinations[#destinations+1] = {'Gold', goldBackpack}
			itemLists[goldBackpack] = {[3031] = true}

			-- Move platinum and crystal coins to main
			local mainBackpack = _backpacks['Main']
			destinations[#destinations+1] = {'Main', mainBackpack}
			itemLists[mainBackpack] = {
				[3035] = true,
				[3043] = true
			}

			-- Create itemid list for each supply group
			for itemid, supply in pairs(_supplies) do
				if itemid ~= ITEMID.GOLDEN_MUG then
					-- Amulets and Rings always go in the Supplies backpack
					local name = supply.group
					if name == 'Amulet' or name == 'Ring' then
						name = 'Supplies'
					end
					-- Send to Main backpack list if it matches the index
					local backpack = _backpacks[name]
					if backpack then
						if backpack == _backpacks['Main'] then
							name = 'Main'
						end
						-- Init table if it doesn't exist
						if not itemLists[backpack] then
							itemLists[backpack] = {}
							-- Add backpack to index for easy iteration
							destinations[#destinations+1] = {name, backpack}
						end
						-- Add supply item to the list
						itemLists[backpack][itemid] = true
					end
				end
			end

			local function moveNextItems(index)
				local backpack = destinations[index]

				-- Check if destination exists (no items to move)
				if not backpack then
					finishSetup()
					return
				end

				local backpackName = backpack[1]
				local destination = backpack[2]

				-- Get itemid list for this backpack
				local itemList = itemLists[destination]

				-- Clean all backpacks and move valid items to this backpack
				cleanContainers(destination, itemList, function(success)
					-- Proceed to next destination
					moveNextItems(index+1)
				end)
			end

			-- Move items to proper backpack, then finish
			if #destinations > 0 then
				moveNextItems(1)
			-- None to move, finish up
			else
				finishSetup()
			end
		end

		-- Assign backpacks
		local function assignBackpacks()
			-- Setup containers (start at index 2 since Main = 0, Loot = 1)
			local index = 2
			local list = {}

			list[#list+1] = '#1  -  Main backpack'
			list[#list+1] = '#2  -  Loot backpack'

			local containerStatuses = {
				{'Gold', needGoldContainer},
				{'Potions', needPotionContainer},
				{'Runes', needRuneContainer},
				{'Ammo', needAmmoContainer},
				{'Supplies', needSuppliesContainer}
			}

			for i = 1, #containerStatuses do
				local status = containerStatuses[i]
				if status and status[2] then
					_backpacks[status[1]] = index
					list[#list+1] = ('#%d  -  %s backpack'):format(index+1, status[1])
					index = index + 1
				else
					_backpacks[status[1]] = 0
				end
			end

			info('Your backpack setup:\n' .. formatList(list, '\n', '    '));

			if _config['General']['Organize-Backpacks'] then
				log('Organizing your backpacks, please wait...')
				organizeMainBackpack()
			else
				finishSetup()
			end
		end

		-- Open main bp and children
		resetContainers(function()
			-- Count how many are open (excluding main bp)
			-- Determine how many we need
			-- If we have enough, continue
			-- If not, prompt user, wait for response, recheck

			-- Loop through supplies, flag each "type" of container we will need
			local neededContainers = 0
			local runeCount = 0
			local potionCount = 0
			local ammoCount = 0
			local supplyCount = 0

			if _config['Loot']['Loot-Gold'] then
			   neededContainers = neededContainers + 1
			   needGoldContainer = true 
			end

			for supplyId, supply in pairs(_supplies) do
				if supply.group == 'Potions' and not needPotionContainer then
					potionCount = potionCount + supply.max
					if potionCount > 100 then
						neededContainers = neededContainers + 1
						needPotionContainer = true
					end
				elseif supply.group == 'Runes' and not needRuneContainer then
					runeCount = runeCount + supply.max
					if runeCount > 100 then
						neededContainers = neededContainers + 1
						needRuneContainer = true
					end
				elseif supply.group == 'Ammo' and not needAmmoContainer then
					ammoCount = ammoCount + supply.max
					if ammoCount > 100 then
						neededContainers = neededContainers + 1
						needAmmoContainer = true
					end
				elseif (supply.group == 'Ring' or supply.group == 'Amulet') and not needSuppliesContainer then
					supplyCount = supplyCount + supply.max
					if supplyCount > 5 then
						neededContainers = neededContainers + 1
						needSuppliesContainer = true
					end
				end
			end

			-- Backpacks inside main bp we can use (ignore mainbp and loot bp)
			local availableContainers = getLastContainer() - 1

			-- Make sure we have enough, if not prompt, then retry
			if availableContainers < neededContainers then
				-- prompt user, then assignBackpacks
				local missingCount = (neededContainers - availableContainers)
				local singularMsg = 'Not enough backpacks. Add one more backpack to your main backpack. Type "retry" to continue.'
				local pluralMsg = 'Not enough backpacks. Add ' .. missingCount .. ' more backpacks to your main backpack. Type "retry" to continue.'
				local message = missingCount > 1 and pluralMsg or singularMsg
				local function promptBackpacks()
					prompt(message, function(response)
						if string.find(string.lower(response), 'retry') then
							setupContainers(callback)
						else
							promptBackpacks()
						end
					end)
				end
				promptBackpacks()
				return
			end

			-- All is well, start setup
			assignBackpacks()
		end)
	end

	local function getContainerItemCounts(index, callback, deepSearch, startLevel)
		local items = {}
		local function countLevel(level)
			-- Iterate through container spots
			local lastSlot = xeno.getContainerItemCount(index) - 1
			for spot = 0, lastSlot do
				local item = xeno.getContainerSpotData(index, spot)
				-- Do not count the cascade backpack 
				if spot ~= lastSlot or not xeno.isItemContainer(item.id) then
					-- Create table and entries on-demand
					if not items[item.id] then
						items[item.id] = 0
					end
					-- Increment count
					items[item.id] = items[item.id] + math.max(item.count, 1)
				end
			end

			-- Only counting the current container level OR reached top level
			if not deepSearch or level <= 1 then
				if callback then
					callback(items)
				end
				return items
			-- Not done, keep counting backwards
			else
				-- Navigate back a level
				local function goBack()
					xeno.containerBack(index)
					whenContainerUpdates(index, function(success)
						if not success then
							goBack()
							return
						end
						countLevel(level-1)
					end)
				end
				goBack()
			end
			return nil
		end
		local function gotoBottom(depth)
			local lastSlot = xeno.getContainerItemCount(index) - 1
			local cascadeID = xeno.getContainerSpotData(index, lastSlot).id
			-- Another cascade, go deeper
			if xeno.isItemContainer(cascadeID) then
				xeno.containerUseItem(index, lastSlot, true, true)
				whenContainerUpdates(index, function(success)
					if not success then
						gotoBottom(depth)
					else
						gotoBottom(depth + 1)
					end
				end)
				return
			end
			-- At the last level, start counting items
			countLevel(depth)
		end
		-- Deep count specified, go to end of container and count backwards
		if deepSearch then
			gotoBottom(startLevel or 1)
		-- Shallow count, function can be used synchronously
		else
			return countLevel(1)
		end
	end

	local function getTotalItemCount(itemIdList, ignoreEquipment)
		local totals = {}
		local numberReturn = false

		-- Wrap single itemid in an index table
		if type(itemIdList) ~= 'table' then
			numberReturn = itemIdList
			itemIdList = {[itemIdList] = true}
		end

		-- Count equipment
		if not ignoreEquipment then
			local slots = {
				xeno.getHeadSlotData,
				xeno.getArmorSlotData,
				xeno.getLegsSlotData,
				xeno.getFeetSlotData,
				xeno.getAmuletSlotData,
				xeno.getWeaponSlotData,
				xeno.getRingSlotData,
				xeno.getShieldSlotData,
				xeno.getAmmoSlotData
			}
			for i = 1, #slots do
				local slot = slots[i]()
				if slot and slot.id then
					-- Counting this item
					if itemIdList[slot.id] then
						local itemTotal = totals[slot.id]
						local itemcount = math.max(slot.count, 1)
						if not itemTotal then
							totals[slot.id] = itemcount
						else
							itemTotal = itemTotal + itemcount
						end
					end
				end
			end
		end

		-- Iterate all possible containers
		for i = 0, 16 do
			-- No more containers, stop searching
			if not xeno.getContainerOpen(i) then
				break
			end
			-- Count this container
			local counts = getContainerItemCounts(i)
			for itemid, itemcount in pairs(counts) do
				-- Counting this item
				if itemIdList[itemid] then
					local itemTotal = totals[itemid]
					if not itemTotal then
						totals[itemid] = itemcount
					else
						totals[itemid] = itemTotal + itemcount
					end
				end
			end
		end

		-- Returns number if single number was provided
		-- otherwise returns a pairs table with itemid = count
		if numberReturn then
			totals = totals[numberReturn]
		end
		return totals or 0
	end

	local function getMoney()
		local counts = getTotalItemCount(ITEM_LIST_MONEY)

		local gold = counts[3031] or 0
		local plat = counts[3035] or 0
		local crystal = counts[3043] or 0

		local total = gold
		total = total + (plat * 100)
		total = total + (crystal * 10000)

		return total
	end

	local function getFlasks()
		local counts = getTotalItemCount(ITEM_LIST_FLASKS)

		local small = counts[285] or 0
		local med = counts[284] or 0
		local large = counts[283] or 0

		return small + med + large
	end

	local function getFlaskWeight()
		local counts = getTotalItemCount(ITEM_LIST_FLASKS)

		local small = counts[285] or 0
		local med = counts[284] or 0
		local large = counts[283] or 0

		return (small * xeno.getItemWeight(285))
			+ (med * xeno.getItemWeight(284))
			+ (large * xeno.getItemWeight(283))
	end

	local function unrustLoot()
		-- Make sure a corpse is not currently open
		-- Loop through each slot in the loot container
		-- If loot is a "rusty" item, use oil on it.
		-- Wait x delay and look at the same slot.
		--ITEM_LIST_RUSTYARMORS
		local rustRemoverSlot = nil
		local supplybp = _backpacks['Supplies']
		for spot = 0, xeno.getContainerItemCount(supplybp) - 1 do
			local item = xeno.getContainerSpotData(supplybp, spot)
			if item.id == ITEMID.RUST_REMOVER then
				rustRemoverSlot = spot
				break
			end
		end

		if rustRemoverSlot then
			local lootbp = _backpacks['Loot']
			for spot = 0, xeno.getContainerItemCount(lootbp) - 1 do
				local item = xeno.getContainerSpotData(lootbp, spot)
				if ITEM_LIST_RUSTYARMORS[item.id] then
					-- TODO: Remove rusty armor from supplies (HUD)
					-- TODO: Add oil as supply waste (HUD)
					xeno.containerUseWithContainer(supplybp, rustRemoverSlot, lootbp, spot)
					setTimeout(function()
						-- If loot is shitty, toss it out.
						local unrusted = xeno.getContainerSpotData(lootbp, spot)
						if ITEM_LIST_RUSTYTRASH[unrusted.id] then
							-- Get random position
							local pos = xeno.getSelfPosition()
							local tiles = getWalkableTiles(pos, 3)
							if not tiles or #tiles < 1 then
								tiles = {pos}
							end
							local destination = tiles[math.random(1, #tiles)]
							xeno.containerMoveItemToGround(lootbp, spot, destination.x, destination.y, destination.z, -1)
						end
					end, pingDelay(DELAY.CONTAINER_USEWITH))
					break
				end
			end
		end
	end

	-- Export global functions
	return {
		getLastContainer = getLastContainer,
		getContainerByName = getContainerByName,
		whenContainerUpdates = whenContainerUpdates,
		containerMoveItems = containerMoveItems,
		setupContainers = setupContainers,
		resetContainers = resetContainers,
		getContainerItemCounts = getContainerItemCounts,
		cleanContainers = cleanContainers,
		getTotalItemCount = getTotalItemCount,
		getMoney = getMoney,
		getFlasks = getFlasks,
		getFlaskWeight = getFlaskWeight,
		unrustLoot = unrustLoot
	}
end)()
Hud = (function()
	
	-- Imports
	local formatNumber = Core.formatNumber
	local overflowText = Core.overflowText
	local titlecase = Core.titlecase
	local isCorpseOpen = Core.isCorpseOpen

	-- All HUD pointers are referenced here
	local hudPointers = {}
	local containerHud = {}

	local function hudGetContainerDimensions()
		local dimensions = xeno.HUDGetContainerDimensions()
		local containers = {}
		for i = 1, #dimensions, 5 do
			local temp = {}
			temp.x = dimensions[i+0]
			temp.y = dimensions[i+1]
			temp.w = dimensions[i+2]
			temp.h = dimensions[i+3]
			temp.id = dimensions[i+4]
			containers[temp.id+1] = temp
		end
		return containers
	end

	local function hudUpdateDimensions()
		local screen = xeno.HUDGetDimensions()
		local changed = _hud.gamewindow.x ~= screen.gamewindowx or
						_hud.gamewindow.y ~= screen.gamewindowy or
						_hud.gamewindow.w ~= screen.gamewindoww or
						_hud.gamewindow.h ~= screen.gamewindowh

		if not changed and _hud.rightcolumn.x > 0 then
			return false
		end

		_hud.gamewindow = {
			x = screen.gamewindowx,
			y = screen.gamewindowy,
			w = screen.gamewindoww,
			h = screen.gamewindowh
		}

		_hud.rightcolumn.x = screen.gamewindowx + screen.gamewindoww + 10

		return true
	end

	local function hudUpdatePositions()
		-- Reposition columns
		local leftcolumn = _hud.leftcolumn
		local rightcolumn = _hud.rightcolumn

		-- Threshold for y-axis (before wrapping)
		local maxAxisY = (_hud.gamewindow.y + _hud.gamewindow.h) - 10
		local wrappedColumn = false

		-- Track our current position while we add/update
		local currentAxisY = leftcolumn.y
		local currentAxisX = leftcolumn.x

		if _config['HUD']['Show-Containers'] then
			-- Update container hud
			local containers = hudGetContainerDimensions()
			local containerNames = {} -- by index
			for name, index in pairs(_backpacks) do
				containerNames[index+1] = name
				-- Remove missing containers
				if not xeno.getContainerOpen(index) then
					xeno.HUDUpdateLocation(containerHud[index+1], -100, -100)
				end
			end
			for id, container in pairs(containers) do
				local pointer = containerHud[id]
				local name = id == 1 and 'Main' or containerNames[id] or ''
				xeno.HUDUpdateTextText(pointer, name)
				xeno.HUDUpdateLocation(pointer, container.x + 15, container.y - 12)
			end
		end

		-- Loop through all panels in the column
		for i = 1, #leftcolumn.panels do
			-- Track the total height the panels take up
			local panel = leftcolumn.panels[i]
			local itemCount = #panel.items

			-- If panel has items we show the title of the panel
			-- add 25 pixels to the y-axis for the title (after adding/re-positioning the title)
			if itemCount > 0 then
				-- Detect if at least 1 item can fit on the screen
				-- if not, wrap the entire panel (including title)
				if currentAxisY + 20 > maxAxisY then
					currentAxisY = leftcolumn.y
					currentAxisX = currentAxisX + leftcolumn.w
				end

				-- Add panel title if it doesn't yet exist
				if not panel.pointer
					and (_config['HUD']['Show-Supplies'] or panel.title ~= 'Supplies')
					and (_config['HUD']['Show-Loot'] or panel.title ~= 'Loot') then
					local pointer = xeno.HUDCreateText(currentAxisX, currentAxisY, '[' .. panel.title .. ']', unpack(THEME[_script.theme].title))
					leftcolumn.panels[i].pointer = pointer
					hudPointers[#hudPointers+1] = pointer
				-- Update position
				else
					xeno.HUDUpdateLocation(panel.pointer, currentAxisX, currentAxisY)
				end
				currentAxisY = currentAxisY + 20

				-- Look at first item, if value is a number, sort all items higher to lower
				if type(panel.items[1].value) == 'number' then
					table.sort(panel.items, function(a, b)
						return a.value > b.value
					end)
				end
			end

			-- Loop through all items in the panel
			local wrappedPanel = false
			for j = 1, itemCount do
				-- Add or update title & value
				local item = panel.items[j]

				-- Add item title if pointer doesn't exist
				if not item.tpointer then
					local itemTitle = item.title .. ':'
					-- Title is an item id
					if type(item.title) == 'number' then
						itemTitle = overflowText(titlecase(xeno.getItemNameByID(item.title)), 11, '...')
						-- Icon doesn't exist, add it
						if not item.ipointer then
							-- Only add an icon if they are enabled
							if _config['HUD']['Show-Icons']
								and (_config['HUD']['Show-Supplies'] or panel.title ~= 'Supplies')
								and (_config['HUD']['Show-Loot'] or panel.title ~= 'Loot') then
								-- Images need slight y-axis offset
								local pointer = xeno.HUDCreateItemImage(currentAxisX, currentAxisY-5, item.title, 16, 100)
								panel.items[j].ipointer = pointer
								hudPointers[#hudPointers+1] = pointer
							end
						-- Update icon position (even if disabled, since we can't destroy them)
						else
							xeno.HUDUpdateLocation(item.ipointer, currentAxisX, currentAxisY-5)
						end
					end
					-- Indent title if there's an icon
					local xOffset = item.ipointer and 25 or 0

					if (_config['HUD']['Show-Supplies'] or panel.title ~= 'Supplies')
						and (_config['HUD']['Show-Loot'] or panel.title ~= 'Loot') then
						local pointer = xeno.HUDCreateText(currentAxisX + xOffset, currentAxisY, itemTitle, unpack(THEME[_script.theme].primary))
						panel.items[j].tpointer = pointer
						hudPointers[#hudPointers+1] = pointer
					end
				-- Update item title position
				else
					-- Update icon position (even if disabled, since we can't destroy them)
					if item.ipointer then
						xeno.HUDUpdateLocation(item.ipointer, currentAxisX, currentAxisY-5)
					end
					local xOffset = item.ipointer and 25 or 0
					xeno.HUDUpdateLocation(item.tpointer, currentAxisX + xOffset, currentAxisY)
				end

				-- Add item value if pointer doesn't exist
				if not item.vpointer then
					local itemValue = item.value
					if type(item.value) == 'number' then
						itemValue = formatNumber(item.value) .. ' gp'
					end
					if (_config['HUD']['Show-Supplies'] or panel.title ~= 'Supplies')
						and (_config['HUD']['Show-Loot'] or panel.title ~= 'Loot') then
						local pointer = xeno.HUDCreateText(currentAxisX + 110, currentAxisY, itemValue, unpack(THEME[_script.theme].secondary))
						panel.items[j].vpointer = pointer
						hudPointers[#hudPointers+1] = pointer
					end
				-- Update item value position
				else
					xeno.HUDUpdateLocation(item.vpointer, currentAxisX + 110, currentAxisY)
				end

				-- Each items adds 25px to the y-axis
				currentAxisY = currentAxisY + 15

				-- Test if we need to wrap the column
				if not wrappedColumn and currentAxisY >= maxAxisY then
					-- Reset y-axis (from panel title)
					currentAxisY = leftcolumn.y + 20
					-- Wrap to next "column"
					currentAxisX = currentAxisX + leftcolumn.w
					-- Flag as we wrapped once, do not show anymore panels
					wrappedPanel = true
				end
			end

			-- Wrapped items in the panel, flag the column as wrapped
			if wrappedPanel then
				wrappedColumn = true
			end

			-- Add padding to bottom if there were items
			if itemCount > 0 then
				currentAxisY = currentAxisY + 15
			end

			-- Wrapped the last panel (hide the rest)
			if wrappedColumn then
				currentAxisX = currentAxisX - (leftcolumn.w * 2)
			end
		end

		-- Track our current position while we add/update
		currentAxisY = rightcolumn.y
		currentAxisX = rightcolumn.x

		-- Loop through all panels in the column
		for i = 1, #rightcolumn.panels do
			-- Track the total height the panels take up
			local panel = rightcolumn.panels[i]
			local itemCount = #panel.items

			-- If panel has items we show the title of the panel
			-- add 25 pixels to the y-axis for the title (after adding/re-positioning the title)
			if itemCount > 0 then
				-- Detect if at least 1 item can fit on the screen
				-- if not, wrap the entire panel (including title)
				if currentAxisY + 20 > maxAxisY then
					currentAxisY = rightcolumn.y
					currentAxisX = currentAxisX + rightcolumn.w
				end

				-- Add panel title if it doesn't yet exist
				if not panel.pointer
					and (_config['HUD']['Show-Supplies'] or panel.title ~= 'Supplies')
					and (_config['HUD']['Show-Loot'] or panel.title ~= 'Loot') then
					local pointer = xeno.HUDCreateText(currentAxisX, currentAxisY, '[' .. panel.title .. ']', unpack(THEME[_script.theme].title))
					rightcolumn.panels[i].pointer = pointer
					hudPointers[#hudPointers+1] = pointer
				-- Update position
				else
					xeno.HUDUpdateLocation(panel.pointer, currentAxisX, currentAxisY)
				end
				currentAxisY = currentAxisY + 20

				-- Look at first item, if value is a number, sort all items higher to lower
				if type(panel.items[1].value) == 'number' then
					table.sort(panel.items, function(a, b)
						return a.value > b.value
					end)
				end
			end

			-- Loop through all items in the panel
			local wrappedPanel = false
			for j = 1, itemCount do
				-- Add or update title & value
				local item = panel.items[j]

				-- Add item title if pointer doesn't exist
				if not item.tpointer then
					local itemTitle = item.title .. ':'
					-- Title is an item id
					if type(item.title) == 'number' then
						itemTitle = overflowText(titlecase(xeno.getItemNameByID(item.title)), 11, '...')
						-- Icon doesn't exist, add it
						if not item.ipointer then
							-- Only add an icon if they are enabled
							if _config['HUD']['Show-Icons']
								and (_config['HUD']['Show-Supplies'] or panel.title ~= 'Supplies')
								and (_config['HUD']['Show-Loot'] or panel.title ~= 'Loot') then
								-- Images need slight y-axis offset
								local pointer = xeno.HUDCreateItemImage(currentAxisX, currentAxisY-5, item.title, 16, 100)
								panel.items[j].ipointer = pointer
								hudPointers[#hudPointers+1] = pointer
							end
						-- Update icon position (even if disabled, since we can't destroy them)
						else
							xeno.HUDUpdateLocation(item.ipointer, currentAxisX, currentAxisY-5)
						end
					end
					-- Indent title if there's an icon
					local xOffset = item.ipointer and 25 or 0
					if (_config['HUD']['Show-Supplies'] or panel.title ~= 'Supplies')
						and (_config['HUD']['Show-Loot'] or panel.title ~= 'Loot') then
						local pointer = xeno.HUDCreateText(currentAxisX + xOffset, currentAxisY, itemTitle, unpack(THEME[_script.theme].primary))
						panel.items[j].tpointer = pointer
						hudPointers[#hudPointers+1] = pointer
					end
				-- Update item title position
				else
					-- Update icon position (even if disabled, since we can't destroy them)
					if item.ipointer then
						xeno.HUDUpdateLocation(item.ipointer, currentAxisX, currentAxisY-5)
					end
					local xOffset = item.ipointer and 25 or 0
					xeno.HUDUpdateLocation(item.tpointer, currentAxisX + xOffset, currentAxisY)
				end

				-- Add item value if pointer doesn't exist
				if not item.vpointer then
					local itemValue = item.value
					if type(item.value) == 'number' then
						itemValue = formatNumber(item.value) .. ' gp'
					end
					if (_config['HUD']['Show-Supplies'] or panel.title ~= 'Supplies')
						and (_config['HUD']['Show-Loot'] or panel.title ~= 'Loot') then
						local pointer = xeno.HUDCreateText(currentAxisX + 110, currentAxisY, itemValue, unpack(THEME[_script.theme].secondary))
						panel.items[j].vpointer = pointer
						hudPointers[#hudPointers+1] = pointer
					end
				-- Update item value position
				else
					xeno.HUDUpdateLocation(item.vpointer, currentAxisX + 110, currentAxisY)
				end

				-- Each items adds 25px to the y-axis
				currentAxisY = currentAxisY + 15

				-- Test if we need to wrap the column
				if not wrappedColumn and currentAxisY >= maxAxisY then
					-- Reset y-axis (from panel title)
					currentAxisY = rightcolumn.y + 20
					-- Wrap to next "column"
					currentAxisX = currentAxisX + rightcolumn.w
					-- Flag as we wrapped once, do not show anymore panels
					wrappedPanel = true
				end
			end

			-- Wrapped items in the panel, flag the column as wrapped
			if wrappedPanel then
				wrappedColumn = true
			end

			-- Add padding to bottom if there were items
			if itemCount > 0 then
				currentAxisY = currentAxisY + 15
			end

			-- Wrapped the last panel (hide the rest)
			if wrappedColumn then
				currentAxisX = currentAxisX - (rightcolumn.w * 2)
			end
		end
	end

	local function hudPanelCreate(title, column, skipUpdate)
		local panel = {
			title = title,
			items = {}
		}
		table.insert(_hud[column].panels, panel)
		if not skipUpdate then
			hudUpdatePositions()
		end
		_hud.index[title] = panel
		return panel
	end

	local function hudItemCreate(panel, title, value, skipUpdate)
		local panel = _hud.index[panel]
		if not panel then
			return false
		end

		local item = {
			title = title,
			value = value
		}
		table.insert(panel.items, item)
		if not skipUpdate then
			hudUpdatePositions()
		end
		_hud.index[panel.title][title] = item
		return item
	end

	local function hudItemUpdate(panel, title, value, skipUpdate)
		local panel = _hud.index[panel]
		if panel then
			local item = panel[title]
			if item and value ~= item.value then
				item.value = value
				local itemValue = value
				if type(value) == 'number' then
					itemValue = formatNumber(value) .. ' gp'
				end
				xeno.HUDUpdateTextText(item.vpointer, itemValue)
				if not skipUpdate then
					hudUpdatePositions()
				end
			end
		end
	end

	local function getItemValue(lootID)
		return _config['Prices'][lootID] or xeno.getItemValue(lootID)
	end

	local function hudTrack(type, itemid, amount, skipUpdate)
		-- Loot / Supplies
		local hudItem = _hud.index[type][itemid]
		if not hudItem then
			hudItemCreate(type, itemid, 0, false)
			hudItem = _hud.index[type][itemid]
		end

		-- TODO: finish duration
		-- Check if this item has a duration
		local duration = ITEM_LIST_DURATIONS[itemid]
		--local hudValue = values and formatNumber((itemValue / (values.d * 60)) * count) .. ' gp' or '--'

		-- Get current count and values
		local calculateValue = type == 'Supplies' and xeno.getItemCost or getItemValue
		local itemValue = calculateValue(itemid)

		local hudCount = (hudItem.rawCount or 0) + amount
		local hudValue = (hudItem.rawValue or 0) + (itemValue * amount)

		-- Save raw values
		hudItem.rawCount = hudCount
		hudItem.rawValue = hudValue

		-- Timestamp duration item
		if duration then
			hudItem._lastCheck = os.time()
		end

		-- Update HUD
		local text = ''
		if ITEM_LIST_MONEY[itemid] then
			text = formatNumber(hudValue) .. ' gp'
		else
			text = formatNumber(hudCount) .. ' (' .. formatNumber(hudValue) .. ' gp)'
		end
		hudItemUpdate(type, itemid, text, skipUpdate)
	end

	-- polling
		-- supplies decrementing
		-- loot added
			-- corpse looting
			-- skinned items
		-- eq tracking (ammo, distance weapons, amulets)
		-- ammo tracking (ammo slot)
		-- time tracking (softboots, rings)
		-- 

	local function hudQueryLootChanges()
		-- TODO: support fishing/skinning
		-- TODO: decrement used loot (food, pots, etc)

		-- Total value from this query
		local totalQueryValue = 0

		local function queryBackpackChanges(type, filter)
			-- Check looted items (if not main bp)
			if _backpacks[type] and _backpacks[type] > 0 then
				-- Create snapshot if doesn't exist
				if not _hud.lootSnapshots[type] then
					_hud.lootSnapshots[type] = {}
				end

				-- Count the items in the backpack
				local newCounts = {}
				for spot = 0, xeno.getContainerItemCount(_backpacks[type]) - 1 do
					local item = xeno.getContainerSpotData(_backpacks[type], spot)
					-- Only look at items in list
					if not filter or filter[item.id] then
						-- Initialize the count if needed
						if not newCounts[item.id] then
							newCounts[item.id] = 0
						end
						-- Increment the count
						newCounts[item.id] = newCounts[item.id] + math.max(1, item.count)
					end
				end

				-- Find out which items went missing (none found and were there before)
				for lootID, lootCount in pairs(_hud.lootSnapshots[type]) do
					if not newCounts[lootID] then
						_hud.lootSnapshots[type][lootID] = 0
					end
				end

				-- Loop through all itemids with new counts
				for lootID, lootCount in pairs(newCounts) do
					-- No snapshot, set to zero
					if not _hud.lootSnapshots[type][lootID] then
						_hud.lootSnapshots[type][lootID] = 0
					end
					-- Get difference of snapshot and new count
					local difference = lootCount - _hud.lootSnapshots[type][lootID]
					-- Snapshot current count (even without corpse)
					_hud.lootSnapshots[type][lootID] = lootCount
					-- If difference is positive and corpse open, add to totals
					if difference > 0 and isCorpseOpen() then
						-- Add to overall total
						local value = (getItemValue(lootID) * difference)
						totalQueryValue = totalQueryValue + value
						hudTrack('Loot', lootID, difference)
					end
				end
			end
		end

		queryBackpackChanges('Gold', ITEM_LIST_MONEY)
		queryBackpackChanges('Loot')

		if totalQueryValue > 0 then
			-- Update looted total
			local totalLooted = _hud.index['Statistics']['Looted'].value
			local totalWaste = _hud.index['Statistics']['Wasted'].value
			hudItemUpdate('Statistics', 'Looted', totalLooted + totalQueryValue, true)
			-- Update profit
			local gain = (totalLooted + totalQueryValue) - totalWaste
			local timediff = os.time() - _script.start
			local staminadiff = _script.startStamina - xeno.getSelfStamina() 
			staminadiff = (staminadiff > 0 and staminadiff or 1) * 60
			local useStaminaMeasure = _config['HUD']['Per-Stamina-Measurement']
			local diff = useStaminaMeasure and staminadiff or timediff
			local hourlygain = tonumber(math.floor(gain / (diff / 3600))) or 0
			local hourPostfix = useStaminaMeasure and ' gp/sh' or ' gp/h'
			hudItemUpdate('Statistics', 'Hourly Profit', formatNumber(hourlygain) .. hourPostfix, false)
			-- Update HUD
			hudUpdatePositions()
		end
	end

	local function hudQuerySupplyChanges()
		if _script.depotOpen then
			return
		end

		-- Total value from this query
		local totalQueryValue = 0

		local function queryBackpackChanges(type, filter)
			-- Check supply items, skip if closed
			local backpack = _backpacks[type]
			if backpack and xeno.getContainerOpen(backpack) then
				-- Create snapshot if doesn't exist
				if not _hud.supplySnapshots[type] then
					_hud.supplySnapshots[type] = {}
				end

				-- Count the items in the backpack
				local newCounts = {}
				for spot = 0, xeno.getContainerItemCount(backpack) - 1 do
					local item = xeno.getContainerSpotData(backpack, spot)
					-- Only look at items in list
					if not filter or filter[item.id] then
						-- Initialize the count if needed
						if not newCounts[item.id] then
							newCounts[item.id] = 0
						end
						-- Increment the count
						newCounts[item.id] = newCounts[item.id] + math.max(1, item.count)
					end
				end

				-- Find out which items went missing (none found and were there before)
				for supplyID, supplyCount in pairs(_hud.supplySnapshots[type]) do
					if not newCounts[supplyID] then
						-- This differs from the loot tracking,
						-- instead of clearing the snapshot, we set the newCount to 0, so we get a negative
						newCounts[supplyID] = 0
					end
				end

				-- Loop through all itemids with new counts
				for supplyID, supplyCount in pairs(newCounts) do
					-- No snapshot, set to zero
					if not _hud.supplySnapshots[type][supplyID] then
						_hud.supplySnapshots[type][supplyID] = 0
					end
					-- Get difference of snapshot and new count
					local difference = supplyCount - _hud.supplySnapshots[type][supplyID]
					-- Snapshot current count (even when gaining supplies)
					_hud.supplySnapshots[type][supplyID] = supplyCount
					-- If difference is negative AND depot is not open, add to totals
					if difference < 0 then
						-- Only the absolute value matters at this point
						difference = math.abs(difference)
						-- Threshold failsafe (impossible to use this many supplies within 200ms)
						if difference < SUPPLY_CHECK_THRESHOLD then
							local value = xeno.getItemCost(supplyID) * difference
							-- Add to overall total
							totalQueryValue = totalQueryValue + value
							hudTrack('Supplies', supplyID, difference)
						end
					end
				end
			end

			-- TODO: Look for items in the equipment slot that decreased from the container
			-- decrease the missing count by the slot count
		end

		local function queryEquipmentChanges(type, filter)
			-- Slots: ring, ammo, amulet, weapon
			local slotFunc = {
				['Amulet'] = xeno.getAmuletSlotData,
				['Ammo'] = xeno.getAmmoSlotData,
				['Distance'] = xeno.getWeaponSlotData,
				['Feet'] = xeno.getFeetSlotData,
				['Ring'] = xeno.getRingSlotData
			}

			local slot = slotFunc[type]
			if not slot then return end
			slot = slot()

			local isSlotEmpty = slot.id == 0

			-- Ignore if item is not in our supply list
			if not isSlotEmpty and not filter[slot.id] then
				return
			end

			-- Previous state of this slot
			local lastSlot = _hud.supplySnapshots[type]
			if lastSlot and lastSlot.id == 0 then
				lastSlot = nil
			end

			-- This is a new item (we do not have a snapshot for it)
			-- record state and do work next time :)
			if not isSlotEmpty and (not lastSlot or lastSlot.id ~= slot.id) then
				_hud.supplySnapshots[type] = slot
				return
			end

			-- If slot is empty, make sure we didn't just dequip the item
			if isSlotEmpty and lastSlot and _script.equipped[type:lower()] then
				_hud.supplySnapshots[type] = slot
				return
			end

			-- Get difference of counts, if slot is empty, the difference is the snapshot count
			if lastSlot then
				local difference = isSlotEmpty and lastSlot.count or lastSlot.count - slot.count
				local itemid = isSlotEmpty and lastSlot.id or slot.id
				if difference > 0 and difference < SUPPLY_CHECK_THRESHOLD then
					-- Add to overall total
					local value = xeno.getItemCost(itemid) * difference
					totalQueryValue = totalQueryValue + value
					-- Update HUD
					hudTrack('Supplies', itemid, difference)
				end
			end

			-- No matter what, always update your snapshot
			_hud.supplySnapshots[type] = slot
		end

		-- Populate backpack and item lists to check changes
		local supplyLists = {}
		for itemid, supply in pairs(_supplies) do
			-- Amulets and Rings always go in the Supplies backpack
			local name = supply.group
			-- Item is a distance weapon, doesn't go to ammo slot
			if DISTANCE_WEAPONS[itemid] then
				name = 'Distance'
			end
			-- Init table if it doesn't exist
			if not supplyLists[name] then
				supplyLists[name] = {}
			end
			-- Add supply item to the list
			supplyLists[name][itemid] = true
		end

		queryBackpackChanges('Feet', {[ITEMID.SOFTBOOTS_ACTIVE] = true})

		for backpack, filter in pairs(supplyLists) do
			if backpack == 'Amulet'
				or backpack == 'Ring'
				or backpack == 'Distance'
				or backpack == 'Ammo' then
				queryEquipmentChanges(backpack, filter)
			else
				queryBackpackChanges(backpack, filter)
			end
		end

		if totalQueryValue > 0 then
			-- Update supply total
			local totalWaste = _hud.index['Statistics']['Wasted'].value
			local totalLooted = _hud.index['Statistics']['Looted'].value
			hudItemUpdate('Statistics', 'Wasted', totalWaste + totalQueryValue, true)
			-- Update profit
			local gain = totalLooted - (totalWaste + totalQueryValue)
			local timediff = os.time() - _script.start
			local staminadiff = _script.startStamina - xeno.getSelfStamina() 
			staminadiff = (staminadiff > 0 and staminadiff or 1) * 60
			local useStaminaMeasure = _config['HUD']['Per-Stamina-Measurement']
			local diff = useStaminaMeasure and staminadiff or timediff
			local hourlygain = tonumber(math.floor(gain / (diff / 3600))) or 0
			local hourPostfix = useStaminaMeasure and ' gp/sh' or ' gp/h'
			hudItemUpdate('Statistics', 'Hourly Profit', formatNumber(hourlygain) .. hourPostfix, false)

		end
	end

	local function hudUpdate()
		-- TODO: categorize based on hud color, update theme colors
		for i = 1, #hudPointers do
			local pointer = hudPointers[i]
			if pointer then
				-- Change color
			end
		end
	end

	local function hudInit()

		hudPanelCreate('General', 'leftcolumn', true)
		hudPanelCreate('Statistics', 'leftcolumn', true)
		hudPanelCreate('Script', 'leftcolumn', true)

		hudPanelCreate('Supplies', 'rightcolumn', true)
		hudPanelCreate('Loot', 'rightcolumn', true)

		hudItemCreate('General', 'XenoBot', _script.xenoversion, true)
		hudItemCreate('General', 'Online Time', '--', true)
		hudItemCreate('General', 'Time Remaining', '--', true)
		hudItemCreate('General', 'Server Save', '--', true)
		hudItemCreate('General', 'Stamina', '--', true)
		hudItemCreate('General', 'Latency', '--', true)
		hudItemCreate('General', 'Balance', '--', true)

		hudItemCreate('Script', 'Version', LIB_REVISION, true)
		hudItemCreate('Script', 'Round', tostring(_script.round), true)
		hudItemCreate('Script', 'State', 'Setting up backpacks', true)
		hudItemCreate('Script', 'Route', '--', true)
		hudItemCreate('Script', 'Walker', '--', true)
		hudItemCreate('Script', 'Targeter', '--', true)
		--hudItemCreate('Script', 'Avg. Resupply', '--', true)
		--hudItemCreate('Script', 'Avg. Round', '--', true)

		hudItemCreate('Statistics', 'Experience', '--', true)
		hudItemCreate('Statistics', 'Profit', '--', true)
		hudItemCreate('Statistics', 'Hourly Exp', '--', true)
		hudItemCreate('Statistics', 'Hourly Profit', '--', true)
		hudItemCreate('Statistics', 'Looted', 0, true)
		hudItemCreate('Statistics', 'Wasted', 0, true)
		hudItemCreate('Statistics', 'Exp to Level', '--', true)
		hudItemCreate('Statistics', 'Time to Level', '--', true)

		local containerColor = THEME[_script.theme].title
		for i = 0, 15 do
			containerHud[i+1] = xeno.HUDCreateText(-100, -100, '--', unpack(containerColor))
		end

		hudUpdatePositions()
	end

	-- Export global functions
	return {
		hudUpdateDimensions = hudUpdateDimensions,
		hudUpdatePositions = hudUpdatePositions,
		hudItemUpdate = hudItemUpdate,
		hudQueryLootChanges = hudQueryLootChanges,
		hudQuerySupplyChanges = hudQuerySupplyChanges,
		hudInit = hudInit
	}
end)()
Ini = (function()
	-- Imports
	local split = Core.split
	local trim = Core.trim
	local countPairs = Core.countPairs
	local indexTable = Core.indexTable
	local setTimeout = Core.setTimeout
	local getSelfName = Core.getSelfName
	local debug = Core.debug
	local error = Console.error
	local log = Console.log
	local prompt = Console.prompt

	local function loadIniFile(file)
		-- Could not load config
		if not file then
			error('Could not load the config.')
		end

		local tbl = {}
		local section
		for line in file:lines() do
			local s = string.match(line, "^%[([^%]]+)%]$")
			if s then
				section = s
				tbl[section] = tbl[section] or {}
			end

			local key, value = string.match(line, "^([^%s]+)%s+=%s+([^;]+)")

			-- If the first try didnt work, check for a multi-word key
			if not key then
				key, value = string.match(line, '"(.+)"%s+=%s+([^;]*)')
			end
			if key and value then
				-- Type casting
				if tonumber(value) ~= nil then
					value = tonumber(value)
				else
					value = string.gsub(value, "^%s*(.-)%s*$", "%1")
					if value == "true" then
						value = true
					elseif value == "false" then
						value = false
					-- Transform comma-delimited string to table
					elseif string.find(value, ',') then
						value = split(value, ',')
						for i = 1, #value do
							value[i] = trim(value[i])
						end
					end
				end
				if section then
					if not tbl[section] then
						tbl[section] = {}
					end
					tbl[section][key] = value
				end
			end
		end

		file:close()
		return tbl
	end

	local function loadMarketPrices()
		local file = io.open(PRICES_CONFIG_PATH, 'r')

		-- Found config, compare config version against embedded config
		if file then
			local match = false
			for line in file:lines() do
				if string.match(line, '^; ::' .. _script.pricesConfigHash .. '$') then
					match = true
					break
				end
			end
			if not match then
				log('Updating script config file...')
				file:close()
				file = nil
			end
		end
		-- Could not find a config anywhere (or we wanted to update)
		if not file then
			-- Write the embedded config to disk
			local defaultConfig = io.open(PRICES_CONFIG_PATH, 'w+')
			if defaultConfig then
				defaultConfig:write(LIB_PRICES_CONFIG)
				defaultConfig:close()
			else
				error('Could not write default config file.')
			end
			
			-- Try again
			file = io.open(PRICES_CONFIG_PATH, 'r')
		end

		local priceConfig = loadIniFile(file)
		local prices = {}

		-- Load default prices
		if priceConfig['Default'] then
			for name, price in pairs(priceConfig['Default']) do
				local id = xeno.getItemIDByName(name)
				prices[id] = price
			end
		end

		-- Load and overwrite with character specific config
		if priceConfig[getSelfName()] then
			for name, price in pairs(priceConfig[getSelfName()]) do
				local id = xeno.getItemIDByName(name)
				prices[id] = price
			end
		end

		return prices
	end


	local function updateSupplyConfig()
		local function loadBlockSection(sectionName, extras)
			local section = _config[sectionName]
			if section then
				for key, value in pairs(section) do
					local start, stop = string.find(key, 'Name')
					if start and value then
						-- Base name of the key (ex: 'Mana' of 'ManaName')
						local name = string.sub(key, 1, start-1)
						local enabled = section[name .. 'Enabled']
						-- Supply is enabled
						if enabled ~= false then
							-- TODO: validate user submitted name/id
							local id = nil
							if sectionName == 'Spells' then
								id = string.lower(value)
							else
								id = type(value) == 'string' and xeno.getItemIDByName(value) or tonumber(value)
							end

							local min = section[name .. 'Min'] or 0
							local max = section[name .. 'Max'] or 0

							-- Noob proofing
							if min > max then
								error('Config error. The "' .. name .. 'Min" value is higher than the "' .. name .. 'Max" value.')
							end

							local alarm = section[name .. 'Alarm'] or 0
							local options = nil

							-- Extra fields
							if extras then
								options = {}
								for i = 1, #extras do
									local extraKey = extras[i]
									local extraValue = section[name .. extraKey]
									if extraValue ~= nil then
										if extraKey == 'Creatures' then
										    options[extraKey] = indexTable(extraValue, true)
										else
										    options[extraKey] = extraValue
										end
									end
								end
							end

							-- Add item to supplies list
							local index = sectionName == 'Spells' and name or id
							_supplies[index] = {
								name = name,
								id = id,
								group = sectionName,
								count = 0,
								needed = 0,
								min = min,
								max = max,
								alarm = alarm,
								options = options
							}
						end
					end
				end
			end
		end

		loadBlockSection('Potions')
		loadBlockSection('Ammo')
		loadBlockSection('Food')
		loadBlockSection('Supplies')
		loadBlockSection('Runes', {'Priority', 'TargetMin', 'Targets', 'MaxHP', 'MinHP'})
		loadBlockSection('Spells', {'Priority', 'TargetMin', 'Targets', 'Utito', 'MaxHP', 'MinHP'})
		loadBlockSection('Ring', {'Creatures', 'CreatureCount', 'MinHP', 'MinMP'})
		loadBlockSection('Amulet', {'Creatures', 'CreatureCount', 'MinHP', 'MinMP'})
	end

	local function loadMasterConfig()
		local file = io.open(MASTER_CONFIG_PATH, 'r')
		if not file then
			return nil
		end
		local config = loadIniFile(file)

		local groups = {}
		-- Multi Script #1
		for name, rules in pairs(config) do
			local priority = tonumber(name:match('Multi Script #(%d)'))
			if rules.Enabled then
				rules.priority = priority
				groups[#groups+1] = rules
			end
		end

		table.sort(groups, function(a, b)
			return a.priority < b.priority
		end)

		return groups
	end

	local function loadConfigFile(callback, isReload)
		local configName = '[' .. getSelfName() .. '] ' .. _script.name .. '.ini'
		local configPath = FOLDER_CONFIG_PATH .. configName

		local function parse(file)
			local tbl = loadIniFile(file)

			-- Convert anti-lure creatures to key,value table
			if tbl['Anti Lure'] then
				local lureCreatures = tbl['Anti Lure']['Creatures']
				if lureCreatures then
					local lureTbl = {}
					if type(lureCreatures) == 'table' then
						for i = 1, #lureCreatures do
							lureTbl[string.lower(lureCreatures[i])] = true
						end
						tbl['Anti Lure']['Creatures'] = lureTbl
					else
						tbl['Anti Lure']['Creatures'] = {
							[string.lower(lureCreatures)] = true
						}
					end
				end
			end

			-- Update start config values
			if not isReload and tbl['HUD'] then
				_script.theme = tbl['HUD']['Theme'] or 'light'
			end

			_config = tbl
			_config['Prices'] = loadMarketPrices()
			updateSupplyConfig()
			callback()
		end

		local function promptConfig()
			local message = 'A new config file was generated, please reconfigure before proceeding. Type "ok" to continue.'
			-- Print in server console (this is not a debug, do not remove)
			print(message)
			prompt(message, function(response)
				if string.find(string.lower(response), 'ok') then
					local newFile = io.open(configPath, 'r')
					parse(newFile)
				else
					promptConfig()
				end
			end)
		end

		-- Open config file
		local file = io.open(configPath, 'r')

		-- Found config, compare config version against embedded config
		if file then
			local match = false
			for line in file:lines() do
				if string.match(line, '^; ::' .. _script.configHash .. '$') then
					match = true
					break
				end
			end
			if not match then
				log('Updating script config file...')
				file:close()
				file = nil
			end
		end

		-- Could not find a config anywhere (or we wanted to update)
		if not file then
			-- Write the embedded config to disk
			local defaultConfig = io.open(configPath, 'w+')
			if defaultConfig then
				defaultConfig:write(LIB_CONFIG)
				defaultConfig:close()
				promptConfig()
			else
				error('Could not write default config file.')
			end
			return
		end

		-- Using existing config
		parse(file)
	end

	local function parseRange(value)
		local range = type(value) == 'number' and {value, value} or split(value, '-')
		return tonumber(range[1]), tonumber(range[2])
	end

	local function checkChainRules(groups, initCheck)
		local switchScript = nil
		-- TODO: balance
		local ruleChecks = {
			-- Randomly choose between the range, always trigger if reached or above range
			['Rounds'] = function(req)
				if req == 0 then return false end
				local min, max = parseRange(req)
				local target = math.random(min, max)
				local round = _script.round - 1
				local status = round == target or round >= max
				debug(('Rounds rule: %s [%d = %d]'):format(tostring(status), round, target))
				return status
			end,
			-- Randomly choose between the range, always trigger if reached or above range
			['Level'] = function(req)
				if req == 0 then return false end
				local min, max = parseRange(req)
				local target = math.random(min, max)
				local level = xeno.getSelfLevel()
				local status = level == target or level >= max
				debug(('Level rule: %s [%d = %d]'):format(tostring(status), level, target))
				return status
			end,
			-- Trigger within the range
			['Experience'] = function(req)
				if req == 0 then return false end
				local min, max = parseRange(req)
				local timediff = os.time() - _script.start
				local gain = xeno.getSelfExperience() - _script.baseExp
				local hourlyexp = tonumber(math.floor(gain / (timediff / 3600))) or 0
				local status = hourlyexp >= min and hourlyexp <= max
				debug(('Hourly exp rule: %s [%d, %s]'):format(tostring(status), hourlyexp, req))
				return status
			end,
			-- Trigger within the range
			['Profit'] = function(req)
				if req == 0 then return false end
				local min, max = parseRange(req)
				local timediff = os.time() - _script.start
				local totalLooted = _hud.index['Statistics']['Looted'].value
				local totalWaste = _hud.index['Statistics']['Wasted'].value
				local profit = totalLooted - totalWaste
				local hourlygain = tonumber(math.floor(profit / (timediff / 3600))) or 0
				local status = hourlygain >= min and hourlygain <= max
				debug(('Hourly profit rule: %s [%d, %s]'):format(tostring(status), hourlygain, req))
				return status
			end,
			-- Randomly choose between the range, always trigger if reached or above range
			['Time'] = function(req)
				if req == 0 then return false end
				local min, max = parseRange(req)
				local target = math.random(min, max)
				local hours = math.floor((os.time() - _script.start) / 3600)
				local status = hours == target or hours >= max
				debug(('Time rule: %s [%d = %d]'):format(tostring(status), hours, target))
				return status
			end,
			-- Randomly choose between the range, always trigger if reached or above range
			['Strangers'] = function(req)
				if req == 0 then return false end
				local min, max = parseRange(req)
				local target = math.random(min, max)
				local strangers = _script.strangers
				local status = strangers == target or strangers >= max
				debug(('Crowded rule: %s [%d = %d]'):format(tostring(status), strangers, target))
				return status
			end
		}

		for i = 1, #groups do
			local properties = groups[i]
			-- Character is in group or no character list supplied
			local players = indexTable(properties.Characters, true)
			if not players or players[getSelfName():lower()] then
				local scriptList = indexTable(properties.From, true)
				local currentScript = _script.slug:gsub('.xbst', '')
				if not scriptList or scriptList[currentScript:lower()] then

					local rules = {}
					-- Get rule list from properties
					for property, value in pairs(properties) do
						if ruleChecks[property] then
							rules[property] = value
						end
					end

					-- How many rules it takes to trigger a switch for this group of rules
					local ruleLimit = properties.Check == 'all' and countPairs(rules) or properties.Check
					local failedRules = 0

					-- Start checking rules
					for rule, requirement in pairs(rules) do
						if not initCheck or (initCheck and (rule == 'Level')) then
							local status = ruleChecks[rule](requirement)
							if status then
								failedRules = failedRules + 1
								-- Found a script, stop checking rules in this group
								if failedRules >= ruleLimit then
									local scripts = properties.Goto
									local tries = 20
									local function getTargetScript()
										local target = type(scripts) == 'string' and scripts or scripts[math.random(1, #scripts)]
										if target:lower() == currentScript:lower() then
											if type(scripts) == 'string' then
												return nil
											end
											tries = tries - 1
											if tries <= 0 then
												return nil
											end
											return getTargetScript()
										end
										return target
									end
									local targetScript = getTargetScript()
									if targetScript then
										switchScript = targetScript
										break
									end
								end
							end
						end
					end

					debug(('Rule Group #%d: %d/%d'):format(i, failedRules, ruleLimit))

					-- Found a script, stop checking groups of rules
					if switchScript then
						debug('Chaining to script: ' .. switchScript)
						xeno.loadSettings(switchScript, 'All')
						break
					end
				end
			end
		end

		return switchScript ~= nil
	end

	-- Export global functions
	return {
		loadConfigFile = loadConfigFile,
		loadMasterConfig = loadMasterConfig,
		checkChainRules = checkChainRules
	}
end)()
Npc = (function()
	
	-- Imports
	local pingDelay = Core.pingDelay
	local setTimeout = Core.setTimeout
	local talk = Core.talk
	local checkSoftBoots = Core.checkSoftBoots
	local getXenoVersion = Core.getXenoVersion
	local debug = Core.debug
	local error = Console.error
	local getTotalItemCount = Container.getTotalItemCount
	local containerMoveItems = Container.containerMoveItems
	local getMoney = Container.getMoney
	local getFlasks = Container.getFlasks

	local function moveTransactionGoldChange(container, callback)
		if container == _backpacks['Gold'] then
			callback()
			return
		end
		-- Move loose gold change from container to gold backpack
		-- uses main bp if gold backpack isn't assigned.
		debug('moveTransactionGoldChange: ' .. container .. ', ' .. _backpacks['Gold'])
		containerMoveItems({
			src = container,
			dest = _backpacks['Gold'],
			items = {
				[3031] = true,
				[3035] = true
			},
			disableSourceCascade = true,
			openwindow = false
		}, function(success)
			callback()
		end)
	end

	local function bankDepositGold(callback)
		-- Deposit everything (skip deposit if no money)
		talk(getMoney() <= 0 and {'hi'} or {'hi', 'deposit all', 'yes'}, function(responses)
			-- TODO: verify funds deposited
			callback()
		end)
	end

	local function bankGetBalance(callback, nodialog)
		local dialog = not nodialog and {'hi', 'balance'} or {'balance'}
		talk(dialog, function(responses)
			-- Search for balance in dialog
			if responses then
				for i = 1, #responses do
					local response = responses[i]
					if response then
						local balanceText = response:gsub(',', '')
						local balance = balanceText:match('account balance is (%d+)')
						if balance then
							_script.balance = tonumber(balance) or 0
							-- Callback
							callback()
							return true
						end
					end
				end
			end
			-- Failure callback
			callback(false)
		end)
	end

	local function bankWithdrawGold(amount, callback, nodialog)
		local dialog = not nodialog and {'hi', 'withdraw', amount, 'yes'} or {'withdraw', amount, 'yes'}
		local prevMoney = getMoney()
		local tries = 3
		local function interact()
			-- TODO: use npc proxy to verify withdraw
			setTimeout(function()
				if getMoney() > prevMoney then
					callback()
				else
					tries = tries - 1
					if tries <= 0 then
						error('Unable to withdraw ' .. amount .. ' gold. Make sure you have sufficient funds.')
					else
						talk(dialog, interact)
					end
				end
			end, pingDelay(DELAY.RANGE_TALK))
		end

		talk(dialog, interact)
	end

	local function shopSellableCount(itemid, includeEq)
		local countWithEq = xeno.shopGetItemSaleCountByID(itemid)
		if includeEq then
			return countWithEq
		end

		local slots = {"getHeadSlotData", "getArmorSlotData", "getLegsSlotData", "getFeetSlotData", "getAmuletSlotData", "getWeaponSlotData", 
					   "getRingSlotData", "getBackpackSlotData", "getShieldSlotData", "getAmmoSlotData"}

		local count = countWithEq
		for _, slot in ipairs(slots) do
			local itemInSlot = xeno[slot]()
			if itemInSlot.id == itemid then
				count = count - math.max(itemInSlot.count, 1)
			end
		end

		return count
	end

	local function shopSellItem(itemid, callback, neededCount, tries)
		tries = tries or 10

		-- Sell specific amount or "all"
		local remaining = neededCount or 100000

		local function sellItem()
			-- Item doesn't exist, ignore
			local amount = shopSellableCount(itemid)

			-- No more to sell
			if amount <= 0 then
				debug('shopSellItem: sellItem -> callback()')
				callback()
				return
			end

			-- Sell 100x at a time
			local neededStackCount = math.min(remaining, amount)

			-- Successfully sold the stack
			if xeno.shopSellItemByID(itemid, neededStackCount) > 0 then
				-- Reduce remaining by sold stack count, reset tries
				remaining = remaining - neededStackCount
				-- TODO: add to HUD looted (itemid:neededStackCount)
				setTimeout(function()
					-- Remaining count to sell, recurse
					if remaining > 0 then
						debug('shopSellItem: sellItem()')
						sellItem()
					-- Sold all items, callback
					else
						debug('shopSellItem: callback()')
						callback()
					end
				end, pingDelay(DELAY.TRADE_TRANSACTION))
			-- Failed to sell, retrying
			elseif tries > 0 then
				debug('shopSellItem: retry('.. tries-1 ..')')
				shopSellItem(itemid, callback, remaining, tries-1)
			-- Out of tries. Failed to sell stack.
			else
				error('Failed to sell ' .. xeno.getItemNameByID(itemid) .. ' (' .. neededStackCount .. 'x).')
			end
			return
		end
		-- Start recursive selling
		debug('shopSellItem: sellItem() [start]')
		sellItem()
	end

	local function shopSellLoot(sellList, callback, nodialog)
		-- Add key, value array to flat list
		local itemlist = {}
		for itemid, _ in pairs(sellList) do
			itemlist[#itemlist+1] = itemid
		end
		local itemcount = #itemlist
		debug('shopSellLoot: itemcount = '.. itemcount ..'')

		function sell(index)
			local itemid = itemlist[index]

			-- No more items, finish
			if not itemid then
				-- Move change to gold
				debug('shopSellLoot: moveTransactionGoldChange()')
				moveTransactionGoldChange(0, function()
					debug('shopSellLoot: callback()')
					callback()
				end)
				return
			end

			local amount = shopSellableCount(itemid)
			debug('shopSellLoot: shopSellableCount('.. itemid ..') = ' .. amount)

			if amount > 0 then
				shopSellItem(itemid, function()
					debug('shopSellLoot: shopSellItem('.. itemid ..')')
					-- Recurse to next item in list
					setTimeout(function()
						sell(index + 1)
						debug('shopSellLoot: sell('.. index + 1 ..')')
					end, pingDelay(DELAY.TRADE_TRANSACTION))
				end)
			else
				-- If we don't have the item, recurse without a wait.
				sell(index + 1)
				debug('shopSellLoot: sell('.. index + 1 ..') [no item]')
			end
		end

		if nodialog then
			sell(1)
			debug('shopSellLoot: sell(1)')
			return
		end

		talk({'hi', 'trade'}, function()
			-- Todo: use NPC proxy to verify trade window
			setTimeout(function()
				sell(1)
				debug('shopSellLoot: sell(1) [greet]')
			end, pingDelay(DELAY.RANGE_TALK))
		end)
	end

	local function shopSellFlasks(callback)
		if getXenoVersion() <= 1092 then
			callback()
			return
		end
		debug('shopSellFlasks: shopSellLoot()')
		shopSellLoot(ITEM_LIST_FLASKS, callback, true)
	end

	local function shopRefillSoftboots(callback)
		local tries = 10
		function repair()
			talk({'soft boots', 'yes'}, function()
				-- Wait for this bitch to shine our boots
				setTimeout(function()
					-- Move change to gold
					moveTransactionGoldChange(0, function()
						-- No more boots, or failed too much
						if getTotalItemCount(ITEMID.SOFTBOOTS_WORN) <= 0 or tries <= 0 then
							-- Equip softboots if needed
							checkSoftBoots()
							callback()
						else
							tries = tries - 1
							repair()
						end
					end)
				end, pingDelay(DELAY.TRADE_TRANSACTION))
			end)
		end

		talk({'hi'}, function()
			repair()
		end)
	end

	local function shopBuyItemUpToCount(itemid, neededCount, destination, callback, tries)
		destination = destination or 0
		tries = tries or 10
		local remaining = neededCount

		local function buyItem()
			-- Item doesn't exist, ignore
			local mainbp = _backpacks['Main']
			local price = xeno.shopGetItemBuyPriceByID(itemid)
			local neededStackCount = math.min(remaining, 100)

			-- Price not found
			if price <= 0 then
				debug('shopBuyItemUpToCount: moveTransactionGoldChange()')
				moveTransactionGoldChange(0, function()
					debug('shopBuyItemUpToCount: callback')
					callback()
				end)
				return
			end

			-- Successfully bought stack
			if xeno.shopBuyItemByID(itemid, neededStackCount) > 0 then
				-- Reduce remaining by bought stack count, reset tries
				remaining = remaining - neededStackCount

				local function buyAgain()
					-- Remaining count to buy, continue
					if remaining > 0 then
						buyItem()
						debug('shopBuyItemUpToCount -> buyAgain: buyItem()')
					-- Bought all items, destination is not main, callback
					elseif destination > 0 then
						-- Final cleanup
						debug('shopBuyItemUpToCount -> buyAgain: containerMoveItems()')
						containerMoveItems({
							src = mainbp,
							dest = destination,
							items = {[itemid] = true},
							disableSourceCascade = true,
							openwindow = false
						}, function(success)
							debug('shopBuyItemUpToCount -> buyAgain: callback() [move]')
							callback()
						end)
					-- Bought all items, destination is main
					else
						debug('shopBuyItemUpToCount -> buyAgain: callback()')
						callback()
					end
				end

				-- TODO: add to log (itemid:neededStackCount)
				setTimeout(function()
					-- Only move if intended destination isn't main backpack
					-- and we have less than 3 free slots
					local freeSlots = xeno.getContainerItemCapacity(mainbp) - xeno.getContainerItemCount(mainbp)
					if destination > 0 and freeSlots < 4 then
						debug('shopBuyItemUpToCount: containerMoveItems()')
						-- Move to destination after buying stack
						containerMoveItems({
							src = mainbp,
							dest = destination,
							items = {[itemid] = true},
							disableSourceCascade = true,
							openwindow = false
						}, function(success)
							buyAgain()
							debug('shopBuyItemUpToCount: buyAgain() [retry]')
						end)
					else
						buyAgain()
						debug('shopBuyItemUpToCount: buyAgain()')
					end
				end, pingDelay(DELAY.TRADE_TRANSACTION))
			-- Failed to buy, retrying
			elseif tries > 0 then
				shopBuyItemUpToCount(itemid, remaining, destination, callback, tries-1)
				debug('shopBuyItemUpToCount: retry(' .. tries - 1 .. ')')
			-- Out of tries. Failed to buy stack.
			else
				error('Failed to buy ' .. xeno.getItemNameByID(itemid) .. ' (' .. neededStackCount .. 'x). ' .. 'Make sure you have enough capacity and gold.')
			end
			return
		end
		-- Start recursive buying
		buyItem()
	end

	local function shopBuySupplies(group, callback)
		local items = {}
		local backpack = _backpacks[group] and _backpacks[group] or nil
		local function buyListItem(index)
			-- Reached end of list, callback

			if index > #items then
				debug('shopBuySupplies: callback')
				callback()
				return
			end

			-- Lookup current item
			local item = items[index]

			-- Item doesn't exist or not needed
			if not item or not item.needed or item.needed < 1 then
				debug('shopBuySupplies: buyListItem(' .. index + 1 .. ') [skip]')
				buyListItem(index + 1)
				return
			end

			-- Buy item
			shopBuyItemUpToCount(item.id, item.needed, backpack, function()
				debug('shopBuySupplies: buyListItem(' .. index + 1 .. ')')
				buyListItem(index + 1)
			end)
		end

		-- Whether we need to greet npc
		local greetNPC = true

		-- Populate items
		for itemid, supply in pairs(_supplies) do
			-- Belongs to the correct group
			if supply.group == group then
				-- Minimum is expected to be checked and is below expected
				if supply.needed and supply.needed > 0 then
					items[#items+1] = supply
					-- Check if item is in trade window (if open)
					if xeno.shopGetItemBuyPriceByID(itemid) > 0 then
						greetNPC = false
					end
				end
			end
		end

		if greetNPC then
			talk({'hi'}, function()
				-- Try to sell flasks if we may be at the magic shop
				if group == 'Potions' then
					talk({'trade'}, function()
						shopSellFlasks(function()
							debug('shopBuySupplies: buyListItem(1) [greet, potions]')
							buyListItem(1)
						end)
					end)
				else
					talk({'trade'}, function()
						debug('shopBuySupplies: buyListItem(1) [greet]')
						buyListItem(1)
					end)
				end
			end)
		else
			-- Try to sell flasks if we may be at the magic shop
			if group == 'Potions' then
				shopSellFlasks(function()
					debug('shopBuySupplies: buyListItem(1) [potions]')
					buyListItem(1)
				end)
			else
				debug('shopBuySupplies: buyListItem(1)')
				buyListItem(1)
			end
		end
	end

	local function shopBuyBackpacks(count, callback)
		talk({'hi', 'trade'}, function()
			setTimeout(function()
				local itemid = nil
				-- Find a backpack to buy from the NPC
				for id, _ in pairs(ITEM_LIST_BACKPACKS) do
					local price = xeno.shopGetItemBuyPriceByID(id)
					if price > 0 then
						itemid = id
						break
					end
				end

				if not itemid then
					error('Unable to find a backpack to purchase. Please contact support.')
					return
				end
				
				shopBuyItemUpToCount(itemid, count, 0, function()
					callback()
				end)
			end, pingDelay(DELAY.RANGE_TALK))
		end)
	end

	-- Export global functions
	return {
		bankDepositGold = bankDepositGold,
		bankGetBalance = bankGetBalance,
		bankWithdrawGold = bankWithdrawGold,
		shopSellLoot = shopSellLoot,
		shopRefillSoftboots = shopRefillSoftboots,
		shopBuySupplies = shopBuySupplies,
		shopBuyBackpacks = shopBuyBackpacks
	}
end)()
Walker = (function()
	
	-- Imports
	local debug = Core.debug
	local pingDelay = Core.pingDelay
	local setTimeout = Core.setTimeout
	local when = Core.when
	local split = Core.split
	local getPosFromString = Core.getPosFromString
	local cleanLabel = Core.cleanLabel
	local delayWalker = Core.delayWalker
	local resumeWalker = Core.resumeWalker
	local sortPositionsByDistance = Core.sortPositionsByDistance
	local getPositionFromDirection = Core.getPositionFromDirection
	local getDistanceBetween = Core.getDistanceBetween
	local getWalkableTiles = Core.getWalkableTiles
	local talk = Core.talk
	local log = Console.log
	local warn = Console.warn
	local error = Console.error
	local prompt = Console.prompt
	local bankWithdrawGold = Npc.bankWithdrawGold
	local getMoney = Container.getMoney
	local getTotalItemCount = Container.getTotalItemCount

	local function walkerLabelExists(label)
		local waypoints = _settings['Walker']['WaypointList']
		for i = 1, #waypoints do
			if cleanLabel(waypoints[i].text) == label then
				return true
			end
		end
		return false
	end

	local function walkerGetTownExit()
		if _script.townexit then
			return _script.townexit
		end
		local waypoints = _settings['Walker']['WaypointList']
		for i = 1, #waypoints do
			if string.find(waypoints[i].text, '~spawn:') then
				local label = cleanLabel(waypoints[i].text)
				_script.townexit = split(split(label, '|')[2], '~')[1]
				return
			end
		end
	end

	local function walkerGetTownEntrance()
		if _script.townentrance then
			return _script.townentrance
		end
		local waypoints = _settings['Walker']['WaypointList']
		for i = 1, #waypoints do
			if string.find(waypoints[i].text, 'spawn~') then
				local label = cleanLabel(waypoints[i].text)
				_script.townentrance = split(split(label, '|')[2], '~')[2]
				return
			end
		end
	end

	local function walkerStartPath(town, source, destination, callback)
		-- DISABLED, we should have depot~depot and similar paths.
		-- Already at destination, return success
		--if source == destination then
		--    callback()
		--    return
		--end

		local function walkTo(label, walkCallback)
			xeno.gotoLabel(label)
			resumeWalker()
			when(EVENT_PATH_END, nil, function()
				debug('Reached destination: ' .. destination)
				_script.lastDestination = {name=destination, town=town}
				walkCallback()
			end)
		end

		-- Label doesn't exist, try walking to depot, then destination from there
		local label = string.lower(town) .. '|' .. source .. '~' .. destination
		if not walkerLabelExists(label) then
			local depotLabel = string.lower(town) .. '|' .. source .. '~depot'
			
			-- Depot doesn't exist, error out, this should never happen (path missing)
			if not walkerLabelExists(depotLabel) then
				-- Check if we're starting the script in spawn
				if source == 'spawn' then
					error('Unable to walk to ' .. destination .. ' from here. Please start the script near ' .. town .. '.')
				else	
					error('Missing route: ' .. town .. ' ' .. source .. ' to ' .. destination .. '. Please contact support.')
				end
				return
			end
			
			-- Depot path exist, take detour
			walkTo(depotLabel, function()
				-- Walk from depot to destination
				walkTo(string.lower(town) .. '|depot~' .. destination, callback)
			end)
			return
		end

		-- Path exists, take direct path
		walkTo(label, callback)
	end

	local function walkerGetPosAfterLabel(label, index)
		local waypoints = _settings['Walker']['WaypointList']
		local foundLabel = index and true or false
		local startIndex = index or 1
		for i = startIndex, #waypoints do
			waypoint = waypoints[i]
			-- Find the starting position if we haven't already
			if not foundLabel and cleanLabel(waypoint.text) == label then
				foundLabel = true
			end
			-- Find the related stand position after we find the label
			if foundLabel and tonumber(waypoint.tag) < 10 then
				local pos = getPosFromString(waypoint.text)
				return pos.x > 0 and pos or false
			end
		end
		return false
	end

	local function walkerGetClosestLabel(multiFloor, prefix)
		local waypoints = _settings['Walker']['WaypointList']
		local positions = {}
		local selfPos = xeno.getSelfPosition()
		for i = 1, #waypoints do
			if waypoints[i].tag == '255' then
				local label = cleanLabel(waypoints[i].text)
				if not string.find(label, 'spawn~') then
					-- Prefix filter
					if not prefix or string.lower(split(label, '|')[1]) == string.lower(prefix) then
						-- Floor filter
						local pos = walkerGetPosAfterLabel(nil, i)
						if pos and (multiFloor or selfPos.z == pos.z) then
							pos.name = label
							table.insert(positions, pos)
						end
					end
				end
			end
		end
		positions = sortPositionsByDistance(selfPos, positions, 10)
		for i = 1, 5 do
			local spos = positions[i]
			if not spos then
				break
			end
			debug('Closest label #' .. i .. ' :' .. table.serialize(positions[i]))
		end
		return positions[1], positions
	end

	local function walkerVerifyPosition(label, option)
		local pos = walkerGetPosAfterLabel(label)
		local selfPos = xeno.getSelfPosition()
		local distance = getDistanceBetween(selfPos, pos)
		if pos then
			-- no option specified, compare exact position
			if not option and distance < 1 and selfPos.z == pos.z then
				return true
			-- option (=) specified, check for higher z axis.
			elseif option == '=' and selfPos.z == pos.z then
				return true
			-- option (-) specified, check for higher z axis.
			elseif option == '-' and selfPos.z > pos.z then
				return true
			-- option (+) specified, check for lower z axis.
			elseif option == '+' and selfPos.z < pos.z then
				return true
			-- other long option specified, probably range.
			elseif option and #option > 1 then
				local operator = string.sub(option, 1, 1)
				local value = tonumber(string.sub(option, 2))
				-- if value is a number
				if value then
					local meetsRange = false
					if operator == '>' then
						meetsRange = (distance > value)
					elseif operator == '<' then
						meetsRange = (distance < value)
					elseif operator == '=' then
						meetsRange = (distance == value)
					end
					if meetsRange then
						return true
					end
				end
			end
		end

		warn('Failed label ' .. label .. ', trying again.')
		xeno.gotoLabel(label)
		return false
	end

	local function walkerGetNeededTools()
		local tools = {pick=false, shovel=false, rope=false}
		local needsTools = false
		local waypoints = _settings['Walker']['WaypointList']
		for i = 1, #waypoints do
			if not tools.rope and waypoints[i].tag == '3' then
				tools.rope = true
				needsTools = true
			elseif not tools.shovel and waypoints[i].tag == '4' then
				tools.shovel = true
				needsTools = true
			elseif not tools.pick and waypoints[i].tag == '255' and waypoints[i].tag == '255' and split(waypoints[i].text, '|')[1] == 'pick' then
				tools.pick = true
				needsTools = true
			end
		end
		return needsTools and tools or false
	end

	local function walkToPos(x, y, z)
		_script.unsafeQueue = 0
		xeno.doSelfWalkTo(x, y, z)
	end

	local function walkerReachNPC(name, callback, tries)
		tries = tries ~= nil and tries or 5
		local targetIndex = nil
		local targetPos = nil
		local selfPos = xeno.getSelfPosition()

		-- Loop through battle list
		xeno.enterCriticalMode()
		for i = 0, 1300 do
			local creaturePos = xeno.getCreaturePosition(i)
			local distance = getDistanceBetween(selfPos, creaturePos)
			-- NPC we are looking for
			if string.lower(xeno.getCreatureName(i)) == string.lower(name) and distance < 7 then
				-- We need to walk to it
				if distance > 2 then
					targetIndex = i
					targetPos = creaturePos
					break
				-- We are close enough
				else
					xeno.exitCriticalMode()
					callback()
					return
				end
			end
		end
		xeno.exitCriticalMode()

		-- Failed to find NPC
		if not targetPos then
			error('Unable to find ' .. name .. '. Please contact support.')
			return
		end

		-- Walk to NPC
		local tiles = getWalkableTiles(targetPos, 2)

		-- Failed to find walkable tile
		if not tiles then
			error('Unable to reach ' .. name .. '. Please contact support.')
			return
		end

		-- Find closest tile
		positions = sortPositionsByDistance(selfPos, tiles, 10)

		-- Walk to the closest tile
		local destination = positions[1]
		walkToPos(destination.x, destination.y, destination.z)

		-- Wait and see if we reached the NPC
		setTimeout(function()
			-- In range, finish with callback
			if getDistanceBetween(xeno.getSelfPosition(), xeno.getCreaturePosition(targetIndex)) <= 2 then
				callback()
			elseif tries <= 0 then
				error('Unable to reach ' .. name .. '. Please contact support.')
			else
				walkerReachNPC(name, callback, tries - 1)
			end
		end, pingDelay(DELAY.FOLLOW_WAIT))
	end

	local function walkerTravel(route, callback)
		local travelInfo = TRAVEL_ROUTES[route]
		local travelCost = travelInfo.cost
		local travelMethod = travelInfo.route or 'boat'
		-- Loop through all spectators on screen
		local spectators = {xeno.getCreatureSpectators(0)}
		-- Break when/if we find an npc with a transcript
		for _, listIndex in ipairs(spectators) do
			local name = xeno.getCreatureName(listIndex)
			local transcript = travelInfo.transcript[name]
			-- Found transcript
			if transcript then
				-- Follow NPC
				walkerReachNPC(name, function()
					-- Start talking
					talk(transcript, function()
						callback()
					end)
				end)
				break
			end
		end
	end

	local function walkerGotoTown(targetTown, callback)
		local townPositions = sortPositionsByDistance(xeno.getSelfPosition(), TOWN_POSITIONS)
		local town = townPositions[1].name:lower()
		targetTown = targetTown:lower()

		local selfPos = xeno.getSelfPosition()
		local lastDest = _script.lastDestination
		local lastDestLabel = lastDest and ('%s|%s~depot'):format(lastDest.town, lastDest.name)
		local lastDestPos = lastDestLabel and walkerGetPosAfterLabel(lastDestLabel)
		local labelList = nil
		local closestLabel = nil

		-- Close to last known destination
		if lastDestPos and getDistanceBetween(selfPos, lastDestPos) <= 30 then
			closestLabel = lastDestPos
			closestLabel.name = lastDestLabel
		-- Find out where we are in town
		else
			-- Update label, override if we find depot is close
			closestLabel, labelList = walkerGetClosestLabel(true, town, 10)
			for i = 1, #labelList do
				local tmpLabel = labelList[i]
				if tmpLabel.name == ('%s|depot~depot'):format(town) then
					if getDistanceBetween(selfPos, tmpLabel) <= 20 then
						closestLabel = tmpLabel
						break
					end
				end
			end
		end

		-- In town, return success
		if (town == targetTown) then
			callback(closestLabel)
			return
		end

		-- Out of town, detect travel costs
		local route = town .. '~' .. targetTown
		local travelInfo = TRAVEL_ROUTES[route]

		-- Travel path doesn't exist, prompt user to walk manually
		if not travelInfo then
			local function travelPrompt()
				prompt('Unable to travel to ' .. _script.town .. '. When you are in town type "retry" to continue.', function(response)
					if string.find(response, 'retry') then
						walkerGotoTown(targetTown, callback)
					else
						travelPrompt()
					end
				end)
			end
			travelPrompt()
			return
		end

		local travelCost = travelInfo.cost
		local travelMethod = travelInfo.route or 'boat'

		-- When we have travel money
		local function gotoBoat(startLocation)
			-- Walk to boat
			-- Wait for us to get to the boat
			walkerStartPath(town, startLocation, travelMethod, function(path)
				walkerTravel(route, function()
					-- Get closest town, fire function again if we're still not in the correct town
					-- some towns take multiple routes to reach
					local newTownPositions = sortPositionsByDistance(xeno.getSelfPosition(), TOWN_POSITIONS)
					local newTown = newTownPositions[1].name:lower()
					-- Not in the new town yet, recurse
					if newTown ~= targetTown then
						walkerGotoTown(targetTown, callback)
					-- Didn't leave the last town
					elseif newTown == town then
						error('Failed to travel to ' .. targetTown .. ' from ' .. newTown .. '.')
						return
					-- Reached the target town
					else
						callback({name=('%s|%s~depot'):format(town, travelMethod)})
					end
				end)
			end)
		end

		-- Close label not found or too far away
		if not closestLabel or getDistanceBetween(selfPos, closestLabel) > 30 then
			error('Too far from any start point. Restart the script closer to a town.')
			return
		end

		local closestRoute = split(closestLabel.name, '|')
		local closestPath = split(closestRoute[2], '~')
		local location = closestPath[1]
		local destination = closestPath[2]

		debug('Closest location: ' .. location)
		debug('Recent location: ' .. tostring(lastDestLabel))

		-- Tell the user what we're doing
		local locationName = location:gsub('%.', ' ');
		log('You are near the ' .. town .. ' ' .. locationName .. ', traveling to ' .. targetTown:lower() .. '.')

		-- Needs gold to travel, go to bank from here
		local travelCostDifference = travelCost - getMoney()
		if _config['General']['Walk-To-Banks'] and travelCostDifference > 0 then
			-- Tell the user we need to go to the bank
			local bankMessage = 'Traveling to ' .. targetTown:lower() .. ' requires an additional ' .. travelCostDifference .. ' gold.'
			if location ~= 'bank' then
				bankMessage = bankMessage .. ' Heading to the ' .. town .. ' bank.'    
			end
			log(bankMessage)

			-- Go to local bank
			-- Wait for us to get to the bank
			walkerStartPath(town, location, 'bank', function()
				-- Withdraw travel funds (round up to nearest hundred)
				local roundedCost = math.ceil(travelCostDifference / 100) * 100
				bankWithdrawGold(roundedCost, function()
					gotoBoat('bank')
				end)
			end)
			return
		end

		-- Has travel money, head to boat
		-- Go to travel label once at boat
		-- If no path from here to boat / bank, go to depot first
		gotoBoat(location)
	end

	local function walkerGotoLocation(town, destination, callback)
		-- Make sure we're in the right town
		walkerGotoTown(town, function(closestLabel)
			local closestRoute = split(closestLabel.name, '|')
			local closestPath = split(closestRoute[2], '~')
			local start = closestPath[1]
			-- Walk to path
			walkerStartPath(town, start, destination, function(path)
				callback(path)
			end)
		end)
	end

	local function walkerGotoDepot(callback)
		-- Go to the first town depot
		xeno.gotoLabel('depot|' .. _script.town .. '|1')
		-- Tell if-stuck monitor to try next depot if we get stuck
		_script.findingDepot = 1
		resumeWalker()
		when(EVENT_DEPOT_END, nil, function()
			-- Do not try anymore depots if-stuck
			_script.findingDepot = nil
			callback()
		end)
	end

	local function walkerGetDoorDetails(doorID)
		-- Cached details
		if _script.doors[doorID] then
			return _script.doors[doorID]
		end

		-- Determine door details
		-- get position of the stand before the label
		local doorPos = nil
		local posLabel = nil
		local direction = nil
		local startLabel = 'door|'..doorID..'|START'
		local standPos = walkerGetPosAfterLabel(startLabel)
		local directions = {['NORTH']=NORTH, ['SOUTH']=SOUTH, ['EAST']=EAST, ['WEST']=WEST}
		for dirName, dirCode in pairs(directions) do
			-- Look for the corresponding door label
			posLabel = 'door|'..doorID..'|'..dirName
			if walkerLabelExists(posLabel) then
				-- Determine position of the door
				doorPos = getPositionFromDirection(standPos, dirCode, 1)
				direction = dirCode
				break
			end
		end

		if not doorPos then
			return error('Missing door position for Door #' .. doorID ..'. Please contact support.')
		end

		_script.doors[doorID] = {
			doorPos = doorPos,
			standPos = standPos,
			posLabel = posLabel,
			startLabel = startLabel,
			direction = direction
		}

		return _script.doors[doorID]
	end

	local function walkerUseTrainer()
		local skill = _config['Logout']['Train-Skill']
		local statues = {
			sword = 16198,
			axe = 16199,
			club = 16200,
			spear = 16201,
			magic = 16202
		}

		local itemid = statues[skill]

		-- Skill statue does not exist
		if not itemid then
			error('Invalid skill type, valid options: sword, axe, club, spear, magic.')
			return
		end

		-- Find statue on map
		local pos = xeno.getSelfPosition()
		for x = -7, 7 do
			for y = -7, 7 do
				local posX = pos.x + x
				local posY = pos.y + y
				if xeno.getTileUseID(posX, posY, pos.z).id == itemid then
					xeno.selfUseItemFromGround(posX, posY, pos.z)
					return
				end
			end
		end

		error('Unable to locate the "'.. skill ..'" training statue.')
	end

	local function walkerUseClosestItem(itemIdList)
		local pos = xeno.getSelfPosition()
		local tiles = {}
		for x = -7, 7 do
			for y = -7, 7 do
				local posX = pos.x + x
				local posY = pos.y + y
				local item = xeno.getTileUseID(posX, posY, pos.z)
				if item and itemIdList[item.id] then
					tiles[#tiles+1] = {x=posX, y=posY, z=pos.z}
				end
			end
		end

		if #tiles == 0 then
			return nil
		end

		local items = sortPositionsByDistance(pos, tiles)
		local target = items[1]
		return xeno.selfUseItemFromGround(target.x, target.y, target.z), target
	end

	local function walkerCapacityDrop()
		if not _config['Capacity'] then
			return
		end
		local flaskDropCap = _config['Capacity']['Drop-Flasks']
		local goldDropCap = _config['Capacity']['Drop-Gold']
		if (goldDropCap and goldDropCap > 0) or (flaskDropCap and flaskDropCap > 0) then
			local cap = xeno.getSelfCap()
			local pos = xeno.getSelfPosition()

			-- Get random position
			local tiles = getWalkableTiles(pos, 3)
			if not tiles or #tiles < 1 then
				tiles = {pos}
			end

			local destination = tiles[math.random(1, #tiles)]

			-- Check if we need to drop flasks
			if flaskDropCap and flaskDropCap > 0 and cap <= flaskDropCap then
				local flasks = ITEM_LIST_FLASKS
				-- Potion Backpack
				for spot = 0, xeno.getContainerItemCount(_backpacks['Potions']) - 1 do
					local item = xeno.getContainerSpotData(_backpacks['Potions'], spot)
					-- Item is a flask
					if flasks[item.id] then
						-- Drop this stack of flasks
						xeno.containerMoveItemToGround(_backpacks['Potions'], spot, destination.x, destination.y, destination.z, -1)
						setTimeout(function()
							walkerCapacityDrop()
						end, pingDelay(DELAY.CONTAINER_MOVE_ITEM))
						return
					end
				end
				-- Main Backpack (if different than Potion)
				if _backpacks['Potions'] ~= _backpacks['Main'] then
					for spot = 0, xeno.getContainerItemCount(_backpacks['Main']) - 1 do
						local item = xeno.getContainerSpotData(_backpacks['Main'], spot)
						-- Item is a flask
						if flasks[item.id] then
							-- Drop this stack of flasks
							xeno.containerMoveItemToGround(_backpacks['Main'], spot, destination.x, destination.y, destination.z, -1)
							setTimeout(function()
								walkerCapacityDrop()
							end, pingDelay(DELAY.CONTAINER_MOVE_ITEM))
							return
						end
					end
				end
			end

			-- Check if we need to drop gold
			if goldDropCap and goldDropCap > 0 and cap <= goldDropCap then
				for spot = 0, xeno.getContainerItemCount(_backpacks['Gold']) - 1 do
					local item = xeno.getContainerSpotData(_backpacks['Gold'], spot)
					-- Item is gold
					if item.id == 3031 then
						-- Drop this stack of gold
						xeno.containerMoveItemToGround(_backpacks['Gold'], spot, destination.x, destination.y, destination.z, -1)
						setTimeout(function()
							walkerCapacityDrop()
						end, pingDelay(DELAY.CONTAINER_MOVE_ITEM))
						return
					end
				end
				-- Main Backpack (if different than Gold)
				if _backpacks['Gold'] ~= _backpacks['Main'] then
					for spot = 0, xeno.getContainerItemCount(_backpacks['Main']) - 1 do
						local item = xeno.getContainerSpotData(_backpacks['Main'], spot)
						-- Item is gold
						if item.id == 3031 then
							-- Drop this stack of gold
							xeno.containerMoveItemToGround(_backpacks['Main'], spot, destination.x, destination.y, destination.z, -1)
							setTimeout(function()
								walkerCapacityDrop()
							end, pingDelay(DELAY.CONTAINER_MOVE_ITEM))
							return
						end
					end
				end
			end
		end
	end

	local function walkerRestoreMana(potionid, manaRestorePercent, callback)
		local selfid = xeno.getSelfID()
		local function pump()
			if getTotalItemCount(potionid) == 0 then
				return
			end

			-- Stop if creature onscreen
			local pos = xeno.getSelfPosition()
			for i = CREATURES_LOW, CREATURES_HIGH do
				local cpos = xeno.getCreaturePosition(i)
				if cpos and pos.z == cpos.z and getDistanceBetween(pos, cpos) <= _config['Mana Restorer']['Range'] then
					if xeno.getCreatureVisible(i) and xeno.getCreatureHealthPercent(i) > 0 and xeno.isCreatureMonster(i) then
						callback()
						return
					end
				end
			end
			-- Stop if we're above threshold
			if math.abs((xeno.getSelfMana() / xeno.getSelfMaxMana()) * 100) >= manaRestorePercent then
				callback()
				return
			end
			-- Use potion
			xeno.selfUseItemWithCreature(potionid, selfid)
			-- Recurse
			setTimeout(function()
				pump()
			end, 100)
		end
		pump()
	end

	-- Export global functions
	return {
		walkerLabelExists = walkerLabelExists,
		walkerGetTownExit = walkerGetTownExit,
		walkerGetTownEntrance = walkerGetTownEntrance,
		walkerStartPath = walkerStartPath,
		walkerGetPosAfterLabel = walkerGetPosAfterLabel,
		walkerGetClosestLabel = walkerGetClosestLabel,
		walkerGetNeededTools = walkerGetNeededTools,
		walkerReachNPC = walkerReachNPC,
		walkerGotoLocation = walkerGotoLocation,
		walkerGotoDepot = walkerGotoDepot,
		walkerGetDoorDetails = walkerGetDoorDetails,
		walkerUseTrainer = walkerUseTrainer,
		walkerUseClosestItem = walkerUseClosestItem,
		walkerCapacityDrop = walkerCapacityDrop,
		walkerRestoreMana = walkerRestoreMana,
		walkerTravel = walkerTravel
	}
end)()
Depot = (function()
	
	-- Imports
	local pingDelay = Core.pingDelay
	local setTimeout = Core.setTimeout
	local getWalkableTiles = Core.getWalkableTiles
	local getDirectionTo = Core.getDirectionTo
	local getSelfLookPosition = Core.getSelfLookPosition
	local getPositionFromDirection = Core.getPositionFromDirection
	local formatList = Core.formatList
	local flattenItemCounts = Core.flattenItemCounts
	local warn = Console.warn
	local error = Console.error
	local log = Console.log
	local getLastContainer = Container.getLastContainer
	local getContainerByName = Container.getContainerByName
	local whenContainerUpdates = Container.whenContainerUpdates
	local containerMoveItems = Container.containerMoveItems
	local resetContainers = Container.resetContainers
	local walkerGotoDepot = Walker.walkerGotoDepot
	local walkerStartPath = Walker.walkerStartPath
	local bankWithdrawGold = Npc.bankWithdrawGold
	local shopBuyBackpacks = Npc.shopBuyBackpacks

	local function openLocker(callback)
		-- Immediately callback if Locker is already open
		local locker = getContainerByName(CONT_NAME_LOCKER)
		if locker then
			callback(locker)
			return
		end

		-- Depot position (defaults to look pos)
		local depot = getSelfLookPosition(1)

		-- Detect entry, find depot tile from opposite direction
		local pos = xeno.getSelfPosition()
		local tiles = getWalkableTiles(pos, 1)
		if tiles and tiles[1] then
			local entryPos = tiles[1]
			depot = getPositionFromDirection({x=pos.x, y=pos.y}, getDirectionTo(entryPos, pos), 1)
		end
		-- Browse locker field
		xeno.selfBrowseField(depot.x, depot.y, pos.z)
		-- Wait for Browsefield window
		setTimeout(function()
			-- Browsefield window
			local browsefield = getLastContainer()
			-- Open Locker in same window (first slot)
			xeno.containerUseItem(browsefield, 0, true, true)
			-- Wait for Locker window
			whenContainerUpdates(browsefield, function(success)
				if not success then
					openLocker(callback)
					return
				end

				-- Callback with container list index
				locker = getContainerByName(CONT_NAME_LOCKER)
				callback(locker)
			end)
		end, pingDelay(DELAY.BROWSE_FIELD))
	end

	local function openDepot(callback)
		-- Immediately callback if Depot is already open
		local depot = getContainerByName(CONT_NAME_DEPOT)
		if depot then
			callback(depot)
			return
		end

		-- Open Locker first
		openLocker(function(locker)
			-- Unable to open locker
			if not locker then
				callback(false)
				return
			end

			-- Open Depot in same window (first slot)
			xeno.containerUseItem(locker, 0, true, true)
			-- Wait for Depot window
			whenContainerUpdates(locker, function(success)
				if not success then
					openDepot(callback)
					return
				end

				-- Callback with container list index
				depot = getContainerByName(CONT_NAME_DEPOT)
				callback(depot)
			end)
		end)
	end

	local function transferToDepot(depot, slot, callback)
		containerMoveItems({
			src = _backpacks['Loot'],
			dest = depot,
			slot = slot,
			openwindow = false,
			ignore = {
				-- Flasks
				[283] = true,
				[284] = true,
				[285] = true,
				-- Money
				[3031] = true,
				[3035] = true,
				[3043] = true,
				-- Tools
				[ITEMID.OBSIDIAN_KNIFE] = true,
				[ITEMID.BLESSED_STAKE] = true
			},
			filter = function(item)
				local supplyItem = _supplies[item.id]
				if slot == DEPOT.SLOT_STACK and xeno.isItemStackable(item.id) and not supplyItem then
					return true
				elseif slot == DEPOT.SLOT_NONSTACK and not xeno.isItemStackable(item.id) and not supplyItem then
					return true
				elseif slot == DEPOT.SLOT_SUPPLY and supplyItem then
					return true
				end
				return false
			end
		}, function(success, moveCounts)
			local totalCount = 0
			if moveCounts then
				for itemid, count in pairs(moveCounts) do
					-- TODO: add to HUD looted
					totalCount = totalCount + count
				end
			end
			if totalCount > 0 then
				local moveList = formatList(flattenItemCounts(moveCounts), ', ', '')
				local lootType = slot == DEPOT.SLOT_STACK and 'stackables' or 'items'
				log('Deposited ' .. lootType .. ': ' .. moveList .. '.')
			end
			-- Warn player not all their loot was moved
			if not success then
				warn('Some loot was unable to be deposited. Make sure you have enough free slots in your depot backpacks.')
			end
			-- Return
			callback()
		end)
	end

	local function transferFromDepot(depot, neededSupplies, callback)
		-- Detect items we need to withdraw, and backpacks to withdraw to
		local groups = {}
		local groupIndex = {}
		local mainBP = _backpacks['Main']
		local potionsBP = _backpacks['Potions']
		local runesBP = _backpacks['Runes']
		local ammoBP = _backpacks['Ammo']
		local suppliesBP = _backpacks['Supplies']
		local groupTransfers = 0

		local suppliesUsed = false
		for itemid, supply in pairs(_supplies) do
			if supply.group == 'Ring'or supply.group == 'Amulet' or supply.group == 'Supplies' then
				if supply.max > 0 then
					suppliesUsed = true
					break
				end
			end
		end

		for itemid, supply in pairs(neededSupplies) do
			if supply.group == 'Food' then
				if not groups[mainBP] then groups[mainBP] = {} end
				groups[mainBP][itemid] = supply.needed
			elseif supply.group == 'Potions' then
				if not groups[potionsBP] then groups[potionsBP] = {} end
				groups[potionsBP][itemid] = supply.needed
			elseif supply.group == 'Runes' then
				if not groups[runesBP] then groups[runesBP] = {} end
				groups[runesBP][itemid] = supply.needed
			elseif supply.group == 'Ammo' then
				if not groups[ammoBP] then groups[ammoBP] = {} end
				groups[ammoBP][itemid] = supply.needed
			elseif supply.group == 'Ring' or supply.group == 'Amulet' or supply.group == 'Supplies' then
				if not groups[suppliesBP] then groups[suppliesBP] = {} end
				groups[suppliesBP][itemid] = supply.needed
			end
		end

		-- Turn associate list into something we can iterate easily
		for bp, _ in pairs(groups) do
			groupIndex[#groupIndex+1] = bp
		end

		-- Move each group
		local function transferGroup(index)
			-- Lookup group backpack
			local backpack = groupIndex[index]
			-- No more groups, finished
			if not backpack then
				if not suppliesUsed and groupTransfers == 0 then
					_script.disableWithdraw = true
					log('No supplies found in depot (3rd slot). Disabling future withdrawal attempts.')
				end
				return callback()
			end
			-- Look group items
			local items = groups[backpack]
			-- Move group
			containerMoveItems({
				src = depot,
				dest = backpack,
				openwindow = false,
				items = items,
			}, function(success, moveCounts)
				-- If we didn't withdraw anything, disable withdrawing supplies in the future
				local totalCount = 0
				if moveCounts then
					for itemid, count in pairs(moveCounts) do
						-- TODO: add to HUD supplies
						totalCount = totalCount + count
					end
				end
				if totalCount > 0 then
					local moveList = formatList(flattenItemCounts(moveCounts), ', ', '')
					log('Withdrew ' .. moveList .. '.')
					groupTransfers = groupTransfers + 1
				end
				-- Warn player not all their loot was moved
				if not success then
					warn('Unable to withdraw all supplies. Make sure your character has slots and capacity.')
				end
				-- Next group, after short delay
				setTimeout(function()
					transferGroup(index+1)
				end, pingDelay(DELAY.CONTAINER_MOVE_ITEM))
			end)
		end

		-- Open supply slot in depot
		xeno.containerUseItem(depot, DEPOT.SLOT_SUPPLY, true, true)
		setTimeout(function()
			-- Start transfer
			transferGroup(1)
		end, pingDelay(DELAY.CONTAINER_MOVE_ITEM))
	end

	local function depositBackpacks(locker, count, callback)
		local slots = {}
		-- Find the slots to move from
		for spot = 0, xeno.getContainerItemCount(0) - 1 do
			local item = xeno.getContainerSpotData(0, spot)
			if xeno.isItemContainer(item.id) then
				local newIndex = #slots+1
				slots[newIndex] = spot
				if newIndex >= count then
					break
				end
			end
		end


		-- Sort greatest to least so we don't shift source slots
		table.sort(slots, function(a,b) return a > b end)

		local function moveBp(index)
			local fromSlot = slots[index]
			-- No more containers to deposit, return
			if not fromSlot then
				callback()
				return
			end

			-- Move backpack to depot slot in locker
			xeno.containerMoveItemToContainer(0, fromSlot, locker, 0, 1)

			-- Delay and continue
			setTimeout(function()
				moveBp(index+1)
			end, pingDelay(DELAY.CONTAINER_MOVE_ITEM))
		end

		moveBp(1)
	end

	local function depotTransfer(depot, needDeposit, neededSupplies, callback)

		-- Minimize depot container
		if _config['General']['Minimize-Depot'] then
			xeno.minimizeContainer(depot)
		end

		-- Set depot state
		_script.depotOpen = true

		-- Check slots
		local missingBps = 0
		for spot = 0, 2 do
			local item = xeno.getContainerSpotData(depot, spot)
			if not item or not xeno.isItemContainer(item.id) then
				missingBps = missingBps + 1
			end
		end

		local function walkToTools()
			-- Walk to tool NPC
			walkerStartPath(_script.town, 'bank', 'tools', function()
				-- Buy backpacks
				shopBuyBackpacks(missingBps, function()
					-- Walk back to depot
					walkerStartPath(_script.town, 'tools', 'depot', function()
						walkerGotoDepot(function()
							openLocker(function(locker)
								depositBackpacks(locker, missingBps, function()
									-- Recurse this insane callstack
									openDepot(function(newDepot)
										depotTransfer(newDepot, needDeposit, neededSupplies, callback)
									end)
								end)
							end)
						end)
					end)
				end)
			end)
		end

		-- Stackable and nonstackables required
		if missingBps > 0 then
			warn('Missing loot and/or stackable loot container in depot. Walking to the equipment shop.')
			local bpPrice = missingBps * PRICE.BACKPACK
			-- Walk to bank
			if _config['General']['Walk-To-Banks'] then
				walkerStartPath(_script.town, 'depot', 'bank', function()
					-- Withdraw gold
					bankWithdrawGold(bpPrice, function()
						walkToTools()
					end)
				end)
			else
				walkToTools()
			end
			return
		end

		-- We need to deposit
		if needDeposit then
			-- Deposit stackables
			transferToDepot(depot, DEPOT.SLOT_STACK, function()
				-- Delay
				setTimeout(function()
					-- Deposit non-stackables
					transferToDepot(depot, DEPOT.SLOT_NONSTACK, function()
						-- Deposit supplies
						transferToDepot(depot, DEPOT.SLOT_SUPPLY, function()
							-- We need to withdraw, delay and withdraw
							if neededSupplies then
								setTimeout(function()
									-- Withdraw supplies
									transferFromDepot(depot, neededSupplies, function()
										-- Set depot state
										_script.depotOpen = false
										callback()
									end)
								end, DELAY.CONTAINER_MOVE_ITEM)
							-- Nothing left
							else
								-- Set depot state
								_script.depotOpen = false
								callback()
							end
						end)
					end)
				end, DELAY.CONTAINER_MOVE_ITEM)
			end)
		-- Only withdraw
		elseif neededSupplies then
			-- Withdraw supplies
			transferFromDepot(depot, neededSupplies, function()
				-- Set depot state
				_script.depotOpen = false
				callback()
			end)
		-- Nothing?
		else
			-- Set depot state
			_script.depotOpen = false
			callback()
		end
	end

	local function startDepotTransfer(needDeposit, neededSupplies, callback)
		-- Walk to nearest depot
		walkerGotoDepot(function()
			resetContainers(function()
				-- Open Depot
				openDepot(function(depot)
					-- Depot not opened, keep looking
					if not depot then
						startDepotTransfer(needDeposit, neededSupplies, callback)
						return
					end
					depotTransfer(depot, needDeposit, neededSupplies, callback)
				end)
			end)
		end)
	end

	-- Export global functions
	return {
		startDepotTransfer = startDepotTransfer
	}
end)()
Settings = (function()
	
	-- Imports
	local titlecase = Core.titlecase
	local formatList = Core.formatList
	local getSelfName = Core.getSelfName
	local split = Core.split
	local trim = Core.trim
	local setTimeout = Core.setTimeout
	local warn = Console.warn
	local error = Console.error
	local prompt = Console.prompt
	local walkerGetNeededTools = Walker.walkerGetNeededTools

	local function loadSettingsFile(callback)
		local file = io.input(FOLDER_SETTINGS_PATH .. _script.slug)
		local message = 'Make sure "'.._script.slug..'" is in the "Documents/XenoBot/Settings" folder. Type "retry" to continue.'
		local function promptXBST()
			prompt(message, function(response)
				if string.find(string.lower(response), 'retry') then
					loadSettingsFile(callback)
				else
					promptXBST()
				end
			end)
		end
		
		-- File does not exist
		if not file then
			promptXBST()
			return
		end

		-- Read whole file
		local xml = io.read("*all")
		io.close(file)
		
		-- Could not read
		if not xml then
			promptXBST()
			return
		end

		local tbl = {}

		local parseAttributes = function(str)
			local attr = {}
			string.gsub(str, PATTERN.XML_ATTR, function (w, _, a)
				attr[w] = a
			end)
			return attr
		end

		local index = 1
		local current = {panel=nil, control=nil}
		while true do
			local begin, final, closed, label, str, empty = string.find(xml, PATTERN.XML_TAG, index)
			if not begin then
				break
			end

			local attr = parseAttributes(str)

			-- Contains no inner value: <item name="ex" />
			if empty == '/' and tbl[current.panel] then
				local attr = parseAttributes(str)
				local target = (current.control ~= nil) and tbl[current.panel][current.control] or tbl[current.panel]
				if attr.name then
					target[attr.name] = attr.value
				else
					table.insert(target, attr)
				end

			-- New element start with possible children
			elseif closed == '' and attr.name then
				if label == 'panel' then
					tbl[attr.name] = {}
				elseif label == 'control' and tbl[current.panel] then
					tbl[current.panel][attr.name] = {}
				end
				current[label] = attr.name
			else -- close tag: </end> 
				current[label] = nil
			end
			index = final + 1
		end

		_settings = tbl
		
		callback()

		return true
	end

	local function setNeededTools(callback)
		local tools = walkerGetNeededTools()
		if tools then
			-- Loop through main backpack
			local mainbp = _backpacks['Main']
			for spot = 0, xeno.getContainerItemCount(mainbp) - 1 do
				local item = xeno.getContainerSpotData(mainbp, spot)
				-- Rope
				if tools.rope and ROPE_TOOLS[item.id] then
					-- Save tool id
					_script.rope = item.id
					_script.ropeCode = ROPE_TOOLS[item.id]
					-- Stay on the same spot if its a whacky tool
					if item.id == 9594 or item.id == 9596 or item.id == 9598 then
						_script.shovel = item.id
						_script.pick = item.id
						_script.shovelCode = SHOVEL_TOOLS[item.id]
					end
					-- No other tools needed to detect, break search
					if not tools.shovel and not tools.pick then
						break
					end
				-- Shovel
				elseif tools.shovel and SHOVEL_TOOLS[item.id] then
					-- Save tool id
					_script.shovel = item.id
					_script.shovelCode = SHOVEL_TOOLS[item.id]
					-- Stay on the same spot if its a whacky tool
					if item.id == 9594 or item.id == 9596 or item.id == 9598 then
						_script.shovel = item.id
						_script.pick = item.id
						_script.shovelCode = SHOVEL_TOOLS[item.id]
					end
					-- No other tools needed to detect, break search
					if not tools.rope and not tools.pick then
						break
					end
				-- Pick
				elseif tools.pick and PICK_TOOLS[item.id] then
					-- Save tool id
					_script.pick = item.id
					-- No other tools needed to detect, break search
					if not tools.rope and not tools.shovel then
						break
					end
				end
			end

			-- Error if we didn't find a tool we needed
			local missingTools = {}
			for tool, needed in pairs(tools) do
				if needed then
					if (tool == 'shovel' and not _script.shovel) or
					   (tool == 'rope' and not _script.rope) or
					   (tool == 'pick' and not _script.pick) then
						-- Add tool to missing list
						missingTools[#missingTools+1] = tool
					end
				end
			end
			if #missingTools > 0 then
				local message = 'You need a ' .. formatList(missingTools) .. ' in your main backpack. Type "retry" to continue.'
				local function promptTools()
					prompt(message, function(response)
						if string.find(string.lower(response), 'retry') then
							setNeededTools(callback)
						else
							promptTools()
						end
					end)
				end
				promptTools()
				return
			end
		end
		callback(tools)
	end

	local lureTemplate = '<panel name="Dynamic Lure"><control name="LureList"><item count="%d" prioMax="9" prioMin="%d" prioRaw="%d" until="%d" enabled="1" /></control><control name="AttackWhileLuring" value="%d"/></panel>'
	local function getDynamicLureXBST()
		local amount = _config['Lure']['Amount']
		local priority = _config['Lure']['MinPriority']
		local untilCount = _config['Lure']['Until'] or 0
		local attackWhileLure = _config['Lure']['AttackWhileLure'] and 1 or 0
		-- Validate config
		if not priority or priority > 9 or priority < 0 then
			error('[Config Error] Dynamic lure minimum priority is missing or invalid [0-9]!')
			return
		end
		-- Validate amounts
		if untilCount >= amount then
			error('[Config Error] Dynamic lure "until" cannot be greater than "amount"!')
			return
		end

		local rawPrio = 100 + priority
		return lureTemplate:format(amount, priority, rawPrio, untilCount, attackWhileLure)
	end

	local function getShooterXBST()
		local xbst = nil
		local shooterList = {}
		local maxMana = xeno.getSelfMaxMana()

		-- Loop through supplies, add Runes and Spells to the list.
		for _, supply in pairs(_supplies) do
			-- Belongs to the correct section, and has shooter settings
			if supply.group == 'Spells' or supply.group == 'Runes' and supply.options then
				local supplyid = supply.id

				-- Titlecase monsters incase the user didn't
				local targets = supply.options['Targets']
				if type(targets) == 'table' then
					for i = 1, #targets do
						if targets[i] then
							targets[i] = titlecase(targets[i])
						end
					end
					targets = table.concat(targets, ',')
				elseif targets then
					targets = titlecase(targets)
				end

				-- Look up item details
				local details = MAGIC_SHOOTER_ITEM[supplyid]
				if details then
					if supply.group == 'Runes' or maxMana >= details.mana then
						-- Add new item
						shooterList[#shooterList+1] = {
							spell = supply.group == 'Spells' and supplyid or '',
							rune = supply.group == 'Runes' and supplyid or 0,
							srange = details.srange,
							type = details.type,
							mana = details.mana and math.ceil((details.mana / xeno.getSelfMaxMana()) * 100) or 0,
							creature = targets,
							minhp = supply.options['MinHP'],
							maxhp = supply.options['MaxHP'],
							count = supply.options['TargetMin'],
							utito = supply.options['Utito'],
							priority = supply.options['Priority']
						}
						-- If utito is enabled, make a shooter entry (copy spell conditions)
						if supply.options['Utito'] then
							shooterList[#shooterList+1] = {
								spell = 'utito tempo',
								rune = 0,
								srange = details.srange,
								type = 4,
								mana = 50,
								--mana = details.mana and math.ceil((details.mana / xeno.getSelfMaxMana()) * 100) or 0,
								creature = targets,
								minhp = supply.options['MinHP'],
								maxhp = supply.options['MaxHP'],
								count = supply.options['TargetMin'],
								priority = 0
							}
						end
					else
						warn('Could not add "'..supplyid..'" to the shooter. You do not have enough mana to cast this spell.')
					end
				else
					if supply.group == 'Runes' then
						warn('Could not add "'..xeno.getItemNameByID(supplyid)..'" to the shooter. If this is a valid attack rune, please contact support.')
					else
						warn('Could not add "'..supplyid..'" to the shooter. If this is a valid attack spell, please contact support.')
					end
				end
			end
		end

		if #shooterList > 0 then
			xbst = '<panel name="Spell Shooter"><control name="shooterList">'
			-- Sort shooter list by priority
			table.sort(shooterList, function(a, b)
				return a.priority < b.priority
			end)
			-- Add each list item
			for i = 1, #shooterList do
				local item = shooterList[i]
				xbst = xbst .. string.format(
					'<item spell="%s" rune="%d" srange="%s" type="%s" reason="0" minhp="%d" maxhp="%d" mana="%d" count="%d" creature="%s" danger="1" targ="1" enabled="1"/>',
					item.spell, item.rune, item.srange, item.type, item.minhp or 0, item.maxhp or 0, item.mana or 0, item.count or 0, item.creature
				)
			end
			xbst = xbst .. '</control></panel>'
		end
		return xbst
	end

	local function setDynamicSettings(callback)
		-- Detect needed tools
		setNeededTools(function(tools)
			local xbstContents = ''

			-- Walker Options
			if _script.ropeCode > 0 or _script.shovelCode > 0 then
				xbstContents = string.format([[<panel name="Walker Options"><control name="ropeOption" value="%d"/><control name="shovelOption" value="%d"/></panel>]], _script.ropeCode, _script.shovelCode)
			end

			-- Detect ammunition or distance weapons
			local disWeaponID = 0
			local disAmmoID = 0
			for itemid, supply in pairs(_supplies) do
				if supply.group == 'Ammo' then
					if DISTANCE_WEAPONS[itemid] then
						disWeaponID = itemid
					else
						disAmmoID = itemid
					end
				end
			end

			-- Equipment Manager
			if disWeaponID > 0 or disAmmoID > 0 then
				if not xbstContents then
					xbstContents = ''
				end
				xbstContents = xbstContents .. string.format([[<panel name="Equipment Manager"><control name="AmmoRefillID" value="%d"/><control name="AmmoRefillEnable" value="%d"/><control name="WeaponRefillID" value="%d"/><control name="WeaponRefillEnable" value="%d"/></panel>]], disAmmoID, disAmmoID > 0 and 1 or 0, disWeaponID, disWeaponID > 0 and 1 or 0)
			end

			-- Looter
			local lootStyle = _config['Loot']['Loot-Style'] == 'first' and '0' or '1'
			local unlisted = _script.name:find('Thais Paw Collector') and '0' or '1'
			local lootXML = '<panel name="Looter"><control name="LootList" mode="' .. lootStyle .. '" minimum="0" maximum="0" skinner="2" unlisted="' .. unlisted .. '">'
			
			-- Demonic Blood use/loot
			lootXML = lootXML .. '<item ID="6558" action="20"/><item ID="237" action="1"/><item ID="236" action="1"/>'
			
			-- Only add gold if enabled
			if _config['Loot']['Loot-Gold'] then
				lootXML = lootXML .. '<item ID="3031" action="' .. _backpacks['Gold'] .. '"/>'
			end

			-- Always add platinum coins to gold backpack (even if gold bp==main)
			lootXML = lootXML .. '<item ID="3035" action="' .. _backpacks['Gold'] .. '"/>'

			-- Loop through targetlist, get items to add to looter
			local targeting = _settings['Targeting']
			if targeting then
				local targets = targeting['TargetingList']
				if targets then
					local lootList = {}
					for i = 1, #targets do
						local creatures = split(targets[i].type, ',')
						for k = 1, #creatures do
							local creature = trim(creatures[k])
							local monsterLoot = MONSTER_LOOT[creature]
							if monsterLoot then
								for j = 1, #monsterLoot do
									lootList[monsterLoot[j]] = true
								end
							end
						end
					end
					-- Add loot items to looter
					local minValue = _config['Loot']['Loot-Min-Value']
					local maxWeight = _config['Loot']['Loot-Max-Weight']
					local whiteList = _config['Loot']['Loot-WhiteList']
					local blackList = _config['Loot']['Loot-BlackList']

					-- Convert strings to tables if needed
					if type(whiteList) ~= 'table' then
						whiteList = {whiteList}
					end
					if type(blackList) ~= 'table' then
						blackList = {blackList}
					end

					-- Sort loot by value
					local lootKeys = {}
					for itemid, _ in pairs(lootList) do
						lootKeys[#lootKeys+1] = itemid
					end
					table.sort(lootKeys, function(a, b)
						return xeno.getItemValue(a) > xeno.getItemValue(b)
					end)

					-- Iterate sorted keys
					for i = 1, #lootKeys do
						local itemid = lootKeys[i]
						local name = string.lower(xeno.getItemNameByID(itemid))
						local blackListed = blackList and #blackList > 0 and table.find(blackList, name, true)
						if not blackListed then
							-- POTIONS
							local whiteListed = whiteList and #whiteList > 0 and table.find(whiteList, name, true)
							-- Meets min value condition
							if whiteListed or ITEM_LIST_POTIONS[itemid] or ITEM_LIST_RUSTYARMORS[itemid] or (not minValue or minValue <= 0 or xeno.getItemValue(itemid) >= minValue) then
								-- Meets max weight condition
								if whiteListed or ITEM_LIST_POTIONS[itemid] or ITEM_LIST_RUSTYARMORS[itemid] or (not maxWeight or maxWeight <= 0 or xeno.getItemWeight(itemid) <= maxWeight) then
									lootXML = lootXML .. '<item ID="' .. itemid .. '" action="' .. _backpacks['Loot'] .. '"/>'
								end
							end
						end
					end
				end
			end

			-- End of list
			xbstContents = xbstContents .. lootXML .. '</control></panel>'

			-- Magic Shooter
			if not _config['General']['Manual-Shooter'] then
				local shooter = getShooterXBST()
				if shooter then
					if not xbstContents then
						xbstContents = ''
					end
					xbstContents = xbstContents .. shooter
				end
			end

			-- Dynamic Lure
			if _config['Lure'] and _config['Lure']['Amount'] and _config['Lure']['Amount'] > 0 then
				local lurexml = getDynamicLureXBST()
				if lurexml then
					if not xbstContents then
						xbstContents = ''
					end
					xbstContents = xbstContents .. lurexml
				end
			end

			-- Save XBST if needed
			if xbstContents then				
				local filename = 'tmp.' .. string.gsub(getSelfName(), ".", string.byte)
				local file = io.open(FOLDER_SETTINGS_PATH .. filename .. '.xbst', 'w+')
				if file then
					file:write(xbstContents)
					file:close()
					xeno.loadSettings(FOLDER_SETTINGS_PATH .. filename, 'All')
					setTimeout(function()
						os.remove(FOLDER_SETTINGS_PATH .. filename .. '.xbst')
					end, 500)
				end
			end
			callback()
		end)
	end

	-- Export global functions
	return {
		loadSettingsFile = loadSettingsFile,
		setDynamicSettings = setDynamicSettings
	}
end)()
Supply = (function()
	
	-- Imports
	local formatList = Core.formatList
	local setInterval = Core.setInterval
	local clearTimeout = Core.clearTimeout
	local delayWalker = Core.delayWalker
	local resumeWalker = Core.resumeWalker
	local getDistanceBetween = Core.getDistanceBetween
	local log = Console.log
	local warn = Console.warn
	local prompt = Console.prompt
	local error = Console.error
	local getContainerItemCounts = Container.getContainerItemCounts
	local cleanContainers = Container.cleanContainers
	local getTotalItemCount = Container.getTotalItemCount
	local getMoney = Container.getMoney
	local getFlaskWeight = Container.getFlaskWeight
	local hudItemUpdate = Hud.hudItemUpdate
	local bankDepositGold = Npc.bankDepositGold
	local bankGetBalance = Npc.bankGetBalance
	local bankWithdrawGold = Npc.bankWithdrawGold
	local shopSellLoot = Npc.shopSellLoot
	local shopRefillSoftboots = Npc.shopRefillSoftboots
	local shopBuySupplies = Npc.shopBuySupplies
	local walkerLabelExists = Walker.walkerLabelExists
	local walkerStartPath = Walker.walkerStartPath
	local walkerGetPosAfterLabel = Walker.walkerGetPosAfterLabel
	local walkerGotoLocation = Walker.walkerGotoLocation
	local startDepotTransfer = Depot.startDepotTransfer
	local checkChainRules = Ini.checkChainRules

	local function updateSupplyCount(supplyTypes, itemListFilter)
		local function checkBackpack(group)
			-- Count the backpack assigned to this supply group
			-- Some supplies share the same backpack (Amulets & Rings)
			local backpackName = group
			if group == 'Amulet' or group == 'Ring' then
				backpackName = 'Supplies'
			end

			-- If dedicated backpack doesn't exist, check main backpack
			-- Supplies actually use the Main container, not Supplies
			local backpack = nil
			if group ~= 'Supplies' and _backpacks[backpackName] then
				backpack = _backpacks[backpackName]
			else
				backpack = _backpacks['Main']
			end

			local sessionCount = {}

			-- Count slots
			local slotItems = {}

			slotItems[1] = xeno.getAmmoSlotData()
			slotItems[2] = xeno.getHeadSlotData()
			slotItems[3] = xeno.getArmorSlotData()
			slotItems[4] = xeno.getLegsSlotData()
			slotItems[5] = xeno.getFeetSlotData()
			slotItems[6] = xeno.getAmuletSlotData()
			slotItems[7] = xeno.getWeaponSlotData()
			slotItems[8] = xeno.getRingSlotData()
			slotItems[9] = xeno.getShieldSlotData()

			-- Count supplies in slots
			for i = 1, 9 do
				local slot = slotItems[i]
				if slot and slot.id > 0 then
					if not itemListFilter or itemListFilter[slot.id] then
						local supply = _supplies[slot.id]
						-- This item is a supply and the correct group
						if supply and supply.group == group then
							-- Create supply count session if needed
							if not sessionCount[slot.id] then
								sessionCount[slot.id] = 0
							end

							-- Update supply count
							local count = sessionCount[slot.id] + math.max(slot.count, 1)
							sessionCount[slot.id] = count
							_supplies[slot.id].count = count
						end
					end
				end
			end

			-- Count supplies in the backpack determined above
			for spot = 0, xeno.getContainerItemCount(backpack) - 1 do
				local item = xeno.getContainerSpotData(backpack, spot)
				if not itemListFilter or itemListFilter[item.id] then
					local supply = _supplies[item.id]
					-- This item is a supply and the correct group
					if supply and supply.group == group then
						-- Create supply count session if needed
						if not sessionCount[item.id] then
							sessionCount[item.id] = 0
						end

						-- Update supply count
						local count = sessionCount[item.id] + math.max(item.count, 1)
						sessionCount[item.id] = count
						_supplies[item.id].count = count
					end
				end
			end

			-- Set supplies not found to zero
			for itemid, supply in pairs(_supplies) do
				if supply.group == group then
					if not sessionCount[itemid] then
						_supplies[itemid].count = 0
					end
				end
			end
		end

		-- If not supply types specified, default to all
		if not supplyTypes then
			supplyTypes = {'Runes', 'Potions', 'Ammo', 'Food', 'Supplies', 'Ring', 'Amulet'}
		-- Wrap in table (passed one)
		elseif type(supplyTypes) ~= 'table' then
			supplyTypes = {supplyTypes}
		end

		for i = 1, #supplyTypes do
			checkBackpack(supplyTypes[i])
		end
	end

	local disableAlarm = function()
		prompt('To disable the alarm, enter any text to stop the alarm.', function(response)
			if _script.alarmInterval then
				clearTimeout(_script.alarmInterval)
				_script.alarmInterval = nil
				warn('Alarm disabled.')
			end
		end)
	end

	local function checkAllSupplyThresholds(updatedNeededCount)
		-- Update all supply counts before checking
		updateSupplyCount()

		-- Thresholds
		local minThresholds = false
		local maxThresholds = false
		local alarmThresholds = false

		-- Loop through supplies, find the differences for each setting
		for itemid, supply in pairs(_supplies) do
			-- Minimum is expected to be checked and is below expected
			if supply.min > 0 and supply.count < supply.min then
				if not minThresholds then
					minThresholds = {}
				end
				minThresholds[itemid] = supply
			end
			-- Maximum is expected to be checked and is below expected
			local maxThreshold = supply.max >= 200 and supply.max - 20 or supply.max
			if supply.max > 0 and supply.count < maxThreshold then
				if not maxThresholds then
					maxThresholds = {}
				end
				maxThresholds[itemid] = supply
				-- Lock the buy amount
				if updatedNeededCount then
					supply.needed = supply.max - supply.count
				end
			-- Count is above max, always clear needed
			else
				supply.needed = 0
			end
			-- Alarm is expected to be checked and is below expected
			if supply.alarm > 0 and supply.count < supply.alarm then
				if not alarmThresholds then
					alarmThresholds = {}
				end
				alarmThresholds[itemid] = supply
			end
		end

		-- Log items below minimum & max
		local itemNames = {}
		local itemsAdded = {}
		local itemLists = {minThresholds}

		-- Town check, print max items too
		if not _script.inSpawn then
			itemLists[#itemLists + 1] = maxThresholds
		end

		-- Add items from min and max tables
		for i = 1, #itemLists do
			local list = itemLists[i]
			if list then
				for itemid, _ in pairs(list) do
					-- Make sure we don't add duplicates
					if not itemsAdded[itemid] then
						-- Make name plural
						local name = xeno.getItemNameByID(itemid)
						local suffix = 's'
						-- Name ends with 's', make suffix 'es'
						if string.sub(name, -1) == 's' then
							suffix = 'es'
						end
						-- Check if alarm for this item is triggered
						local important = ''
						if _script.inSpawn and (alarmThresholds and alarmThresholds[itemid]) then
							important = '!!!'
						end
						-- Add to log
						itemNames[#itemNames+1] = name .. suffix .. important
						-- Flag as added to log
						itemsAdded[itemid] = true
					end
				end
			end
		end

		-- Print the min and max items
		if #itemNames > 0 then
			warn('Low supply count for ' .. formatList(itemNames) .. '.')
		end

		-- If any item was added to the alarm threshold, start alarm
		if _script.inSpawn and alarmThresholds and not _script.alarmInterval then
			-- Sound alarm until disabled
			_script.alarmInterval = setInterval(function()
				xeno.alert()
			end, DELAY.AlARM_INTERVAL)

			-- Send alarm immediately
			xeno.alert()

			-- Send stop alarm prompt to user
			disableAlarm()
		end

		-- Return all supplies below thresholds
		return {
			min = minThresholds,
			max = maxThresholds,
			alarm = alarmThresholds
		}
	end

	local function getResupplyDetails()
		-- Only run this after selling loot, depositing loot gold, and withdrawing supplies
		-- Needed count for items will be locked after running this function
		-- Counts are decremented per item purchase
		-- count can decrease after selling loot
		-- count can increase after depositing loot gold
		-- count can decrease after withdrawing supplies
		local totalCost = 0
		local totalWeight = 0
		local refillSupplyGroups = {}
		local refillSoftboots = false
		local venoreTravel = false
		local edronTravel = false
		local runeTravel = nil
		local sourceTown = string.lower(_script.town)

		-- Spawn traveling, lookup by script name, apply a flat fee
		local spawnTravelFee = SPAWN_TRAVELLING[string.lower(_script.name)]
		if spawnTravelFee then
			totalCost = spawnTravelFee
		end

		-- Softboots refill (+ travel costs if not in venore and not already)
		if _config['Soft Boots']['Mana-Percent'] > 0 then
			local wornSoftBootCount = getTotalItemCount(ITEMID.SOFTBOOTS_WORN)
			-- Worn softboots on us, refill
			if wornSoftBootCount > 0 then
				refillSoftboots = true
				-- Not in Venore, we need to travel
				if sourceTown ~= 'venore' then
					venoreTravel = true
				end
				totalCost = totalCost + math.max(0, wornSoftBootCount) * PRICE.SOFTBOOTS_REFILL
			end
		end

		-- Supply refill cost (+ travel costs for exotic runes)
		local thresholds = checkAllSupplyThresholds(true)
		if thresholds.max then
			for itemid, supply in pairs(thresholds.max) do
				if supply.group ~= 'Amulet' and supply.group ~= 'Ring' then
					-- Runes can be domestic or foreign
					if supply.group == 'Runes' then
						-- We need to travel to Edron to get premium runes
						if RUNES_EXOTIC[itemid] and not EXOTIC_RUNE_TOWNS[sourceTown] then
							edronTravel = true
							runeTravel = 'Edron'
						-- We are in Edron and we need to travel to get free runes
						elseif RUNES_NORMAL[itemid] and sourceTown == 'edron' then
							venoreTravel = true
							runeTravel = 'Venore'
						-- We can buy these runes in town
						else
							refillSupplyGroups[supply.group] = true
						end
					-- Other supplies are all domestic
					elseif supply.group == 'Potions' or supply.group == 'Ammo' or supply.group == 'Food' then
						refillSupplyGroups[supply.group] = true
					end
					totalCost = totalCost + supply.needed * xeno.getItemCost(itemid)
					totalWeight = totalWeight + supply.needed * xeno.getItemWeight(itemid)
				end
			end
		end

		-- Add all travel costs to total
		if venoreTravel then
		    local travelRoute = TRAVEL_ROUTES[sourceTown .. '~venore']
		    local returnRoute = TRAVEL_ROUTES['venore~' .. sourceTown]
		    if not travelRoute then
		        error('Missing travel route from ' .. sourceTown .. ' to venore. Please contact support.')
		    end
		    totalCost = totalCost + travelRoute.cost + returnRoute.cost
		end
		if edronTravel and sourceTown ~= 'edron' then
		    local returnRoute = TRAVEL_ROUTES['edron~' .. sourceTown]
		    if venoreTravel then
		        -- Since we're returning directly from Edron we don't need the cash for traveling back from Venore anymore.
		        local notNeededVenoreReturnRoute = TRAVEL_ROUTES['venore~' .. sourceTown]
		        totalCost = totalCost - notNeededVenoreReturnRoute.cost
		        -- We already had to go to venore, head from venore to edron
		        sourceTown = 'venore'
		    end
		    local travelRoute = TRAVEL_ROUTES[sourceTown .. '~edron']
		    if not travelRoute then
		        error('Missing travel route from ' .. sourceTown .. ' to edron. Please contact support.')
		    end
		    totalCost = totalCost + travelRoute.cost + returnRoute.cost
		end

		return {
			withdrawGold = math.max(0, totalCost),
			capNeeded = math.max(0, totalWeight),
			refillSupplyGroups = refillSupplyGroups,
			refillSoftboots = refillSoftboots,
			foreignRuneTown = runeTravel
		}
	end

	local function resupply(callback, step, loot, details)
		--[[ 
			- Check if we need to go to loot seller
				- Sell loot (if any)
			- Check if we need to go to bank
				- Deposit gold (if any)
				IF NOT WITHDRAWING SUPPPLIES:
					- Withdraw gold
			- Check if we need to go to depot
				- Deposit loot (if any)
				- Withdraw supplies (if any)
			- IF HASN'T WITHDREW SUPPLY GOLD Check if we need to go to bank
				- Withdraw gold
			- Check travel-prone supplies first
				- Softboot refill (travel venore)
				- In edron and need "normal" runes (travel venore)
				- Not in edron, gray island, rathleton and need "exotic" runes (travel edron)
					- If already traveling to venore, travel directly from venore to edron
			- Check regular supplies
				- Runes not needing travel, Potions, Ammo, and Food
				- Order is based on current distance
		]]

		-- Update HUD and script state
		_script.state = 'Resupplying';

		step = step or 0

		-- Step 1) Detect loot to sell
		if step < 1 then
			-- Deep search of loot backpack.
			delayWalker()
			getContainerItemCounts(_backpacks['Loot'], function(items)
				resumeWalker()

				-- No items at all, skip step
				if not items then
					resupply(callback, 1, items)
					return
				end

				-- NPC Sell disabled (still pass items for deposit detection)
				if not _config['Loot']['Npc-Sell'] then
					resupply(callback, 1, items)
					return
				end

				-- List of sellable loot in this town
				local townLoot = SELLABLE_LOOT[string.lower(_script.town)]

				-- Nothing sellable in town, skip step
				if not townLoot then
					resupply(callback, 1, items)
					return
				end

				-- Path chosen (closest to us)
				local closestPath = nil
				local closestDistance = nil
				local supplyTown = string.lower(_script.town)
				local selfPos = xeno.getSelfPosition()

				-- Determine if we can sell each loot item
				local lootPaths = {}
				local lootPathCount = 0
				for itemid, itemcount in pairs(items) do
					-- We can sell this item
					local lootPath = townLoot[itemid]
					if lootPath then
						-- First type found is boolean, only one loot seller for town
						if type(lootPath) == 'boolean' then
							lootPaths['loot'] = true
							break
						-- Insert loot path as an option if not already
						elseif not lootPaths['loot.' .. lootPath] then
							lootPaths['loot.' .. lootPath] = true
							lootPathCount = lootPathCount + 1
						end
					end
				end

				-- Find the closest loot path to take
				for pathName, _ in pairs(lootPaths) do
					local label = supplyTown .. '|' .. pathName .. '~depot'
					-- Path exists
					if walkerLabelExists(label) then
						local pos = walkerGetPosAfterLabel(label)
						local distance = getDistanceBetween(selfPos, pos)
						-- Closest label so far
						if closestDistance == nil or distance < closestDistance then
							closestDistance = distance
							closestPath = pathName
						end
					end
				end

				-- We have loot to deposit
				if closestPath then
					log('Walking to the depot to deposit loot.')
					walkerGotoLocation(_script.town, closestPath, function()
						-- Arrived at loot shop
						shopSellLoot(townLoot, function()
							-- Repeat step if more loot paths
							if lootPathCount > 1 then
								resupply(callback, 0, items)
							-- Skip to next step
							else
								resupply(callback, 1, items)
							end
						end)
					end)
				-- No loot, go to next step
				else
					resupply(callback, 1, items)
				end
			end, true)
			return
		end

		-- Step 2) Detected money to deposit AND we need to do step 3 OTHERWISE skip to step 4
		if step < 2 then
			-- Loot remaining in loot backpack
			local depositLoot = false
			if loot then
				for itemid, _ in pairs(loot) do
					if itemid ~= ITEMID.OBSIDIAN_KNIFE and itemid ~= ITEMID.BLESSED_STAKE then
						depositLoot = true
						break
					end
				end
			end
			
			-- We need to withdraw supplies
			local withdrawSupplies = not _script.disableWithdraw and checkAllSupplyThresholds().max

			-- We can skip step 3, so we can also skip this step, go past 3.
			if not depositLoot and not withdrawSupplies then
				resupply(callback, 3, loot)
				return
			end

			local gold = getMoney()
			if gold > 500 then
				walkerGotoLocation(_script.town, 'bank', function(path)
					-- Arrived at bank
					bankDepositGold(function()
						-- Balance
						bankGetBalance(function()
							-- Deposited gold, continue resupply
							resupply(callback, 2, loot)
						end, true)
					end)
				end)
			else
				-- Skip to next step
				resupply(callback, 2, loot)
			end
			return
		end

		-- Step 3) Detected loot to deposit or supplies to withdraw
		if step < 3 then
			-- Loot remaining in loot backpack
			local depositLoot = false
			if loot then
				for itemid, _ in pairs(loot) do
					if itemid ~= ITEMID.OBSIDIAN_KNIFE
						and itemid ~= ITEMID.MECHANICAL_ROD
						and itemid ~= ITEMID.FISHING_ROD
						and itemid ~= ITEMID.BLESSED_STAKE then
						depositLoot = true
						break
					end
				end
			end

			-- We need to withdraw supplies
			local neededSupplies = false
			if not _script.disableWithdraw then
				neededSupplies = checkAllSupplyThresholds(true).max
			end

			if depositLoot and neededSupplies then
				log('Walking to the depot to withdraw supplies and deposit loot.')
			elseif depositLoot then
				log('Walking to the depot to deposit loot.')
			elseif neededSupplies then
				log('Walking to the depot to withdraw supplies.')
			end

			-- Do we need to head to the depot (deposit or withdraw)
			if depositLoot or neededSupplies then				
				walkerGotoLocation(_script.town, 'depot', function()
					-- Arrived at depot
					startDepotTransfer(depositLoot, neededSupplies, function()
						if _script.chainConfig then
							if checkChainRules(_script.chainConfig) then
								return
							end
						end
						-- Finished deposit & withdraw, continue resupply
						resupply(callback, 3, loot)
					end)
				end)
				return
			end
		end

		-- SHIT GETS REAL NOW. From this point on we need to look into the future
		-- Includes gold cost, softboot refill, and foreign rune town
		-- Do NOT call more than once, as it resets the future (resets needed values)!!!
		if not details then
			details = getResupplyDetails()
		end

		-- Step 4) Once this is called the amount we will buy is locked
		if step < 4 then
			-- Skip step 4 if we're not walking to banks (old NPC system)
			if not _config['General']['Walk-To-Banks'] then
				resupply(callback, 4, loot, details)
				return
			end

			if details.withdrawGold > 0 then 
				-- Check capacity
				if details.capNeeded > 0 then
					-- Deduct weight of supplies we sell before buying (flasks)
					--[[local estimatedCap = xeno.getSelfCap() - getFlaskWeight()
					-- Not enough capacity for supplies error
					if details.capNeeded > estimatedCap then
						error('Not enough capacity for supplies. Please lower config values or increase your capacity.')
						return
					end]]
				end
				walkerGotoLocation(_script.town, 'bank', function()
					-- Arrived at bank
					bankDepositGold(function()
						-- Under 10k rounds to nearest hundredths, otherwise thousandths 
						local roundTo = details.withdrawGold < 10000 and 100 or 1000
						local roundedCost = math.ceil(details.withdrawGold / roundTo) * roundTo
						-- Withdraw travel funds
						bankWithdrawGold(roundedCost, function()
							-- Balance
							bankGetBalance(function()
								-- Finished bank withdrawal, continue resupply
								resupply(callback, 4, loot, details)
							end, true)
						end, true)
					end)
				end)
				return
			end
		end

		-- Step 5) Detected softboots to refill
		if step < 5 then
			if details.refillSoftboots then
				walkerGotoLocation('Venore', 'soft.boots', function()
					-- Arrived at softboots
					shopRefillSoftboots(function()
						-- Refilled boots, continue resupply
						resupply(callback, 5, loot, details)
					end)
				end)
				return
			end
		end

		-- Step 6) Detected foreign runes to buy
		if step < 6 then
			if details.foreignRuneTown then
				walkerGotoLocation(details.foreignRuneTown, 'runes', function()
					-- Arrived at softboots
					shopBuySupplies('Runes', function()
						-- Refilled boots, continue resupply
						resupply(callback, 6, loot, details)
					end)
				end)
				return
			end
		end

		-- Step 7) Detected remaining supplies to buy (runes, potions, ammo, food)
		if step < 7 then
			-- Loop through all supplies needed to refill
			-- go to the closest supply location
			-- remove the group from the refill table
			-- repeat until none are left
			-- when none are left set step to 7
			local selfPos = xeno.getSelfPosition()
			local supplyTown = string.lower(_script.town)
			local supplyChosen = nil
			local supplyDistance = nil

			for supply, status in pairs(details.refillSupplyGroups) do
				if status then
					-- Find a label that starts at the destination (so we can determine distance)
					local label = supplyTown .. '|' .. string.lower(supply) .. '~depot'
					-- Route to supplies has to exist
					if walkerLabelExists(label) then
						local pos = walkerGetPosAfterLabel(label)
						local distance = getDistanceBetween(selfPos, pos)
						-- Closest label so far
						if supplyDistance == nil or distance < supplyDistance then
							supplyDistance = distance
							supplyChosen = supply
						end
					end
				end
			end


			-- No supply chose, this step is complete
			if not supplyChosen then
				resupply(callback, 7, loot, details)
				return
			end

			-- Walk to closest shop
			walkerGotoLocation(_script.town, string.lower(supplyChosen), function()
				-- Arrived at supplier
				shopBuySupplies(supplyChosen, function()
					-- Clear this supply
					details.refillSupplyGroups[supplyChosen] = nil
					-- Resupplied, trigger same step until we're out of resupplies
					resupply(callback, 6, loot, details)
				end)
			end)

			return
		end

		-- Done, go to town exit
		log('Ready to hunt. Walking to the spawn.')

		-- Update script state
		_script.state = 'Walking to town exit';
		
		walkerGotoLocation(_script.town, _script.townexit, function()

			-- Update script state
			_script.state = 'Walking to spawn';

			-- Exited town, go to spawn
			walkerStartPath(_script.town, _script.townexit, 'spawn', function()
				-- Enter spawn
				xeno.gotoLabel('enterspawn')
				resumeWalker()
				xeno.setTargetingEnabled(true)
				xeno.setLooterEnabled(true)
				-- Reached spawn
				if callback then
					callback()
					-- We finished our first resupply
					_script.firstResupply = false
				end
			end)
		end)
	end

	-- Export global functions
	return {
		checkSoftBoots = checkSoftBoots,
		checkAllSupplyThresholds = checkAllSupplyThresholds,
		resupply = resupply
	}
end)()
Targeter = (function()
	
	-- Imports
	local clearTimeout = Core.clearTimeout
	local setInterval = Core.setInterval
	local getDistanceBetween = Core.getDistanceBetween
	
	local function targetingGetCreatureThreshold(list, range, amount, multifloor, floor)
		local targets = {}
		local count = 0
		local pos = xeno.getSelfPosition()
		for i = CREATURES_LOW, CREATURES_HIGH do
			local name = xeno.getCreatureName(i)
			-- Is this creature invited to die?
			if list[string.lower(name)] then
				-- Position & Distance
				local cpos = xeno.getCreaturePosition(i)
				local distance = getDistanceBetween(pos, cpos)
				if ((pos.z + (floor or 0)) == cpos.z or multifloor) and distance <= range then
					-- Normal creature checks
					if xeno.getCreatureVisible(i) and xeno.getCreatureHealthPercent(i) > 0 and xeno.isCreatureMonster(i) then
						targets[#targets+1] = xeno.getCreatureIDFromIndex(i)
						count = count + 1
					end
				end
			end
		end
		return {count >= amount, targets}
	end

	-- Export global functions
	return {
		targetingGetCreatureThreshold = targetingGetCreatureThreshold
	}
end)()
do
	-- Imports
	local debug = Core.debug
	local formatNumber = Core.formatNumber
	local formatTime = Core.formatTime
	local freeMemory = Core.freeMemory
	local throttle = Core.throttle
	local titlecase = Core.titlecase
	local talk = Core.talk
	local clearTimeout = Core.clearTimeout
	local setTimeout = Core.setTimeout
	local setInterval = Core.setInterval
	local checkTimers = Core.checkTimers
	local checkEvents = Core.checkEvents
	local delayWalker = Core.delayWalker
	local resumeWalker = Core.resumeWalker
	local indexTable = Core.indexTable
	local split = Core.split
	local pingDelay = Core.pingDelay
	local getTimeUntilServerSave = Core.getTimeUntilServerSave
	local clearWalkerPath = Core.clearWalkerPath
	local getPositionFromDirection = Core.getPositionFromDirection
	local getDistanceBetween = Core.getDistanceBetween
	local getSelfName = Core.getSelfName
	local sortPositionsByDistance = Core.sortPositionsByDistance
	local cast = Core.cast
	local isSpell = Core.isSpell
	local cureConditions = Core.cureConditions
	local checkSoftBoots = Core.checkSoftBoots
	local log = Console.log
	local warn = Console.warn
	local openConsole = Console.openConsole
	local openDebugChannel = Console.openDebugChannel
	local openPrivateMessageConsole = Console.openPrivateMessageConsole
	local cleanContainers = Container.cleanContainers
	local resetContainers = Container.resetContainers
	local getTotalItemCount = Container.getTotalItemCount
	local setupContainers = Container.setupContainers
	local whenContainerUpdates = Container.whenContainerUpdates
	local unrustLoot = Container.unrustLoot
	local hudUpdateDimensions = Hud.hudUpdateDimensions
	local hudUpdatePositions = Hud.hudUpdatePositions
	local hudItemUpdate = Hud.hudItemUpdate
	local hudQueryLootChanges = Hud.hudQueryLootChanges
	local hudQuerySupplyChanges = Hud.hudQuerySupplyChanges
	local loadConfigFile = Ini.loadConfigFile
	local shopSellLoot = Npc.shopSellLoot
	local walkerLabelExists = Walker.walkerLabelExists
	local walkerStartPath = Walker.walkerStartPath
	local walkerGetClosestLabel = Walker.walkerGetClosestLabel
	local walkerReachNPC = Walker.walkerReachNPC
	local walkerGetDoorDetails = Walker.walkerGetDoorDetails
	local walkerUseTrainer = Walker.walkerUseTrainer
	local walkerUseClosestItem = Walker.walkerUseClosestItem
	local walkerCapacityDrop = Walker.walkerCapacityDrop
	local walkerRestoreMana = Walker.walkerRestoreMana
	local walkerGotoLocation = Walker.walkerGotoLocation
	local walkerTravel = Walker.walkerTravel
	local setDynamicSettings = Settings.setDynamicSettings
	local checkAllSupplyThresholds = Supply.checkAllSupplyThresholds
	local resupply = Supply.resupply
	local targetingGetCreatureThreshold = Targeter.targetingGetCreatureThreshold

	local LABEL_ACTIONS = {
		-- Player & Supply Check [huntcheck|id]
		['huntcheck'] = function(group, id, failLabel, skipSupplyCheck, skipState)
			skipState = skipState == 'true'
			skipSupplyCheck = skipSupplyCheck == 'true'
			local state = 'Hunting'
			local route = '--'

			-- Pause walker
			delayWalker()

			-- Drop vials / gold
			walkerCapacityDrop()

			-- Check logout conditions
			local logoutReason = nil
			local logoutConfig = _config['Logout']

			-- Condition: Forced
			if _script.forceLogoutQueued then
				logoutReason = 'Requested by user.'
			-- Condition: Low Stamina
			elseif logoutConfig['Stamina'] and logoutConfig['Stamina'] > 0 and (xeno.getSelfStamina() / 60) < logoutConfig['Stamina'] then
				logoutReason = 'Low stamina.'
			-- Condition: Reached Target level
			elseif logoutConfig['Level'] and logoutConfig['Level'] > 0 and xeno.getSelfLevel() >= logoutConfig['Level'] then
				logoutReason = 'Desired level reached.'
			-- Condition: near Server Save
			elseif logoutConfig['Server-Save'] and logoutConfig['Server-Save'] > 0 and getTimeUntilServerSave() < logoutConfig['Server-Save'] then
				logoutReason = 'Close to server save.'
			-- Condition: Reached Time limit
			elseif logoutConfig['Time-Limit'] and logoutConfig['Time-Limit'] > 0 and ((os.time() - _script.start) / 3600) >= logoutConfig['Time-Limit'] then
				logoutReason = 'Time limit reached.'
			end

			-- Found a reason to logout
			if logoutReason then
				state = 'Exiting'
				-- Train or logout
				local action = 'logout'
				if logoutConfig['Train-Skill'] and logoutConfig['Train-Skill'] ~= 'none' then
					action = 'train'
					_script.trainingQueued = true
				else
					_script.logoutQueued = true
				end
				log('Returning to ' .._script.town.. ' to ' .. action .. '. ' .. logoutReason)
				-- Clean backpacks
				cleanContainers(_backpacks['Loot'], ITEM_LIST_SKINNABLE_LOOT, nil, true)
				-- Route system
				if failLabel then
					xeno.gotoLabel(failLabel, true)
				-- Regular system
				else
					xeno.gotoLabel('huntexit|' .. id)
				end
			-- Continue hunting
			else
				-- Check our state
				local supplies = not skipSupplyCheck and checkAllSupplyThresholds() or {}
				local lowSupplies = supplies.min
				local lowCap = not skipSupplyCheck and (xeno.getSelfCap() < _config['Capacity']['Hunt-Minimum']) or false
				local needSoftbootRepair = not skipSupplyCheck and (_config['Soft Boots']['Mana-Percent'] > 0 and getTotalItemCount(ITEMID.SOFTBOOTS_WORN) > 0) or false
				-- Resupply
				if _script.returnQueued or supplies.min or lowCap or needSoftbootRepair then
					if _script.state ~= 'Walking to exit' then
						state = 'Walking to exit'
						log('Returning to ' .. _script.town .. ' to ' .. (needSoftbootRepair and 'repair soft boots.' or 're-supply.') .. (_script.returnQueued and ' [forced]' or ''))
					end
					-- Clean backpacks
					cleanContainers(_backpacks['Loot'], ITEM_LIST_SKINNABLE_LOOT, nil, true)
					-- Route system
					if failLabel then
						xeno.gotoLabel(failLabel, true)
					-- Regular system
					else
						xeno.gotoLabel('huntexit|'..id)
					end
				-- Continue hunting
				else
					-- Route system
					if failLabel then
						-- Check route status (disable, enabled, random)
						-- random is a 50% chance to take the route
						local routeData = _config['Route']
						if routeData then
							local routeEnabled = routeData[id]
							if routeEnabled == 'random' then
								routeEnabled = math.random(1, 10) > 5 and true or false
							end
							if _script.returnQueued or not routeEnabled then
								xeno.gotoLabel(failLabel, true)
							-- Route enabled, update script state
							else
								route = id
							end
						end
					-- Regular system
					else
						xeno.gotoLabel('huntstart|'..id)
					end
				end
			end
			if not route then route = '--' end
			-- Update script state
			if not skipState and _config['HUD']['Enabled'] then
				_script.state = state;
				-- We don't currently have a route
				if _script.route == '--' then
					_script.route = route ~= '--' and route:gsub('-', ' ') or '--'
				end
				-- The current label is a route
				if route ~= '--' then
					-- Set the new route
					_script.route = route:gsub('-', ' ')
				end
			end

			-- Resume walker
			resumeWalker()
		end,

		-- Exit spawn and return to town
		['spawnexit'] = function(group)
			-- Update state
			log('Exiting spawn.')
			_script.inSpawn = false
			_script.state = 'Walking to town'

			-- Update round
			_script.round = _script.round + 1

			-- Disable active alarm if running
			if _script.alarmInterval then
				clearTimeout(_script.alarmInterval)
				_script.alarmInterval = nil
				warn('Alarm disabled.')
			end

			-- Clear return queued
			_script.returnQueued = false

			-- Walk to town|spawn~townentrance
			walkerStartPath(_script.town, 'spawn', _script.townentrance or _script.townexit, function()

				-- Cure Conditions
				if _config['General']['Cure-Conditions'] then
					cureConditions()
				end

				-- Trainers
				if _script.trainingQueued then
					walkerStartPath(_script.town, _script.townentrance or _script.townexit, 'trainers', function()
						walkerUseTrainer()
						--assert(false, 'Script finished successfully.')
					end)
				-- Logout
				elseif _script.logoutQueued then
					walkerStartPath(_script.town, _script.townentrance or _script.townexit, 'depot', function()
						log('Hunting complete, logging out.')
						if not _config['Logout']['Exit-Log'] then
							xeno.doSelfLogout()
							assert(false, 'Script finished successfully.')
						else
							os.exit()
						end
					end)
				-- Start resupply process
				else
					resupply()
				end
			end)
		end,

		-- Enter spawn
		['enterspawn'] = function(group)
			log('Entering spawn.')
			_script.state = 'Hunting';
			_script.inSpawn = true;
		end,

		-- Door System
		['door'] = function(group, id, action)
			if action == 'START' then
				local door = walkerGetDoorDetails(id)
				-- Skip to corresponding door label
				if xeno.getTileIsWalkable(door.doorPos.x, door.doorPos.y, door.doorPos.z) then
					xeno.gotoLabel(door.posLabel)
				end
			-- Door position label (ex: door|100|SOUTH)
			else
				-- Door is walkable
				-- Use door in front, step forward until out of doorway
				-- Check if we're on other side of door, if not go back to door|id|START
				local door = walkerGetDoorDetails(id)
				-- Open door if closed
				if not xeno.getTileIsWalkable(door.doorPos.x, door.doorPos.y, door.doorPos.z) then
					xeno.selfUseItemFromGround(door.doorPos.x, door.doorPos.y, door.doorPos.z)
				end
				-- Rush through open door
				xeno.doSelfStep(door.direction)
				xeno.doSelfStep(door.direction)
				-- If walker gets stuck in the next 3 seconds, return to door
				_script.stuckReturnLabel = door.startLabel
				_script.stuckReturnTimer = setTimeout(function()
					_script.stuckReturnLabel = nil
				end, 3000)
			end
		end,

		-- Pick System
		['pick'] = function(group, direction)
			local directions = {['NORTH']=NORTH, ['SOUTH']=SOUTH, ['EAST']=EAST, ['WEST']=WEST}
			local pos = getPositionFromDirection(xeno.getSelfPosition(), directions[direction], 1)
			xeno.selfUseItemWithGround(_script.pick, pos.x, pos.y, pos.z)
		end,

		-- Levitate System
		['levitate'] = function(group, change, direction, nostep)
			local prevFloor = xeno.getSelfPosition().z
			local directions = {['NORTH']=NORTH, ['SOUTH']=SOUTH, ['EAST']=EAST, ['WEST']=WEST}
			local dir = directions[direction]

			-- Pause walker & looter
			delayWalker()
			xeno.setLooterEnabled(false)
			xeno.doSelfTurn(dir)
			xeno.doSelfTurn(dir)

			if not nostep then
				xeno.doSelfStep(dir)
			end

			setTimeout(function()
				if xeno.getSelfPosition().z == prevFloor then
					cast('exani hur ' .. (change == '+' and 'up' or 'down'))
				end
				xeno.setLooterEnabled(true)
				resumeWalker()
			end, 1000)
		end,

		-- Anti-Lure System
		['run'] = function(group, name, id, waitTime)
			-- Reached the end, wait
			if id == 'end' then
				local setIgnore = setTargetingIgnoreEnabled
				-- Pause walker
				delayWalker()
				-- Disable ignore mode
				setIgnore(false)
				-- Enable the walker when there's no more threats
				_script.antiLureCheckInterval = setInterval(function()
					-- Check if we can continue
					local threshold = targetingGetCreatureThreshold(
						_config['Anti Lure']['Creatures'],
						_config['Anti Lure']['Range'],
						_config['Anti Lure']['Amount'],
						false)
					-- Threshold met, stop timer and start walker
					if not threshold[1] then
						if _script.antiLureCheckInterval then
							clearTimeout(_script.antiLureCheckInterval)
							_script.antiLureCheckInterval = nil
						end
						resumeWalker()
					end
				end, waitTime and tonumber(waitTime) or 30000)
			end
		end,

		-- Anti-Lure Spy System
		['spy'] = function(group, floor, label, range, amount, list)
			-- Pause walker
			delayWalker()

			local creatures = list and indexTable(split(list, ','), true) or _config['Anti Lure']['Creatures']
			if not creatures then
				resumeWalker()
			end

			local firstCheck = true
			local function checkFloor()
				local threshold = targetingGetCreatureThreshold(
					creatures,
					range and tonumber(range) or _config['Anti Lure']['Range'],
					amount and tonumber(amount) or _config['Anti Lure']['Amount'],
					false,
					tonumber(floor)
				)

				-- Safe
				if not threshold[1] then
					if not firstCheck then
						setTimeout(function()
							resumeWalker()
						end, pingDelay(DELAY.ANTILURE_DELAY))
					else
						resumeWalker()
					end

				-- Not safe, bitch label found, run
				elseif label and label ~= 'nil' then
					xeno.gotoLabel(label)
					resumeWalker()
				-- Not safe, wait until it is
				else
					firstCheck = false
					setTimeout(checkFloor, 200)
				end
			end

			checkFloor()
		end,

		-- Traveling (travel|ankrahmun~svargrond)
		['travel'] = function(group, route)
			delayWalker()
			walkerTravel(route, function()
				resumeWalker()
			end, true)
		end,

		-- Edge cases
		['special'] = function(group, param1, param2)
			-- Rafzan Shop (in-spawn shop)
			if param1 == 'RafzanTrade' then
				delayWalker()
				walkerReachNPC('Rafzan', function()
					shopSellLoot({
						[17846] = true,
						[17813] = true,
						[17812] = true,
						[17810] = true,
						[17859] = true
					}, function()
						resumeWalker()
					end)
				end)
			-- Elemental Soils Shop (in-spawn shop)
			elseif param1 == 'SoilsTrade' then
				delayWalker()
				walkerReachNPC('Arkulius', function()
					shopSellLoot({
						[940] = true, -- natural soil
						[941] = true, -- glimmering soil
						[942] = true, -- flawless ice crystal
						[944] = true, -- iced soil
						[945] = true, -- energy soil
						[946] = true, -- eternal flames
						[947] = true, -- mother soil
						[948] = true, -- pure energy
						[954] = true -- neutral matter
					}, function()
						resumeWalker()
					end)
				end)
			elseif param1 == 'SpheresMachine' then
				delayWalker()
				local gemItemId = tonumber(param2) or 678
				local tries = 0
				local depositInterval = nil
				local function depositGem()
					-- Drop gem in machine
					xeno.selfUseItemWithGround(gemItemId, 33269, 31830, 10)
					local pos = xeno.getSelfPosition()
					setTimeout(function()
						-- Attempt to use machine
						xeno.selfUseItemFromGround(33269, 31830, 10)
						-- Teleported
						if getDistanceBetween(xeno.getSelfPosition(), pos) > 10 then
							-- Stop gem dropper & resume bot
							clearTimeout(depositInterval)
							resumeWalker()
						end
					end, DELAY.CONTAINER_USE_ITEM)
				end
				depositInterval = setInterval(depositGem, DELAY.CONTAINER_USE_ITEM)
			-- Use nearest Yalahar gate mechanism, verify position change
			elseif param1 == 'YalaharMech' then
				delayWalker()
				local pos = xeno.getSelfPosition()
				local function useMech()
					walkerUseClosestItem({[8615]=true, [8618]=true})
					setTimeout(function()
						if getDistanceBetween(xeno.getSelfPosition(), pos) > 3 then
							resumeWalker()
						else
							useMech()
						end
					end, pingDelay(DELAY.MAP_USE_ITEM))
				end
				useMech()
			elseif param1 == 'PythiusMug' then
				delayWalker()
				local mugs = getTotalItemCount(ITEMID.GOLDEN_MUG)
				local dialog = {'hi', 'offer', 'yes', 'golden mug'}
				walkerReachNPC('Pythius the Rotten', function()
					talk(dialog, function()
						setTimeout(function()
							resumeWalker()
							if getTotalItemCount(ITEMID.GOLDEN_MUG) >= mugs then
								xeno.gotoLabel('special|PrePythiusMug')
							end
						end, pingDelay(DELAY.RANGE_TALK))
					end)
				end)
			end
		end
	}

	local _huntingForDepot = false
	local _snapbacks = 0
	local _lastsnapback = 0
	local _lastposition = xeno.getSelfPosition()
	local _walkerStuckScreenshotInterval = nil

	function onTick()
		if not _script.ready then return end

		-- Backpacks were closed, we just logged in.
		if not _script.openingContainers and not xeno.getContainerOpen(0) then
			local inProtectionZone = xeno.getSelfFlag('inpz')
			-- Disable walker, looter, and targeter
			delayWalker()
			xeno.setLooterEnabled(false)
			xeno.setTargetingEnabled(false)
			-- If in PZ, we enable after we setup containers
			resetContainers(function()
				if inProtectionZone then
					resumeWalker()
					xeno.setLooterEnabled(true)
					xeno.setTargetingEnabled(true)
				end
			end)
			-- Otherwise, we wait 10 seconds
			if not inProtectionZone then
				setTimeout(function()
					resumeWalker()
					xeno.setLooterEnabled(true)
					xeno.setTargetingEnabled(true)
				end, 10000)
			end
		end

		-- Check and execute timers
		checkTimers()

		-- Update conditions (that need polling)
		_script.stuck = xeno.getWalkerStuck()
		_script.ignoring = xeno.getTargetingIgnoring()

		-- We're stuck, take a screenshot in 10 seconds if we are still stuck then
		if _script.stuck and not _walkerStuckScreenshotInterval then
			_walkerStuckScreenshotInterval = setTimeout(function()
				xeno.setDiagnosticsEnabled(1)
				local pos = xeno.getSelfPosition()
				setTimeout(function()
					xeno.screenshot(('stuck-%d-%d-%d'):format(pos.x, pos.y, pos.z))
					xeno.setDiagnosticsEnabled(0)
				end, 1000)
				_walkerStuckScreenshotInterval = nil
			end, 10 * 1000)

		-- No longer stuck, cancel the screenshot
		elseif not _script.stuck and _walkerStuckScreenshotInterval then
			clearTimeout(_walkerStuckScreenshotInterval)
			_walkerStuckScreenshotInterval = nil
		end

		-- Anti-lure checks
		if _config['Anti Lure'] and _config['Anti Lure']['Amount'] and _config['Anti Lure']['Amount'] > 0 then
			-- Not already running away like a little bitch
			if not _script.ignoring then
				local setIgnore = setTargetingIgnoreEnabled
				local threshold = targetingGetCreatureThreshold(
					_config['Anti Lure']['Creatures'],
					_config['Anti Lure']['Range'],
					_config['Anti Lure']['Amount'],
					false)
				-- Threshold met, goto run path
				if threshold[1] then
					setIgnore(true)
					xeno.attackCreature(0)
					log('Anti-lure triggered. Returning to safety.')
					local closestPath = walkerGetClosestLabel(false, 'run')
					if closestPath then
						xeno.gotoLabel(closestPath.name)
					end
				end
			end
		end

		-- Initiate path clearing process
		if _script.stuck then
			-- Finding a depot, try next one
			if _script.findingDepot then
				-- Not already searching
				if not _huntingForDepot then
					_script.findingDepot = _script.findingDepot + 1
					local label = 'depot|' .. string.lower(_script.town) .. '|' .. _script.findingDepot
					-- Depot exists, try walking to it
					if walkerLabelExists(label) then
						xeno.gotoLabel(label)
						-- Prevent stuck event from firing this same action immediately
						_huntingForDepot = true
						setTimeout(function()
							_huntingForDepot = false
						end, 3000)
					-- No more depots, go to a depotend, most likely to fail
					else
						xeno.gotoLabel('depotend')
					end
				end
			-- Go to return label if set
			elseif _script.stuckReturnLabel then
				xeno.gotoLabel(_script.stuckReturnLabel)
				_script.stuckReturnLabel = nil
				if _script.stuckReturnTimer then
					clearTimeout(_script.stuckReturnTimer)
				end
			end
			throttle(THROTTLE_CLEAR_PATH, clearWalkerPath)
		end

		if _config['HUD'] and _config['HUD']['Enabled'] then
			-- Time related statistics
			local timediff = os.time() - _script.start
			local serverSave = getTimeUntilServerSave() * 3600
			local playerStamina = xeno.getSelfStamina() * 60
			local logoutConfig = _config['Logout']
						local simpleTime = _config['HUD'] and _config['HUD']['Simple-Time-Format']
			
			hudItemUpdate('General', 'Balance', _script.balance, true)
			hudItemUpdate('General', 'Online Time', formatTime(timediff, simpleTime), true)
			
			local timeLimit = logoutConfig['Time-Limit'] or 0
			local ssLimit = logoutConfig['Server-Save'] or 0
			local stamLimit = logoutConfig['Stamina'] or 0
			local remaining = {}

			if timeLimit > 0 then
				remaining[#remaining+1] = (timeLimit * 3600) - (os.time() - _script.start)
			end

			if serverSave > 0 then
				remaining[#remaining+1] = serverSave - (ssLimit * 3600)
			end

			if stamLimit > 0 then
				remaining[#remaining+1] = playerStamina - (stamLimit * 3600)
			end

			-- Sort remaining times (lowest first)
			table.sort(remaining)

			-- Choose lowest remaining time to display
			local remainingTime = remaining[1]
			if remainingTime then
				hudItemUpdate('General', 'Time Remaining', formatTime(remainingTime, simpleTime), true)
			end

			hudItemUpdate('General', 'Server Save', formatTime(serverSave, simpleTime), true)
			hudItemUpdate('General', 'Stamina', formatTime(playerStamina, simpleTime), true)

			local ping = xeno.ping()
			if ping ~= _script.pingLast then
				_script.pingSum = _script.pingSum + ping
				_script.pingEntries = _script.pingEntries + 1
				_script.pingLast = ping
			end

			if _script.pingEntries > 0 then
				hudItemUpdate('General', 'Latency', ping .. ' ms (avg: ' .. math.floor((_script.pingSum / _script.pingEntries) + 0.5) .. ')', true)
			end

			-- Update experience gain
			local gain = xeno.getSelfExperience() - _script.baseExp
			local staminadiff = _script.startStamina - xeno.getSelfStamina()
			staminadiff = (staminadiff > 0 and staminadiff or 1) * 60
			local useStaminaMeasure = _config['HUD']['Per-Stamina-Measurement']
			local diff = useStaminaMeasure and staminadiff or timediff
			local hourlyexp = tonumber(math.floor(gain / (diff / 3600))) or 0			
			local hourPostfix = useStaminaMeasure and ' xp/sh' or ' xp/h'
			hudItemUpdate('Statistics', 'Experience', formatNumber(gain) .. ' xp', true)
			hudItemUpdate('Statistics', 'Hourly Exp', formatNumber(hourlyexp) .. hourPostfix, true)

			-- Update profit
			local totalLooted = _hud.index['Statistics']['Looted'].value
			local totalWaste = _hud.index['Statistics']['Wasted'].value
			local profit = totalLooted - totalWaste
			local hourlygain = tonumber(math.floor(profit / (diff / 3600))) or 0		
			local hourPostfix = useStaminaMeasure and ' gp/sh' or ' gp/h'		
			hudItemUpdate('Statistics', 'Profit', formatNumber(profit) .. ' gp', true)
			hudItemUpdate('Statistics', 'Hourly Profit', formatNumber(hourlygain) .. hourPostfix, true)

			-- Update level stats
			local playerLevel = xeno.getSelfLevel()
			local targetLevel = playerLevel + 1
			local expLeft = ((50/3) * (targetLevel^3) - (100 * targetLevel^2) + ((850/3) * targetLevel) - 200) - xeno.getSelfExperience()
			hudItemUpdate('Statistics', 'Exp to Level', formatNumber(expLeft) .. ' xp', true)
			hudItemUpdate('Statistics', 'Time to Level', hourlyexp > 0 and formatTime(expLeft / (gain / timediff), simpleTime) or formatTime(0, simpleTime), true)

			-- Update state
			hudItemUpdate('Script', 'State', _script.state, true)
			hudItemUpdate('Script', 'Reason', _script.reason, true)
			hudItemUpdate('Script', 'Route', _script.route, true)
			hudItemUpdate('Script', 'Round', tostring(_script.round), true)

			local targetState = 'Disabled'
			if _script.ignoring then
				targetState = 'Ignoring'
			elseif xeno.getXenoBotStatus()["targeting"] then
				targetState = 'Enabled'
			end

			hudItemUpdate('Script', 'Targeter', targetState, true)

			local walkerState = 'Disabled'
			if _script.stuck then
				walkerState = 'Stuck'
			elseif xeno.getWalkerLuring() then
				walkerState = 'Luring'
			elseif xeno.getXenoBotStatus()["walker"] then
				walkerState = 'Enabled'
			end

			hudItemUpdate('Script', 'Walker', walkerState, true)

			-- Loot & Supply Polling
			hudQueryLootChanges()
			hudQuerySupplyChanges()

			hudUpdateDimensions()
			hudUpdatePositions()
		end

		--[[ Change gold (only on Open Tibia)
		if xeno.isRealTibia() ~= 1 then
			local mainbp = _backpacks['Main']
			local goldbp = _backpacks['Gold']
			local backpacks = {goldbp}
			if mainbp ~= goldbp then
				backpacks[#backpacks+1] = mainbp
			end
			for i = 1, #backpacks do
				local bp = backpacks[i]
				local used = false
				for spot = 0, xeno.getContainerItemCount(bp) - 1 do
					local item = xeno.getContainerSpotData(bp, spot)
					if item.count >= 100 and ITEM_LIST_MONEY[item.id] and item.id ~= 3043 then
						-- Use stack to change gold
						xeno.containerUseItem(bp, spot)
						-- Stop, we'll get the next one next tick
						used = true
						break
					end
					if used then break end
				end
			end
		end]]

		-- Unruster
		unrustLoot()

		-- Script crashed, safely walk to exit
		if _script.crashed then
			_script.crashed = nil
			local msg = 'Walking to depot to stop script.'
			local townPositions = sortPositionsByDistance(xeno.getSelfPosition(), TOWN_POSITIONS)
			local town = townPositions[1].name:lower()
			log(msg)
			print(msg)
			xeno.setWalkerEnabled(true)
			walkerGotoLocation(town, 'depot', function()
				assert(false, msg)
			end)
		end
	end

	function onLabel(name)
		if not _script.ready then return end
		

		-- Path end event
		if name == 'end' then
			delayWalker()
			checkEvents(EVENT_PATH_END, _path)
			_path = {town = nil, route = nil, town = nil, from = nil, to = nil}
			
			return
		end

		-- Depot end event
		if name == 'depotend' then
			delayWalker()
			checkEvents(EVENT_DEPOT_END, 'depotend')
			
			return
		end

		-- Split label
		local label = split(name, '|')
		local group = label and label[1]

		-- Path start, parse
		if group ~= 'travel' and string.find(name, '~') then
			local pathData = split(name, '|')
			local town = pathData[1]
			local route = pathData[2]

			local routeData = split(route, '~')
			local from = routeData[1]
			local to = routeData[2]

			-- Update path
			_path = {town = town, route = route, town = town, from = from, to = to}
			
			return
		end

		-- Reached the end of a route
		if group:sub(1,3) == 'No-' then
			-- False route matches current route
			if group:sub(4):lower() == _script.route:lower() then
				_script.route = '--';
			end
		end

		-- Label events
		local event = LABEL_ACTIONS[group] or _events[EVENT_LABEL][group]
		if event then
			event(unpack(label))
		end
		
	end

	function onErrorMessage(message)
		if not _script.ready then return end
		

		checkEvents(EVENT_ERROR, message)

		-- Snap back
		if message == ERROR_NOT_POSSIBLE then
			-- Only trigger in spawn
			if _script.inSpawn then
				local time = os.clock() * 1000
				local pos = xeno.getSelfPosition()
				-- It's been longer than 2 seconds, reset snapbacks
				if time - _lastsnapback > 2000 then
					_snapbacks = 0
				-- Moved since the last snapback
				elseif getDistanceBetween(_lastposition, pos) > 0 then
					_snapbacks = 0
				end

				-- Save time and increment snapbacks by one
				_lastsnapback = time
				_lastposition = pos
				_snapbacks = _snapbacks + 1
				-- If snapbacks are at 5 or more, assume an invisible monster is blocking
				if _snapbacks >= 5 then
					if _config['General']['Invis-Anti-Stuck'] then
						local pvpsafe = true
						for i = CREATURES_LOW, CREATURES_HIGH do
							local cpos = xeno.getCreaturePosition(i)
							local distance = getDistanceBetween(pos, cpos)
							-- Same or 1 floor away, 2sqms away
							if math.abs(pos.z - cpos.z) <= 1 and distance <= 2 then
								-- Normal creature checks
								if xeno.getCreatureVisible(i) and xeno.getCreatureHealthPercent(i) > 0 and xeno.isCreaturePlayer(i) then
									pvpsafe = false
								end
							end
						end

						-- TODO: free account alternative (wait for "You must learn this spell first" or "You need a premium account" error message)
						if pvpsafe then
							if _script.vocation == 'Paladin' then
								cast('exori san')
							elseif _script.vocation == 'Knight' then
								cast('exori')
							else
								cast('exori frigo')
							end
						end
					end
					_snapbacks = 0
				end

			end
		end
	end

	function onLootMessage(message)
		if not _script.ready then return end
		

		-- Check if we need to pump mana
		local manaRestorePercent = _config['Mana Restorer']['Restore-Percent']
		local potionName = _config['Potions']['ManaName']
		local playerPos = xeno.getSelfPosition()
		if manaRestorePercent and manaRestorePercent > 0 and potionName then
			-- Mana below threshold
			local playerMana = math.abs((xeno.getSelfMana() / xeno.getSelfMaxMana()) * 100)
			if playerMana <= manaRestorePercent then
				-- Check for monsters
				local potionid = type(potionName) == 'string' and xeno.getItemIDByName(potionName) or potionName
				local monsterOnScreen = false
				for i = CREATURES_LOW, CREATURES_HIGH do
					local cpos = xeno.getCreaturePosition(i)
					if cpos then
						local distance = getDistanceBetween(playerPos, cpos)
						if playerPos.z == cpos.z and distance <= _config['Mana Restorer']['Range'] then
							if xeno.getCreatureVisible(i) and xeno.getCreatureHealthPercent(i) > 0 and xeno.isCreatureMonster(i) then
								monsterOnScreen = true
								break
							end
						end
					end
				end
				-- No monsters on screen
				if not monsterOnScreen then
					-- Stop walker to pump
					delayWalker()
					walkerRestoreMana(potionid, manaRestorePercent, function()
						-- Mana restored, continue walking
						resumeWalker()
					end)
				end
			end
		end

		-- Check if we need to drop anything
		throttle(THROTTLE_CAP_DROP, walkerCapacityDrop)

		checkEvents(EVENT_LOOT, message)
		
	end

	local _battleMsgRunning = false
	function onBattleMessage(message)
		if _battleMsgRunning then return end
		if not _script.ready then return end

		_battleMsgRunning = true	

		-- What should we equip/un-equip (slot=itemid)
		local equip = {}
		local unequip = {}

		local playerPos = xeno.getSelfPosition()
		local playerRing = xeno.getRingSlotData().id
		local playerAmulet = xeno.getAmuletSlotData().id
		local playerHealth = math.abs((xeno.getSelfHealth() / xeno.getSelfMaxHealth()) * 100)
		local playerMana = math.abs((xeno.getSelfMana() / xeno.getSelfMaxMana()) * 100)

		-- Collect all valid creatures
		local validCreaturesIndexes = {}
		for i = CREATURES_LOW, CREATURES_HIGH do
			-- Position & Distance
			local cpos = xeno.getCreaturePosition(i)
			local distance = getDistanceBetween(playerPos, cpos)
			if playerPos.z == cpos.z and distance <= 7 then
				-- Normal creature checks
				if xeno.getCreatureVisible(i) and xeno.getCreatureHealthPercent(i) > 0 and xeno.isCreatureMonster(i) then
					table.insert(validCreaturesIndexes, i)
				end
			end
		end

		for itemid, supply in pairs(_supplies) do
			-- Check rings & amulets
			if supply.group == 'Ring' or supply.group == 'Amulet' and supply.options then

				-- Thresholds
				local triggered = false
				local count = supply.options['CreatureCount'] or 0
				local health = supply.options['MinHP'] or 0
				local mana = supply.options['MinMP'] or 0
				local ignore = count == 0 and health == 0 and mana == 0

				if not ignore then

					local targets = supply.options['Creatures'] or {}
									 
					-- Count only monsters in the config
					local creatures = 0 -- Moved into the loops to fix a bug. Remember to remove the earlier definition.
					if count > 0 then
						for _, i in ipairs(validCreaturesIndexes) do
							local name = xeno.getCreatureName(i)
							debug('ring equipper - name: ' .. name)
							if targets[name:lower()] then
								creatures = creatures + 1
								debug('ring equipper - creature #: ' .. creatures)
							end
						end
					end

					local slotItem = supply.group == 'Ring' and playerRing or playerAmulet
					-- We need to equip the ring
					if (count > 0 and creatures >= count) or (health > 0 and playerHealth <= health) or (mana > 0 and playerMana <= mana) then
						-- Only equip if we don't have it on already
						if slotItem ~= itemid and slotItem ~= ITEM_LIST_ACTIVE_RINGS[itemid] then
							equip[supply.group] = itemid
						end
					-- We need to un-equip the ring
					elseif slotItem == itemid or slotItem == ITEM_LIST_ACTIVE_RINGS[itemid] then
						unequip[supply.group] = itemid
					end
				end
			end
		end

		-- Equip all queued supplies
		for group, itemid in pairs(equip) do
			-- Search for the item to equip
			local backpack = _backpacks['Supplies']
			local slot = group == 'Ring' and "ring" or "amulet"
			for spot = 0, xeno.getContainerItemCount(backpack) - 1 do
				local item = xeno.getContainerSpotData(backpack, spot)
				-- Equip item
				if item.id == itemid then
					xeno.containerMoveItemToSlot(backpack, spot, slot, -1)
					_script.equipped[slot] = true;
					-- If this group exists in unequip, remove it, as it will be removed on equip.
					if unequip[group] then
						unequip[group] = nil
					end
					break
				end
			end
		end

		-- Un-equip all queued supplies
		for group, itemid in pairs(unequip) do
			local slot = group == 'Ring' and "ring" or "amulet"
			xeno.slotMoveItemToContainer(slot, _backpacks['Supplies'], 0)
			_script.equipped[slot] = false;
		end

		checkSoftBoots()
		checkEvents(EVENT_BATTLE, message)
		
		_battleMsgRunning = false
	end

	function onChannelSpeak(channel, message)
		-- Do not check if the script is event ready
		-- prompts are needed beforehand
		
		-- First character is slash, command is expected
		if string.sub(message, 1, 1) == '/' then
			-- Clear last console message, so we can repeat ourselves
			_lastConsoleMessage = nil
			local params = split(string.sub(message, 2), ' ')
			local command = params and params[1]
			-- Help command
			if command == 'help' then
				log([[Available commands:
					/resupply  =  Forces the script to return to town after the current round.
					/logout  =  Forces the script to return to town and logout after the current round.
					/config = Opens the config file for this script.
					/resethud  =  Reset the session start time.
					/history  =  Opens a channel to monitor received private messages.
					/debug = Opens a debug channel with more verbose logging.]])
			-- Clear memory
			elseif command == 'freemem' then
				local bytes = freeMemory()
				log('Released ' .. bytes .. ' bytes of allocated RAM.')
			-- Open config
			elseif command == '' then
			-- Open debug channel
			elseif command == 'debug' then
				openDebugChannel()
			-- Open private message history channel
			elseif command == 'history' then
				openPrivateMessageConsole()
			--[[elseif command == 'theme' then
				local themeName = params[2]
				local theme = themeName and THEME[themeName]
				if theme then
					_script.theme = themeName
					log('HUD theme set to ' .. themeName .. '.')
				else
					log('Invalid HUD theme name. [light, dark]')
				end]]
			-- Reset session time
			elseif command == 'resethud' then
				_script.start = os.time()
				log('Reset script start time.')
			elseif command == 'config' then
				local configName = '[' .. getSelfName() .. '] ' .. _script.name
				xeno.showConfigEditor(configName)
			-- Force logout
			elseif command == 'logout' then
				_script.forceLogoutQueued = true
				log('Returning to town to logout after the current round.')
			-- Force resupply
			elseif command == 'resupply' then
				_script.returnQueued = true
				log('Returning to town after the current round.')
			elseif command == 'refill' then
				_script.returnQueued = true
				log('Returning to town after the current round.')
			-- TODO: implement a more modular reload system in RC2
			-- Reload config
			--[[elseif command == 'reload' then
				_config = {}
				_supplies = {}
				loadConfigFile(function()
					setupContainers(function()
						setDynamicSettings(function()
							log('Reloaded the config.')
							-- If reloaded in town, trigger resupply
							if _script.state == 'Resupplying' or _script.state == 'Starting' then
								log('Triggering resupply incase supply counts may have changed.')
								resupply()
							end
						end)
					end)
				end, true)--]]
			end
		-- Spell, forward to default channel
		elseif isSpell(message:lower()) then
			xeno.selfSay(message)
		-- Not command, handle as usual
		else
			checkEvents(EVENT_COMMAND, message)
		end
		
	end

	function onLogoutEvent()
		if not _script.ready then return end
		_script.forceLogoutQueued = true
		log('Returning to town to logout after the current round. [Xeno Monitor]')
	end

	function onChannelClose(channel)
		if not _script.ready then return end
		
		if _script.channel and tonumber(_script.channel) == tonumber(channel) then
			openConsole()
		elseif _script.historyChannel and tonumber(_script.historyChannel) == tonumber(channel) then
			_script.historyChannel = nil
		end
		
	end

	function onPrivateMessage(name, level, message)
		if not _script.ready then return end
		

		-- TODO: filter spam
		-- TODO: alarm and red text for configurable words
		if _script.historyChannel then
			xeno.luaSendChannelMessage(_script.historyChannel, CHANNEL_ORANGE, name .. ' ['..level..']', message)
		end
		
	end

	function onNpcMessage(name, message)
		if not _script.ready then return end
		
		checkEvents(EVENT_NPC, message, name)
		
	end

	function onContainerChange(index, title, id)
		if not _script.ready then return end
		-- Trigger on the next tick cycle
		-- we need to give the client time to update
		-- on RL Tibia we artificially delay this time for safety reasons
		local delay = xeno.isRealTibia() == 1 and pingDelay(DELAY.CONTAINER_WAIT) or 0
		setTimeout(function()
			
			checkEvents(EVENT_CONTAINER, index, title, id)
			
		end, delay)
	end

	xeno.registerNativeEventListener(TIMER_TICK, 'onTick')
	xeno.registerNativeEventListener(WALKER_SELECTLABEL, 'onLabel')
	xeno.registerNativeEventListener(ERROR_MESSAGE, 'onErrorMessage')
	xeno.registerNativeEventListener(LOOT_MESSAGE, 'onLootMessage')
	xeno.registerNativeEventListener(BATTLE_MESSAGE, 'onBattleMessage')
	xeno.registerNativeEventListener(EVENT_SELF_CHANNELSPEECH, 'onChannelSpeak')
	xeno.registerNativeEventListener(LOGOUT_COMMAND, 'onLogoutEvent')
	xeno.registerNativeEventListener(EVENT_SELF_CHANNELCLOSE, 'onChannelClose')
	xeno.registerNativeEventListener(PRIVATE_MESSAGE, 'onPrivateMessage')
	xeno.registerNativeEventListener(NPC_MESSAGE, 'onNpcMessage')
	xeno.registerNativeEventListener(CONTAINER_OPEN, 'onContainerChange')
end
--local global = _G
--local env = {}
--setfenv(1, env)

local function init()
    xeno.setWalkerEnabled(false)

    -- Made in Texas with love <3
    xeno.HUDCreateText(65, 33, 'X E N O B O T', 0, 0, 0)
    xeno.HUDCreateText(66, 32, 'X E N O B O T', 255, 255, 255)

    -- Imports
    local loadMasterConfig = Ini.loadMasterConfig
    local loadConfigFile = Ini.loadConfigFile
    local checkChainRules = Ini.checkChainRules
    local hudInit = Hud.hudInit
    local checkSoftBoots = Core.checkSoftBoots
    local isXenoBotBinary = Core.isXenoBotBinary
    local getXenoVersion = Core.getXenoVersion
    local openConsole = Console.openConsole
    local openDebugChannel = Console.openDebugChannel
    local sortPositionsByDistance = Core.sortPositionsByDistance
    local log = Console.log
    local setupContainers = Container.setupContainers
    local walkerGetTownExit = Walker.walkerGetTownExit
    local walkerGetTownEntrance = Walker.walkerGetTownEntrance
    local loadSettingsFile = Settings.loadSettingsFile
    local setDynamicSettings = Settings.setDynamicSettings
    local resupply = Supply.resupply
    local walkerGetClosestLabel = Walker.walkerGetClosestLabel

    _script.chainConfig = loadMasterConfig()

    -- Immediately check chaining rules to see if we
    if _script.chainConfig then
        if checkChainRules(_script.chainConfig, true) then
            return
        end
    end

    -- Only allow XenoBot Binary
    if getXenoVersion() < MINIMUM_XENO_VERSION then
        print('You are using an older version of XenoBot. Update to the latest version of XenoBot to run this script.')
        return
    end

    -- Create channel
    openConsole()
    
    if DEBUG_ACCOUNTS[xeno.getUserName():lower()] then
        openDebugChannel()
    end
        
    -- Load config.ini
    loadConfigFile(function()
        -- Grab screen dimensions
        if _config['HUD']['Enabled'] then
            hudInit()
        end
        -- Ready for events
        _script.ready = true
        -- Only continue after containers are setup
        setupContainers(function()
            -- Check EQ related stuff
            checkSoftBoots()

            -- Load XBST
            loadSettingsFile(function()
                -- Modify XBST
                xeno.setWalkerEnabled(false)
                setDynamicSettings(function()
                    xeno.setWalkerEnabled(true)
                    -- Detect town exit
                    walkerGetTownExit()
                    walkerGetTownEntrance()

                    -- Check if we're in the spawn or in town
                    local position = xeno.getSelfPosition()
                    local townPositions = sortPositionsByDistance(xeno.getSelfPosition(), TOWN_POSITIONS)
                    local town = townPositions[1].name
                    local startLabel = walkerGetClosestLabel(true, town:lower())
                    local huntStart = false
                    if not startLabel or getDistanceBetween(position, startLabel) > 30 then
                        startLabel = walkerGetClosestLabel(false, 'huntstart')
                        huntStart = true
                        if not startLabel or getDistanceBetween(position, startLabel) > 30 then
                            error('Too far from any start point. Restart the script closer to a town.')
                            return
                        end
                    end

                    -- Start the walker in the spawn or in town
                    if huntStart then
                        xeno.gotoLabel(startLabel.name)
                        _script.state = 'Hunting';
                        _script.inSpawn = true;
                    else
                        resupply()
                    end
                end)
            end)
        end)
    end)
end

init()
