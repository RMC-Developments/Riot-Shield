Config = {}

-- Shield Configuration
Config.Shield = {
    duration = 10000000, -- Duration of the shield in milliseconds (10 seconds)
    damageReduction = 0.5, -- Reduce damage by 50% when shield is active
    model = 'prop_ballistic_shield', -- Prop model for the shield
    animation = {
        dict = 'weapons@first_person@aim_rng@generic@ballistic_shield@', -- Animation dictionary
        name = 'idle', -- Animation name
    }
}

-- Notifications
Config.Notifications = {
    shieldActivated = 'Shield Activated!',
    shieldDeactivated = 'Shield Deactivated!',
    alreadyActive = 'You already have the shield active!',
}
