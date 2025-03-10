// Station voidsuits
//Engineering rig
/obj/item/clothing/head/space/void/engineering
	name = "engineering voidsuit helmet"
	desc = "A special helmet designed for work in a hazardous, low-pressure environment. Has radiation shielding."
	icon_state = "technohelmet_void"
	item_state = "technohelmet_void"
	item_state_slots = list(
		slot_l_hand_str = "eng_helm",
		slot_r_hand_str = "eng_helm",
		)
	armor = list(
		melee = 35,
		bullet = 30,
		energy = 30,
		bomb = 40,
		bio = 100,
		rad = 100
	)
	max_heat_protection_temperature = FIRE_HELMET_MAX_HEAT_PROTECTION_TEMPERATURE

/obj/item/clothing/suit/space/void/engineering
	name = "engineering voidsuit"
	desc = "A special suit that protects against hazardous, low pressure environments. Has radiation shielding and extra plating."
	icon_state = "technosuit"
	item_state = "technosuit"
	armor = list(
		melee = 35,
		bullet = 30,
		energy = 30,
		bomb = 40,
		bio = 100,
		rad = 100
	)
	max_heat_protection_temperature = FIRESUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	extra_allowed = list(
		/obj/item/storage/toolbox,
		/obj/item/storage/briefcase/inflatable,
		/obj/item/device/t_scanner,
		/obj/item/rcd
	)
	helmet = /obj/item/clothing/head/space/void/engineering
	rarity_value = 10.1

/obj/item/clothing/suit/space/void/engineering/equipped
	boots = /obj/item/clothing/shoes/magboots
	tank = /obj/item/tank/jetpack/oxygen
	accompanying_object = null
	spawn_blacklisted = TRUE

//Mining rig
/obj/item/clothing/head/space/void/mining
	name = "mining voidsuit helmet"
	desc = "A special helmet designed for work in a hazardous, low pressure environment. Has reinforced plating."
	icon_state = "mining_helmet"
	item_state = "mining_helmet"
	item_state_slots = list(
		slot_l_hand_str = "mining_helm",
		slot_r_hand_str = "mining_helm",
		)
	armor = list(
		melee = 50,
		bullet = 35,
		energy = 30,
		bomb = 25,
		bio = 100,
		rad = 75
	)
	light_overlay = "helmet_light_dual"

/obj/item/clothing/suit/space/void/mining
	name = "mining voidsuit"
	desc = "A special suit that protects against hazardous, low pressure environments. Has reinforced plating."
	item_state = "miner_suit"
	icon_state = "miner_suit"
	slowdown = 0.35
	armor = list(
		melee = 50,
		bullet = 35,
		energy = 30,
		bomb = 25,
		bio = 100,
		rad = 75
	)
	helmet = /obj/item/clothing/head/space/void/mining
	rarity_value = 10.11

//Medical Rig
/obj/item/clothing/head/space/void/medical
	name = "medical voidsuit helmet"
	desc = "A special helmet designed for work in a hazardous, low pressure environment. Has minor radiation shielding."
	icon_state = "rig0-medical"
	item_state = "medical_helm"
	item_state_slots = list(
		slot_l_hand_str = "medical_helm",
		slot_r_hand_str = "medical_helm",
		)
	armor = list(
		melee = 30,
		bullet = 10,
		energy = 35,
		bomb = 25,
		bio = 100,
		rad = 75
	)

/obj/item/clothing/suit/space/void/medical
	icon_state = "rig-medical"
	name = "medical voidsuit"
	desc = "A special suit that protects against hazardous, low pressure environments. Has minor radiation shielding."
	item_state = "medical_voidsuit"
	slowdown = 0.15
	extra_allowed = list(
		/obj/item/storage/firstaid,
		/obj/item/device/scanner/health,
		/obj/item/stack/medical,
		/obj/item/roller
	)
	armor = list(
		melee = 20,
		bullet = 10,
		energy = 35,
		bomb = 25,
		bio = 100,
		rad = 75
	)
	helmet = /obj/item/clothing/head/space/void/medical
	rarity_value = 8.7

/obj/item/clothing/suit/space/void/medical/equipped
	boots = /obj/item/clothing/shoes/magboots
	accompanying_object = null
	spawn_blacklisted = TRUE

	//Security
/obj/item/clothing/head/space/void/security
	name = "aegis voidsuit helmet"
	desc = "A special helmet designed for work in a hazardous, low pressure environment. Has an additional layer of armor."
	icon_state = "ihsvoidhelm"
	item_state = "ihsvoidhelm"
	item_state_slots = list(
		slot_l_hand_str = "sec_helm",
		slot_r_hand_str = "sec_helm",
		)

	armor = list(
		melee = 35,
		bullet = 40,
		energy = 30,
		bomb = 25,
		bio = 100,
		rad = 75
	)
	siemens_coefficient = 0.7
	light_overlay = "helmet_light_ihs"

/obj/item/clothing/suit/space/void/security
	name = "aegis voidsuit"
	icon_state = "ihvoidsuit"
	desc = "A bulky suit that protects against hazardous, low pressure environments. Sacrifices mobility for protection."
	item_state = "ihvoidsuit"
	armor = list(
		melee = 35,
		bullet = 40,
		energy = 30,
		bomb = 25,
		bio = 100,
		rad = 75
	)
	siemens_coefficient = 0.7
	helmet = /obj/item/clothing/head/space/void/security
	rarity_value = 40

/obj/item/clothing/suit/space/void/security/equipped
	boots = /obj/item/clothing/shoes/magboots
	tank = /obj/item/tank/jetpack/oxygen
	accompanying_object = null
	spawn_blacklisted = TRUE

//Atmospherics Rig (BS12)
/obj/item/clothing/head/space/void/atmos
	desc = "A special helmet designed for work in a hazardous, low pressure environments. Has improved thermal protection and minor radiation shielding."
	name = "atmospherics voidsuit helmet"
	icon_state = "rig0-atmos"
	item_state = "atmos_helm"
	item_state_slots = list(
		slot_l_hand_str = "atmos_helm",
		slot_r_hand_str = "atmos_helm",
		)
	armor = list(
		melee = 30,
		bullet = 10,
		energy = 10,
		bomb = 25,
		bio = 100,
		rad = 75
	)
	max_heat_protection_temperature = FIRE_HELMET_MAX_HEAT_PROTECTION_TEMPERATURE
	light_overlay = "helmet_light_dual"

/obj/item/clothing/suit/space/void/atmos
	desc = "A special suit that protects against hazardous, low pressure environments. Has improved thermal protection and minor radiation shielding."
	icon_state = "rig-atmos"
	name = "atmos voidsuit"
	item_state = "atmos_voidsuit"
	armor = list(
		melee = 30,
		bullet = 10,
		energy = 10,
		bomb = 25,
		bio = 100,
		rad = 75
	)
	max_heat_protection_temperature = FIRESUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	helmet = /obj/item/clothing/head/space/void/atmos
	rarity_value = 16

//Science
/obj/item/clothing/head/space/void/science
	name = "Moebius combat Helmet"
	desc = "A special helmet designed for work in a hazardous, low pressure environment. Has an additional layer of armor."
	icon_state = "moebiushelmb"
	item_state = "moebiushelmb"
	item_state_slots = list(
		slot_l_hand_str = "assaulthelm",
		slot_r_hand_str = "assaulthelm",
		)
	matter = list(
	MATERIAL_PLASTEEL = 5,
	MATERIAL_STEEL = 5,
	MATERIAL_GLASS = 5
	)
	price_tag = 200
	armor = list(
		melee = 40,
		bullet = 35,
		energy = 45,
		bomb = 30,
		bio = 100,
		rad = 75
	)
	siemens_coefficient = 0.4
	light_overlay = "helmet_light_dual"

/obj/item/clothing/head/space/void/science
    var/list/icon_states = list("moebiushelmb","moebiushelmr", "moebiushelmp","moebiushelmg", "moebiushelmy", "moebiushelmw") //TODO: a manual selection anytime.

/obj/item/clothing/head/space/void/science/New()
    ..()
    icon_state = pick(icon_states)

/obj/item/clothing/suit/space/void/science
	name = "Moebius combat voidsuit"
	icon_state = "moebiussuit"
	desc = "A heavy space suit designed for work in hazardous environment. Features several advanced layers of armor."	//SYZYGY EDIT - lore compliance
	item_state = "moebiussuit"
	matter = list(
	MATERIAL_PLASTEEL = 15,
	MATERIAL_STEEL = 10,
	MATERIAL_PLASTIC = 10,
	MATERIAL_PLATINUM = 5
	)
	armor = list(
		melee = 40,
		bullet = 35,
		energy = 45,
		bomb = 30,
		bio = 100,
		rad = 75
	)
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 4)
	price_tag = 1200
	siemens_coefficient = 0.4
	helmet = /obj/item/clothing/head/space/void/science
	rarity_value = 50
	spawn_blacklisted = TRUE

/obj/item/clothing/head/space/void/riggedvoidsuit
	name = "makeshift armored Helmet"
	desc = "A makeshift armored helmet you can see the glue holding it, just close enough to be airtight."
	icon_state = "makeshift_void"
	item_state = "makeshift_void"
	slowdown = 2

	armor = list(
		melee = 20,
		bullet = 15,
		energy = 20,
		bomb = 25,
		bio = 100,
		rad = 0
	)
	light_overlay = "helmet_light_dual"
	siemens_coefficient = 0.8

/obj/item/clothing/suit/space/void/riggedvoidsuit
	name = "makeshift armored voidsuit"
	desc = "A makeshift armored voidsuit you can see the glue holding it, just close enough to be airtight."
	icon_state = "makeshift_void"
	item_state = "makeshift_void"
	siemens_coefficient = 0.4
	armor = list(
		melee = 10,
		bullet = 20,
		energy = 20,
		bomb = 25,
		bio = 100,
		rad = 0
	)
	siemens_coefficient = 0.8
	helmet = /obj/item/clothing/head/space/void/riggedvoidsuit
	spawn_blacklisted = TRUE

