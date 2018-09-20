-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff.Migawari = buffactive.migawari or false
    state.Buff.Doom = buffactive.doom or false
    state.Buff.Yonin = buffactive.Yonin or false
    state.Buff.Innin = buffactive.Innin or false
    state.Buff.Futae = buffactive.Futae or false
    state.Buff['Reive Mark'] = buffactive['Reive Mark'] or false
    state.Buff['Voidwatcher'] = buffactive['Voidwatcher'] or false
    state.Buff['Pathos'] = buffactive['Pathos'] or false
    -- determine_haste_group()
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Katana', 'Club', 'Dagger', 'GreatKatana', 'Polearm', 'Scythe', 'Staff', 'Sword')
    --state.HybridMode:options('Normal', 'Evasion', 'PDT')
    --state.WeaponskillMode:options('Normal', 'Acc', 'Mod')
    --state.CastingMode:options('Normal', 'Resistant')
    --state.PhysicalDefenseMode:options('PDT', 'Evasion')

    gear.MovementFeet = {name="Danzo Sune-ate"}
    gear.DayFeet = "Danzo Sune-ate"
    gear.NightFeet = "Ninja Kyahan +1"

    gear.default.weaponskill_neck = "Fotia Gorget"
    gear.default.weaponskill_waist = "Fotia Belt"

    select_movement_feet()
    select_default_macro_book()

    -- local binds
    send_command('bind !F9 gs c reset OffenseMode')
end
-- Cleanup after job change
function user_unload()
    send_command('unbind !F9')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    -- sets.precast.JA['Mijin Gakure'] = {legs="Mochizuki Hakama"}
    sets.precast.JA['Futae'] = {legs="Iga Tekko +2"}
    -- sets.precast.JA['Sange'] = {legs="Mochizuki Chainmail"}

    -- Waltz set (chr and vit)
    --[[sets.precast.Waltz = {ammo="Sonia's Plectrum",
        head="Felistris Mask",
        body="Hachiya Chainmail +1",hands="Buremte Gloves",ring1="Spiral Ring",
        back="Iximulew Cape",waist="Caudata Belt",legs="Nahtirah Trousers",feet="Otronif Boots +1"}]]
        -- Uk'uxkaj Cap, Daihanshi Habaki
        
    -- Don't need any special gear for Healing Waltz.
    -- sets.precast.Waltz['Healing Waltz'] = {}

    -- Set for acc on steps, since Yonin drops acc a fair bit
    --[[sets.precast.Step = {
        head="Whirlpool Mask",neck="Ej Necklace",
        body="Otronif Harness +1",hands="Buremte Gloves",ring1="Patricius Ring",
        back="Yokaze Mantle",waist="Chaac Belt",legs="Manibozho Brais",feet="Otronif Boots +1"}]]

    -- sets.precast.Flourish1 = {waist="Chaac Belt"}

    -- Fast cast sets for spells
    sets.precast.WS = {neck="Fotia Gorget",waist="Fotia Belt"}
    sets.precast.FC = {ammo="Sapience Orb",
                        head="Herculean Helm", 
                        neck="Orunmila's Torque",
                        ear1="Etiolation Earring",
                        ear2="Loquacious Earring", 
                        hands="Leyline Gloves", 
                        ring1="Prolix Ring",
                        ring2="Kishar Ring",
                        back="Yokaze Mantle",
                        waist="Sarissaphoroi Belt",
                        legs="Gyve Trousers",
                        feet="Hizamaru Sune-ate +1"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Mochizuki Chainmail +1"})

    -- Snapshot for ranged
    sets.precast.RA = {range="Aliyat Chakram"} -- , hands="Manibozho Gloves",legs="Nahtirah Trousers",feet="Wurrukatte Boots"}
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS['Blade: Ku'] = set_combine(sets.precast.WS, {neck=""})
    sets.precast.WS['Blade: Yu'] = set_combine(sets.precast.WS, {head="Mochizuki Hatsuburi +1",neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Hecate's Earring",
        ring1="Shiva Ring",ring2="Shiva Ring", back="Toro Cape"})
    sets.precast.WS['Blade: Shun'] = set_combine(sets.precast.WS, {feet="Daihanshi Habaki"})
    --[[sets.precast.WS = {ammo="Qirmiz Tathlum",
        head="Whirlpool Mask",neck=gear.ElementalGorget,ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Qaaxo Harness",hands="Mochizuki Tekko",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Atheling Mantle",waist=gear.ElementalBelt,legs="Manibozho Brais",feet="Otronif Boots +1"}
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {ammo="Jukukik Feather",hands="Buremte Gloves",
        back="Yokaze Mantle"})]]

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    --[[sets.precast.WS['Blade: Jin'] = set_combine(sets.precast.WS,
        {neck="Rancor Collar",ear1="Brutal Earring",ear2="Moonshade Earring",feet="Daihanshi Habaki"})]]

    sets.precast.WS['Blade: Hi'] = set_combine(sets.precast.WS,
        {head="Herculean Helm",
         ring1="Ramuh Ring +1", ring2="Ilabrat Ring", 
         back="Yokaze Mantle", legs="Hizamaru Hizayoroi +1", feet="Hizamaru Sune-ate +1"})
    sets.precast.WS['Blade: Ten'] = set_combine(sets.precast.WS,
        {head="Herculean Helm",
         ring1="Ramuh Ring +1", ring2="Ilabrat Ring", 
         back="Yokaze Mantle", legs="Hizamaru Hizayoroi +1", feet="Hizamaru Sune-ate +1"})
    --[[sets.precast.WS['Aeolian Edge'] = {
        head="Wayfarer Circlet",neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Moonshade Earring",
        body="Wayfarer Robe",hands="Wayfarer Cuffs",ring1="Acumen Ring",ring2="Demon's Ring",
        back="Toro Cape",legs="Shneddick Tights +1",feet="Daihanshi Habaki"}]]

    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
        head="Felistris Mask",ear2="Loquacious Earring",
        body="Hachiya Chainmail +1",hands="Mochizuki Tekko",ring1="Prolix Ring",
        legs="Hachiya Hakama",feet="Qaaxo Leggings"}
        
    sets.midcast.Utsusemi = set_combine(sets.midcast.SelfNinjutsu, {back="Andartia's Mantle",feet="Hattori Kyahan"})

    sets.midcast.ElementalNinjutsu = {
        head="Mochizuki Hatsuburi +1",neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Mochizuki Chainmail +1",hands="Iga Tekko +2",ring1="Shiva Ring",ring2="Balrahn's Ring",
        back="Toro Cape",waist=gear.ElementalObi,legs="Nahtirah Trousers",feet="Mochizuki Kyahan"}

    sets.midcast.ElementalNinjutsu.Resistant = set_combine(sets.midcast.Ninjutsu, {ear1="Lifestorm Earring",ear2="Psystorm Earring",
        back="Yokaze Mantle"})

    sets.midcast.NinjutsuDebuff = {
        head="Hachiya Hatsuburi",neck="Stoicheion Medal",ear1="Lifestorm Earring",ear2="Psystorm Earring",
        hands="Mochizuki Tekko",ring2="Sangoma Ring",
        back="Yokaze Mantle",feet="Hachiya Kyahan"}

    sets.midcast.NinjutsuBuff = {head="Hachiya Hatsuburi",neck="Ej Necklace",back="Yokaze Mantle"}

    sets.midcast.RA = {
        head="Felistris Mask",neck="Ej Necklace",
        body="Hachiya Chainmail +1",hands="Hachiya Tekko",ring1="Beeline Ring",
        back="Yokaze Mantle",legs="Nahtirah Trousers",feet="Qaaxo Leggings"}
    -- Hachiya Hakama/Thurandaut Tights +1

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
    
    -- Resting sets
    --[[sets.resting = {head="Ocelomeh Headpiece +1",neck="Wiglen Gorget",
        ring1="Sheltered Ring",ring2="Paguroidea Ring"}]]
    
    -- Idle sets
    sets.idle = set_combine(sets.engaged, {feet=gear.MovementFeet})
    sets.idle.Town = set_combine(sets.engaged, {feet=gear.MovementFeet})
    sets.idle.Weak = set_combine(sets.engaged, {feet=gear.MovementFeet})
    --[[sets.idle = {
        head="Mochizuki Hatsuburi",neck="Magoraga Beads",ear1="Suppanomimi",ear2="Brutal Earring",
        body="Hachiryu Haramaki",hands="Hachiryu Kote",ring1="Rajas Ring",ring2="Balrahn's Ring",
        back="Yokaze Mantle",waist="Anguinus Belt",legs="Hachiryu Haidate",feet=gear.MovementFeet}

    sets.idle.Town = {main="Shigi",sub="Kaitsuburi",ammo="Qirmiz Tathlum",
        head="Mochizuki Hatsuburi",neck="Magoraga Beads",ear1="Suppanomimi",ear2="Brutal Earring",
        body="Hachiryu Haramaki",hands="Hachiryu Kote",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Anguinus Belt",legs="Hachiryu Haidate",feet=gear.MovementFeet}
    
    sets.idle.Weak = {
        head="Mochizuki Hatsuburi",neck="Magoraga Beads",ear1="Suppanomimi",ear2="Brutal Earring",
        body="Hachiryu Haramaki",hands="Hachiryu Kote",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Anguinus Belt",legs="Hachiryu Haidate",feet=gear.MovementFeet}]]
    
    -- Defense sets
    --[[sets.defense.Evasion = {
        head="Felistris Mask",neck="Ej Necklace",
        body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Beeline Ring",
        back="Yokaze Mantle",waist="Flume Belt",legs="Nahtirah Trousers",feet="Otronif Boots +1"}

    sets.defense.PDT = {ammo="Iron Gobbet",
        head="Whirlpool Mask",neck="Twilight Torque",
        body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        back="Shadow Mantle",waist="Flume Belt",legs="Nahtirah Trousers",feet="Otronif Boots +1"}

    sets.defense.MDT = {ammo="Demonry Stone",
        head="Whirlpool Mask",neck="Twilight Torque",
        body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Shadow Ring",
        back="Engulfer Cape",waist="Flume Belt",legs="Nahtirah Trousers",feet="Otronif Boots +1"}]]


    sets.Kiting = {feet=gear.MovementFeet}


    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee groups
    sets.engaged = {main="Kanaria", sub="Kanaria", ammo="Seki Shuriken",
        head="Adhemar Bonnet +1",neck="Iqabi Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        body="Adhemar Jacket +1",hands="Hizamaru Kote +1",ring1="Apate Ring",ring2="Ramuh Ring +1",
        back="Yokaze Mantle",waist="Anguinus Belt",legs="Hizamaru Hizayoroi +1",feet="Hizamaru Sune-ate +1"}
    
    --[[sets.engaged.Acc = {main="Kanaria", sub="Shigi", ammo="Seki Shuriken",
        head="Skormoth Mask",neck="Asperity Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        body="Hizamaru Haramaki +1",hands="Herculean Gloves",ring1="Hetairoi Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Herculean Boots"}]]
    
    --[[sets.engaged.Acc = {main="Isuka", sub="Shigi", ammo="Happo Shuriken"   ,
        head="Mochizuki Hatsuburi +1",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Mochizuki Chainmail +1",hands="Mochizuki Tekko",ring1="Rajas Ring",ring2="Balrahn's Ring",
        back="Yokaze Mantle",waist="Anguinus Belt",legs="Kaabnax Trousers",feet="Rawhide Boots"}
    sets.engaged.Defense = {ammo="Happo Shuriken",
        head="Uk'uxkaj Cap",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Mochizuki Chainmail +1",hands="Mochizuki Tekko",ring1="Dark Ring",ring2="Shadow Ring",
        back="Shadow Mantle",waist="Flume Belt",legs="Kaabnax Trousers",feet="Rawhide Boots"}]]
    -- Abyssea Groups ('Club', 'Dagger', 'GreatKatana', 'Polearm', 'Scythe', 'Staff', 'Sword', 'Ninjutsu')
    sets.engaged.Club = {main="Deae Gratia", sub=empty}
    sets.engaged.Dagger = {main="Ternion Dagger", sub=empty}
    sets.engaged.GreatKatana = {main="Zanmato +1", sub=empty}
    sets.engaged.Polearm = {main="Pitchfork", sub=empty}
    sets.engaged.Scythe = {main="Ark Scythe", sub=empty}
    sets.engaged.Staff = {main="Mekki Shakki", sub=empty}
    sets.engaged.Sword = {main="Ibushi Shinai +1", sub=empty}

    --[[sets.engaged.Evasion = {ammo="Qirmiz Tathlum",
        head="Outrider Mask",neck="Evasion Torque",ear1="Suppanomimi",ear2="Brutal Earring",
        body="Mochizuki Chainmail +1",hands="Outrider Mittens",ring1="Rajas Ring",ring2="Heed Ring",
        back="Atheling Mantle",waist="Twilight Belt",legs="Outrider Hose",feet="Rawhide Boots"}
    sets.engaged.Acc.Evasion = {ammo="Qirmiz Tathlum",
        head="Outrider Mask",neck="Evasion Torque",ear1="Suppanomimi",ear2="Brutal Earring",
        body="Mochizuki Chainmail +1",hands="Outrider Mittens",ring1="Rajas Ring",ring2="Heed Ring",
        back="Atheling Mantle",waist="Twilight Belt",legs="Outrider Hose",feet="Rawhide Boots"}
    sets.engaged.PDT = {ammo="Qirmiz Tathlum",
        head="Outrider Mask",neck="Evasion Torque",ear1="Suppanomimi",ear2="Brutal Earring",
        body="Mochizuki Chainmail +1",hands="Outrider Mittens",ring1="Rajas Ring",ring2="Heed Ring",
        back="Atheling Mantle",waist="Twilight Belt",legs="Outrider Hose",feet="Rawhide Boots"}
    sets.engaged.Acc.PDT = {ammo="Qirmiz Tathlum",
        head="Outrider Mask",neck="Evasion Torque",ear1="Suppanomimi",ear2="Brutal Earring",
        body="Mochizuki Chainmail +1",hands="Outrider Mittens",ring1="Rajas Ring",ring2="Heed Ring",
        back="Atheling Mantle",waist="Twilight Belt",legs="Outrider Hose",feet="Rawhide Boots"}]]

    -- Custom melee group: High Haste (~20% DW)
    --[[sets.engaged.HighHaste = {ammo="Qirmiz Tathlum",
        head="Outrider Mask",neck="Evasion Torque",ear1="Suppanomimi",ear2="Brutal Earring",
        body="Mochizuki Chainmail +1",hands="Outrider Mittens",ring1="Rajas Ring",ring2="Heed Ring",
        back="Atheling Mantle",waist="Twilight Belt",legs="Outrider Hose",feet="Rawhide Boots"}
    sets.engaged.Acc.HighHaste = {ammo="Qirmiz Tathlum",
        head="Outrider Mask",neck="Evasion Torque",ear1="Suppanomimi",ear2="Brutal Earring",
        body="Mochizuki Chainmail +1",hands="Outrider Mittens",ring1="Rajas Ring",ring2="Heed Ring",
        back="Atheling Mantle",waist="Twilight Belt",legs="Outrider Hose",feet="Rawhide Boots"}
    sets.engaged.Evasion.HighHaste = {ammo="Qirmiz Tathlum",
        head="Outrider Mask",neck="Evasion Torque",ear1="Suppanomimi",ear2="Brutal Earring",
        body="Mochizuki Chainmail +1",hands="Outrider Mittens",ring1="Rajas Ring",ring2="Heed Ring",
        back="Atheling Mantle",waist="Twilight Belt",legs="Outrider Hose",feet="Rawhide Boots"}
    sets.engaged.Acc.Evasion.HighHaste = {ammo="Qirmiz Tathlum",
        head="Outrider Mask",neck="Evasion Torque",ear1="Suppanomimi",ear2="Brutal Earring",
        body="Mochizuki Chainmail +1",hands="Outrider Mittens",ring1="Rajas Ring",ring2="Heed Ring",
        back="Atheling Mantle",waist="Twilight Belt",legs="Outrider Hose",feet="Rawhide Boots"}
    sets.engaged.PDT.HighHaste = {ammo="Qirmiz Tathlum",
        head="Outrider Mask",neck="Evasion Torque",ear1="Suppanomimi",ear2="Brutal Earring",
        body="Mochizuki Chainmail +1",hands="Outrider Mittens",ring1="Rajas Ring",ring2="Heed Ring",
        back="Atheling Mantle",waist="Twilight Belt",legs="Outrider Hose",feet="Rawhide Boots"}
    sets.engaged.Acc.PDT.HighHaste = {ammo="Qirmiz Tathlum",
        head="Outrider Mask",neck="Evasion Torque",ear1="Suppanomimi",ear2="Brutal Earring",
        body="Mochizuki Chainmail +1",hands="Outrider Mittens",ring1="Rajas Ring",ring2="Heed Ring",
        back="Atheling Mantle",waist="Twilight Belt",legs="Outrider Hose",feet="Rawhide Boots"}

    -- Custom melee group: Embrava Haste (7% DW)
    sets.engaged.EmbravaHaste = {ammo="Qirmiz Tathlum",
        head="Whirlpool Mask",neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Qaaxo Harness",hands="Otronif Gloves",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Atheling Mantle",waist="Windbuffet Belt +1",legs="Manibozho Brais",feet="Manibozho Boots"}
    sets.engaged.Acc.EmbravaHaste = {ammo="Qirmiz Tathlum",
        head="Whirlpool Mask",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Mochizuki Chainmail",hands="Otronif Gloves",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Manibozho Brais",feet="Manibozho Boots"}
    sets.engaged.Evasion.EmbravaHaste = {ammo="Qirmiz Tathlum",
        head="Whirlpool Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Otronif Harness +1",hands="Otronif Gloves",ring1="Beeline Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Windbuffet Belt +1",legs="Hachiya Hakama",feet="Otronif Boots +1"}
    sets.engaged.Acc.Evasion.EmbravaHaste = {ammo="Qirmiz Tathlum",
        head="Whirlpool Mask",neck="Ej Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Otronif Harness +1",hands="Otronif Gloves",ring1="Beeline Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Hachiya Hakama",feet="Otronif Boots +1"}
    sets.engaged.PDT.EmbravaHaste = {ammo="Qirmiz Tathlum",
        head="Whirlpool Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Windbuffet Belt +1",legs="Manibozho Brais",feet="Otronif Boots +1"}
    sets.engaged.Acc.PDT.EmbravaHaste = {ammo="Qirmiz Tathlum",
        head="Whirlpool Mask",neck="Twilight Torque",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Manibozho Brais",feet="Otronif Boots +1"}

    -- Custom melee group: Max Haste (0% DW)
    sets.engaged.MaxHaste = {ammo="Qirmiz Tathlum",
        head="Whirlpool Mask",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Qaaxo Harness",hands="Otronif Gloves",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Atheling Mantle",waist="Windbuffet Belt +1",legs="Manibozho Brais",feet="Manibozho Boots"}
    sets.engaged.Acc.MaxHaste = {ammo="Qirmiz Tathlum",
        head="Whirlpool Mask",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Otronif Harness +1",hands="Otronif Gloves",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Manibozho Brais",feet="Manibozho Boots"}
    sets.engaged.Evasion.MaxHaste = {ammo="Qirmiz Tathlum",
        head="Whirlpool Mask",neck="Ej Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Otronif Harness +1",hands="Otronif Gloves",ring1="Beeline Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Windbuffet Belt +1",legs="Hachiya Hakama",feet="Otronif Boots +1"}
    sets.engaged.Acc.Evasion.MaxHaste = {ammo="Qirmiz Tathlum",
        head="Whirlpool Mask",neck="Ej Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Otronif Harness +1",hands="Otronif Gloves",ring1="Beeline Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Hachiya Hakama",feet="Otronif Boots +1"}
    sets.engaged.PDT.MaxHaste = {ammo="Qirmiz Tathlum",
        head="Whirlpool Mask",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Windbuffet Belt +1",legs="Manibozho Brais",feet="Otronif Boots +1"}
    sets.engaged.Acc.PDT.MaxHaste = {ammo="Qirmiz Tathlum",
        head="Whirlpool Mask",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Hurch'lan Sash",legs="Manibozho Brais",feet="Otronif Boots +1"}]]


    --------------------------------------
    -- Custom buff sets
    --------------------------------------
    sets.buff.Migawari = {body="Iga Ningi +2"}
    sets.buff.Doom = {ring2="Saida Ring"}
    sets.buff.Yonin = {legs="Hattori Hakama"}
    sets.buff.Innin = {head="Hattori Zukin"}
    sets.buff.Reive = {sub="Senkutanto"}
    --sets.buff.Voidwatcher = {body="Mextli Harness"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Run after the general midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if state.Buff.Doom then
        equip(sets.buff.Doom)
    end
end


-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
    if not spell.interrupted and spell.english == "Migawari: Ichi" then
        state.Buff.Migawari = true
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    -- If we gain or lose any haste buffs, adjust which gear set we target.
    if S{'haste','march','embrava','haste samba'}:contains(buff:lower()) then
        determine_haste_group()
        handle_equipping_gear(player.status)
    elseif S{'voidwatcher'}:contains(buff:lower()) then
        Fanatic = "Fanatic's Drink"
        windower.send_command('input /item "'..Fanatic..'" '..windower.ffxi.get_player()["name"])
    elseif state.Buff[buff] ~= nil then
        handle_equipping_gear(player.status)
    end
end

function job_status_change(new_status, old_status)
    if new_status ~= 'Engaged' then
        select_movement_feet()
    end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Get custom spell maps
function job_get_spell_map(spell, default_spell_map)
    if spell.skill == "Ninjutsu" then
        if not default_spell_map then
            if spell.target.type == 'SELF' then
                return 'NinjutsuBuff'
            else
                return 'NinjutsuDebuff'
            end
        end
    end
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if state.Buff.Migawari then
        idleSet = set_combine(idleSet, sets.buff.Migawari)
    end
    if state.Buff.Doom then
        idleSet = set_combine(idleSet, sets.buff.Doom)
    end
    return idleSet
end


-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
    if state.Buff.Migawari then
        meleeSet = set_combine(meleeSet, sets.buff.Migawari)
    end
    if state.Buff.Doom then
        meleeSet = set_combine(meleeSet, sets.buff.Doom)
    end
    if state.Buff['Reive Mark'] then
        meleeSet = set_combine(meleeSet, sets.buff.Reive)
    end
    if state.Buff['Voidwatcher'] then
        meleeSet = set_combine(meleeSet, sets.buff.Voidwatcher)
    end
    return meleeSet
end

-- Called by the default 'update' self-command.
function job_update(cmdParams, eventArgs)
    select_movement_feet()
    determine_haste_group()
    determine_location()
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
function determine_location()
    -- Change gear based on area and subjob
    -- Combine standard gear with some specials like Assault or Dynamis only items
    --if player.sub_job == 'RDM' then        
    --    classes.CustomMeleeGroups:append(Refresh)
end
function determine_haste_group()
    -- We have three groups of DW in gear: Hachiya body/legs, Iga head + Patentia Sash, and DW earrings
    
    -- Standard gear set reaches near capped delay with just Haste (77%-78%, depending on HQs)

    -- For high haste, we want to be able to drop one of the 10% groups.
    -- Basic gear hits capped delay (roughly) with:
    -- 1 March + Haste
    -- 2 March
    -- Haste + Haste Samba
    -- 1 March + Haste Samba
    -- Embrava
    
    -- High haste buffs:
    -- 2x Marches + Haste Samba == 19% DW in gear
    -- 1x March + Haste + Haste Samba == 22% DW in gear
    -- Embrava + Haste or 1x March == 7% DW in gear
    
    -- For max haste (capped magic haste + 25% gear haste), we can drop all DW gear.
    -- Max haste buffs:
    -- Embrava + Haste+March or 2x March
    -- 2x Marches + Haste
    
    -- So we want four tiers:
    -- Normal DW
    -- 20% DW -- High Haste
    -- 7% DW (earrings) - Embrava Haste (specialized situation with embrava and haste, but no marches)
    -- 0 DW - Max Haste
    
    classes.CustomMeleeGroups:clear()
    
    if buffactive.embrava and (buffactive.march == 2 or (buffactive.march and buffactive.haste)) then
        classes.CustomMeleeGroups:append('MaxHaste')
    elseif buffactive.march == 2 and buffactive.haste then
        classes.CustomMeleeGroups:append('MaxHaste')
    elseif buffactive.embrava and (buffactive.haste or buffactive.march) then
        classes.CustomMeleeGroups:append('EmbravaHaste')
    elseif buffactive.march == 1 and buffactive.haste and buffactive['haste samba'] then
        classes.CustomMeleeGroups:append('HighHaste')
    elseif buffactive.march == 2 then
        classes.CustomMeleeGroups:append('HighHaste')
    end
end


function select_movement_feet()
    if world.time >= 17*60 or world.time < 7*60 then
        gear.MovementFeet.name = gear.NightFeet
    else
        gear.MovementFeet.name = gear.DayFeet
    end
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(2, 13)
    elseif player.sub_job == 'THF' then
        set_macro_page(2, 13)
    elseif player.sub_job == 'RDM' then
        set_macro_page(3, 13)
    elseif player.sub_job == 'WAR' then
        set_macro_page(1, 13)
    else
        set_macro_page(2, 13)
    end
end

