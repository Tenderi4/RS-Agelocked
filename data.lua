local data = {}

data.Ages = {
    {
        label = "Fifth Age",
        id = 1,
        hidden = false,
        npcs = {},
        interactions = {},
        unlockedBy = {}
    },
    {
        label = "The World Wakes",
        id = 2,
        hidden = true,
        npcs = {
        -- Orlando Smith, the World Wakes starting point
            "TSD_ORLANDO_OUTSIDE",
        },
        interactions = {
            -- Guthix's Cave
            "TSD_DIGSITE_DOORWAY_CLOSE",
        },
        unlockedBy = {
            {
                id = 1,
                achievements = {

                },
                bosses = {

                },
                lorebooks = {

                }
            },
            {
                id = 2,
                achievements = {

                },
                bosses = {

                },
                lorebooks = {
                    
                }
            },
            {
                id = 3, 
                achievements = {

                },
                bosses = {

                },
                lorebooks = {
                    
                }
            },
            {
                id = 4, 
                achievements = {

                },
                bosses = {

                },
                lorebooks = {
                    
                }
            },
            {
                id = 5,
                achievements = {

                },
                bosses = {

                },
                lorebooks = {
                    
                }
            },
            {
                id = 6, 
                achievements = {

                },
                bosses = {

                },
                lorebooks = {
                    
                }
            }
        },
    },
    {
        label = "Sliske's Game",
        id = 3,
        hidden = false,
        npcs = {
        -- Sir Owen (The Death of Chivalry)    
            "OWEN1_OWEN_UNARMED",
        --Emissary NPCs
            "GODEM_ARMADYL_EMISSARY",
            "GODEM_BANDOS_EMISSARY",
            "GODEM_SARADOMIN_EMISSARY",
            "GODEM_SEREN_EMISSARY",
            "GODEM_SLISKE_EMISSARY",
            "GODEM_ZAMORAK_EMISSARY",
            "GODEM_ZAROS_EMISSARY",
            "GODEM_GODLESS_EMISSARY",
            "GODEM_V_EMISSARY",
	
	    --World Event NPCs
            "_6AWE3_QUARTERMASTER",
            "_6AWE1_CUTSCENE_REPLAYER",
            "_6AWE2_CUTSCENE_REPLAYER",
            "TUSKA_CRASHSITE_SCOPULUS",
            "TUSKA_ASTROMANCER_LUMBRIDGE_TELEPORT",
            "TUSKA_CRASHSITE_GARLANDIA",
            "TUSKA_CRASHSITE_KARA_MEIR",
            "TUSKA_TUSKA_RAID_CUTSCENE_TUSKA",
            "TUSKA_CRASHSITE_LRC2_SLISKE",
	
	
        --Missing Presumed Death NPCs
            "SLISKE1_SURVIVOR",
            "SLISKE1_SURVIVOR_SCARED",
            "SLISKE1_SURVIVOR_NORMAL",
            "SLISKE1_SPIRIT_MONK_1",
            "SLISKE1_SPIRIT_MONK_2",
            "SLISKE1_SPIRIT_MONK_3",
            "SLISKE1_SPIRIT_ELF_1",
	
        --GWD2 NPCs
            "GWD2_MINIQUEST_CURATOR",
            "GWD2_MINIQUEST_CURATOR_VIS",

        -- Divination
            "DIV_WISP1",
            "DIV_WISP2",
            "DIV_WISP_SUPER2",
            "DIV_WISP3",
            "DIV_WISP_SUPER3",
            "DIV_WISP4",
            "DIV_WISP_SUPER4",
            "DIV_WISP5",
            "DIV_WISP_SUPER5",
            "DIV_WISP6",
            "DIV_WISP_SUPER6",
            "DIV_WISP7",
            "DIV_WISP_SUPER7",
            "DIV_WISP8",
            "DIV_WISP_SUPER8",
            "DIV_WISP9",
            "DIV_WISP_SUPER9",
            "DIV_WISP10",
            "DIV_WISP_SUPER10",
            "DIV_WISP11",
            "DIV_WISP_SUPER11",
            "DIV_WISP12",
            "DIV_WISP_SUPER12",
            "DIV_FOUNTAIN1",
            "DIV_FOUNTAIN2",
            "DIV_FOUNTAIN_SUPER2",
            "DIV_FOUNTAIN3",
            "DIV_FOUNTAIN_SUPER3",
            "DIV_FOUNTAIN4",
            "DIV_FOUNTAIN_SUPER4",
            "DIV_FOUNTAIN5",
            "DIV_FOUNTAIN_SUPER5",
            "DIV_FOUNTAIN6",
            "DIV_FOUNTAIN_SUPER6",
            "DIV_FOUNTAIN7",
            "DIV_FOUNTAIN_SUPER7",
            "DIV_FOUNTAIN8",
            "DIV_FOUNTAIN_SUPER8",
            "DIV_FOUNTAIN9",
            "DIV_FOUNTAIN_SUPER9",
            "DIV_FOUNTAIN10",
            "DIV_FOUNTAIN_SUPER10",
            "DIV_FOUNTAIN11",
            "DIV_FOUNTAIN_SUPER11",
            "DIV_FOUNTAIN12",
            "DIV_FOUNTAIN_SUPER12",
            "DIV_ORLA",
            "DIV_FAIZAN",
            "DIV_MAY",
            "DIV_SKILLHUB_NPC1",
            "DIV_SKILLHUB_NPC2",
            "DIV_SKILLHUB_NPC3",
            "DIV_SKILLHUB_NPC4",
            "DIV_BURTHORPE_NPC",
            "DIV_CHRONICLE",
            "DIV_CHRONICLE_ALL",
        -- Empty Throne Room
            "FOTG2_DIGSITE_GUIDE",
        },
        interactions = {
            -- GWD2 Entrance
            "GWD2_ENTANCE_GATE_BASE_EMPTY_CLICKZONE",
            -- Empty Throne Room (related to Children of Mah, a Sliske's Game quest)
            "FOTG2_DIGSITE_ENTRANCE"
        },
        unlockedBy = {
            {
                id = 1,
                achievements = {

                },
                bosses = {

                },
                lorebooks = {
                    
                }
            },
            {
                id = 2,
                achievements = {

                },
                bosses = {

                },
                lorebooks = {
                    
                }
            },
            {
                id = 3, 
                achievements = {

                },
                bosses = {

                },
                lorebooks = {
                    
                }
            },
            {
                id = 4, 
                achievements = {

                },
                bosses = {

                },
                lorebooks = {
                    
                }
            },
            {
                id = 5,
                achievements = {

                },
                bosses = {

                },
                lorebooks = {
                    
                }
            },
            {
                id = 6, 
                achievements = {
                    
                },
                bosses = {

                },
                lorebooks = {
                    
                }
            }
        }
        
    },
    {
        label = "Curse of the Black Stone",
        id = 4,
        hidden = true,
        npcs = {
            -- Bryll Thoksdottir
            "DUNGEON_REWARD_SHOP_NPC",
            "DUNGEON_DRAGONFORT_REWARD_SHOP_NPC",
        },
        interactions = {
            -- Elite Dungeon entrances
            "ELR1_AMINISHI_DUNGEON_ENTRANCE",
            "WILDERNESS_LABORATORY_ENTRANCE_5X5_ACTIVE",
            "DUNGEON_ULTHVEN_ENTRANCE"
        },
        unlockedBy = {
            {
                id = 1,
                achievements = {

                },
                bosses = {

                },
                lorebooks = {
                    
                }
            },
            {
                id = 2,
                achievements = {

                },
                bosses = {

                },
                lorebooks = {
                    
                }
            },
            {
                id = 3,
                achievements = {

                },
                bosses = {

                },
                lorebooks = {
                    
                }
            },
            {
                id = 4,
                achievements = {

                },
                bosses = {

                },
                lorebooks = {
                    
                }
            },
            {
                id = 5,
                achievements = {

                },
                bosses = {

                },
                lorebooks = {
                    
                }
            },
            {
                id = 6,
                achievements = {
                    
                },
                bosses = {

                },
                lorebooks = {
                    
                }
            }
        }
    },
    {
        label = "Elder God Wars",
        id = 5,
        hidden = false,
        npcs = {
            -- Burthorpe Council
            "QUEST_CHAROS_SEREN_SIMPLE",
            "QUEST_CHAROS_SEREN_EXTRAVAGANT",
            "QUEST_CHAROS_DORIC_VIS",
            "QUEST_CHAROS_PHAROAH_OSMAN_VIS",
            "QUEST_CHAROS_CYLCOPS_KHAN_VIS",
            "QUEST_CHAROS_GARLANDIA_VIS",
            "QUEST_CHAROS_ZILYANNA_VIS",
            "QUEST_CHAROS_MOIA_VIS",
            "QUEST_CHAROS_AZZANADRA_VIS",
            "QUEST_CHAROS_ZANIK_VIS",
            "QUEST_CHAROS_ICTHLARIN_VIS",
            "QUEST_CHAROS_ZARADOR_VIS",
            "QUEST_CHAROS_GLOUPHRIE_REP_VIS",
            "QUEST_CHAROS_NARODE_VIS",
            "QUEST_CHAROS_VANESCULA_VIS",
            "QUEST_CHAROS_ONEIROMANCER_VIS",
            "QUEST_CHAROS_RANCOUR_VIS",
            "QUEST_CHAROS_JUNA_VIS",
            "QUEST_CHAROS_KING_ROALD_VIS",
            "QUEST_CHAROS_SIR_AMIK_VIS",
            "QUEST_CHAROS_LORD_DAQUARIUS_VIS",
            "QUEST_CHAROS_ARMADYL_VIS",
            "QUEST_CHAROS_BRUNDT_VIS",
            "QUEST_CHAROS_THOK",

        },
        interactions = {
            -- The Needle
            "TNS_NEEDLE_VIS",

        },
        unlockedBy = {
            {
                id = 1,
                achievements = {

                },
                bosses = {

                },
                lorebooks = {
                    
                }
            },
            {
                id = 2,
                achievements = {

                },
                bosses = {

                },
                lorebooks = {
                    
                }
            },
            {
                id = 3, 
                achievements = {

                },
                bosses = {

                },
                lorebooks = {
                    
                }
            },
            {
                id = 4, 
                achievements = {

                },
                bosses = {

                },
                lorebooks = {
                    
                }
            },
            {
                id = 5,
                achievements = {

                },
                bosses = {

                },
                lorebooks = {
                    
                }
            },
            {
                id = 6, 
                achievements = {
                    
                },
                bosses = {

                },
                lorebooks = {
                    
                }
            }
        }
    },
    {
        label = "The Land Out of Time",
        id = 6,
        hidden = true,
        npcs = {
            -- Anachronia ship NPCs
            "DINO_ONBOARDING_LANIAKEA",
            "DINO_ONBOARDING_VARROCK_GUARD",
            "DINO_ONBOARDING_ARCHAEOLOGIST",
            -- Arch Guild NPCs
            "ARCH_GUILDMASTER_REINIGER_TUTORIAL",
            "ARCH_KHARIDET_MANAGER",
            "ARCH_EVERLIGHT_MANAGER",
            "ARCH_INFERNALSOURCE_MANAGER",
            "ARCH_STORMGUARD_MANAGER",
            "ARCH_WARFORGE_MANAGER",

        },
        interactions = {
            -- Anachronia ship
            "HUMAN_VEHICLE_BARGE_REGULAR_V4"

        },
        unlockedBy = {
            {
                id = 1,
                achievements = {

                },
                bosses = {

                },
                lorebooks = {
                    
                }
            },
            {
                id = 2,
                achievements = {

                },
                bosses = {

                },
                lorebooks = {
                    
                }
            },
            {
                id = 3, 
                achievements = {

                },
                bosses = {

                },
                lorebooks = {
                    
                }
            },
            {
                id = 4, 
                achievements = {

                },
                bosses = {

                },
                lorebooks = {
                    
                }
            },
            {
                id = 5,
                achievements = {

                },
                bosses = {

                },
                lorebooks = {
                    
                }
            },
            {
                id = 6, 
                achievements = {
                    
                },
                bosses = {

                },
                lorebooks = {
                    
                }
            }
        }
    },
    {
        label = "Battle of the Monolith",
        id = 7,
        hidden = true,
        npcs = {
            -- Battle of the Monolith start
            "MINIQUEST_EGWD_PRERELEASE_WAHISIETEL_PRESENT",
            "MINIQUEST_EGWD_PRERELEASE_TRINDINE_DURING",

        },
        interactions = {

        },
        unlockedBy = {
            {
                id = 1,
                achievements = {

                },
                bosses = {

                },
                lorebooks = {
                    
                }
            },
            {
                id = 2,
                achievements = {

                },
                bosses = {

                },
                lorebooks = {
                    
                }
            },
            {
                id = 3, 
                achievements = {

                },
                bosses = {

                },
                lorebooks = {
                    
                }
            },
            {
                id = 4, 
                achievements = {

                },
                bosses = {

                },
                lorebooks = {
                    
                }
            },
            {
                id = 5,
                achievements = {

                },
                bosses = {

                },
                lorebooks = {
                    
                }
            },
            {
                id = 6, 
                achievements = {
                    
                },
                bosses = {

                },
                lorebooks = {
                    
                }
            }
        }
    },
    {
        label = "Elder God Wars Dungeon",
        id = 8,
        hidden = true,
        npcs = {

        },
        interactions = {

            -- Senntisten entrance
            "EGWD_SURFACE_ENTRANCE_DOOR",
        },
        unlockedBy = {
            {
                id = 1,
                achievements = {

                },
                bosses = {

                },
                lorebooks = {
                    
                }
            },
            {
                id = 2,
                achievements = {

                },
                bosses = {

                },
                lorebooks = {
                    
                }
            },
            {
                id = 3, 
                achievements = {

                },
                bosses = {

                },
                lorebooks = {
                    
                }
            },
            {
                id = 4, 
                achievements = {

                },
                bosses = {

                },
                lorebooks = {
                    
                }
            },
            {
                id = 5,
                achievements = {

                },
                bosses = {

                },
                lorebooks = {
                    
                }
            },
            {
                id = 6, 
                achievements = {
                    
                },
                bosses = {

                },
                lorebooks = {
                    
                }
            }
        }
    },
    {
        label = "Age of Chaos", 
        id = 9,
        npcs = {
            -- Adrasteia
            "ADRASTEIA_BASILISSA",
        },
        interactions = {
            -- Necromancy entrance
            "UNDERWORLD_ENTRANCE_LOUD",
            -- New Foundations quest start
            "QUEST_FORT_INTRO_START_LOC"
            -- Daughter of Chaos quest start

        },
        unlockedBy = {
            {
                id = 1,
                achievements = {

                },
                bosses = {

                },
                lorebooks = {
                    
                }
            },
            {
                id = 2,
                achievements = {

                },
                bosses = {

                },
                lorebooks = {
                    
                }
            },
            {
                id = 3, 
                achievements = {

                },
                bosses = {

                },
                lorebooks = {
                    
                }
            },
            {
                id = 4, 
                achievements = {

                },
                bosses = {

                },
                lorebooks = {
                    
                }
            },
            {
                id = 5,
                achievements = {

                },
                bosses = {

                },
                lorebooks = {
                    
                }
            },
            {
                id = 6, 
                achievements = {
                    
                },
                bosses = {

                },
                lorebooks = {
                    
                }
            }
        }
    }
}

return data