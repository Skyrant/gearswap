-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

--[[
    Custom commands:

    gs c cycle treasuremode (set on ctrl-= by default): Cycles through the available treasure hunter modes.

    Treasure hunter modes:
        None - Will never equip TH gear
        Tag - Will equip TH gear sufficient for initial contact with a mob (either melee, ranged hit, or Aeolian Edge AOE)
        SATA - Will equip TH gear sufficient for initial contact with a mob, and when using SATA
        Fulltime - Will keep TH gear equipped fulltime

--]]

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff['Sneak Attack'] = buffactive['sneak attack'] or false
    state.Buff['Trick Attack'] = buffactive['trick attack'] or false
    state.Buff['Feint'] = buffactive['feint'] or false
    state.Buff['Reive Mark'] = buffactive['Reive Mark'] or false

    include('Mote-TreasureHunter')

    -- For th_action_check():
    -- JA IDs for actions that always have TH: Provoke, Animated Flourish
    info.default_ja_ids = S{35, 204}
    -- Unblinkable JA IDs for actions that always have TH: Quick/Box/Stutter Step, Desperate/Violent Flourish
    info.default_u_ja_ids = S{201, 202, 203, 205, 207}
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    -------------------------------------------------------------------------------------------------------------------
    -- Initialization function that defines sets and variables to be used.
    -------------------------------------------------------------------------------------------------------------------
    -- F12 - Update currently equipped gear, and report current status.
    -- F10 - Activate emergency Physical Defense Mode. Replaces Magical Defense Mode, if that was active.
    -- F11 - Activate emergency Magical Defense Mode. Replaces Physical Defense Mode, if that was active.
    -- Alt-F12 - Turns off any emergency defense mode.
    -- Alt-F10 - Toggles Kiting Mode.

    -- F9 - Cycle Offense Mode (the offensive half of all 'hybrid' melee modes).
    state.OffenseMode:options('Normal','Acc', 'DoubleAttack', 'DualWield', 'TreasureHunter','Swords')
    -- Ctrl-F9 - Cycle Hybrid Mode.
    state.HybridMode:options('Normal', 'Evasion', 'PDT')

    state.RangedMode:options('Normal', 'Acc')
    -- Win-F9 - Cycle Weaponskill Mode.
    state.WeaponskillMode:options('Normal', 'Acc', 'Mod', 'CP')
    -- Ctrl-F10 - Cycle type of Physical Defense Mode in use.
    state.PhysicalDefenseMode:options('Evasion', 'PDT')


    gear.default.weaponskill_neck = "Fotia Gorget"
    gear.default.weaponskill_waist = "Fotia Belt"
    gear.AugQuiahuiz = {name="Quiahuiz Trousers", augments={'Haste+2','"Snapshot"+2','STR+8'}}
    LeftDarkRing = {name="Dark Ring", augments={'Phys. dmg. taken -6%','Magic dmg. taken -4%','Spell interruption rate down -3%'}}
    RightDarkRing = {name="Dark Ring", augments={'Breath dmg. taken -5%','Phys. dmg. taken -4%','Magic dmg. taken -3'}}
    gear.ShijoC = {name="Shijo", augments={'DMG:+15','Accuracy+15','Attack+15'}}
    gear.ShijoD = {name="Shijo", augments={'DEX+15','"Dual Wield"+5','"Triple Atk."+2'}}


    -- Additional local binds
    --- ! = alt, @ = windows, ^ = ctrl
    --- Ctrl-` Flee
    send_command('bind ^` input /ja "Flee" <me>')
    --- Ctrl-= Cycle Treasurehunter Mode
    send_command('bind ^= gs c cycle treasuremode')
    --- Alt-- Cycle Target Mode
    send_command('bind !- gs c cycle targetmode')
    --- Alt-F9 Reset Offense Mode
    send_command('bind !F9 gs c reset OffenseMode')

    select_default_macro_book()
end

-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^`')
    send_command('unbind !-')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Special sets (required by rules)
    --------------------------------------

    sets.Kiting = {feet="Skadi's Jambeaux +1"}

    sets.buff['Sneak Attack'] = { ammo="Qirmiz Tathlum",
        head="Adhemar Bonnet +1", neck="Love Torque", ear1="Steelflash Earring", ear2="Bladeborn Earring",
        body="Plunderer's Vest +3", hands="Skulker's Armlets +1", ring1="Ramuh Ring +1", ring2="Ilbrat Ring",
        back="Toutatis's Cape", waist="Anguinus Belt", legs="Lustratio Subligar", feet="Meghanada Jambeaux +2"}

    sets.buff['Trick Attack'] = set_combine(sets.buff['Sneak Attack'], {
        head="Pillager's Bonnet +3", neck="Fotia Gorget", ear1="Sherida Earring", ear2="Cessance Earring",
        body="Plunderer's Vest +3",  hands="Pillager's Armlets +3", ring1="Apate Ring", ring2="Ilabrat Ring",
        back="Toutatis's Cape", waist="Fotia Belt", legs="Meghanada Chausses +2", feet="Meghanada Jambeaux +2"
    })

    -- Actions we want to use to tag TH.
    sets.TreasureHunter = {hands="Plunderer's Armlets +1", waist="Chaac Belt", feet="Skulker's Poulaines"}
    sets.precast.Step = sets.TreasureHunter
    sets.precast.Flourish1 = sets.TreasureHunter
    sets.precast.JA.Provoke = sets.TreasureHunter
    sets.precast.RA = sets.TreasureHunter
    sets.precast.SA = sets.TreasureHunter
    sets.precast.TA = sets.TreasureHunter

    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA['Collaborator'] = {head="Skulker's Bonnet +1"}
    sets.precast.JA['Accomplice'] = {head="Skulker's Bonnet +1"}
    sets.precast.JA['Flee'] = {feet="Pillager's Poulaines +1"}
    sets.precast.JA['Hide'] = {body="Pillager's Vest +3"}
    sets.precast.JA['Conspirator'] = {body="Skulker's Vest +1"}
    sets.precast.JA['Steal'] = {head="Plunderer's Bonnet +1",hands="Pillager's Armlets +3",legs="Pillager's Culottes +1",feet="Pillager's Poulaines +1"}
    sets.precast.JA['Despoil'] = {legs="Raider's Culottes +2",feet="Raider's Poulaines +2"}
    sets.precast.JA['Perfect Dodge'] = {hands="Plunderer's Armlets +1"}
    sets.precast.JA['Feint'] = {} -- {legs="Assassin's Culottes +2"}
    sets.precast.JA['Mug'] = {head="Plunderer's Bonnet +1"}

    sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']
    sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']


    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Sonia's Plectrum",
        head="Meghanada Visor +2",
        body="Pillager's Vest +3",
        hands="Buremte Gloves",
        ring1="Asklepian Ring", ring2="Valseur's Ring",
        back="Iximulew Cape",
        waist="Caudata Belt",
        legs="Pillager's Culottes +1",
        feet="Rawhide Boots"}

    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}


    -- Fast cast sets for spells
    sets.precast.FC = { ammo="Sapience Orb",
        head="Herculean Helm",
        neck="Orunmila's Torque",
        ear1="Loquacious Earring",
        ear2="Moonshade Earring",
        body="Samnuha Coat",
        hands="Leyline Gloves",
        ring1="Prolix Ring",
        ring2="Lebeche Ring",
        back="Solemnity Cape",
        waist="Gishdubar Sash",
        legs="Samnuha Tights",
        feet="Jute Boots"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})


    -- Ranged snapshot gear
    sets.precast.RA = set_combine(sets.TreasureHunter, {range="Antitail", hands="Plunderer's Armlets +1", feet="Skulker's Poulaines"})


    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Ginsen",
        head="Pillager's Bonnet +3",neck="Fotia Gorget", ear1="Sherida Earring", ear2="Cessance Earring",
        body="Plunderer's Vest +3",hands="Meghanada Gloves +2",ring1="Ramuh Ring +1",ring2="Ilabrat Ring",
        back="Toutatis's Cape", waist="Fotia Belt",legs="Samnuha Tights",feet="Meghanada Jambeaux +2"}

    sets.precast.WS.Acc = set_combine(sets.precast.WS, {ammo="Yamarang"})
    sets.precast.WS.CP = set_combine(sets.precast.WS, {back="Aptitude Mantle"})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Mercy Stroke'] = set_combine(sets.precast.WS, { head="Meghanada Visor +2", ring1="Apate Ring"})
    sets.precast.WS['Mercy Stroke'].Acc = set_combine(sets.precast.WS['Mercy Stroke'], {ammo="Yamarang", back="Letalis Mantle"})
    sets.precast.WS['Mercy Stroke'].Mod = set_combine(sets.precast.WS['Mercy Stroke'], {head="Felistris Mask",waist="Fotia Belt"})
    sets.precast.WS['Mercy Stroke'].SA = set_combine(sets.precast.WS['Mercy Stroke'].Mod, {ammo="Qirmiz Tathlum",legs="Lustratio Subligar"})
    sets.precast.WS['Mercy Stroke'].TA = set_combine(sets.precast.WS['Mercy Stroke'].Mod, {ammo="Qirmiz Tathlum"})
    sets.precast.WS['Mercy Stroke'].SATA = set_combine(sets.precast.WS['Mercy Stroke'].Mod, {ammo="Qirmiz Tathlum",legs="Lustratio Subligar"})
    sets.precast.WS['Mercy Stroke'].Reive = set_combine(sets.precast.WS['Mercy Stroke'], {ammo="Qirmiz Tathlum",neck="Ygnas's Resolve +1"})

    sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {ring1="Stormsoul Ring",legs="Nahtirah Trousers"})
    sets.precast.WS['Exenterator'].Acc = set_combine(sets.precast.WS['Exenterator'], {ammo="Yamarang", back="Letalis Mantle"})
    sets.precast.WS['Exenterator'].Mod = set_combine(sets.precast.WS['Exenterator'], {head="Felistris Mask",waist="Fotia Belt"})
    sets.precast.WS['Exenterator'].SA = set_combine(sets.precast.WS['Exenterator'].Mod, {ammo="Qirmiz Tathlum",legs="Lustratio Subligar"})
    sets.precast.WS['Exenterator'].TA = set_combine(sets.precast.WS['Exenterator'].Mod, {ammo="Qirmiz Tathlum"})
    sets.precast.WS['Exenterator'].SATA = set_combine(sets.precast.WS['Exenterator'].Mod, {ammo="Qirmiz Tathlum",legs="Lustratio Subligar"})
    sets.precast.WS['Exenterator'].Reive = set_combine(sets.precast.WS['Exenterator'], {ammo="Qirmiz Tathlum",neck="Ygnas's Resolve +1"})

    sets.precast.WS['Dancing Edge'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Dancing Edge'].Acc = set_combine(sets.precast.WS['Dancing Edge'], {ammo="Yamarang", back="Letalis Mantle"})
    sets.precast.WS['Dancing Edge'].Mod = set_combine(sets.precast.WS['Dancing Edge'], {waist="Fotia Belt"})
    sets.precast.WS['Dancing Edge'].SA = set_combine(sets.precast.WS['Dancing Edge'].Mod, {ammo="Qirmiz Tathlum","Lustratio Subligar"})
    sets.precast.WS['Dancing Edge'].TA = set_combine(sets.precast.WS['Dancing Edge'].Mod, {ammo="Qirmiz Tathlum"})
    sets.precast.WS['Dancing Edge'].SATA = set_combine(sets.precast.WS['Dancing Edge'].Mod, {ammo="Qirmiz Tathlum",legs="Lustratio Subligar"})
    sets.precast.WS['Dancing Edge'].Reive = set_combine(sets.precast.WS, {neck="Ygnas's Resolve +1"})

    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, { ammo="Qirmiz Tathlum", legs="Lustratio Subligar"})
    sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS['Evisceration'], {ammo="Yamarang"})
    sets.precast.WS['Evisceration'].Mod = set_combine(sets.precast.WS['Evisceration'], {})
    sets.precast.WS['Evisceration'].SA = set_combine(sets.precast.WS['Evisceration'].Mod, {legs="Lustratio Subligar"})
    sets.precast.WS['Evisceration'].TA = set_combine(sets.precast.WS['Evisceration'].Mod, {})
    sets.precast.WS['Evisceration'].SATA = set_combine(sets.precast.WS['Evisceration'].Mod, {legs="Lustratio Subligar"})
    sets.precast.WS['Evisceration'].Reive = set_combine(sets.precast.WS['Evisceration'], {neck="Ygnas's Resolve +1"})

    sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, { ammo="Mantoptera Eye" })
    sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS["Rudra's Storm"], {ammo="Yamarang"})
    sets.precast.WS["Rudra's Storm"].Mod = set_combine(sets.precast.WS["Rudra's Storm"], {back="Kayapa Cape",waist="Fotia Belt"})
    sets.precast.WS["Rudra's Storm"].SA = set_combine(sets.precast.WS["Rudra's Storm"].Mod, {ammo="Qirmiz Tathlum",legs="Lustratio Subligar"})
    sets.precast.WS["Rudra's Storm"].TA = set_combine(sets.precast.WS["Rudra's Storm"].Mod, {ammo="Qirmiz Tathlum"})
    sets.precast.WS["Rudra's Storm"].SATA = set_combine(sets.precast.WS["Rudra's Storm"].Mod, {ammo="Qirmiz Tathlum",legs="Lustratio Subligar"})

    sets.precast.WS["Shark Bite"] = set_combine(sets.precast.WS, {head="Pillager's Bonnet +1",ear1="Brutal Earring",ear2="Moonshade Earring"})
    sets.precast.WS['Shark Bite'].Acc = set_combine(sets.precast.WS['Shark Bite'], {ammo="Yamarang", back="Letalis Mantle"})
    sets.precast.WS['Shark Bite'].Mod = set_combine(sets.precast.WS['Shark Bite'], {})
    sets.precast.WS['Shark Bite'].SA = set_combine(sets.precast.WS['Shark Bite'].Mod, {ammo="Qirmiz Tathlum",legs="Lustratio Subligar"})
    sets.precast.WS['Shark Bite'].TA = set_combine(sets.precast.WS['Shark Bite'].Mod, {ammo="Qirmiz Tathlum"})
    sets.precast.WS['Shark Bite'].SATA = set_combine(sets.precast.WS['Shark Bite'].Mod, {ammo="Qirmiz Tathlum", legs="Lustratio Subligar"})
    sets.precast.WS["Shark Bite"].Reive = set_combine(sets.precast.WS["Shark Bite"], {neck="Ygnas's Resolve +1",})

    sets.precast.WS['Mandalic Stab'] = set_combine(sets.precast.WS, {ammo="Qirmiz Tathlum"})
    sets.precast.WS['Mandalic Stab'].Acc = set_combine(sets.precast.WS['Mandalic Stab'], {ammo="Yamarang", back="Letalis Mantle"})
    sets.precast.WS['Mandalic Stab'].Mod = set_combine(sets.precast.WS['Mandalic Stab'], {back="Kayapa Cape",waist="Fotia Belt"})
    sets.precast.WS['Mandalic Stab'].SA = set_combine(sets.precast.WS['Mandalic Stab'].Mod, {ammo="Qirmiz Tathlum", legs="Lustratio Subligar"})
    sets.precast.WS['Mandalic Stab'].TA = set_combine(sets.precast.WS['Mandalic Stab'].Mod, {ammo="Qirmiz Tathlum"})
    sets.precast.WS['Mandalic Stab'].SATA = set_combine(sets.precast.WS['Mandalic Stab'].Mod, {ammo="Qirmiz Tathlum", legs="Lustratio Subligar"})
    sets.precast.WS["Mandalic Stab"].Reive = set_combine(sets.precast.WS["Mandalic Stab"], {neck="Ygnas's Resolve +1"})

    sets.precast.WS['Aeolian Edge'] = {ammo="Ombre Tathlum +1",
        head="Pillager's Bonnet +3",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Samnuha Coat",hands="Pillager's Armlets +3",ring1="Shiva Ring +1",ring2="Ramuh Ring +1",
        back="Toro Cape",waist="Chaac Belt",legs="Samnuha Tights",feet="Herculean Boots"}

    sets.precast.WS['Aeolian Edge'].TH = set_combine(sets.precast.WS['Aeolian Edge'], sets.TreasureHunter)

    sets.precast.WS['Sanguine Blade'] = {ammo="Pemphredo Tathlum",
        head="Highwing Helm",neck="Deviant Necklace",ear1="Hecate's Earring",ear2="Friomisi Earring",
        body="Samnuha Coat",hands="Leyline Gloves",ring1="Persis Ring",ring2="Shiva Ring +1",
        back="Toro Cape",waist="Fotia Belt",legs="Shneddick Tights +1",feet="Herculean Boots"}

    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
        head="Whirlpool Mask",ear2="Loquacious Earring",
        body="Pillager's Vest +3",hands="Skulker's Armlets +1",
        back="Toutatis's Cape",legs="Kaabnax Trousers",feet="Iuitl Gaiters +1"}

    -- Specific spells
    sets.midcast.Utsusemi = {
        head="Whirlpool Mask",neck="Ej Necklace",ear2="Loquacious Earring",
        body="Pillager's Vest +3",hands="Skulker's Armlets +1",ring1="Beeline Ring",
        back="Toutatis's Cape",legs="Kaabnax Trousers",feet="Iuitl Gaiters +1"}

    -- Ranged gear
    sets.midcast.RA = {
        head="Meghanada Visor +2",
        neck="Sanctity Necklace",
        ear1="Clearview Earring",ear2="Volley Earring",
        body="Meghanada Cuirie",
        hands="Meghanada Gloves +2",
        ring1="Beeline Ring",ring2="Hajduk Ring",
        back="Libeccio Mantle",
        waist="Aquiline Belt",
        legs="Meghanada Chausses +2",
        feet="Meghanada Jambeaux +2"}

    sets.midcast.RA.Acc = set_combine( sets.midcast.RA, {

    })

    --------------------------------------
    -- Idle/resting/defense sets
    --------------------------------------

    -- Resting sets
    sets.resting = {head="Ocelomeh Headpiece +1",neck="Wiglen Gorget",
        ring1="Sheltered Ring",ring2="Paguroidea Ring"}


    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {ammo="Ginsen",
        head="Adhemar Bonnet +1", neck="Sanctity Necklace",ear1="Infused Earring",ear2="Moonshade Earring",
        body="Samnuha Coat",hands="Adhemar Wristbands +1",ring1=LeftDarkRing,ring2=RightDarkRing,
        back="Toutatis's Cape",waist="Flume Belt",legs="Samnuha Tights",feet="Jute Boots +1"}

    sets.idle.Regen = set_combine(sets.idle, {neck="Wiglen Gorget", ring1="Sheltered Ring"})

    sets.idle.Town = sets.idle

    sets.idle.Weak = {
        head="Pillager's Bonnet +1",neck="Sanctity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Pillager's Vest +3",hands="Skulker's Armlets +1",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Toutatis's Cape",waist="Flume Belt",legs="Pillager's Culottes +1",feet="Jute Boots +1"}

    -- Defense sets

    sets.defense.Evasion = {
        head="Pillager's Bonnet +1",neck="Evasion Torque",
        body="Qaaxo Harness",hands="Plun. Armlets +1",ring1="Defending Ring",ring2="Beeline Ring",
        back="Toutatis's Cape",waist="Flume Belt",legs="Kaabnax Trousers",feet="Iuitl Gaiters +1"}

    sets.defense.PDT = {ammo="Iron Gobbet",
        head="Meghanada Visor +2",
        neck="Loricate Torque +1",
        ear1="", ear2="",
        body="Meghanada Cuirie +2",
        hands="Meghanada Gloves +2",
        ring1=LeftDarkRing,ring2=RightDarkRing,
        back="Solemnity Cape",
        waist="Flume Belt",
        legs="Meghanada Chausses +2",
        feet="Meghanada Jambeaux +2"}

    sets.defense.MDT = set_combine ( sets.defense.PDT, {

    })

    --------------------------------------
    -- Melee sets
    --------------------------------------
    sets.engaged = {
        main=gear.ShijoC, sub=gear.ShijoD, ammo="Yamarang",
        head="Adhemar Bonnet +1",neck="Asperity Necklace",ear1="Sherida Earring",ear2="Brutal Earring",
        body="Pillager's Vest +3",hands="Adhemar Wristbands +1",ring1="Hetairoi Ring",ring2="Epona's Ring",
        back="Toutatis's Cape",waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Herculean Boots"}

    sets.engaged.DualWield = set_combine(sets.engaged, {
        neck="Sanctity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring"})

    sets.engaged.DoubleAttack = set_combine(sets.engaged, {ammo="Antitail", waist="Kentarch Belt",
        back="Atheling Mantle"})

    sets.engaged.Acc= {main=gear.ShijoC, sub=gear.ShijoD, ammo="Yamarang",
        head="Meghanada Visor +2",neck="Iqabi Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        body="Pillager's Vest +3",hands="Meghanada Gloves +2",ring1="Rajas Ring",ring2="Ramuh Ring +1",
        back="Toutatis's Cape",waist="Anguinus Belt",legs="Meghanada Chausses +2", feet="Meghanada Jambeaux +2"}

    sets.engaged.TreasureHunter = set_combine(sets.engaged, {
        main="Sandung", sub="Thief's Knife", neck="Sanctity Necklace",hands="Plunderer's Armlets +1", waist="Chaac Belt", feet="Skulker's Poulaines"})

    sets.engaged.Swords = {main="Tanmogayi +1", sub="Malevolence"}

    sets.engaged.PDT = {
        head="Meghanada Visor +2", neck="Loricate Torque +1", ear1="Etiolation Earring",
        body="Meghanada Cuirie +2", hands="Meghanada Gloves +2", ring1=LeftDarkRing, ring2=RightDarkRing,
        back="Solemnity Cape", waist="Flume Belt", legs="Meghanada Chausses +2", feet="Meghanada Jambeaux +2"}

        sets.engaged.MDT = {main="Sandung", sub="Eminent Dagger",
        head="Uk'uxkaj Cap",neck="Warder's Charm +1",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
        body="Plunderer's Vest +1",hands="Skulker's Armlets +1",ring1='Shadow Ring', ring2="Archon Ring",
        back="Toutatis's Cape",waist="Anguinus Belt",legs="Kaabnax Trousers",feet="Herculean Boots"}

    --------------------------------------
    -- Custom buff sets
    --------------------------------------

    sets.buff['Reive Mark'] = {sub="Homestead Dagger",neck="Ygnas's Resolve +1"}

end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Run after the general precast() is done.
function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.english == 'Aeolian Edge' and state.TreasureMode.value ~= 'None' then
        equip(sets.TreasureHunter)
    elseif spell.english=='Sneak Attack' or spell.english=='Trick Attack' or spell.type == 'WeaponSkill' then
        if state.TreasureMode.value == 'SATA' or state.TreasureMode.value == 'Fulltime' then
            equip(sets.TreasureHunter)
        end
    end
end

-- Run after the general midcast() set is constructed.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if state.TreasureMode.value ~= 'None' and spell.action_type == 'Ranged Attack' then
        equip(sets.TreasureHunter)
    end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
    -- Weaponskills wipe SATA/Feint.  Turn those state vars off before default gearing is attempted.
    if spell.type == 'WeaponSkill' and not spell.interrupted then
        state.Buff['Sneak Attack'] = false
        state.Buff['Trick Attack'] = false
        state.Buff['Feint'] = false
    end
end

-- Called after the default aftercast handling is complete.
function job_post_aftercast(spell, action, spellMap, eventArgs)
    -- If Feint is active, put that gear set on on top of regular gear.
    -- This includes overlaying SATA gear.
    check_buff('Feint', eventArgs)
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if state.Buff[buff] ~= nil then
        if not midaction() then
            handle_equipping_gear(player.status)
        end
    end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

function get_custom_wsmode(spell, spellMap, defaut_wsmode)
    local wsmode

    if state.Buff['Sneak Attack'] then
        wsmode = 'SA'
    end
    if state.Buff['Trick Attack'] then
        wsmode = (wsmode or '') .. 'TA'
    end
    if state.Buff['Reive Mark'] then
        wsmode = (wsmode or '') .. 'Reive'
    end
    return wsmode
end


-- Called any time we attempt to handle automatic gear equips (ie: engaged or idle gear).
function job_handle_equipping_gear(playerStatus, eventArgs)
    -- Check that ranged slot is locked, if necessary
    check_range_lock()

    -- Check for SATA when equipping gear.  If either is active, equip
    -- that gear specifically, and block equipping default gear.
    check_buff('Sneak Attack', eventArgs)
    check_buff('Trick Attack', eventArgs)
end


function customize_idle_set(idleSet)
    if player.hpp < 90 then
        idleSet = set_combine(idleSet, sets.idle.Regen)
    end
    return idleSet
end


function customize_melee_set(meleeSet)
    if state.TreasureMode.value == 'Fulltime' then
        meleeSet = set_combine(meleeSet, sets.TreasureHunter)
    end
    if state.Buff['Reive Mark'] then
        meleeSet = set_combine(meleeSet, sets.buff['Reive Mark'])
    end
    return meleeSet
end


-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    th_update(cmdParams, eventArgs)
end

-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
    local msg = 'Melee'

    if state.CombatForm.has_value then
        msg = msg .. ' (' .. state.CombatForm.value .. ')'
    end

    msg = msg .. ': '

    msg = msg .. state.OffenseMode.value
    if state.HybridMode.value ~= 'Normal' then
        msg = msg .. '/' .. state.HybridMode.value
    end
    msg = msg .. ', WS: ' .. state.WeaponskillMode.value

    if state.DefenseMode.value ~= 'None' then
        msg = msg .. ', ' .. 'Defense: ' .. state.DefenseMode.value .. ' (' .. state[state.DefenseMode.value .. 'DefenseMode'].value .. ')'
    end

    if state.Kiting.value == true then
        msg = msg .. ', Kiting'
    end

    if state.PCTargetMode.value ~= 'default' then
        msg = msg .. ', Target PC: '..state.PCTargetMode.value
    end

    if state.SelectNPCTargets.value == true then
        msg = msg .. ', Target NPCs'
    end

    msg = msg .. ', TH: ' .. state.TreasureMode.value

    add_to_chat(122, msg)

    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- State buff checks that will equip buff gear and mark the event as handled.
function check_buff(buff_name, eventArgs)
    if state.Buff[buff_name] then
        equip(sets.buff[buff_name] or {})
        if state.TreasureMode.value == 'SATA' or state.TreasureMode.value == 'Fulltime' then
            equip(sets.TreasureHunter)
        end
        eventArgs.handled = true
    end
end


-- Check for various actions that we've specified in user code as being used with TH gear.
-- This will only ever be called if TreasureMode is not 'None'.
-- Category and Param are as specified in the action event packet.
function th_action_check(category, param)
    if category == 2 or -- any ranged attack
        --category == 4 or -- any magic action
        (category == 3 and param == 30) or -- Aeolian Edge
        (category == 6 and info.default_ja_ids:contains(param)) or -- Provoke, Animated Flourish
        (category == 14 and info.default_u_ja_ids:contains(param)) -- Quick/Box/Stutter Step, Desperate/Violent Flourish
        then return true
    end
end


-- Function to lock the ranged slot if we have a ranged weapon equipped.
function check_range_lock()
    if player.equipment.range ~= 'empty' then
        disable('range', 'ammo')
    else
        enable('range', 'ammo')
    end
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(3, 6)
    elseif player.sub_job == 'WAR' then
        set_macro_page(1, 6)
    elseif player.sub_job == 'NIN' then
        set_macro_page(2, 6)
    else
        set_macro_page(3, 6)
    end
end


