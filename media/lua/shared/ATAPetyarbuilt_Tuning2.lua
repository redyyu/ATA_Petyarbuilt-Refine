require "ATA2TuningTable"

local function copy(obj, seen)
  if type(obj) ~= 'table' then return obj end
  if seen and seen[obj] then return seen[obj] end
  local s = seen or {}
  local res = setmetatable({}, getmetatable(obj))
  s[obj] = res
  for k, v in pairs(obj) do res[copy(k, s)] = copy(v, s) end
  return res
end

local carRecipe = "ATAPetyarbuiltRecipes"

local NewCarTuningTable = {}
NewCarTuningTable["ATAPetyarbuilt"] = {
    addPartsFromVehicleScript = "",
    parts = {}
}

NewCarTuningTable["ATAPetyarbuilt"].parts["ATA2ProtectionWheelsFront"] = {
    ATAProtection = {
        removeIfBroken = true,
        icon = "media/ui/tuning2/wheel_chain.png",
        category = "Protection", 
        protectionModel = true, 
        protection = {"TireFrontLeft", "TireFrontRight"}, 
        install = {
            sound = "ATA2InstallWheelChain",
            use = { 
                ATAProtectionWheelsChain = 1,
                BlowTorch=2,
            },
            tools = { 
                bodylocation = "Base.WeldingMask", 
                primary = "Base.Wrench",
            },
            skills = {
                Mechanics = 2,
                MetalWelding = 3,
            },
            recipes = {"Basic Tuning"},
            requireInstalled = {"TireFrontLeft", "TireFrontRight"},
            time = 65, 
        },
        uninstall = {
            sound = "ATA2InstallWheelChain",
            use = {
                BlowTorch=2,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                both = "Base.Crowbar",
            },
            skills = {
                MetalWelding = 2,
            },
            result = {
                UnusableMetal=2,
            },
            time = 40,
        }
    }
}

NewCarTuningTable["ATAPetyarbuilt"].parts["ATA2ProtectionRearWheels"] = {
    Default = {
        icon = "media/ui/tuning2/petyar_protection.png",
        category = "Protection",
        protection = {"TireMiddleLeft", "TireMiddleRight", "TireRearLeft", "TireRearRight"},
        install = {
            area = "TireRearLeft",
            weight = "auto",
            use = {
                MetalPipe = 6,
                MetalBar = 6,
                SheetMetal = 2,
                Screws=10,
                BlowTorch=8,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                primary = "Base.Wrench",
            },
            skills = {
                MetalWelding = 5,
            },
            requireInstalled = {"TireMiddleLeft", "TireMiddleRight", "TireRearLeft", "TireRearRight"},
            recipes = {carRecipe},
            time = 60,
        },
        uninstall = {
            area = "TireRearLeft",
            animation = "ATA_IdleLeverOpenMid",
            use = {
                BlowTorch=4,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                both = "Base.Crowbar",
            },
            skills = {
                MetalWelding = 2,
            },
            result = "auto",
            time = 30,
        }
    },
}

NewCarTuningTable["ATAPetyarbuilt"].parts["ATA2ProtectionSideLeft"] = {
    Default = {
        icon = "media/ui/tuning2/petyar_protection_side.png",
        secondModel = "StaticPart",
        category = "Protection",
        protection = {"DoorFrontLeft", "WindowFrontLeft"},
        disableOpenWindowFromSeat = "SeatFrontLeft",
        install = {
            weight = "auto",
            use = {
                MetalPipe = 4,
                MetalBar=8,
                SheetMetal=10,
                Screws=10,
                BlowTorch=10,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                primary = "Base.Wrench",
            },
            skills = {
                MetalWelding = 6,
            },
            recipes = {carRecipe},
            requireInstalled = {"WindowFrontLeft"},
            time = 120,
        },
        uninstall = {
            animation = "ATA_IdleLeverOpenMid",
            use = {
                BlowTorch=5,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                both = "Base.Crowbar",
            },
            skills = {
                MetalWelding = 4,
            },
            requireUninstalled = {"ATA2ProtectionSideFront", "ATA2ProtectionSideTop"},
            result = "auto",
            time = 60,
        }
    }
}


NewCarTuningTable["ATAPetyarbuilt"].parts["ATA2ProtectionSideRight"] = copy(NewCarTuningTable["ATAPetyarbuilt"].parts["ATA2ProtectionSideLeft"])
NewCarTuningTable["ATAPetyarbuilt"].parts["ATA2ProtectionSideRight"].Default.protection = {"DoorFrontRight", "WindowFrontRight"}
NewCarTuningTable["ATAPetyarbuilt"].parts["ATA2ProtectionSideRight"].Default.disableOpenWindowFromSeat = "SeatFrontRight"
NewCarTuningTable["ATAPetyarbuilt"].parts["ATA2ProtectionSideRight"].Default.install.requireInstalled = {"WindowFrontRight"}

NewCarTuningTable["ATAPetyarbuilt"].parts["ATA2ProtectionSideFront"] = {
    Default = {
        icon = "media/ui/tuning2/petyar_protection_front.png",
        secondModel = "StaticPart",
        category = "Protection",
        protection = {"EngineDoor", "HeadlightLeft", "HeadlightRight"},
        install = {
            area = "FrontArea",
            weight = "auto",
            use = {
                MetalPipe = 2,
                MetalBar=8,
                SheetMetal=8,
                Screws=10,
                BlowTorch=10,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                primary = "Base.Wrench",
            },
            skills = {
                MetalWelding = 6,
            },
            recipes = {carRecipe},
            requireInstalled = {"ATA2ProtectionSideRight", "ATA2ProtectionSideLeft"},
            time = 120,
        },
        uninstall = {
            area = "FrontArea",
            animation = "ATA_IdleLeverOpenMid",
            use = {
                BlowTorch=5,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                both = "Base.Crowbar",
            },
            skills = {
                MetalWelding = 4,
            },
            requireUninstalled = {"ATA2ProtectionSideTop"},
            result = "auto",
            time = 60,
        }
    }
}

NewCarTuningTable["ATAPetyarbuilt"].parts["ATA2ProtectionSideTop"] = {
    Default = {
        icon = "media/ui/tuning2/petyar_protection_top.png",
        category = "Protection",
        protection = {"Windshield"},
        install = {
            weight = "auto",
            use = {
                MetalPipe = 2,
                SheetMetal=8,
                Screws=10,
                BlowTorch=10,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                primary = "Base.Wrench",
            },
            skills = {
                MetalWelding = 7,
            },
            recipes = {carRecipe},
            requireInstalled = {"ATA2ProtectionSideFront"},
            time = 90,
        },
        uninstall = {
            animation = "ATA_IdleLeverOpenHigh",
            use = {
                BlowTorch=5,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                both = "Base.Crowbar",
            },
            skills = {
                MetalWelding = 4,
            },
            requireUninstalled = {"ATA2RoofLightFront", "ATA2RoofLightLeft", "ATA2RoofLightRight"},
            result = "auto",
            time = 45,
        }
    }
}

NewCarTuningTable["ATAPetyarbuilt"].parts["ATA2ProtectionGasTank"] = {
    Default = {
        icon = "media/ui/tuning2/petyar_protection.png",
        category = "Protection",
        protection = {"GasTank"},
        install = {
            weight = "auto",
            use = {
                MetalPipe = 6,
                MetalBar = 6,
                SheetMetal = 2,
                Screws=10,
                BlowTorch=8,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                primary = "Base.Wrench",
            },
            skills = {
                MetalWelding = 5,
            },
            requireInstalled = {"GasTank"},
            recipes = {carRecipe},
            time = 60,
        },
        uninstall = {
            animation = "ATA_IdleLeverOpenMid",
            use = {
                BlowTorch=4,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                both = "Base.Crowbar",
            },
            skills = {
                MetalWelding = 2,
            },
            result = "auto",
            time = 30,
        }
    },
}

NewCarTuningTable["ATAPetyarbuilt"].parts["ATA2ProtectionSleeper"] = {
    Default = {
        icon = "media/ui/tuning2/petyar_protection_sleeper.png",
        category = "Protection",
        protection = {"WindowRearLeft", "WindowRearRight", "GasTank",},
        install = {
            weight = "auto",
            use = {
                MetalPipe = 10,
                MetalBar = 3,
                SheetMetal = 5,
                Screws=10,
                BlowTorch=10,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                primary = "Base.Wrench",
            },
            skills = {
                MetalWelding = 7,
            },
            requireInstalled = {"WindowRearLeft", "WindowRearRight", "GasTank",},
            recipes = {carRecipe},
            time = 150,
        },
        uninstall = {
            animation = "ATA_IdleLeverOpenMid",
            use = {
                BlowTorch=5,
            },
            tools = {
                bodylocation = "Base.WeldingMask",
                both = "Base.Crowbar",
            },
            skills = {
                MetalWelding = 4,
            },
            result = "auto",
            time = 70,
        }
    },
}

NewCarTuningTable["ATAPetyarbuiltSleeper"] = NewCarTuningTable["ATAPetyarbuilt"]
NewCarTuningTable["ATAPetyarbuiltSleeperLong"] = NewCarTuningTable["ATAPetyarbuilt"]

ATA2Tuning_AddNewCars(NewCarTuningTable)
