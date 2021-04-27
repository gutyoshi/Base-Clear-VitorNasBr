local cfg = {}

cfg.groups = {

	--[	Staff ]------------------------------------------------------------------

	["manager"] = {
		_config = {
			title = "Manager",
			gtype = "staff"
		},
		"manager.permissao"
	},
	["off-manager"] = {
		_config = {
			title = "Manager",
			gtype = "staff"
		},
		"off-manager.permissao"
	},

	["administrador"] = {
		_config = {
			title = "Administrador(a)",
			gtype = "staff"
		},
		"administrador.permissao"
	},
	["off-administrador"] = {
		_config = {
			title = "Administrador(a)",
			gtype = "staff"
		},
		"off-administrador.permissao"
	},

	["moderador"] = {
		_config = {
			title = "Moderador(a)",
			gtype = "staff"
		},
		"moderador.permissao"
	},
	["off-moderador"] = {
		_config = {
			title = "Moderador(a)",
			gtype = "staff"
		},
		"off-moderador.permissao"
	},

	["suporte"] = {
		_config = {
			title = "Suporte",
			gtype = "staff"
		},
		"suporte.permissao"
	},
	["off-suporte"] = {
		_config = {
			title = "Suporte",
			gtype = "staff"
		},
		"off-suporte.permissao"
	},
	["aprovador-wl"] = {
		_config = {
			title = "Aprovador WL",
			gtype = "staff"
		},
		"aprovador-wl.permissao"
	},
}

cfg.users = {
	[1] = { "manager" }
}

cfg.selectors = {}

return cfg