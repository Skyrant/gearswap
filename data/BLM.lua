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

end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant', 'Proc')
    state.IdleMode:options('Normal', 'PDT')

    state.MagicBurst = M(false, 'Magic Burst')
    state.CapacityPoints = M(false, 'CapacityPoints')

    lowTierNukes = S{'Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder',
        'Stone II', 'Water II', 'Aero II', 'Fire II', 'Blizzard II', 'Thunder II',
        'Stone III', 'Water III', 'Aero III', 'Fire III', 'Blizzard III', 'Thunder III',
        'Stonega', 'Waterga', 'Aeroga', 'Firaga', 'Blizzaga', 'Thundaga',
        'Stonega II', 'Waterga II', 'Aeroga II', 'Firaga II', 'Blizzaga II', 'Thundaga II'}

    -- Special Augmented Gear
    MerlinicBurst = {
        name="Merlinic Crackows",
        augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Magic burst dmg.+10%','VIT+2','Mag. Acc.+10','"Mag.Atk.Bns."+12' }
    }
    MerlinicDrain = {
        name="Merlinic Crackows",
        augments={'Mag. Acc.+12 "Mag.Atk.Bns."+12','"Drain" and "Aspir" potency +10','MND+9' }
    }

    -- Additional local binds
	-- CTRL + `
    send_command('bind ^` input /ma Stun <t>')
    send_command('bind ^d gs equip sets.idle; gs enable all')
    -- Windows + `
	send_command('bind @` gs c toggle MagicBurst')
    -- ALT + `
    send_command('bind !` gs c toggle CapacityPoints; gs disable back')
    send_command("bind !d gs equip sets.midcast['Death']; gs disable all")

    select_default_macro_book()
end

-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^`')
    send_command('unbind @`')
	send_command('unbind !`')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    ---- Precast Sets ----

    -- Precast sets to enhance JAs
    sets.precast.JA['Mana Wall'] = {feet="Goetia Sabots +2"}

    sets.precast.JA.Manafont = {body="Sorcerer's Coat +2"}

    -- equip to maximize HP (for Tarus) and minimize MP loss before using convert
    sets.precast.JA.Convert = {}


    ---------------------------------------------------------------------------
    -- Precast Sets -----------------------------------------------------------
    ---------------------------------------------------------------------------
    -- Fast Cast Sets for all Spells ( Cap:80% - SCH:70% - RDM:65% ) ----------
    ---------------------------------------------------------------------------
    sets.precast.FC = {
        ammo="Sapience Orb",        -- 02%
        head="Vanya Hood",          -- 10%
        neck="Orunmila's Torque",   -- 05%
        ear1="Etiolation Earring",  -- 01%
        ear2="Loquacious Earring",  -- 02%
        body="Shango Robe",         -- 08%
        hands="Gendewitha Gages +1",-- 07%
        ring1="Prolix Ring",        -- 02%
        ring2="Kishar Ring",        -- 04%
        back="Swith Cape",          -- 03%
        waist="Witful Belt",        -- 03%/03% quick magic
        legs="Gyve Trousers",       -- 05%
        feet="Regal Pumps +1"       -- 04%
    --------------------------- Total: 56% ------------------------------------
    }

    --[[    ammo="Impatiens",
        head="Vanya Hood",ear1="Loquacious Earring",ear2="Etiolation Earring",
        body="Shango Robe",hands="Helios Gloves", ring1="Prolix Ring",
        back="Swith Cape",waist="Witful Belt",legs="Gyve Trousers",feet="Regal Pumps +1"}]]

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {head="Umuthi Hat",waist="Siegel Sash"})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {neck="Stoicheion Medal"})

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {body="Heka's Kalasiris", back="Pahtli Cape"})

    sets.precast.FC.Curaga = sets.precast.FC.Cure

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
    --[[    head="Hagondes Hat",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="Icesoul Ring",
        back="Refraction Cape",waist="Cognition Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Vidohunir'] = {ammo="Dosis Tathlum",
        head="Hagondes Hat",neck="Eddy Necklace",ear1="Friomisi Earring",ear2="Strophadic Earring",
        body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Icesoul Ring",ring2="Acumen Ring",
        back="Toro Cape",waist="Thunder Belt",legs="Hagondes Pants",feet="Hagondes Sabots"]]}


    ---- Midcast Sets ----

    sets.midcast.FastRecast = {
        head="Nahtirah Hat",ear1="Loquacious Earring",ear2="Etiolation Earring",
        body="Vanir Cotehardie",hands="Bokwus Gloves",ring1="Prolix Ring",
        back="Swith Cape",waist="Goading Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}

    sets.midcast.Cure = {main="Tamaxchi",sub="Genbu's Shield",
        head="Nahtirah Hat",neck="Colossus's Torque",ear2="Loquacious Earring",
        body="Heka's Kalasiris",hands="Bokwus Gloves",ring1="Ephedra Ring",ring2="Sirona's Ring",
        back="Pahtli Cape",waist=gear.ElementalObi,legs="Hagondes Pants",feet="Hagondes Sabots"}

    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast['Enhancing Magic'] = {
        neck="Colossus's Torque", head="Befouled Crown", ear1="Andoaa Earring",
        body="Manasa Chasuble",hands="Ayao's Gages", legs="Telchine Braconi", waist="Olympus Sash"}

    sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'], {
        feet="Inspirited Boots", waist="Gishdubar Sash"})

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})

    sets.midcast['Enfeebling Magic'] = {main="Lathi",sub="Enki Strap",range="Pemphredo Tathlum",
        head="Merlinic Hood",neck="Henic Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body="Spaekona's Coat +3",hands="Jhakri Cuffs +2",ring1="Omega Ring",ring2="Kishar Ring",
        back="Taranus's Cape",waist="Rumination Sash",legs="Merlinic Shalwar",feet="Mallquis Clogs +1"}

    sets.midcast.ElementalEnfeeble = sets.midcast['Enfeebling Magic']

    sets.midcast['Dark Magic'] = {main="Lathi",sub="Enki Strap",range="Pemphredo Tathlum",
        head="Nahtirah Hat",neck="Aesir Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Strendu Ring",ring2="Sangoma Ring",
        back="Bane Cape",waist="Goading Belt",legs="Bokwus Slops",feet="Bokwus Boots"}

    sets.midcast.Drain = {main="Rubicundity",range="Pemphredo Tathlum",
        head="Striga Crown",neck="Erra Pendant",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body="Psycloth Vest",hands="Merlinic Dastanas",ring1="Strendu Ring",ring2="Sangoma Ring",
        back="Bane Cape",waist="Fucho-no-Obi",legs="Telchine Braconi",feet=MerlinicDrain}

    sets.midcast.Aspir = sets.midcast.Drain

    sets.midcast.Stun = {main="Lathi",sub="Enki Strap",range="Pemphredo Tathlum",
        head="Nahtirah Hat",neck="Aesir Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Strendu Ring",ring2="Sangoma Ring",
        back="Bane Cape",waist="Witful Belt",legs="Orvail Pants +1",feet="Bokwus Boots"}

    sets.midcast.BardSong = {main="Lathi",sub="Enki Strap",range="Pemphredo Tathlum",
        head="Nahtirah Hat",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Strendu Ring",ring2="Sangoma Ring",
        back="Bane Cape",legs="Bokwus Slops",feet="Bokwus Boots"}

    -- Elemental Magic sets
    -- INT 116+246, MAB 311
    sets.midcast['Elemental Magic'] = {main="Lathi",sub="Enki Strap",ammo="Pemphredo Tathlum",
        head="Jhakri Coronal +2",neck="Sanctity Necklace",ear1="Barkarole Earring",ear2="Friomisi Earring",
        body="Jhakri Robe +2",hands="Jhakri Cuffs +1",ring1="Evanescence Ring",ring2="Excelsis Ring",
        back="Toro Cape",waist="Refoccilation Stone",legs="Jhakri Slops +2",feet="Jhakri Pigaches +2"}

    ---------------------------------------------------------------------------
    -- Magic Burst Set for all Spells ( Needed for Cap:40% ) ------------------
    ---------------------------------------------------------------------------
	sets.magic_burst = set_combine(sets.midcast['Elemental Magic'], {
--                                         MB%          INT     MAC     MAB
        head="Merlinic Hood",           -- 00%          +29     +51     +42
        neck="Mizukage-no-Kubikazari",  -- 10%          +04     +00     +08
        ear1="Barkarole Earring",       --              +03     +08     +08
        ear2="Friomisi Earring",        --                              +06
        body="Jhakri Robe +2",          --              +50     +46     +43
        hands="Ea Cuffs",               -- 05%/05%      +35     +39     +30
        ring1="Shiva Ring +1",          -- 00%          +09     +00     +03
        ring2="Mujin Band",             -- 00%/05%
        back="Taranus's Cape",          -- 05%          +20     +20     +10
        --waist="Hachirin-no-Obi",
        legs="Merlinic Shalwar",        -- 10%          +49     +44     +27
        feet=MerlinicBurst              -- 10%          +24     +32     +49
    ------------------------------- Total: 40%/10%     +223    +240    +226
    ----------------------------Set Total:             +187    +192    +184
    ------------------------ EA Set Total:             +202    +197    +165
    ----------------------- +EA Set Total:             +227    +250    +190
        })
    --- item        MAB     INT     MAC     MAB
    --- EA Hat +1   07/07   43      50      38
    --- Neck +2     10/00   15      30      07
    --- EA Body +1  09/09   48      52      44
    --- EA Hands+1  06/06   40      49      35
    --- EA Slops+1  08/08   48      51      41
    --- EA Pigs+1   05/05   05      48      32
    ---             45/35  199     280     197

    --- EA Hat +1   07/07   43      50      38
    --- Neck +2     10/00   15      30      07
    --- EA Body +1  09/09   48      52      44
    --- Archmage+3  20/00   36      38      50
    --- Archfeet+3  00/00   30      42      54
    --- Archpant+3  00/03   50      46      58
    ---             46/19  222     258     251
    ---             +1/-16 +23     -22     +54

    --- EA Hat +1   07/07   43      50      38
    --- Neck +2     10/00   15      30      07
    --- EA Body +1  09/09   48      52      44
    --- Archmage+3  20/00   36      38      50
    --- Alamslop+1  00/00   40      20      60
    --- Almfeet+1   00/00   21      20      52
    ---             46/16  203     210     251



    sets.midcast['Death'] = { main="Lathi",sub="Niobid Strap",ammo="Ombre Tathlum +1",
    head="Merlinic Hood", neck="Sanctity Necklace", ear1="Barkarole Earring", ear2="Halasz Earring",
    body="Spaekona's Coat +3", hands="Wicce Gloves +1", ring1="Mephitas's Ring", ring2="Mephitas's Ring +1",
    back="Bane Cape", waist="Shinjutsu-no-Obi", legs="Merlinic Shalwar", feet=MerlinicBurst }

    --[[sets.midcast['Elemental Magic'].Resistant = {main="Lathi",sub="Niobid Strap",ammo="Dosis Tathlum",
        head="Befouled Crown",neck="Sanctity Necklace",ear1="Strophadic Earring",ear2="Barkarole Earring",
        body="Witching Robe",hands="Helios Gloves",ring1="Strendu Ring",ring2="Shiva Ring",
        back="Bane Cape",waist="Tengu-no-Obi",legs="Merlinic Shalwar",feet="Helios Boots"}]]

    sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {sub="Wizzan Grip"})
    sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'], {sub="Wizzan Grip"})
    sets.midcast['Elemental Magic'].LowTierNuke = set_combine(sets.midcast['Elemental Magic'], {sub="Wizzan Grip"})
    --[[sets.midcast['Elemental Magic'].LowTierNuke = set_combine(sets.midcast['Elemental Magic'], {
        sub="Benthos Grip",
        head="Mallquis Chapeau +1",
        body="Mallquis Saio +1",
        hands="Mallquis Cuffs +1",
        legs="Mallquis Trews +1",
        feet="Mallquis Clogs +1"
        })]]

    -- Minimal damage gear for procs.
    --[[sets.midcast['Elemental Magic'].Proc = {main="Earth Staff", sub="Niobid Strap",ammo="Impatiens",
        head="Nahtirah Hat",neck="Loricate Collar",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Manasa Chasuble",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Swith Cape +1",waist="Witful Belt",legs="Nares Trews",feet="Chelona Boots +1"}]]



    -- Sets to return to when not performing an action.

    -- Resting sets
    sets.resting = {main="Chatoyant Staff",ammo="Seraphic Ampulla",
        head="Nefer Khat +1",neck="Grandiose Chain",
        body="Heka's Kalasiris",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        waist="Austerity Belt",legs="Nares Trews",feet="Serpentes Sabots"}


    -- Idle sets

    -- Normal refresh idle set
    sets.idle = {main="Lathi", sub="Niobid Strap",ammo="Seraphic Ampulla",
        head="Befouled Crown", neck="Sanctity Necklace", ear1="Infused Earring", ear2="Moonshade Earring",
        body="Witching Robe", hands="Wicce Gloves +1", ring1="Shiva Ring",ring2="Shiva Ring +1",
        back="Bane Cape", waist="Refoccilation Stone", legs="Assid. Pants +1", feet="Regal Pumps +1"}

    -- Idle mode that keeps PDT gear on, but doesn't prevent normal gear swaps for precast/etc.
    --sets.idle.PDT = {main="Earth Staff", sub="Zuuxowu Grip",ammo="Impatiens",
    --    head="Nahtirah Hat",neck="Loricate Collar",ear1="Bloodgem Earring",ear2="Loquacious Earring",
    --    body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2=gear.DarkRing.physical,
    --    back="Umbra Cape",waist="Hierarch Belt",legs="Hagondes Pants",feet="Herald's Gaiters"}

    -- Idle mode scopes:
    -- Town gear.
    sets.idle.Town = set_combine(sets.idle, {feet="Herald's Gaiters"})

    -- Defense sets

    sets.defense.PDT = {main="Earth Staff",sub="Zuuxowu Grip",
        head="Nahtirah Hat",neck="Loricate Collar",
        body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        back="Umbra Cape",waist="Hierarch Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}

    sets.defense.MDT = {ammo="Demonry Stone",
        head="Nahtirah Hat",neck="Loricate Collar",
        body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Shadow Ring",
        back="Tuilha Cape",waist="Hierarch Belt",legs="Bokwus Slops",feet="Hagondes Sabots"}

    sets.Kiting = {feet="Herald's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.

    sets.buff['Mana Wall'] = {feet="Goetia Sabots +2"}
    sets.capacity_points = {back="Mecistopins Mantle"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {
      --[[  head="Zelus Tiara",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body="Hagondes Coat",hands="Bokwus Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Umbra Cape",waist="Goading Belt",legs="Hagondes Pants",feet="Hagondes Sabots"]]
    }
    sets.Obi = { waist = "Hachirin-no-Obi"}
    sets.Gain = {head = "Chironic Hat"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if spellMap == 'Cure' or spellMap == 'Curaga' then
        gear.default.obi_waist = "Goading Belt"
    elseif spell.skill == 'Elemental Magic' then
        gear.default.obi_waist = "Sekhmet Corset"
        if state.CastingMode.value == 'Proc' then
            classes.CustomClass = 'Proc'
        end
    end
end


-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Elemental Magic' and state.MagicBurst.value then
        equip(sets.magic_burst)
    end
    if spell.skill == 'Elemental Magic' then
        if spell.element == world.weather_element or spell.element == world.day_element then
            equip(sets.Obi)
        end
    end
end

function job_aftercast(spell, action, spellMap, eventArgs)
    -- Lock feet after using Mana Wall.
    if not spell.interrupted then
        if spell.english == 'Mana Wall' then
            enable('feet')
            equip(sets.buff['Mana Wall'])
            disable('feet')
        --elseif spell.skill == 'Elemental Magic' then
            --state.MagicBurst:reset()
        end
    end
    if state.CapacityPoints.value then
        equip(sets.capacity_points)
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    -- Unlock feet when Mana Wall buff is lost.
    if buff == "Mana Wall" and not gain then
        enable('feet')
        handle_equipping_gear(player.status)
    end
end

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','range')
        else
            enable('main','sub','range')
        end
    end
    if state.CapacityPoints.value then
        equip(sets.capacity_points)
    end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
    if spell.skill == 'Elemental Magic' and default_spell_map ~= 'ElementalEnfeeble' then
        -- No real need to differentiate with current gear.
        if lowTierNukes:contains(spell.english) then
            return 'LowTierNuke'
        else
            return 'HighTierNuke'
        end
    end
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end

    return idleSet
end


-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 5)
end
