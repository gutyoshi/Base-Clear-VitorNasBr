local cfg = {}

local surgery_male = { model = "mp_m_freemode_01" }
local surgery_female = { model = "mp_f_freemode_01" }
local travesti1 = { model = "a_m_m_tranvest_01" }
local travesti2 = { model = "a_m_m_tranvest_02" }
local gogoboy = { model = "u_m_y_staggrm_01" }
local deus = { model = "u_m_m_jesus_01" }
local padre = { model = "cs_priest" }
local pegrande = { model = "cs_orleans" }
local gato = { model = "a_c_cat_01" }
local pug = { model = "a_c_pug" }
local lessie = { model = "a_c_shepherd" }
local poodle = { model = "a_c_westy" }
local onca = { model = "a_c_mtlion" }
local chop = { model = "a_c_chop" }
local macaco = { model = "a_c_chimp" }

for i=0,19 do
	surgery_female[i] = { 1,0 }
	surgery_male[i] = { 1,0 }
end

cfg.cloakroom_types = {
	["Personagem"] = {
		_config = {permissions={"manager.permissao"}},
		["Travesti 1"] = travesti1,
		["Travesti 2"] = travesti2,
		["Gogoboy"] = gogoboy,
		["Deus"] = deus,
		["Padre"] = padre,
		["Pé Grande"] = pegrande,
		["Gato"] = gato,
		["Pug"] = pug,
		["Lessie"] = lessie,
		["Poodle"] = poodle,
		["Onça"] = onca,
		["Chop"] = chop,
		["Macaco"] = macaco,
		["Homem"] = surgery_male,
		["Mulher"] = surgery_female,
		},
		["Fardamento"] = {
			_config = { permissions = {"policia.permissao"} },
			["Aluno"] = {
				[1] = {121,0,1},
				[2] = {4,0,0},
				[3] = {0,0,1},
				[4] = {88,0,1},
				[6] = {25,0,1},
				[8] = {15,0,1},
				[11] = {208,0,1},
				["p0"] = {-1,0},
				["p6"] = {-1,0},
			},
			["Soldado"] = {
				[1] = {121,0,1},
				[2] = {4,0,0},
				[3] = {0,0,1},
				[4] = {87,1,1},
				[6] = {25,0,1},
				[8] = {15,0,1},
				[9] = {19,0,1},
				[11] = {208,1,1},
				["p0"] = {-1,0},
				["p6"] = {-1,0},
			},
			["Cabo"] = {
				[1] = {121,0,1},
				[2] = {4,0,0},
				[3] = {0,0,1},
				[4] = {87,1,1},
				[6] = {25,0,1},
				[8] = {15,0,1},
				[9] = {19,0,1},
				[11] = {208,5,1},
				["p0"] = {-1,0},
				["p6"] = {-1,0},
			},
			["Sargento"] = {
				[1] = {121,0,1},
				[2] = {4,0,0},
				[3] = {0,0,1},
				[4] = {87,3,1},
				[6] = {25,0,1},
				[8] = {15,0,1},
				[9] = {19,0,1},
				[11] = {208,3,1},
				["p0"] = {-1,0},
				["p6"] = {-1,0},
			},
			["Tática"] = {
				[1] = {121,0,1},
				[2] = {4,0,0},
				[3] = {0,0,1},
				[4] = {87,0,1},
				[6] = {25,0,1},
				[8] = {15,0,1},
				[9] = {18,0,1},
				[11] = {208,4,1},
				["p0"] = {-1,0},
				["p6"] = {-1,0},
			},
			["Comando"] = {
				[1] = {121,0,1},
				[2] = {4,0,0},
				[3] = {0,0,1},
				[4] = {87,2,1},
				[6] = {25,0,1},
				[8] = {15,0,1},
				[9] = {18,0,1},
				[11] = {208,2,1},
				["p0"] = {-1,0},
				["p6"] = {-1,0},
			},
	}
}

cfg.cloakrooms = {
	{ "Personagem",36.27, -1542.24, 417.09 },
	{ "Fardamento", -1096.71, -830.09, 14.29 }
}

return cfg