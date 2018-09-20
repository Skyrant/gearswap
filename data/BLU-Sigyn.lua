--TP set toggle input: //gs c toggle TP set----1 Standard, 2 Solo, 3 Marches, 4 AccuracyLite, 5 AccuracyMax, 6 DT, 7 DTAccuracy--
--Idle set toggle input: //gs c toggle Idle set----1 Standard, 2 DT--
--Requiescat set toggle input: //gs c toggle Req set----1 Attack, 2 Accuracy--
--Chant du Cygne set toggle input: //gs c toggle CDC set----1 Attack, 2 Accuracy--

INT_Spells = S{"Foul Waters","Rending Deluge","Droning Whirlwind","Subduction","Embalming Earth","Tem. Upheaval","Thunderbolt","Dark Orb",
				"Water Bomb","Evryone. Grudge","Magic Hammer","Thermal Pulse","Corrosive Ooze","Regurgitation","Firespit",
				"Leafstorm","Gates of Hades","Retinal Glare","Blastbomb","Blazing Bound","Diffusion Ray","Rail Cannon","Foul Waters","Polar Roar",
				"Molting Plumage","Cursed Sphere","Crashing Thunder","Nectarous Deluge","Charged Whisker","Bomb toss","Tenebral Crush",
				"Spectral Floe","Blinding Fulgor","Scouring Spate","Anvil Lightning","Entomb","Silent Storm","Searing Tempest","Palling Salvo"}
Light_Nukes = S{"Blinding Fulgor","Retinal Glare","Diffusion Ray","Rail Cannon","Magic Hammer"}
				
STR_Spells = S{"Vertical Cleave","Empty Thrash","Quadrastrike","Bloodrake","Heavy Strike","Whirl of Rage","Hydro Shot"}
DEX_Spells = S{"Vanity Dive"}
STRDEX_Spells = S{"Disseverment","Frenetic Rip","Goblin Rush","Paralyzing Triad","Thrashing Assault"}
STRVIT_Spells = S{"Quad. Continuum","Delta Thrust","Cannonball","Glutinous Dart","Sinker Drill"}
Buff_Spells = S{"Cocoon","Harden Shell","Battery Charge","Nat. Meditation","Carcharian Verve","Barrier Tusk","Saline Coat","Regeneration",
"Occultation","Magic Barrier","Diamondhide","Erratic Flutter","Mighty Guard"}
Stun_Spells = S{"Head Butt","Sudden Lunge","Bilgestorm","Benthic Typhoon","Tourbillion","Sweeping Gouge","Seedspray"}
Enfeebling_Spells = S{"Sandspray","Geist Wall","Dream Flower","Sheep Song","Frightful Roar","Blitzstrahl","Acrid Stream","Osmosis","Sound Blast",
"Cruel Joke","Absolute Terror","Blank Gaze"}
Cure_Spells = S{"Magic Fruit","Pollen","Restoral","Plenilune Embrace","Wild Carrot","Healing Breeze","White Wind",
"Sandstorm","Rainstorm","Windstorm","Firestorm","Hailstorm","Thunderstorm","Voidstorm","Aurorastorm"}
Enhancing_Spells = S{"Blink","Stoneskin","Aquaveil","Phalanx","Haste","Regen","Refresh","Ice Spikes"}

function get_sets()
	Gear_Debug = 0
	--Idle Sets--	
	sets.Idle = {}
	
	sets.Idle.index = {'Standard','DT'}
	Idle_ind = 1			
	
	sets.Idle.Standard = {
	ammo="Ginsen",
    head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
    body="Jhakri Robe +1",
    hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
    legs="Carmine Cuisses +1",
    feet={ name="Herculean Boots", augments={'Attack+9','"Triple Atk."+4','DEX+9','Accuracy+15',}},
    neck="Loricate Torque +1",
    waist="Kentarch Belt +1",
    left_ear="Steelflash Earring",
    right_ear="Infused Earring",
    left_ring="Sheltered Ring",
    right_ring="Karieyh Ring",
    back="Cheviot Cape",
}
						  
	--sets.Idle.DT = {}
							
							
							
	
	
	--TP Sets--
	sets.TP = {}

	sets.TP.index = {'Standard', 'Solo', 'Marches', 'AccuracyLite', 'AccuracyFull', 'DT', 'DTAccuracy'}
	--1=Standard, 2=Solo, 3=Marches, 4=AccuracyLite, 5=AccuracyFull, 6=DT, 7=DTAccuracy--
	TP_ind = 1
	TP_ind2 = 1
	CP_Mode = 0
	
	sets.TP.Standard = {
	ammo="Ginsen",
    head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
    body={ name="Herculean Vest", augments={'Accuracy+24 Attack+24','"Triple Atk."+1','DEX+6','Accuracy+6','Attack+12',}},
    hands={ name="Herculean Gloves", augments={'Accuracy+21 Attack+21','Crit.hit rate+3','AGI+5','Accuracy+15','Attack+5',}},
    legs={ name="Samnuha Tights", augments={'STR+9','DEX+8','"Dbl.Atk."+2','"Triple Atk."+2',}},
    feet={ name="Herculean Boots", augments={'Attack+9','"Triple Atk."+4','DEX+9','Accuracy+15',}},
    neck="Asperity Necklace",
    waist="Kentarch Belt +1",
    left_ear="Steelflash Earring",
    right_ear="Cessance Earring",
    left_ring="Petrov Ring",
    right_ring="Epona's Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
}
						
	sets.TP.Marches = sets.TP.Standard
					   		
	sets.TP.Solo = sets.TP.Standard
					
	sets.TP.AccuracyLite = {
	ammo="Honed Tathlum",
    head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
    body={ name="Adhemar Jacket", augments={'STR+10','DEX+10','Attack+15',}},
    hands={ name="Herculean Gloves", augments={'Accuracy+21 Attack+21','Crit.hit rate+3','AGI+5','Accuracy+15','Attack+5',}},
    legs={ name="Samnuha Tights", augments={'STR+9','DEX+8','"Dbl.Atk."+2','"Triple Atk."+2',}},
    feet={ name="Herculean Boots", augments={'Attack+9','"Triple Atk."+4','DEX+9','Accuracy+15',}},
    neck="Sanctity Necklace",
    waist="Kentarch Belt +1",
    left_ear="Steelflash Earring",
    right_ear="Cessance Earring",
    left_ring="Petrov Ring",
    right_ring="Epona's Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
}
	
	sets.TP.AccuracyFull = {
	ammo="Falcon Eye",
    head={ name="Dampening Tam", augments={'DEX+7','Accuracy+12','Mag. Acc.+2','Quadruple Attack +1',}},
    body={ name="Herculean Vest", augments={'Accuracy+24 Attack+24','"Triple Atk."+1','DEX+6','Accuracy+6','Attack+12',}},
    hands={ name="Herculean Gloves", augments={'Accuracy+21 Attack+21','Crit.hit rate+3','AGI+5','Accuracy+15','Attack+5',}},
    legs="Carmine Cuisses +1",
    feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Crit.hit rate+3','STR+9','Accuracy+15',}},
    neck="Subtlety Spec.",
    waist="Kentarch Belt +1",
    left_ear="Dignitary's earring",
    right_ear="Zennaroi earring",
    left_ring="Cacoethic Ring",
    right_ring="Cacoethic Ring +1",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','Crit.hit rate+10',}},
}
							
	sets.TP.DT = {
	ammo="Honed Tathlum",
    head={ name="Dampening Tam", augments={'DEX+7','Accuracy+12','Mag. Acc.+2','Quadruple Attack +1',}},
    body="Emet Harness +1",
    hands={ name="Herculean Gloves", augments={'Accuracy+21 Attack+21','Crit.hit rate+3','AGI+5','Accuracy+15','Attack+5',}},
    legs={ name="Samnuha Tights", augments={'STR+9','DEX+8','"Dbl.Atk."+2','"Triple Atk."+2',}},
    feet={ name="Herculean Boots", augments={'Attack+9','"Triple Atk."+4','DEX+9','Accuracy+15',}},
    neck="Loricate Torque +1",
    waist="Kentarch Belt +1",
    left_ear="Zennaroi Earring",
    right_ear="Cessance Earring",
    left_ring="Cacoethic Ring",
    right_ring="Cacoethic Ring +1",
    back="Cheviot Cape",
}
				  
	sets.TP.DTAccuracy = {
	ammo="Honed Tathlum",
    head={ name="Dampening Tam", augments={'DEX+7','Accuracy+12','Mag. Acc.+2','Quadruple Attack +1',}},
    body="Emet Harness +1",
    hands={ name="Herculean Gloves", augments={'Accuracy+21 Attack+21','Crit.hit rate+3','AGI+5','Accuracy+15','Attack+5',}},
    legs={ name="Samnuha Tights", augments={'STR+9','DEX+8','"Dbl.Atk."+2','"Triple Atk."+2',}},
    feet={ name="Herculean Boots", augments={'Attack+9','"Triple Atk."+4','DEX+9','Accuracy+15',}},
    neck="Loricate Torque +1",
    waist="Kentarch Belt +1",
    left_ear="Zennaroi Earring",
    right_ear="Cessance Earring",
    left_ring="Cacoethic Ring",
    right_ring="Cacoethic Ring +1",
    back="Cheviot Cape",
}
			  
	sets.holywater = {ring1="Purity Ring",ring2="Blenmot's Ring"}
	
	
	
	
	
	
	--Weaponskill Sets--
	sets.WS = {ammo="Falcon Eye",
    head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
    body="Abnoba Kaftan",
    hands={ name="Herculean Gloves", augments={'Accuracy+21 Attack+21','Crit.hit rate+3','AGI+5','Accuracy+15','Attack+5',}},
    legs={ name="Herculean Trousers", augments={'Accuracy+21','"Triple Atk."+1','DEX+12',}},
    feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Crit.hit rate+3','STR+9','Accuracy+15',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Mache Earring",
    right_ear="Cessance Earring",
    left_ring="Rufescent Ring",
    right_ring="Epona's Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}}}
	
	sets.Requiescat = {}
	
	sets.Requiescat.index = {'Attack','Accuracy'}
	Requiescat_ind = 1
	
	--sets.WS.Requiescat = {}
				  
	--sets.WS.Realmrazer = {ammo="Ginsen",
			          --head="Despair helm",neck="Fotia gorget",ear1="Lifestorm earring",ear2="Moonshade earring",
			 	  --body="Adhemar jacket",hands="Adhemar wristbands",ring1="Leviathan ring",ring2="Rufescent Ring",
			   	  --back="Bleating mantle",waist="Fotia belt",legs="Samnuha tights",feet="Adhemar gamashes"}
	--sets.WS.Blackhalo = {ammo="Ginsen",
			          --head="Despair helm",neck="Caro necklace",ear1="Lifestorm earring",ear2="Moonshade earring",
			 	  --body="Adhemar jacket",hands="Adhemar wristbands",ring1="Leviathan ring",ring2="Rufescent Ring",
			   	  --back="Bleating mantle",waist="Prosilio belt +1",legs="Samnuha tights",feet="Despair greaves"}			  
					  
	--sets.WS.SavageBlade = {
	--ammo="Ginsen",
    --head={ name="Carmine Mask", augments={'Accuracy+10','DEX+10','MND+15',}},
    --body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    --hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
    --legs={ name="Carmine Cuisses +1", augments={'Accuracy+12','DEX+12','MND+20',}},
    --feet={ name="Carmine Greaves", augments={'Accuracy+10','DEX+10','MND+15',}},
    --neck="Fotia Gorget",
    --waist="Fotia Belt",
    --left_ear="Ishvara Earring",
    --right_ear="Cessance Earring",
    --left_ring="Shukuyu Ring",
    --right_ring="Apate Ring",
    --back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},}
				  
	--sets.WS.VorpalBlade = {
	--ammo="Mantoptera Eye",
    --head={ name="Carmine Mask", augments={'Accuracy+10','DEX+10','MND+15',}},
    --body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    --hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
    --legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    --feet="Thereoid Greaves",
    --neck="Fotia Gorget",
    --waist="Fotia Belt",
    --left_ear="Brutal Earring",
    --right_ear="Cessance Earring",
    --left_ring="Epona's Ring",
    --right_ring="Apate Ring",
    --back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},} 
	
	--sets.WS.Expiacion = {
	--ammo="Mantoptera Eye",
    --head={ name="Carmine Mask", augments={'Accuracy+10','DEX+10','MND+15',}},
    --body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    --hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
    --legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    --feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','STR+8','Accuracy+6','Attack+13',}},
    --neck="Fotia Gorget",
    --waist="Fotia Belt",
    --left_ear="Ishvara Earring",
    --right_ear="Cessance Earring",
    --left_ring="Epona's Ring",
    --right_ring="Apate Ring",
    --back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},}
	
	sets.ChantDuCygne = {}
	
	sets.ChantDuCygne.index = {'Attack','Accuracy'}
	ChantDuCygne_ind = 1						 
		
	sets.WS.ChantDuCygne = {
	ammo="Jukukik Feather",
    head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
    body="Abnoba Kaftan",
    hands={ name="Herculean Gloves", augments={'Accuracy+21 Attack+21','Crit.hit rate+3','AGI+5','Accuracy+15','Attack+5',}},
    legs={ name="Herculean Trousers", augments={'Accuracy+21','"Triple Atk."+1','DEX+12',}},
    feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Crit.hit rate+3','STR+9','Accuracy+15',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Mache Earring",
    right_ear="Cessance Earring",
    left_ring="Hetairoi Ring",
    right_ring="Begrudging ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}}}
	
	sets.WS.CDCAcc = {
	ammo="Honed Tathlum",
    head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
    body="Abnoba Kaftan",
    hands={ name="Herculean Gloves", augments={'Accuracy+21 Attack+21','Crit.hit rate+3','AGI+5','Accuracy+15','Attack+5',}},
    legs={ name="Herculean Trousers", augments={'Accuracy+21','"Triple Atk."+1','DEX+12',}},
    feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Crit.hit rate+3','STR+9','Accuracy+15',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Mache Earring",
    right_ear="Cessance Earring",
    left_ring="Rufescent Ring",
    right_ring="Begrudging Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}}}
			
	--sets.WS.SanguineBlade = {
	--ammo="Pemphredo Tathlum",
    --head="Pixie Hairpin +1",
    --body="Vedic Coat",
    --hands={ name="Amalric Gages", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
    --legs={ name="Amalric Slops", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
    --feet="Hashi. Basmak +1",
    --neck="Sanctity Necklace",
    --waist="Yamabuki-no-Obi",
    --left_ear="Novio Earring",
    --right_ear="Friomisi Earring",
    --left_ring="Shiva Ring +1",
    --right_ring="Shiva Ring +1",
    --back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},}
				
	--sets.WS.CircleBlade = {
	--ammo="Ginsen",
    --head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
    --body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    --hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
    --legs={ name="Herculean Trousers", augments={'Accuracy+25 Attack+25','"Store TP"+4','STR+10','Accuracy+11',}},
    --feet={ name="Herculean Boots", augments={'Accuracy+20 Attack+20','STR+8','Accuracy+6','Attack+13',}},
    --neck="Fotia Gorget",
    --waist="Fotia Belt",
    --left_ear="Ishvara Earring",
    --right_ear="Cessance Earring",
    --left_ring="Shukuyu Ring",
    --right_ring="Ifrit Ring",
    --back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},}
												
	--Blue Magic Sets--
	sets.BlueMagic = {}
	
	sets.BlueMagic.STR = {
	ammo="Mavi Tathlum",
    head="Jhakri Coronal +1",
    body={ name="Adhemar Jacket", augments={'STR+10','DEX+10','Attack+15',}},
    hands={ name="Herculean Gloves", augments={'Accuracy+21 Attack+21','Crit.hit rate+3','AGI+5','Accuracy+15','Attack+5',}},
    legs={ name="Herculean Trousers", augments={'Accuracy+17 Attack+17','"Triple Atk."+1','STR+12',}},
    feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Crit.hit rate+3','STR+9','Accuracy+15',}},
    neck="Caro Necklace",
    waist="Sarissapho. Belt",
    left_ear="Mache Earring",
    right_ear="Cessance Earring",
    left_ring="Rufescent Ring",
    right_ring="Ifrit Ring",
    back={ name="Cornflower Cape", augments={'MP+15','DEX+3','Accuracy+6','Blue Magic skill +10',}},
}
						  
	sets.BlueMagic.STRDEX = {
	ammo="Jukukik Feather",
    head="Jhakri Coronal +1",
    body={ name="Adhemar Jacket", augments={'STR+10','DEX+10','Attack+15',}},
    hands={ name="Herculean Gloves", augments={'Accuracy+21 Attack+21','Crit.hit rate+3','AGI+5','Accuracy+15','Attack+5',}},
    legs={ name="Herculean Trousers", augments={'Accuracy+17 Attack+17','"Triple Atk."+1','STR+12',}},
    feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Crit.hit rate+3','STR+9','Accuracy+15',}},
    neck="Caro Necklace",
    waist="Sarissapho. Belt",
    left_ear="Mache Earring",
    right_ear="Cessance Earring",
    left_ring="Rufescent Ring",
    right_ring="Ifrit Ring",
    back={ name="Cornflower Cape", augments={'MP+15','DEX+3','Accuracy+6','Blue Magic skill +10',}},
}
				 
	sets.BlueMagic.DEX = {
	ammo="Jukukik Feather",
    head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
    body={ name="Adhemar Jacket", augments={'STR+10','DEX+10','Attack+15',}},
    hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
    legs={ name="Herculean Trousers", augments={'Accuracy+21','"Triple Atk."+1','DEX+12',}},
    feet={ name="Herculean Boots", augments={'Attack+9','"Triple Atk."+4','DEX+9','Accuracy+15',}},
    neck="Caro Necklace",
    waist="Sarissapho. Belt",
    left_ear="Mache Earring",
    right_ear="Cessance Earring",
    left_ring="Petrov Ring",
    right_ring="Ramuh Ring",
    back={ name="Cornflower Cape", augments={'MP+15','DEX+3','Accuracy+6','Blue Magic skill +10',}}}
							
	sets.BlueMagic.STRVIT = {
	ammo="Mavi Tathlum",
    head="Jhakri Coronal +1",
    body={ name="Adhemar Jacket", augments={'STR+10','DEX+10','Attack+15',}},
    hands={ name="Herculean Gloves", augments={'Accuracy+21 Attack+21','Crit.hit rate+3','AGI+5','Accuracy+15','Attack+5',}},
    legs={ name="Herculean Trousers", augments={'Accuracy+17 Attack+17','"Triple Atk."+1','STR+12',}},
    feet={ name="Herculean Boots", augments={'Accuracy+19 Attack+19','Crit.hit rate+3','STR+9','Accuracy+15',}},
    neck="Caro Necklace",
    waist="Sarissapho. Belt",
    left_ear="Mache Earring",
    right_ear="Cessance Earring",
    left_ring="Rufescent Ring",
    right_ring="Ifrit Ring",
    back={ name="Cornflower Cape", augments={'MP+15','DEX+3','Accuracy+6','Blue Magic skill +10',}},
}															
	
						  
	sets.BlueMagic.INT = {
	ammo="Pemphredo Tathlum",
	head="Jhakri Coronal +1",
    --head={ name="Amalric Coif", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
    body="Jhakri Robe +1",
	--body="Vedic Coat",
    hands="Jhakri Cuffs +1",
	--hands={ name="Amalric Gages", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
    legs="Jhakri Slops +1",
	--legs={ name="Amalric Slops", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
    feet="Jhakri Pigaches +1",
	--feet={ name="Amalric Nails", augments={'Mag. Acc.+15','"Mag.Atk.Bns."+15','"Conserve MP"+6',}},
    neck="Sanctity Necklace",
    waist="Yamabuki-no-Obi",
    left_ear="Strophadic Earring",
    right_ear="Friomisi Earring",
    left_ring="Shiva Ring",
    right_ring="Sangoma Ring",
    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}
						  
	sets.BlueMagic.Cures = {
	ammo="Mavi Tathlum",
    head={ name="Dampening Tam", augments={'DEX+7','Accuracy+12','Mag. Acc.+2','Quadruple Attack +1',}},
    body="Telchine Chas.",
    hands="Telchine Gloves",
    legs={ name="Lengo Pants", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Refresh"+1',}},
    feet="Medium's Sabots",
    neck="Sanctity Necklace",
    waist="Famine Sash",
    left_ear="Lifestorm Earring",
    right_ear="Mendi. Earring",
    left_ring="Rufescent Ring",
    right_ring="Perception Ring",
    back={ name="Cornflower Cape", augments={'MP+15','DEX+3','Accuracy+6','Blue Magic skill +10',}}}
							
	--sets.BlueMagic.Stun = {}					   						   
	
									 
	sets.BlueMagic.MagicAccuracy = {
	ammo="Pemphredo Tathlum",
    head="Jhakri Coronal +1",
    body={ name="Amalric Doublet", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs={ name="Lengo Pants", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Refresh"+1',}},
    feet={ name="Helios Boots", augments={'Mag. Acc.+11','Magic crit. hit rate +7','Mag. crit. hit dmg. +4%',}},
    neck="Sanctity Necklace",
    waist="Famine Sash",
    left_ear="Psystorm Earring",
    right_ear="Lifestorm Earring",
    left_ring="Sangoma Ring",
    right_ring="Perception Ring",
    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}}}
						
	sets.BlueMagic.Sleep = {
	ammo="Pemphredo Tathlum",
    head={ name="Dampening Tam", augments={'DEX+7','Accuracy+12','Mag. Acc.+2','Quadruple Attack +1',}},
    body={ name="Amalric Doublet", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs={ name="Lengo Pants", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Refresh"+1',}},
    feet={ name="Helios Boots", augments={'Mag. Acc.+11','Magic crit. hit rate +7','Mag. crit. hit dmg. +4%',}},
    neck="Sanctity Necklace",
    waist="Famine Sash",
    left_ear="Psystorm Earring",
    right_ear="Lifestorm Earring",
    left_ring="Sangoma Ring",
    right_ring="Perception Ring",
    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}}}
									 
	sets.BlueMagic.Skill = {
	ammo="Mavi Tathlum",
    head="Luhlaza Keffiyeh +1",
    body="Assimilator's Jubbah +2",
    hands="Rawhide Gloves",
    legs="Hashishin tayt +1",
    feet="Luhlaza Charuqs +1",
    neck="Incanter's Torque",
    waist="Famine Sash",
    left_ear="Psystorm Earring",
    right_ear="Lifestorm Earring",
    left_ring="Sangoma Ring",
    right_ring="Perception Ring",
    back={ name="Cornflower Cape", augments={'MP+15','DEX+3','Accuracy+6','Blue Magic skill +10',}}} 						  
								  
	sets.ElementalMagic = {
	ammo="Pemphredo Tathlum",
    head={ name="Dampening Tam", augments={'DEX+7','Accuracy+12','Mag. Acc.+2','Quadruple Attack +1',}},
    body={ name="Amalric Doublet", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
    hands={ name="Amalric Gages", augments={'MP+60','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
    legs={ name="Lengo Pants", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Refresh"+1',}},
    feet={ name="Helios Boots", augments={'Mag. Acc.+11','Magic crit. hit rate +7','Mag. crit. hit dmg. +4%',}},
    neck="Sanctity Necklace",
    waist="Famine Sash",
    left_ear="Strophadic Earring",
    right_ear="Friomisi Earring",
    left_ring="Strendu Ring",
    right_ring="Shiva Ring",
    back={ name="Rosmerta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}}}	
	
	--sets.EnhancingMagic = {
	--ammo="Mavi Tathlum",
    --head={ name="Telchine Cap", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
    --body={ name="Telchine Chas.", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +9',}},
    --hands={ name="Telchine Gloves", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +9',}},
    --legs={ name="Telchine Braconi", augments={'"Cure" potency +6%','Enh. Mag. eff. dur. +9',}},
    --feet={ name="Telchine Pigaches", augments={'"Cure" potency +5%','Enh. Mag. eff. dur. +10',}},
    --neck="Sanctity Necklace",
    --waist="Gishdubar Sash",
    --left_ear="Lifestorm Earring",
    --right_ear="Psystorm Earring",
    --left_ring="Shiva Ring +1",
    --right_ring="Sirona's Ring",
    --back={ name="Cornflower Cape", augments={'MP+18','DEX+3','Blue Magic skill +9',}},}						  
	
	
	--Job Ability Sets--
	
	sets.JA = {}
	
	sets.JA = {}
	
	sets.JA.ChainAffinity = {
	back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
	}
	
	--sets.JA.BurstAffinity = {legs="Assimilator's shalwar +1",feet="Hashishin basmak +1"}
	
	sets.JA.Efflux = {legs="Hashishin tayt +1",back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
	}
	
	--sets.JA.AzureLore = {hands="Luhlaza bazubands"}
	
	sets.JA.Diffusion = {feet="Luhlaza Charuqs +1"}
								
								
			
			
			
			
	--Precast Sets--
	sets.precast = {}
	
	sets.precast.FC = {}
	
	sets.precast.FC.Standard = {
	 ammo="Sapience Orb",
    head="Herculean Helm",
    body={ name="Luhlaza Jubbah +1", augments={'Enhances "Enchainment" effect',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs="Psycloth Lappas",
    feet="Carmine Greaves",
    neck="Orunmila's Torque",
    waist="Witful Belt",
    left_ear="Enchanter earring +1",
    right_ear="Loquac. Earring",
    left_ring="Prolix Ring",
    right_ring="Rahab Ring",
    back={ name="Rosmerta's Cape", augments={'"Fast Cast"+10',}}}

	
	sets.precast.FC.Blue = {
	ammo="Sapience Orb",
    head="Jhakri Coronal +1",
    body="Hashishin mintan +1",
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs="Psycloth Lappas",
    feet="Carmine Greaves",
    neck="Orunmila's Torque",
    waist="Witful Belt",
    left_ear="Enchanter earring +1",
    right_ear="Loquac. Earring",
    left_ring="Prolix Ring",
    right_ring="Perception Ring",
    back={ name="Rosmerta's Cape", augments={'"Fast Cast"+10',}}}
	
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
	elseif spell.name == 'Holy Water' then
		equip(sets.holywater)
		send_command('@input /echo Holy Water Set')
	else
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
			equip({ring1="Weatherspoon ring"})
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
			if spell.name == "Dark Orb" or spell.name == "Evryone. Grudge" or spell.name == "Tenebral Crush" or spell.name == "Eyes on Me" or spell.name == "Palling Salvo" then
				equip({head="Pixie hairpin +1",ring1="Archon ring"})				
			end			
			if buffactive['Burst Affinity'] then
				equip(sets.JA.BurstAffinity)		
			end
			if Light_Nukes:contains(spell.name) then
				equip({ring2="Weatherspoon ring"})				
			end
		weathercheck(spell.element)
	elseif Cure_Spells:contains(spell.name) then
		equip(sets.BlueMagic.Cures)
		weathercheck(spell.element)
		send_command('@input /echo Blue Cure Set')
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
			equip({head="Amalric coif",waist="Gishdubar sash"})
	elseif Enhancing_Spells:contains(spell.name) then
		equip(sets.EnhancingMagic)
		send_command('@input /echo Enhancing Magic Set')			
		end		
		if buffactive['Diffusion'] then
			equip(sets.JA.Diffusion)
		end			
	end
	if spell.skill == 'Elemental Magic' then
		send_command('@input /echo Elemental Magic Set')
		equip(sets.ElementalMagic)
		weathercheck(spell.element)
	elseif spell.skill == 'Healing Magic' then
		equip(sets.BlueMagic.Cures)	
		send_command('@input /echo Blue Cure W Set')
		weathercheck(spell.element)
	elseif spell.skill == 'Enhancing Magic' then
		equip(sets.EnhancingMagic)	
		send_command('@input /echo Enhancing Set')
	end
	
end

function aftercast(spell)
	if player.status == 'Engaged' then
		equip(sets.TP[sets.TP.index[TP_ind2]])
	else
		if Gear_Debug == 0 then
			equip(sets.Idle.Standard)
			send_command('@input /echo Idle Set')
		else
		end
	end
end

function status_change(new,old)
	if new == 'Engaged' then
		equip(sets.TP[sets.TP.index[TP_ind2]])
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
		equip(sets.Requiescat[sets.Requiescat.index[Requiescat_ind]])
	elseif command == 'toggle CDC set' then
		ChantDuCygne_ind = ChantDuCygne_ind +1
		if ChantDuCygne_ind > #sets.ChantDuCygne.index then ChantDuCygne_ind = 1 end
		send_command('@input /echo <----- Chant du Cygne Set changed to '..sets.ChantDuCygne.index[ChantDuCygne_ind]..' ----->')
		equip(sets.ChantDuCygne[sets.ChantDuCygne.index[ChantDuCygne_ind]])
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