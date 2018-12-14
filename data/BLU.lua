
--TP set toggle input: //gs c toggle TP set----1 Standard, 2 Solo, 3 Marches, 4 AccuracyLite, 5 AccuracyMax, 6 DT, 7 DTAccuracy--
send_command('bind f9 gs c toggle TP set')
--Idle set toggle input: //gs c toggle Idle set----1 Standard, 2 DT--
send_command('bind f10 gs c toggle Idle set')
--Requiescat set toggle input: //gs c toggle Req set----1 Attack, 2 Accuracy--
send_command('bind f11 gs c toggle Req set')
--Chant du Cygne set toggle input: //gs c toggle CDC set----1 Attack, 2 Accuracy--
send_command('bind f12 gs c toggle CDC set')

-- Additional local binds
-- CTRL + `
send_command('bind ^` input /item "Echo Drops" <me>')
-- Windows + `
-- send_command('bind @` gs c toggle MagicBurst')
-- ALT + `
-- send_command('bind !` gs c toggle CapacityPoints; gs disable back')

INT_Spells = S{"Foul Waters","Rending Deluge","Droning Whirlwind","Subduction","Embalming Earth","Tem. Upheaval","Thunderbolt","Dark Orb",
				"Water Bomb","Evryone. Grudge","Magic Hammer","Thermal Pulse","Corrosive Ooze","Regurgitation","Firespit",
				"Leafstorm","Gates of Hades","Retinal Glare","Blastbomb","Blazing Bound","Diffusion Ray","Rail Cannon","Foul Waters","Polar Roar",
				"Molting Plumage","Cursed Sphere","Crashing Thunder","Nectarous Deluge","Charged Whisker","Bomb toss","Tenebral Crush",
				"Spectral Floe","Blinding Fulgor","Scouring Spate","Anvil Lightning","Entomb","Silent Storm","Searing Tempest"}
Light_Nukes = S{"Blinding Fulgor","Retinal Glare","Diffusion Ray","Rail Cannon","Magic Hammer"}

STR_Spells = S{"Vertical Cleave","Empty Thrash","Quadrastrike","Bloodrake","Heavy Strike","Whirl of Rage"}
DEX_Spells = S{"Vanity Dive"}
STRDEX_Spells = S{"Disseverment","Frenetic Rip","Goblin Rush","Paralyzing Triad","Thrashing Assault"}
STRVIT_Spells = S{"Quad. Continuum","Delta Thrust","Cannonball","Glutinous Dart","Sinker Drill"}
Buff_Spells = S{"Cocoon","Harden Shell","Battery Charge","Nat. Meditation","Carcharian Verve","Barrier Tusk","Saline Coat","Regeneration","Occultation","Magic Barrier","Diamondhide","Erratic Flutter","Mighty Guard"}
Stun_Spells = S{"Head Butt","Sudden Lunge","Bilgestorm","Benthic Typhoon","Tourbillion","Sweeping Gouge","Seedspray"}
Enfeebling_Spells = S{"Sandspray","Geist Wall","Dream Flower","Sheep Song","Frightful Roar","Blitzstrahl","Acrid Stream","Osmosis","Sound Blast","Cruel Joke","Absolute Terror","Blank Gaze"}
Cure_Spells = S{"Magic Fruit","Pollen","Restoral","Plenilune Embrace","Wild Carrot","Healing Breeze","White Wind","Sandstorm","Rainstorm","Windstorm","Firestorm","Hailstorm","Thunderstorm","Voidstorm","Aurorastorm"}
RDM_EnSpells = S{"Enfire","Enblizzard","Enaero","Enstone","Enthunder","Enwater"}

LeftDarkRing  = {name="Dark Ring", augments={'Breath dmg. taken -5%','Phys. dmg. taken -4%','Magic dmg. taken -3%'}}
RightDarkRing = {name="Dark Ring", augments={'Phys. dmg. taken -6%','Magic dmg. taken -4%','Spell interruption rate down -3%'}}

function get_sets()

	select_default_macro_book()

	Gear_Debug = 0

	--Idle Sets--
	sets.Idle = {}

	sets.Idle.index = {'Standard','DT'}
	Idle_ind = 1

	sets.Idle.Standard = {main="Sequence", sub="Colada", ammo="Ginsen",
			head="Rawhide Mask",neck="Sanctity Necklace", ear1="Moonshade Earring", ear2="Suppanomimi",
			body="Jhakri Robe +2",hands="Adhemar Wristbands +1",ring1="Hetairoi Ring",ring2="Epona's Ring",
			back="Atheling Mantle",waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Ayanmo Gambieras +2"
	}

	sets.Idle.DT = {ammo="Ginsen",
		head="Rawhide mask",neck="Sanctity Necklace", ear1="Infused Earring", ear2="Moonshade earring",
		body="Jhakri Robe +2",hands="Herculean Gloves",ring1="Sheltered Ring",ring2=RightDarkRing,
		back="Solemnity Cape",waist="Flume belt",legs="Carmine Cuisses +1",feet="Herculean Boots"
	}

	--TP Sets--
	sets.TP = {}
	sets.TP.index = {'Standard', 'Accuracy', 'DT', 'STP'}
	--1=Standard, 2=Solo, 3=Marches, 4=AccuracyLite, 5=AccuracyFull, 6=DT, 7=DTAccuracy--
	TP_ind = 1
	TP_ind2 = 1
	CP_Mode = 0

	sets.TP.Standard = {ammo="Ginsen",
				head="Adhemar Bonnet +1",neck="Asperity Necklace", ear1="Brutal Earring", ear2="Suppanomimi",
				body="Adhemar Jacket +1",hands="Adhemar Wristbands +1",ring1="Hetairoi Ring",ring2="Epona's Ring",
				back="Rosmerta's Cape",waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Herculean Boots"}

	sets.TP.Accuracy = {ammo="Mantoptera Eye",
				head="ayanmo zucchetto +2",neck="Iqabi Necklace", ear1="Bladeborn Earring", ear2="Steelflash Earring",
				body="Ayanmo Corazza +2",hands="Ayanmo Manopolas +2",ring1="Ramuh Ring +1",ring2="Ilabrat Ring",
				back="Rosmerta's Cape",waist="Anguinus Belt",legs="Carmine Cuisses +1",feet="Ayanmo Gambieras +2"}

	sets.TP.DT = {ammo="Ginsen",
				head="ayanmo zucchetto +2",neck="Loricate Torque +1", ear2="Suppanomimi",
				body="Ayanmo Corazza +2",
				back="Solemnity Cape",waist="Flume belt",legs="Herculean trousers",feet="Ayanmo Gambieras +2"}

	sets.TP.STP = {ammo="Ginsen",
				head="ayanmo zucchetto +2",neck="Asperity necklace", ear1="Cessance Earring", ear2="Brutal Earring",
				body="Ayanmo Corazza +2",hands="Herculean Gloves",ring1="Ilabrat Ring",ring2="Rajas ring",
				back="Atheling mantle",waist="Kentarch Belt",legs="Carmine Cuisses +1"}

	sets.RA = { range="Aureole" }

	--Weaponskill Sets--
	sets.WS = {}

	sets.Requiescat = {}
	sets.ChantDuCygne = {}

	sets.Requiescat.index = {'Attack','Accuracy'}
	sets.ChantDuCygne.index = {'Attack','Accuracy'}

	Requiescat_ind = 1
	ChantDuCygne_ind = 1

	sets.WS.ChantDuCygne = {ammo="Mantoptera Eye",
		head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Abnoba Kaftan",hands="Adhemar Wristbands +1",ring1="Hetairoi Ring",ring2="Epona's Ring",
		back="Rosmerta's Cape",waist="Fotia belt",legs="Samnuha Tights",feet="Thereoid Greaves"}

	sets.WS.Requiescat = { ammo="Ginsen",
		head="Jhakri Coronal +2",neck="Fotia Gorget",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Assim. Jubbah +3",hands="Jhakri Cuffs +2",ring1="Persis Ring",ring2="Omega Ring",
		back="Cornflower Cape",waist="Fotia Belt",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

	sets.WS.SanguineBlade = {ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",neck="Deviant Necklace",ear1="Hecate's Earring",ear2="Friomisi Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Strendu Ring",ring2="Shiva Ring +1",
		back="Toro Cape",waist="Yamabuki-no-Obi",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

	sets.WS.SavageBlade = { ammo="Mantoptera Eye",
		head="Jhakri Coronal +2", neck="Fotia Gorget",ear1="Bladeborn Earring",ear2="Steelflash Earring",
		body="Assim. Jubbah +3", hands="Jhakri Cuffs +2",ring1="Persis Ring",ring2="Apate Ring",
		back="Cornflower Cape",waist="Fotia belt", legs="Jhakri Slops +2", feet="Jhakri Pigaches +2"}

	sets.WS.VorpalBlade = {ammo="Mantoptera Eye",
		head="ayanmo zucchetto +2",neck="Fotia Gorget",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Abnoba Kaftan",hands="Jhakri Cuffs +2",ring1="Ramuh Ring +1",ring2="Ilabrat Ring",
		back="Rosmerta's Cape",waist="Fotia belt",legs="Carmine Cuisses +1",feet="Ayanmo Gambieras +2"}

	sets.WS.CircleBlade = {ammo="Mantoptera Eye",
		head="Jhakri Coronal +2",neck="Fotia Gorget",ear1="Hecate's Earring",ear2="Friomisi Earring",
		body="Jhakri Robe +2",hands="Regal Cuffs",ring1="Ilbrat Ring",ring2="Apate Ring",
		back="Toro Cape",waist="Fotia Belt",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

	sets.WS.Expiacion = sets.WS.Requiescat
	sets.WS.Realmrazer = sets.WS.Requiescat
	sets.WS.Blackhalo = sets.WS.Requiescat

	--Blue Magic Sets--
	sets.BlueMagic = {}

	sets.BlueMagic.STR = {ammo="Mantoptera eye",
		head="ayanmo zucchetto +2",ear1="Bladeborn earring",ear2="Dudgeon earring",
		body="Assim. Jubbah +3",ring1="Apate Ring",ring2="Ilabrat Ring",
		back="Cornflower cape"}

	sets.BlueMagic.STRDEX = {ammo="Mantoptera eye",
		head="Jhakri Coronal +2",ear1="Bladeborn earring",ear2="Dudgeon earring",
		body="Assim. Jubbah +3",ring1="Ramuh ring +1",ring2="Rajas ring",
		back="Cornflower cape"}

	sets.BlueMagic.DEX = {
		ear1="Bladeborn earring",ear2="Dudgeon earring",
		body="Assim. Jubbah +3",ring1="Ramuh ring +1",ring2="Rajas ring",
		back="Cornflower cape"
	}

	sets.BlueMagic.STRVIT = {ammo="Mantoptera eye",
		ear1="Bladeborn earring",ear2="Dudgeon earring",
		body="Assim. Jubbah +3",back="Cornflower cape"}

	-- INT 106+242, MAB 264 --
	sets.BlueMagic.INT = {ammo="Pemphredo Tathlum",
		head="Jhakri Coronal +2",neck="Stoicheion Medal",ear1="Strophadic Earring",ear2="Friomisi earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Shiva Ring",ring2="Shiva Ring +1",
		back="Cornflower cape",waist="Yamabuki-no-Obi",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

	sets.BlueMagic.Cures = {ammo="Mavi Tathlum",
		ear1="Lifestorm earring"
	}

	sets.BlueMagic.Stun = {ammo="Mavi Tathlum",
		ear1="Lifestorm earring",ear2="Psystorm earring",
		hands="Leyline gloves",	back="Cornflower cape"
	}

	sets.BlueMagic.MagicAccuracy = {ammo="Mavi Tathlum",
		ear1="Psystorm earring",ear2="Lifestorm earring",
		body="Jhakri Robe +2",hands="Leyline gloves",
		back="Cornflower cape"
	}

	sets.BlueMagic.Sleep = {ammo="Mavi tathlum",
		ear2="Loquac. earring",
		body="Assim. Jubbah +3",hands="Leyline gloves",
		back="Cornflower cape",waist="Witful Belt"
	}

	sets.BlueMagic.Skill = {ammo="Mavi tathlum",
		ear2="Loquac. earring",
		body="Assim. Jubbah +3",
		back="Cornflower cape",waist="Witful Belt"
	}

	sets.ElementalMagic = {}

	--Job Ability Sets for BLU--
	sets.JA = {}
	sets.JA.ChainAffinity = { feet="Assim. Charuqs +2" }
	sets.JA.BurstAffinity = { legs="Assim. Shalwar +2" }
	sets.JA.Efflux = {}
	sets.JA.AzureLore = {}
	sets.JA.Diffusion = {}

	--Job Ability Sets for sub DNC--
	sets.JA.Waltz = {  }

	--Precast Sets--
	sets.precast = {}

	sets.precast.FC = {}

	sets.precast.FC.Standard = {
		ammo="Sapience Orb",		-- 02%
		head="Herculean Helm",		-- 07%
		neck="Loricate Torque +1",
		ear1="Loquac. Earring", 	-- 02%
		ear2="Etiolation Earring",	-- 01%
		body="Samnuha Coat",		-- 03%
		hands="Leyline gloves",		-- 07%
		ring1="Prolix ring",		-- 02%
		ring2="Kishar Ring",		-- 04%
		back="Swith Cape",			-- 03%
		waist="Witful Belt",		-- 03%
		legs="Ayanmo Cosciales +2",	-- 05%
		feet="Tutyr Sabots"			-- 00%	"Carmine greaves +1"
	}

	sets.precast.FC.Blue = {
		ammo="Sapience Orb",		-- 02%
		head="Herculean Helm",		-- 07%
		neck="Loricate Torque +1",
		ear1="Loquac. Earring", 	-- 02%
		ear2="Etiolation Earring",	-- 01%
		body="Samnuha Coat",		-- 03%
		hands="Leyline gloves",		-- 07%
		ring1="Prolix ring",		-- 02%
		ring2="Kishar Ring",		-- 04%
		back="Swith Cape",			-- 03%
		waist="Witful Belt",		-- 03%
		legs="Ayanmo Cosciales +2",	-- 05%
		feet="Tutyr Sabots"			-- 00%	"Carmine greaves +1"
	}


	--RDM Subjob Sets--
	sets.RDM = {}

	sets.RDM.EnSpells = {
		neck="Colossus's torque",
		ear1="Andoaa Earring",
		hands="Ayanmo Manopolas +2",
		waist="Olympus Sash",
		legs="Carmine Cuisses +1"
	}

	sets.capacity_points = {back="Mecistopins Mantle"}
end

function precast(spell)
	if spell.action_type == 'Magic' then
		if spell.type == "BlueMagic" then
			equip(sets.precast.FC.Blue)
			send_command('@input /echo Blue Magic Precast Set')
		else
			equip(sets.precast.FC.Standard)
			send_command('@input /echo Precast Set')
		end
	end

	if spell.english == 'Azure Lore' then
		equip(sets.JA.AzureLore)
	elseif spell.english == 'Diffusion' then
		equip(sets.JA.Diffusion)
	end

	if spell.english == 'Lunge' or spell.english == 'Swipe' then
		equip(sets.BlueMagic.INT)
		send_command('@input /echo Lunge Set')
	end

	if spell.english == 'Requiescat' then
			equip(sets.WS.Requiescat)
			send_command('@input /echo Requiescat Set')
		elseif spell.english == 'Chant du Cygne' then
			equip(sets.WS.ChantDuCygne)
			send_command('@input /echo CDC Set')
		elseif spell.english == 'Circle Blade' then
			equip(sets.WS.CircleBlade)
		elseif spell.english == 'Sanguine Blade' then
			equip(sets.WS.SanguineBlade)
			send_command('@input /echo SB Set')
		elseif spell.english == 'Expiacion' then
			equip(sets.WS.Expiacion)
			send_command('@input /echo Expiacion Set')
		elseif spell.english == 'Savage Blade' then
			equip(sets.WS.SavageBlade)
			send_command('@input /echo Savage Set')
		elseif spell.english == 'Vorpal Blade' then
			equip(sets.WS.VorpalBlade)
			send_command('@input /echo Vorpal Set')
		elseif spell.english == 'Flash Nova' then
			equip(sets.BlueMagic.INT)
			send_command('@input /echo Flash Nova Set')
		elseif spell.english == 'Black Halo' then
			equip(sets.WS.Blackhalo)
			send_command('@input /echo Black Halo Set')
		elseif spell.english == 'Realmrazer' then
			equip(sets.WS.Realmrazer)
			send_command('@input /echo Realmrazer Set')
		elseif spell.english == 'Seraph Blade' or spell.english == 'Red Lotus Blade' then
			equip(sets.BlueMagic.INT)
			send_command('@input /echo Magic WS Set')
	end
end

function midcast(spell,act)

	if  STR_Spells:contains(spell.name) then
		send_command('@input /echo Blue STR Set')
		equip(sets.BlueMagic.STR)
		if buffactive['Chain Affinity'] then
			equip(sets.JA.ChainAffinity)
		end
		if buffactive['Efflux'] then
			equip(sets.JA.Efflux)
		end

	elseif 	STRDEX_Spells:contains(spell.name) then
		send_command('@input /echo Blue STRDEX Set')
		equip(sets.BlueMagic.STRDEX)
		if buffactive['Chain Affinity'] then
			equip(sets.JA.ChainAffinity)
		end
		if buffactive['Efflux'] then
			equip(sets.JA.Efflux)
		end

	elseif 	DEX_Spells:contains(spell.name) then
		send_command('@input /echo Blue DEX Set')
		equip(sets.BlueMagic.DEX)
		if buffactive['Chain Affinity'] then
			equip(sets.JA.ChainAffinity)
		end
		if buffactive['Efflux'] then
			equip(sets.JA.Efflux)
		end

	elseif STRVIT_Spells:contains(spell.name) then
		send_command('@input /echo Blue STRVIT Set')
		equip(sets.BlueMagic.STRVIT)
		if buffactive['Chain Affinity'] then
			equip(sets.JA.ChainAffinity)
		end
		if buffactive['Efflux'] then
			equip(sets.JA.Efflux)
		end

	elseif INT_Spells:contains(spell.name) then
		send_command('@input /echo Blue INT Set')
		equip(sets.BlueMagic.INT)
			if spell.name == "Dark Orb" or spell.name == "Evryone. Grudge" or spell.name == "Tenebral Crush" or spell.name == "Eyes on Me" then
				equip({head="Pixie hairpin +1",ring1="Archon ring"})
			end
			if buffactive['Burst Affinity'] then
				equip(sets.JA.BurstAffinity)
			end
			if Light_Nukes:contains(spell.name) then
				equip({ring2="Weatherspoon ring"})
			end

	elseif Cure_Spells:contains(spell.name) then
		if spell.target.type == "SELF" then
			equip( set_combine(sets.BlueMagic.Cures,{"Gishdubar Sash"}) )
			send_command('@input /echo Blue SELF Cure Set')
		else
			equip(sets.BlueMagic.Cures)
			send_command('@input /echo Blue Cure Set')
		end

	elseif Stun_Spells:contains(spell.name)  then
		send_command('@input /echo Blue Stun Set')
		equip(sets.BlueMagic.Stun)
	elseif Enfeebling_Spells:contains(spell.name) then
		send_command('@input /echo Blue Magic Acc Set')
		equip(sets.BlueMagic.MagicAccuracy)

	elseif spell.english == 'Dream Flower' or spell.english == 'Sheep Song' or spell.english == 'Frightful Roar' then
		equip(sets.BlueMagic.Sleep)

	elseif Buff_Spells:contains(spell.name) then
		equip(sets.BlueMagic.Skill)
		send_command('@input /echo Blue Skill Set')
		if spell.name == 'Battery Charge' then
			equip({head="Amalric coif"})
		end
		if buffactive['Diffusion'] then
			equip(sets.JA.Diffusion)
		end

	elseif RDM_EnSpells:contains(spell.name) then
		equip(sets.RDM.EnSpells)
	end

	if spell.skill == 'Elemental Magic' then
		send_command('@input /echo Blue Elemental Set')
		equip(sets.ElementalMagic)
	elseif spell.skill == 'Healing Magic' then
		equip(sets.BlueMagic.Cures)
		send_command('@input /echo Blue Cure W Set')
	end

end

function aftercast(spell)
	if player.status == 'Engaged' then
		equip(sets.TP[sets.TP.index[TP_ind]])
	else
		if Gear_Debug == 0 then
			equip(sets.Idle.Standard)
			send_command('@input /echo Idle Set')
		else
			equip(sets.Idle[sets.Idle.index[Idle_ind]])
		end
	end
end

function status_change(new,old)
	if new == 'Engaged' then
		equip(sets.TP[sets.TP.index[TP_ind]])
	else
		equip(sets.Idle[sets.Idle.index[Idle_ind]])
	end
end

function self_command(command)
	if command == 'toggle TP set' then
		TP_ind = TP_ind +1
		if TP_ind > #sets.TP.index then TP_ind = 1 end
		send_command('@input /echo <----- TP Set changed to '..sets.TP.index[TP_ind]..' ----->')
		equip(sets.TP[sets.TP.index[TP_ind]])
	elseif command == 'toggle Idle set' then
		Idle_ind = Idle_ind +1
		if Idle_ind > #sets.Idle.index then Idle_ind = 1 end
		send_command('@input /echo <----- Idle Set changed to '..sets.Idle.index[Idle_ind]..' ----->')
		equip(sets.Idle[sets.Idle.index[Idle_ind]])
	elseif command == 'toggle Req set' then
		Requiescat_ind = Requiescat_ind +1
		if Requiescat_ind > #sets.Requiescat.index then Requiescat_ind = 1 end
		send_command('@input /echo <----- Requiescat Set changed to '..sets.Requiescat.index[Requiescat_ind]..' ----->')
	elseif command == 'toggle CDC set' then
		ChantDuCygne_ind = ChantDuCygne_ind +1
		if ChantDuCygne_ind > #sets.ChantDuCygne.index then ChantDuCygne_ind = 1 end
		send_command('@input /echo <----- Chant du Cygne Set changed to '..sets.ChantDuCygne.index[ChantDuCygne_ind]..' ----->')
	elseif command == 'equip TP set' then
		TP_ind = 1
		TP_ind2 = 1
		equip(sets.TP[sets.TP.index[TP_ind2]])
		send_command('@input /echo Changed to Standard mode')
	elseif command == 'equip Idle set' then
		TP_ind = 1
		TP_ind2 = 1
		equip(sets.Idle.Standard)
		send_command('@input /echo Changed to Idle')
	elseif command == 'equip Acc-Lite set' then
		TP_ind = 4
		TP_ind2 = 4
		equip(sets.TP[sets.TP.index[TP_ind2]])
		send_command('@input /echo Changed to Acc-Lite mode')
	elseif command == 'equip Acc-Full set' then
		TP_ind = 5
		TP_ind2 = 5
		equip(sets.TP[sets.TP.index[TP_ind2]])
		send_command('@input /echo Changed to Acc-Full mode')
	elseif command == 'equip DT set' then
		TP_ind = 6
		equip(sets.TP[sets.TP.index[TP_ind]])
		send_command('@input /echo Changed to DT mode')
	elseif command == 'equip set' then
		equip(sets.TP[sets.TP.index[TP_ind2]])
		send_command('@input /echo Current Set '..sets.TP.index[TP_ind2]..' Equiped')
	elseif command == 'enable CP mode' then
		CP_Mode = 1
		equip({back="Mercistopins mantle"})
		send_command('@input CP Mode enabled')
	elseif command == 'change debug mode' then
		if Gear_Debug == 1 then
			Gear_Debug = 0
			send_command('@input /echo Debug Mode Set to 0')
		else
			Gear_Debug = 1
			send_command('@input /echo Debug Mode Set to 1')
		end
	end
end

function buff_change(buff,gain)
 buff = string.lower(buff)
 if buff == "aftermath: lv.3" then -- AM3 Timer/Countdown --
  if gain then
   send_command('timers create "Aftermath: Lv.3" 180 down;wait 120;input /echo Aftermath: Lv.3 [WEARING OFF IN 60 SEC.];wait 30;input /echo Aftermath: Lv.3 [WEARING OFF IN 30 SEC.];wait 20;input /echo Aftermath: Lv.3 [WEARING OFF IN 10 SEC.]')
  else
   send_command('timers delete "Aftermath: Lv.3"')
   add_to_chat(123,'AM3: [OFF]')
  end
 end
end

function weathercheck(spell_element)
	if spell_element == world.weather_element or spell_element == world.day_element then
		equip({waist="Hachirin-no-Obi"})
		send_command('@input /echo Using Element Obi')
	else
		equip({waist="Anguinus Belt"})
	end
end

windower.register_event('zone change', function()
    equip(sets.Idle.Standard)
end)

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'RDM' then
        set_macro_page(1, 16)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 16)
    else
        set_macro_page(1, 16)
    end
end

function set_macro_page(set,book)
        if not tonumber(set) then
                add_to_chat(123,'Error setting macro page: Set is not a valid number ('..tostring(set)..').')
                return
        end
        if set < 1 or set > 10 then
                add_to_chat(123,'Error setting macro page: Macro set ('..tostring(set)..') must be between 1 and 10.')
                return
        end

        if book then
                if not tonumber(book) then
                        add_to_chat(123,'Error setting macro page: book is not a valid number ('..tostring(book)..').')
                        return
                end
                if book < 1 or book > 20 then
                        add_to_chat(123,'Error setting macro page: Macro book ('..tostring(book)..') must be between 1 and 20.')
                        return
                end
                send_command('@input /macro book '..tostring(book)..';wait .1;input /macro set '..tostring(set))
        else
                send_command('@input /macro set '..tostring(set))
        end
end
