	Settings = {}
	Settings.HUD = {}
	Settings.HUD.DetailedInformation = true
	Settings.HUD.DisplayImages = true
	Settings.HUD.UseOutfitColors = false
	Settings.HUD.Items = {}
	Settings.HUD.Items.Default = {}
	Settings.HUD.Items.Default.Loot =
	{
		-- Gold
		3031,
		-- Coryms
		17809, 17817, 17818, 17819, 17846, 17813, 17812, 17810, 17859, 17825,
	}
	Settings.HUD.Items.Default.Supplies =
	{
		-- Mana potions
		268, 237, 238,
		-- Health potions
		7876, 266, 236, 239, 7643,
		-- Other potions
		7642,
		-- Ammunition
		761, 762, 763, 774, 3446, 3447, 3448, 3449, 3450, 6528, 7363, 7364, 7365, 14251, 14252, 15793, 16141, 16142, 16143
	}

	-- Namespace
	Chuitox = {}
	Chuitox.HUD = {}

	-- Data
	dofile("[CONFIG] Chuitox HUD.lua")
	Chuitox.HUD.Data = Settings.HUD.Items
	
	-- Setting lower case
	for index = 1, #Chuitox.HUD.Data do
		Chuitox.HUD.Data[index].Name = Chuitox.HUD.Data[index].Name:lower()
	end

	-- Settings
	Chuitox.HUD.Details = Settings.HUD.DetailedInformation and Settings.HUD.DetailedInformation or false
	Chuitox.HUD.DisplayImages = Settings.HUD.DisplayImages and Settings.HUD.DisplayImages or false

	-- Session
	Chuitox.HUD.Session = {}
	Chuitox.HUD.Session.Character = Self.ID()
	Chuitox.HUD.Session.Name = Self.Name():lower()
	Chuitox.HUD.Session.StartTime = os.time()
	Chuitox.HUD.Session.StartExp = Self.Experience()
	Chuitox.HUD.Session.Validate = function()
		if (Chuitox.HUD.Session.Character ~= Self.ID()) then
			Chuitox.HUD.Session.Character = Self.ID()
			Chuitox.HUD.Session.StartTime = os.time()
			Chuitox.HUD.Session.StartExp = Self.Experience()
		end
		return true
	end

	-- Map
	Chuitox.HUD.Map = {}
	Chuitox.HUD.Map.DepotLocations =
	{
		{x = 32795, y = 31251, z = 7},
		{x = 32793, y = 31251, z = 7},
		{x = 32791, y = 31251, z = 7},
		{x = 32789, y = 31251, z = 7},
		{x = 32787, y = 31251, z = 7},
		{x = 32785, y = 31251, z = 7},
		{x = 32783, y = 31251, z = 7},
		{x = 32781, y = 31251, z = 7},
		{x = 32779, y = 31251, z = 7},
		{x = 32777, y = 31251, z = 7},
		{x = 32795, y = 31244, z = 7},
		{x = 32793, y = 31244, z = 7},
		{x = 32791, y = 31244, z = 7},
		{x = 32789, y = 31244, z = 7},
		{x = 32787, y = 31244, z = 7},
		{x = 32785, y = 31244, z = 7},
		{x = 32783, y = 31244, z = 7},
		{x = 32781, y = 31244, z = 7},
		{x = 32779, y = 31244, z = 7},
		{x = 32777, y = 31244, z = 7},
		{x = 32795, y = 31251, z = 6},
		{x = 32793, y = 31251, z = 6},
		{x = 32791, y = 31251, z = 6},
		{x = 32789, y = 31251, z = 6},
		{x = 32787, y = 31251, z = 6},
		{x = 32785, y = 31251, z = 6},
		{x = 32783, y = 31251, z = 6},
		{x = 32781, y = 31251, z = 6},
		{x = 32779, y = 31251, z = 6},
		{x = 32777, y = 31251, z = 6},
		{x = 32795, y = 31244, z = 6},
		{x = 32793, y = 31244, z = 6},
		{x = 32791, y = 31244, z = 6},
		{x = 32789, y = 31244, z = 6},
		{x = 32787, y = 31244, z = 6},
		{x = 32785, y = 31244, z = 6},
		{x = 32783, y = 31244, z = 6},
		{x = 32781, y = 31244, z = 6},
		{x = 32779, y = 31244, z = 6},
		{x = 32777, y = 31244, z = 6},
		{x = 33014, y = 32060, z = 7},
		{x = 33014, y = 32058, z = 7},
		{x = 33014, y = 32056, z = 7},
		{x = 33014, y = 32054, z = 7},
		{x = 33014, y = 32052, z = 7},
		{x = 33014, y = 32050, z = 7},
		{x = 33014, y = 32048, z = 7},
		{x = 33014, y = 32046, z = 7},
		{x = 33021, y = 32046, z = 7},
		{x = 33021, y = 32048, z = 7},
		{x = 33021, y = 32050, z = 7},
		{x = 33021, y = 32052, z = 7},
		{x = 33021, y = 32054, z = 7},
		{x = 33021, y = 32056, z = 7},
		{x = 32930, y = 32081, z = 7},
		{x = 32928, y = 32081, z = 7},
		{x = 32926, y = 32081, z = 7},
		{x = 32924, y = 32081, z = 7},
		{x = 32921, y = 32081, z = 7},
		{x = 32919, y = 32081, z = 7},
		{x = 32917, y = 32081, z = 7},
		{x = 32915, y = 32081, z = 7},
		{x = 32912, y = 32081, z = 7},
		{x = 32910, y = 32081, z = 7},
		{x = 32911, y = 32072, z = 7},
		{x = 32913, y = 32072, z = 7},
		{x = 32915, y = 32069, z = 7},
		{x = 32917, y = 32069, z = 7},
		{x = 32920, y = 32069, z = 7},
		{x = 32922, y = 32069, z = 7},
		{x = 32924, y = 32072, z = 7},
		{x = 32926, y = 32072, z = 7},
		{x = 32928, y = 32072, z = 7},
		{x = 32930, y = 32072, z = 7},
		{x = 32354, y = 32233, z = 8},
		{x = 32352, y = 32233, z = 8},
		{x = 32354, y = 32229, z = 8},
		{x = 32352, y = 32229, z = 8},
		{x = 32343, y = 32233, z = 8},
		{x = 32341, y = 32233, z = 8},
		{x = 32341, y = 32229, z = 8},
		{x = 32343, y = 32229, z = 8},
		{x = 32341, y = 32222, z = 8},
		{x = 32343, y = 32222, z = 8},
		{x = 32345, y = 32222, z = 8},
		{x = 32347, y = 32222, z = 8},
		{x = 32349, y = 32222, z = 8},
		{x = 32351, y = 32222, z = 8},
		{x = 32353, y = 32222, z = 8},
		{x = 32355, y = 32222, z = 8},
		{x = 32357, y = 32222, z = 8},
		{x = 32359, y = 32222, z = 8},
		{x = 32352, y = 32226, z = 7},
		{x = 32354, y = 32226, z = 7},
		{x = 32352, y = 32230, z = 7},
		{x = 32354, y = 32230, z = 7},
		{x = 32354, y = 32230, z = 6},
		{x = 32352, y = 32230, z = 6},
		{x = 32354, y = 32226, z = 6},
		{x = 32352, y = 32226, z = 6},
		{x = 32346, y = 32230, z = 6},
		{x = 32344, y = 32230, z = 6},
		{x = 32344, y = 32226, z = 6},
		{x = 32346, y = 32226, z = 6},
		{x = 32344, y = 32219, z = 6},
		{x = 32346, y = 32219, z = 6},
		{x = 32348, y = 32219, z = 6},
		{x = 32350, y = 32219, z = 6},
		{x = 32352, y = 32230, z = 5},
		{x = 32354, y = 32230, z = 5},
		{x = 32354, y = 32226, z = 5},
		{x = 32352, y = 32226, z = 5},
		{x = 32346, y = 32230, z = 5},
		{x = 32344, y = 32230, z = 5},
		{x = 32344, y = 32226, z = 5},
		{x = 32346, y = 32226, z = 5},
		{x = 32350, y = 32219, z = 5},
		{x = 32348, y = 32219, z = 5},
		{x = 32346, y = 32219, z = 5},
		{x = 32344, y = 32219, z = 5},
		{x = 32679, y = 31683, z = 8},
		{x = 32679, y = 31685, z = 8},
		{x = 32679, y = 31687, z = 8},
		{x = 32679, y = 31689, z = 8},
		{x = 32679, y = 31683, z = 7},
		{x = 32679, y = 31685, z = 7},
		{x = 32679, y = 31687, z = 7},
		{x = 32679, y = 31689, z = 7},
		{x = 32679, y = 31683, z = 6},
		{x = 32679, y = 31685, z = 6},
		{x = 32679, y = 31687, z = 6},
		{x = 32679, y = 31689, z = 6},
		{x = 32679, y = 31683, z = 5},
		{x = 32679, y = 31685, z = 5},
		{x = 32679, y = 31687, z = 5},
		{x = 32679, y = 31689, z = 5},
		{x = 32679, y = 31683, z = 4},
		{x = 32679, y = 31685, z = 4},
		{x = 32679, y = 31687, z = 4},
		{x = 32679, y = 31689, z = 4},
		{x = 32679, y = 31683, z = 3},
		{x = 32679, y = 31685, z = 3},
		{x = 32679, y = 31687, z = 3},
		{x = 32679, y = 31689, z = 3},
		{x = 32338, y = 31778, z = 7},
		{x = 32336, y = 31778, z = 7},
		{x = 32334, y = 31778, z = 7},
		{x = 32332, y = 31778, z = 7},
		{x = 32338, y = 31778, z = 6},
		{x = 32336, y = 31778, z = 6},
		{x = 32334, y = 31778, z = 6},
		{x = 32332, y = 31778, z = 6},
		{x = 32332, y = 31785, z = 6},
		{x = 32334, y = 31785, z = 6},
		{x = 32336, y = 31785, z = 6},
		{x = 32338, y = 31785, z = 6},
		{x = 32338, y = 31785, z = 5},
		{x = 32336, y = 31785, z = 5},
		{x = 32334, y = 31785, z = 5},
		{x = 32332, y = 31785, z = 5},
		{x = 32332, y = 31778, z = 5},
		{x = 32334, y = 31778, z = 5},
		{x = 32336, y = 31778, z = 5},
		{x = 32338, y = 31778, z = 5},
		{x = 32343, y = 31778, z = 8},
		{x = 32343, y = 31780, z = 8},
		{x = 32343, y = 31782, z = 8},
		{x = 32343, y = 31784, z = 8},
		{x = 32326, y = 31785, z = 8},
		{x = 32326, y = 31783, z = 8},
		{x = 32326, y = 31781, z = 8},
		{x = 32326, y = 31779, z = 8},
		{x = 32326, y = 31777, z = 8},
		{x = 32326, y = 31775, z = 8},
		{x = 32332, y = 31778, z = 8},
		{x = 32334, y = 31778, z = 8},
		{x = 32336, y = 31778, z = 8},
		{x = 32338, y = 31778, z = 8},
		{x = 32332, y = 31784, z = 8},
		{x = 32334, y = 31784, z = 8},
		{x = 32336, y = 31784, z = 8},
		{x = 32338, y = 31784, z = 8},
		{x = 32645, y = 31919, z = 8},
		{x = 32647, y = 31919, z = 8},
		{x = 32655, y = 31916, z = 8},
		{x = 32657, y = 31916, z = 8},
		{x = 32664, y = 31920, z = 8},
		{x = 32664, y = 31918, z = 8},
		{x = 32664, y = 31916, z = 8},
		{x = 32664, y = 31914, z = 8},
		{x = 32664, y = 31912, z = 8},
		{x = 32664, y = 31910, z = 8},
		{x = 32664, y = 31908, z = 8},
		{x = 32664, y = 31906, z = 8},
		{x = 32664, y = 31904, z = 8},
		{x = 32657, y = 31907, z = 8},
		{x = 32655, y = 31907, z = 8},
		{x = 32655, y = 31911, z = 8},
		{x = 32657, y = 31911, z = 8},
		{x = 32648, y = 31911, z = 8},
		{x = 32648, y = 31913, z = 8},
		{x = 33121, y = 32843, z = 7},
		{x = 33121, y = 32841, z = 7},
		{x = 33121, y = 32839, z = 7},
		{x = 33121, y = 32837, z = 7},
		{x = 33131, y = 32837, z = 7},
		{x = 33131, y = 32839, z = 7},
		{x = 33131, y = 32841, z = 7},
		{x = 33131, y = 32843, z = 7},
		{x = 33120, y = 32848, z = 7},
		{x = 33122, y = 32848, z = 7},
		{x = 33130, y = 32848, z = 7},
		{x = 33132, y = 32848, z = 7},
		{x = 33122, y = 32846, z = 6},
		{x = 33124, y = 32846, z = 6},
		{x = 33128, y = 32846, z = 6},
		{x = 33130, y = 32846, z = 6},
		{x = 33129, y = 32841, z = 6},
		{x = 33129, y = 32839, z = 6},
		{x = 33123, y = 32839, z = 6},
		{x = 33123, y = 32841, z = 6},
		{x = 33125, y = 32842, z = 5},
		{x = 33127, y = 32842, z = 5},
		{x = 33205, y = 32456, z = 8},
		{x = 33207, y = 32456, z = 8},
		{x = 33209, y = 32456, z = 8},
		{x = 33211, y = 32456, z = 8},
		{x = 33217, y = 32456, z = 8},
		{x = 33219, y = 32456, z = 8},
		{x = 33221, y = 32456, z = 8},
		{x = 33223, y = 32456, z = 8},
		{x = 33205, y = 32465, z = 8},
		{x = 33207, y = 32465, z = 8},
		{x = 33209, y = 32465, z = 8},
		{x = 33211, y = 32465, z = 8},
		{x = 33213, y = 32465, z = 8},
		{x = 33215, y = 32465, z = 8},
		{x = 33217, y = 32465, z = 8},
		{x = 33219, y = 32465, z = 8},
		{x = 33221, y = 32465, z = 8},
		{x = 33223, y = 32465, z = 8},
		{x = 33161, y = 31803, z = 8},
		{x = 33163, y = 31803, z = 8},
		{x = 33161, y = 31796, z = 8},
		{x = 33163, y = 31796, z = 8},
		{x = 33165, y = 31796, z = 8},
		{x = 33167, y = 31796, z = 8},
		{x = 33169, y = 31796, z = 8},
		{x = 33171, y = 31796, z = 8},
		{x = 33173, y = 31796, z = 8},
		{x = 33175, y = 31796, z = 8},
		{x = 33175, y = 31803, z = 8},
		{x = 33173, y = 31803, z = 8},
		{x = 33173, y = 31813, z = 9},
		{x = 33171, y = 31813, z = 9},
		{x = 33169, y = 31813, z = 9},
		{x = 33167, y = 31813, z = 9},
		{x = 33165, y = 31813, z = 9},
		{x = 33163, y = 31813, z = 9},
		{x = 33163, y = 31803, z = 9},
		{x = 33165, y = 31803, z = 9},
		{x = 33167, y = 31803, z = 9},
		{x = 33169, y = 31803, z = 9},
		{x = 33171, y = 31803, z = 9},
		{x = 33173, y = 31803, z = 9},
		{x = 33173, y = 31803, z = 10},
		{x = 33171, y = 31803, z = 10},
		{x = 33169, y = 31803, z = 10},
		{x = 33167, y = 31803, z = 10},
		{x = 33165, y = 31803, z = 10},
		{x = 33163, y = 31803, z = 10},
		{x = 33163, y = 31813, z = 10},
		{x = 33165, y = 31813, z = 10},
		{x = 33167, y = 31813, z = 10},
		{x = 33169, y = 31813, z = 10},
		{x = 33171, y = 31813, z = 10},
		{x = 33173, y = 31813, z = 10},
		{x = 33028, y = 31461, z = 11},
		{x = 33030, y = 31461, z = 11},
		{x = 33033, y = 31456, z = 11},
		{x = 33033, y = 31454, z = 11},
		{x = 33033, y = 31452, z = 11},
		{x = 33033, y = 31450, z = 11},
		{x = 33027, y = 31444, z = 11},
		{x = 33025, y = 31444, z = 11},
		{x = 33020, y = 31449, z = 11},
		{x = 33020, y = 31451, z = 11},
		{x = 33020, y = 31453, z = 11},
		{x = 33020, y = 31455, z = 11},
		{x = 32327, y = 32832, z = 7},
		{x = 32329, y = 32832, z = 7},
		{x = 32331, y = 32832, z = 7},
		{x = 32333, y = 32832, z = 7},
		{x = 32327, y = 32838, z = 7},
		{x = 32329, y = 32838, z = 7},
		{x = 32332, y = 32841, z = 7},
		{x = 32332, y = 32843, z = 7},
		{x = 32332, y = 32845, z = 7},
		{x = 32332, y = 32847, z = 7},
		{x = 32339, y = 32847, z = 7},
		{x = 32339, y = 32845, z = 7},
		{x = 32339, y = 32843, z = 7},
		{x = 32339, y = 32841, z = 7},
		{x = 32339, y = 32847, z = 6},
		{x = 32339, y = 32845, z = 6},
		{x = 32339, y = 32843, z = 6},
		{x = 32339, y = 32841, z = 6},
		{x = 32332, y = 32841, z = 6},
		{x = 32332, y = 32843, z = 6},
		{x = 32332, y = 32845, z = 6},
		{x = 32332, y = 32847, z = 6},
		{x = 32327, y = 32838, z = 6},
		{x = 32329, y = 32838, z = 6},
		{x = 32331, y = 32838, z = 6},
		{x = 32333, y = 32838, z = 6},
		{x = 32327, y = 32832, z = 6},
		{x = 32329, y = 32832, z = 6},
		{x = 32331, y = 32832, z = 6},
		{x = 32333, y = 32832, z = 6},
		{x = 32339, y = 32831, z = 6},
		{x = 32339, y = 32833, z = 6},
		{x = 32620, y = 32747, z = 7},
		{x = 32625, y = 32747, z = 7},
		{x = 32629, y = 32747, z = 7},
		{x = 32634, y = 32747, z = 7},
		{x = 32634, y = 32745, z = 7},
		{x = 32629, y = 32745, z = 7},
		{x = 32625, y = 32745, z = 7},
		{x = 32620, y = 32745, z = 7},
		{x = 32620, y = 32743, z = 7},
		{x = 32625, y = 32743, z = 7},
		{x = 32629, y = 32743, z = 7},
		{x = 32634, y = 32743, z = 7},
		{x = 32634, y = 32741, z = 7},
		{x = 32629, y = 32741, z = 7},
		{x = 32625, y = 32741, z = 7},
		{x = 32620, y = 32741, z = 7},
		{x = 32620, y = 32739, z = 7},
		{x = 32625, y = 32739, z = 7},
		{x = 32629, y = 32739, z = 7},
		{x = 32634, y = 32739, z = 7},
		{x = 32634, y = 32737, z = 7},
		{x = 32629, y = 32737, z = 7},
		{x = 32625, y = 32737, z = 7},
		{x = 32620, y = 32737, z = 7},
		{x = 32275, y = 31138, z = 7},
		{x = 32273, y = 31138, z = 7},
		{x = 32271, y = 31138, z = 7},
		{x = 32269, y = 31138, z = 7},
		{x = 32267, y = 31138, z = 7},
		{x = 32265, y = 31138, z = 7},
		{x = 32263, y = 31138, z = 7},
		{x = 32261, y = 31138, z = 7},
		{x = 32259, y = 31138, z = 7},
		{x = 32257, y = 31138, z = 7},
		{x = 32255, y = 31138, z = 7},
		{x = 32253, y = 31138, z = 7},
		{x = 32271, y = 31144, z = 7},
		{x = 32269, y = 31144, z = 7},
		{x = 32267, y = 31144, z = 7},
		{x = 32265, y = 31144, z = 7},
		{x = 32263, y = 31144, z = 7},
		{x = 32261, y = 31144, z = 7},
		{x = 32259, y = 31144, z = 7},
		{x = 32257, y = 31144, z = 7},
		{x = 32257, y = 31144, z = 6},
		{x = 32259, y = 31144, z = 6},
		{x = 32261, y = 31144, z = 6},
		{x = 32263, y = 31144, z = 6},
		{x = 32265, y = 31144, z = 6},
		{x = 32267, y = 31144, z = 6},
		{x = 32269, y = 31144, z = 6},
		{x = 32271, y = 31144, z = 6},
		{x = 32275, y = 31138, z = 6},
		{x = 32273, y = 31138, z = 6},
		{x = 32271, y = 31138, z = 6},
		{x = 32269, y = 31138, z = 6},
		{x = 32267, y = 31138, z = 6},
		{x = 32265, y = 31138, z = 6},
		{x = 32263, y = 31138, z = 6},
		{x = 32261, y = 31138, z = 6},
		{x = 32259, y = 31138, z = 6},
		{x = 32257, y = 31138, z = 6},
		{x = 32255, y = 31138, z = 6},
		{x = 32253, y = 31138, z = 6},
		{x = 33453, y = 31320, z = 8},
		{x = 33453, y = 31318, z = 8},
		{x = 33453, y = 31316, z = 8},
		{x = 33453, y = 31314, z = 8},
		{x = 33448, y = 31310, z = 8},
		{x = 33446, y = 31310, z = 8},
		{x = 33440, y = 31312, z = 8},
		{x = 33440, y = 31314, z = 8},
		{x = 33440, y = 31316, z = 8},
		{x = 33440, y = 31318, z = 8},
		{x = 33440, y = 31320, z = 8},
		{x = 33440, y = 31322, z = 8},
		{x = 32833, y = 31755, z = 10},
		{x = 32833, y = 31757, z = 10},
		{x = 32833, y = 31759, z = 10},
		{x = 32833, y = 31761, z = 10},
		{x = 32833, y = 31763, z = 10},
		{x = 32833, y = 31765, z = 10},
		{x = 32833, y = 31767, z = 10},
		{x = 32833, y = 31769, z = 10},
		{x = 32828, y = 31774, z = 10},
		{x = 32826, y = 31774, z = 10},
		{x = 32820, y = 31768, z = 10},
		{x = 32820, y = 31766, z = 10},
		{x = 32820, y = 31764, z = 10},
		{x = 32820, y = 31762, z = 10}
	}
	Chuitox.HUD.Map.Cities =
	{
		{ Name = "Unknown", Coordinates = { x = 1000000, y = 1000000, z = 7}, },
		{ Name = "Ab'Dendriel", Coordinates = { x = 32663, y = 31675, z = 7 } },
		{ Name = "Edron", Coordinates = { x = 33191, y = 31823, z = 7 } },
		{ Name = "Liberty Bay", Coordinates = { x = 32322, y = 32837, z = 7 } },
		{ Name = "Ankrahmun", Coordinates = { x = 33145, y = 32821, z = 7 } },
		{ Name = "Farmine", Coordinates = { x = 33024, y = 31535, z = 7 } },
		{ Name = "Port Hope", Coordinates = { x = 32624, y = 32756, z = 7 } },
		{ Name = "Thais", Coordinates = { x = 32368, y = 32214, z = 7 } },
		{ Name = "Venore", Coordinates = { x = 32921, y = 32070, z = 7 } },
		{ Name = "Carlin", Coordinates = { x = 32338, y = 31789, z = 7 } },
		{ Name = "Gray Beach", Coordinates = { x = 33458, y = 31320, z = 7 } },
		{ Name = "Rookgaard", Coordinates = { x = 32097, y = 32205, z = 7 } },
		{ Name = "Yalahar", Coordinates = { x = 32801, y = 31204, z = 7 } },
		{ Name = "Darashia", Coordinates = { x = 33232, y = 32431, z = 7 } },
		{ Name = "Kazordoon", Coordinates = { x = 32630, y = 31923, z = 7 } },
		{ Name = "Gnomebase", Coordinates = { x = 32797, y = 31776, z = 7 } },
		{ Name = "Svargrond", Coordinates = { x = 32260, y = 31146, z = 7 } }
	}
	Chuitox.HUD.Map.Distance = function(first, second)
		return math.max(math.abs(first.z - second.z), math.max(math.abs(first.x - second.x), math.abs(first.y - second.y)))
	end

	-- Math
	Chuitox.HUD.Math = {}
	Chuitox.HUD.Math.Format = function(value)
		local formatted = (value) and value or 0
		while (true) do  
			formatted, i = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
			if (i == 0) then
				break
			end
		end
		return formatted
	end
	Chuitox.HUD.Math.Round = function(number, format)
		local decimals = Chuitox.HUD.Details and 2 or 0
		local value = tonumber(string.format("%."..decimals.."f", number))
		if (format) then
			return Chuitox.HUD.Math.Format(value)
		else
			return value
		end
	end

	-- Items
	Chuitox.HUD.Items = {}
	Chuitox.HUD.Items.List =
	{
		{ ID = 107, Name = "special flask", Value = 0 },
		{ ID = 110, Name = "special flask", Value = 0 },
		{ ID = 112, Name = "magical watch", Value = 0 },
		{ ID = 113, Name = "the dwarven emperor's beard", Value = 0 },
		{ ID = 117, Name = "crate", Value = 0 },
		{ ID = 118, Name = "crate", Value = 0 },
		{ ID = 119, Name = "box", Value = 0 },
		{ ID = 120, Name = "some special leaves", Value = 0 },
		{ ID = 121, Name = "whoopee cushion", Value = 0 },
		{ ID = 123, Name = "toy mouse", Value = 0 },
		{ ID = 124, Name = "easily inflammable sulphur", Value = 0 },
		{ ID = 125, Name = "special flask", Value = 0 },
		{ ID = 126, Name = "special flask", Value = 0 },
		{ ID = 127, Name = "magical inkwell", Value = 0 },
		{ ID = 128, Name = "signed contract", Value = 0 },
		{ ID = 129, Name = "contract", Value = 0 },
		{ ID = 130, Name = "exploding cookie", Value = 0 },
		{ ID = 131, Name = "ectoplasm container", Value = 0 },
		{ ID = 133, Name = "special flask", Value = 0 },
		{ ID = 135, Name = "special flask", Value = 0 },
		{ ID = 136, Name = "beer bottle", Value = 0 },
		{ ID = 138, Name = "empty beer bottle", Value = 0 },
		{ ID = 139, Name = "mining helmet", Value = 0 },
		{ ID = 140, Name = "parcel", Value = 0 },
		{ ID = 141, Name = "cigar", Value = 0 },
		{ ID = 142, Name = "bale of white cloth", Value = 0 },
		{ ID = 143, Name = "bale of yellowed cloth", Value = 0 },
		{ ID = 144, Name = "mummy disguise", Value = 0 },
		{ ID = 145, Name = "heavy package", Value = 0 },
		{ ID = 170, Name = "fake dwarven beard", Value = 0 },
		{ ID = 172, Name = "parchment (poetry)", Value = 0 },
		{ ID = 235, Name = "bag (ahmet)", Value = 0 },
		{ ID = 236, Name = "strong health potion", Value = 100 },
		{ ID = 237, Name = "strong mana potion", Value = 80 },
		{ ID = 238, Name = "great mana potion", Value = 120 },
		{ ID = 239, Name = "great health potion", Value = 190 },
		{ ID = 266, Name = "health potion", Value = 45 },
		{ ID = 268, Name = "mana potion", Value = 50 },
		{ ID = 281, Name = "giant shimmering pearl", Value = 3000 },
		{ ID = 282, Name = "giant shimmering pearl", Value = 3000 },
		{ ID = 283, Name = "empty potion flask", Value = 5 },
		{ ID = 284, Name = "empty potion flask", Value = 5 },
		{ ID = 285, Name = "empty potion flask", Value = 5 },
		{ ID = 306, Name = "empty flower pot", Value = 0 },
		{ ID = 347, Name = "scroll", Value = 0 },
		{ ID = 348, Name = "intelligence reports", Value = 0 },
		{ ID = 349, Name = "signet ring", Value = 0 },
		{ ID = 350, Name = "case of rust bugs", Value = 0 },
		{ ID = 396, Name = "technomancer beard", Value = 0 },
		{ ID = 397, Name = "amazon disguise kit", Value = 0 },
		{ ID = 399, Name = "building plans for a ship", Value = 0 },
		{ ID = 400, Name = "suspicious documents", Value = 0 },
		{ ID = 401, Name = "book", Value = 0 },
		{ ID = 402, Name = "secret letter", Value = 0 },
		{ ID = 403, Name = "file ah-x17l89", Value = 0 },
		{ ID = 404, Name = "barrel of beer", Value = 0 },
		{ ID = 405, Name = "weapons crate", Value = 0 },
		{ ID = 645, Name = "blue legs", Value = 12000 },
		{ ID = 646, Name = "elvenhair rope", Value = 0 },
		{ ID = 647, Name = "seeds", Value = 0 },
		{ ID = 648, Name = "nature magic spellbook", Value = 0 },
		{ ID = 649, Name = "flower bouquet", Value = 0 },
		{ ID = 650, Name = "watering can", Value = 0 },
		{ ID = 651, Name = "spellwand", Value = 0 },
		{ ID = 652, Name = "rotten heart of a tree", Value = 0 },
		{ ID = 653, Name = "costume bag", Value = 0 },
		{ ID = 654, Name = "costume bag", Value = 0 },
		{ ID = 655, Name = "constume bag", Value = 0 },
		{ ID = 660, Name = "fiery spike sword", Value = 1000 },
		{ ID = 661, Name = "fiery relic sword", Value = 0 },
		{ ID = 662, Name = "fiery mystic blade", Value = 0 },
		{ ID = 663, Name = "fiery blacksteel sword", Value = 0 },
		{ ID = 664, Name = "fiery dragon slayer", Value = 15000 },
		{ ID = 665, Name = "fiery barbarian axe", Value = 0 },
		{ ID = 666, Name = "fiery knight axe", Value = 2000 },
		{ ID = 667, Name = "fiery heroic axe", Value = 0 },
		{ ID = 668, Name = "fiery headchopper", Value = 0 },
		{ ID = 669, Name = "fiery war axe", Value = 9000 },
		{ ID = 670, Name = "fiery clerical mace", Value = 0 },
		{ ID = 671, Name = "fiery crystal mace", Value = 0 },
		{ ID = 672, Name = "fiery cranial basher", Value = 0 },
		{ ID = 673, Name = "fiery orcish maul", Value = 0 },
		{ ID = 674, Name = "fiery war hammer", Value = 1200 },
		{ ID = 675, Name = "small enchanted sapphire", Value = 0 },
		{ ID = 676, Name = "small enchanted ruby", Value = 0 },
		{ ID = 677, Name = "small enchanted emerald", Value = 0 },
		{ ID = 678, Name = "small enchanted amethyst", Value = 0 },
		{ ID = 679, Name = "icy spike sword", Value = 1000 },
		{ ID = 680, Name = "icy relic sword", Value = 0 },
		{ ID = 681, Name = "icy mystic blade", Value = 0 },
		{ ID = 682, Name = "icy blacksteel sword", Value = 0 },
		{ ID = 683, Name = "icy dragon slayer", Value = 15000 },
		{ ID = 684, Name = "icy barbarian axe", Value = 0 },
		{ ID = 685, Name = "icy knight axe", Value = 2000 },
		{ ID = 686, Name = "icy heroic axe", Value = 0 },
		{ ID = 687, Name = "icy headchopper", Value = 0 },
		{ ID = 688, Name = "icy war axe", Value = 9000 },
		{ ID = 689, Name = "icy clerical mace", Value = 0 },
		{ ID = 690, Name = "icy crystal mace", Value = 0 },
		{ ID = 691, Name = "icy cranial basher", Value = 0 },
		{ ID = 692, Name = "icy orcish maul", Value = 0 },
		{ ID = 693, Name = "icy war hammer", Value = 1200 },
		{ ID = 761, Name = "flash arrow", Value = 0 },
		{ ID = 762, Name = "shiver arrow", Value = 0 },
		{ ID = 763, Name = "flaming arrow", Value = 0 },
		{ ID = 768, Name = "document of the follower", Value = 0 },
		{ ID = 769, Name = "document of the officer", Value = 0 },
		{ ID = 770, Name = "document of the leader", Value = 0 },
		{ ID = 774, Name = "earth arrow", Value = 0 },
		{ ID = 779, Name = "earth spike sword", Value = 1000 },
		{ ID = 780, Name = "earth relic sword", Value = 0 },
		{ ID = 781, Name = "earth mystic blade", Value = 0 },
		{ ID = 782, Name = "earth blacksteel sword", Value = 0 },
		{ ID = 783, Name = "earth dragon slayer", Value = 15000 },
		{ ID = 784, Name = "earth barbarian axe", Value = 0 },
		{ ID = 785, Name = "earth knight axe", Value = 2000 },
		{ ID = 786, Name = "earth heroic axe", Value = 0 },
		{ ID = 787, Name = "earth headchopper", Value = 0 },
		{ ID = 788, Name = "earth war axe", Value = 9000 },
		{ ID = 789, Name = "earth clerical mace", Value = 0 },
		{ ID = 790, Name = "earth crystal mace", Value = 0 },
		{ ID = 791, Name = "earth cranial basher", Value = 0 },
		{ ID = 792, Name = "earth orcish maul", Value = 0 },
		{ ID = 793, Name = "earth war hammer", Value = 1200 },
		{ ID = 794, Name = "energy spike sword", Value = 1000 },
		{ ID = 795, Name = "energy relic sword", Value = 0 },
		{ ID = 796, Name = "energy mystic blade", Value = 0 },
		{ ID = 797, Name = "energy blacksteel sword", Value = 0 },
		{ ID = 798, Name = "energy dragon slayer", Value = 15000 },
		{ ID = 801, Name = "energy barbarian axe", Value = 0 },
		{ ID = 802, Name = "energy knight axe", Value = 2000 },
		{ ID = 803, Name = "energy heroic axe", Value = 0 },
		{ ID = 804, Name = "energy headchopper", Value = 0 },
		{ ID = 805, Name = "energy war axe", Value = 9000 },
		{ ID = 806, Name = "energy clerical mace", Value = 0 },
		{ ID = 807, Name = "energy crystal mace", Value = 0 },
		{ ID = 808, Name = "energy cranial basher", Value = 0 },
		{ ID = 809, Name = "energy orcish maul", Value = 0 },
		{ ID = 810, Name = "energy war hammer", Value = 1200 },
		{ ID = 811, Name = "terra mantle", Value = 11000 },
		{ ID = 812, Name = "terra legs", Value = 11000 },
		{ ID = 813, Name = "terra boots", Value = 2500 },
		{ ID = 814, Name = "terra amulet", Value = 1500 },
		{ ID = 815, Name = "glacier amulet", Value = 1500 },
		{ ID = 816, Name = "lightning pendant", Value = 1500 },
		{ ID = 817, Name = "magma amulet", Value = 1500 },
		{ ID = 818, Name = "magma boots", Value = 2500 },
		{ ID = 819, Name = "glacier shoes", Value = 2500 },
		{ ID = 820, Name = "lightning boots", Value = 2500 },
		{ ID = 821, Name = "magma legs", Value = 11000 },
		{ ID = 822, Name = "lightning legs", Value = 11000 },
		{ ID = 823, Name = "glacier kilt", Value = 11000 },
		{ ID = 824, Name = "glacier robe", Value = 11000 },
		{ ID = 825, Name = "lightning robe", Value = 11000 },
		{ ID = 826, Name = "magma coat", Value = 11000 },
		{ ID = 827, Name = "magma monocle", Value = 2500 },
		{ ID = 828, Name = "lightning headband", Value = 2500 },
		{ ID = 829, Name = "glacier mask", Value = 2500 },
		{ ID = 830, Name = "terra hood", Value = 2500 },
		{ ID = 831, Name = "green bed kit", Value = 0 },
		{ ID = 832, Name = "yellow bed kit", Value = 0 },
		{ ID = 833, Name = "red bed kit", Value = 0 },
		{ ID = 834, Name = "blue bed kit", Value = 0 },
		{ ID = 836, Name = "walnut", Value = 0 },
		{ ID = 841, Name = "peanut", Value = 0 },
		{ ID = 860, Name = "crimson sword (uzgod)", Value = 0 },
		{ ID = 872, Name = "trophy stand", Value = 0 },
		{ ID = 875, Name = "mining helmet", Value = 0 },
		{ ID = 892, Name = "package of potions", Value = 0 },
		{ ID = 893, Name = "waterball", Value = 0 },
		{ ID = 894, Name = "jester hat", Value = 0 },
		{ ID = 895, Name = "jester staff", Value = 0 },
		{ ID = 896, Name = "firlefanz", Value = 0 },
		{ ID = 897, Name = "mysterious package", Value = 0 },
		{ ID = 898, Name = "mysterious package", Value = 0 },
		{ ID = 899, Name = "mysterious package", Value = 0 },
		{ ID = 900, Name = "yellow pillow (supersoft)", Value = 0 },
		{ ID = 901, Name = "marlin", Value = 0 },
		{ ID = 902, Name = "marlin trophy", Value = 5000 },
		{ ID = 903, Name = "badger fur", Value = 15 },
		{ ID = 904, Name = "throwing cake", Value = 0 },
		{ ID = 906, Name = "present (explosive)", Value = 0 },
		{ ID = 907, Name = "shapeshifter ring", Value = 0 },
		{ ID = 919, Name = "hallowed axe", Value = 0 },
		{ ID = 939, Name = "bait", Value = 0 },
		{ ID = 940, Name = "natural soil", Value = 2000 },
		{ ID = 941, Name = "glimmering soil", Value = 2000 },
		{ ID = 942, Name = "flawless ice crystal", Value = 0 },
		{ ID = 943, Name = "holy soil", Value = 0 },
		{ ID = 944, Name = "iced soil", Value = 2000 },
		{ ID = 945, Name = "energy soil", Value = 2000 },
		{ ID = 946, Name = "eternal flames", Value = 0 },
		{ ID = 947, Name = "mother soil", Value = 5000 },
		{ ID = 948, Name = "pure energy", Value = 0 },
		{ ID = 953, Name = "nail", Value = 10 },
		{ ID = 954, Name = "neutral matter", Value = 5000 },
		{ ID = 1781, Name = "small stone", Value = 0 },
		{ ID = 2386, Name = "small purple pillow", Value = 0 },
		{ ID = 2387, Name = "small green pillow", Value = 0 },
		{ ID = 2388, Name = "small red pillow", Value = 0 },
		{ ID = 2389, Name = "small blue pillow", Value = 0 },
		{ ID = 2390, Name = "small orange pillow", Value = 0 },
		{ ID = 2391, Name = "small turquoise pillow", Value = 0 },
		{ ID = 2392, Name = "small white pillow", Value = 0 },
		{ ID = 2393, Name = "heart pillow", Value = 0 },
		{ ID = 2394, Name = "blue pillow", Value = 0 },
		{ ID = 2395, Name = "red pillow", Value = 0 },
		{ ID = 2396, Name = "green pillow", Value = 0 },
		{ ID = 2397, Name = "yellow pillow", Value = 0 },
		{ ID = 2398, Name = "round blue pillow", Value = 0 },
		{ ID = 2399, Name = "round red pillow", Value = 0 },
		{ ID = 2400, Name = "round purple pillow", Value = 0 },
		{ ID = 2401, Name = "round turquoise pillow", Value = 0 },
		{ ID = 2469, Name = "box", Value = 0 },
		{ ID = 2471, Name = "crate", Value = 0 },
		{ ID = 2472, Name = "chest", Value = 0 },
		{ ID = 2473, Name = "box (brown)", Value = 0 },
		{ ID = 2478, Name = "treasure chest", Value = 0 },
		{ ID = 2480, Name = "chest", Value = 0 },
		{ ID = 2481, Name = "chest", Value = 0 },
		{ ID = 2482, Name = "chest", Value = 0 },
		{ ID = 2632, Name = "wall mirror", Value = 0 },
		{ ID = 2635, Name = "wall mirror", Value = 0 },
		{ ID = 2638, Name = "wall mirror", Value = 0 },
		{ ID = 2639, Name = "picture", Value = 0 },
		{ ID = 2641, Name = "picture", Value = 0 },
		{ ID = 2644, Name = "purple tapestry", Value = 0 },
		{ ID = 2647, Name = "green tapestry", Value = 0 },
		{ ID = 2650, Name = "yellow tapestry", Value = 0 },
		{ ID = 2653, Name = "orange tapestry", Value = 0 },
		{ ID = 2656, Name = "red tapestry", Value = 0 },
		{ ID = 2659, Name = "blue tapestry", Value = 0 },
		{ ID = 2664, Name = "cuckoo clock", Value = 0 },
		{ ID = 2667, Name = "white tapestry", Value = 0 },
		{ ID = 2668, Name = "cuckoo clock", Value = 0 },
		{ ID = 2775, Name = "red cushioned chair kit", Value = 0 },
		{ ID = 2776, Name = "green cushioned chair kit", Value = 0 },
		{ ID = 2777, Name = "wooden chair kit", Value = 0 },
		{ ID = 2778, Name = "rocking chair kit", Value = 0 },
		{ ID = 2779, Name = "sofa chair kit", Value = 0 },
		{ ID = 2780, Name = "tusk chair kit", Value = 0 },
		{ ID = 2781, Name = "ivory chair kit", Value = 0 },
		{ ID = 2782, Name = "small table kit", Value = 0 },
		{ ID = 2783, Name = "round table kit", Value = 0 },
		{ ID = 2784, Name = "square table kit", Value = 0 },
		{ ID = 2785, Name = "big table kit", Value = 0 },
		{ ID = 2786, Name = "stone table kit", Value = 0 },
		{ ID = 2787, Name = "tusk table kit", Value = 0 },
		{ ID = 2788, Name = "bamboo table kit", Value = 0 },
		{ ID = 2789, Name = "drawer kit", Value = 0 },
		{ ID = 2790, Name = "dresser kit", Value = 0 },
		{ ID = 2791, Name = "locker kit", Value = 0 },
		{ ID = 2792, Name = "trough kit", Value = 0 },
		{ ID = 2793, Name = "barrel kit", Value = 0 },
		{ ID = 2794, Name = "trunk kit", Value = 0 },
		{ ID = 2795, Name = "bamboo drawer kit", Value = 0 },
		{ ID = 2796, Name = "birdcage kit", Value = 0 },
		{ ID = 2797, Name = "globe kit", Value = 0 },
		{ ID = 2798, Name = "table lamp kit", Value = 0 },
		{ ID = 2799, Name = "telescope kit", Value = 0 },
		{ ID = 2800, Name = "rocking horse kit", Value = 0 },
		{ ID = 2801, Name = "pendulum clock kit", Value = 0 },
		{ ID = 2802, Name = "knight statue kit", Value = 0 },
		{ ID = 2803, Name = "minotaur statue kit", Value = 0 },
		{ ID = 2804, Name = "goblin statue kit", Value = 0 },
		{ ID = 2805, Name = "large amphora kit", Value = 0 },
		{ ID = 2806, Name = "coal basin kit", Value = 0 },
		{ ID = 2807, Name = "piano kit", Value = 0 },
		{ ID = 2808, Name = "harp kit", Value = 0 },
		{ ID = 2809, Name = "trunk chair kit", Value = 0 },
		{ ID = 2810, Name = "trunk table kit", Value = 0 },
		{ ID = 2811, Name = "indoor plant kit", Value = 0 },
		{ ID = 2848, Name = "purple tome", Value = 2000 },
		{ ID = 2849, Name = "green tome", Value = 0 },
		{ ID = 2850, Name = "blue tome", Value = 0 },
		{ ID = 2851, Name = "grey tome", Value = 0 },
		{ ID = 2852, Name = "red tome", Value = 2000 },
		{ ID = 2853, Name = "bag", Value = 0 },
		{ ID = 2854, Name = "backpack", Value = 0 },
		{ ID = 2855, Name = "basket", Value = 0 },
		{ ID = 2856, Name = "present", Value = 0 },
		{ ID = 2857, Name = "green bag", Value = 0 },
		{ ID = 2858, Name = "yellow bag", Value = 0 },
		{ ID = 2859, Name = "red bag", Value = 0 },
		{ ID = 2860, Name = "purple bag", Value = 0 },
		{ ID = 2861, Name = "blue bag", Value = 0 },
		{ ID = 2862, Name = "grey bag", Value = 0 },
		{ ID = 2863, Name = "golden bag", Value = 0 },
		{ ID = 2864, Name = "camouflage bag", Value = 0 },
		{ ID = 2865, Name = "green backpack", Value = 0 },
		{ ID = 2866, Name = "yellow backpack", Value = 0 },
		{ ID = 2867, Name = "red backpack", Value = 0 },
		{ ID = 2868, Name = "purple backpack", Value = 0 },
		{ ID = 2869, Name = "blue backpack", Value = 0 },
		{ ID = 2870, Name = "grey backpack", Value = 0 },
		{ ID = 2871, Name = "golden backpack", Value = 0 },
		{ ID = 2872, Name = "camouflage backpack", Value = 0 },
		{ ID = 2873, Name = "bucket", Value = 0 },
		{ ID = 2874, Name = "vial", Value = 5 },
		{ ID = 2875, Name = "bottle", Value = 0 },
		{ ID = 2876, Name = "vase", Value = 0 },
		{ ID = 2877, Name = "green flask", Value = 0 },
		{ ID = 2879, Name = "elven vase", Value = 0 },
		{ ID = 2880, Name = "mug", Value = 0 },
		{ ID = 2881, Name = "cup", Value = 0 },
		{ ID = 2882, Name = "jug", Value = 0 },
		{ ID = 2883, Name = "cup (pirate)", Value = 0 },
		{ ID = 2884, Name = "cup", Value = 0 },
		{ ID = 2885, Name = "brown flask", Value = 0 },
		{ ID = 2893, Name = "amphora", Value = 0 },
		{ ID = 2901, Name = "waterskin", Value = 0 },
		{ ID = 2902, Name = "bowl", Value = 0 },
		{ ID = 2903, Name = "golden mug", Value = 250 },
		{ ID = 2905, Name = "plate", Value = 0 },
		{ ID = 2906, Name = "watch", Value = 0 },
		{ ID = 2911, Name = "candelabrum", Value = 0 },
		{ ID = 2914, Name = "lamp", Value = 0 },
		{ ID = 2917, Name = "candlestick", Value = 0 },
		{ ID = 2920, Name = "torch", Value = 0 },
		{ ID = 2932, Name = "oil lamp", Value = 190 },
		{ ID = 2933, Name = "small oil lamp", Value = 0 },
		{ ID = 2948, Name = "wooden flute", Value = 0 },
		{ ID = 2949, Name = "lyre", Value = 0 },
		{ ID = 2950, Name = "lute", Value = 0 },
		{ ID = 2951, Name = "bongo drum", Value = 0 },
		{ ID = 2952, Name = "drum", Value = 0 },
		{ ID = 2953, Name = "panpipes", Value = 0 },
		{ ID = 2954, Name = "simple fanfare", Value = 0 },
		{ ID = 2955, Name = "fanfare", Value = 0 },
		{ ID = 2956, Name = "royal fanfare", Value = 0 },
		{ ID = 2957, Name = "post horn", Value = 0 },
		{ ID = 2958, Name = "war horn", Value = 0 },
		{ ID = 2965, Name = "dIDgerIDoo", Value = 0 },
		{ ID = 2966, Name = "war drum", Value = 0 },
		{ ID = 2974, Name = "water pipe", Value = 0 },
		{ ID = 2977, Name = "pumpkinhead", Value = 0 },
		{ ID = 2978, Name = "pumpkinhead", Value = 0 },
		{ ID = 2980, Name = "water pipe (deluxe)", Value = 0 },
		{ ID = 2981, Name = "god flowers", Value = 0 },
		{ ID = 2983, Name = "flower bowl", Value = 0 },
		{ ID = 2984, Name = "honey flower", Value = 0 },
		{ ID = 2985, Name = "potted flower", Value = 0 },
		{ ID = 2988, Name = "exotic flowers", Value = 0 },
		{ ID = 2989, Name = "wooden doll", Value = 0 },
		{ ID = 2991, Name = "doll", Value = 200 },
		{ ID = 2992, Name = "snowball", Value = 0 },
		{ ID = 2993, Name = "teddy bear", Value = 0 },
		{ ID = 2994, Name = "model ship", Value = 0 },
		{ ID = 2995, Name = "piggy bank", Value = 0 },
		{ ID = 3001, Name = "bear doll", Value = 0 },
		{ ID = 3002, Name = "voodoo doll", Value = 400 },
		{ ID = 3003, Name = "rope", Value = 15 },
		{ ID = 3004, Name = "wedding ring", Value = 100 },
		{ ID = 3005, Name = "elven brooch", Value = 0 },
		{ ID = 3006, Name = "ring of the sky", Value = 30000 },
		{ ID = 3007, Name = "crystal ring", Value = 250 },
		{ ID = 3008, Name = "crystal necklace", Value = 400 },
		{ ID = 3009, Name = "bronze necklace", Value = 0 },
		{ ID = 3010, Name = "emerald bangle", Value = 800 },
		{ ID = 3011, Name = "crown", Value = 0 },
		{ ID = 3012, Name = "wolf tooth chain", Value = 100 },
		{ ID = 3013, Name = "golden amulet", Value = 2000 },
		{ ID = 3014, Name = "star amulet", Value = 500 },
		{ ID = 3015, Name = "silver necklace", Value = 0 },
		{ ID = 3016, Name = "ruby necklace", Value = 2000 },
		{ ID = 3017, Name = "silver brooch", Value = 150 },
		{ ID = 3018, Name = "scarab amulet", Value = 200 },
		{ ID = 3019, Name = "demonbone amulet", Value = 32000 },
		{ ID = 3020, Name = "some golden fruits", Value = 0 },
		{ ID = 3021, Name = "sapphire amulet", Value = 0 },
		{ ID = 3022, Name = "ancient tiara", Value = 0 },
		{ ID = 3023, Name = "holy scarab", Value = 0 },
		{ ID = 3024, Name = "holy falcon", Value = 0 },
		{ ID = 3025, Name = "ancient amulet", Value = 200 },
		{ ID = 3026, Name = "white pearl", Value = 160 },
		{ ID = 3027, Name = "black pearl", Value = 280 },
		{ ID = 3028, Name = "small diamond", Value = 300 },
		{ ID = 3029, Name = "small sapphire", Value = 250 },
		{ ID = 3030, Name = "small ruby", Value = 250 },
		{ ID = 3031, Name = "gold coin", Value = 1 },
		{ ID = 3032, Name = "small emerald", Value = 250 },
		{ ID = 3033, Name = "small amethyst", Value = 200 },
		{ ID = 3034, Name = "talon", Value = 320 },
		{ ID = 3035, Name = "platinum coin", Value = 100 },
		{ ID = 3036, Name = "violet gem", Value = 10000 },
		{ ID = 3037, Name = "yellow gem", Value = 1000 },
		{ ID = 3038, Name = "green gem", Value = 5000 },
		{ ID = 3039, Name = "red gem", Value = 1000 },
		{ ID = 3040, Name = "gold nugget", Value = 0 },
		{ ID = 3041, Name = "blue gem", Value = 5000 },
		{ ID = 3042, Name = "scarab coin", Value = 0 },
		{ ID = 3043, Name = "crystal coin", Value = 10000 },
		{ ID = 3044, Name = "tusk", Value = 100 },
		{ ID = 3045, Name = "strange talisman", Value = 30 },
		{ ID = 3046, Name = "magic light wand", Value = 35 },
		{ ID = 3048, Name = "might ring", Value = 250 },
		{ ID = 3049, Name = "stealth ring", Value = 200 },
		{ ID = 3050, Name = "power ring", Value = 50 },
		{ ID = 3051, Name = "energy ring", Value = 100 },
		{ ID = 3052, Name = "life ring", Value = 50 },
		{ ID = 3053, Name = "time ring", Value = 100 },
		{ ID = 3054, Name = "silver amulet", Value = 50 },
		{ ID = 3055, Name = "platinum amulet", Value = 2500 },
		{ ID = 3056, Name = "bronze amulet", Value = 50 },
		{ ID = 3057, Name = "amulet of loss", Value = 45000 },
		{ ID = 3058, Name = "strange symbol", Value = 0 },
		{ ID = 3059, Name = "spellbook", Value = 0 },
		{ ID = 3060, Name = "orb", Value = 750 },
		{ ID = 3061, Name = "life crystal", Value = 85 },
		{ ID = 3062, Name = "mind stone", Value = 170 },
		{ ID = 3063, Name = "gold ring", Value = 8000 },
		{ ID = 3065, Name = "terra rod", Value = 2000 },
		{ ID = 3066, Name = "snakebite rod", Value = 100 },
		{ ID = 3067, Name = "hailstorm rod", Value = 3000 },
		{ ID = 3068, Name = "crystal wand", Value = 10000 },
		{ ID = 3069, Name = "necrotic rod", Value = 1000 },
		{ ID = 3070, Name = "moonlight rod", Value = 200 },
		{ ID = 3071, Name = "wand of inferno", Value = 3000 },
		{ ID = 3072, Name = "wand of decay", Value = 1000 },
		{ ID = 3073, Name = "wand of cosmic energy", Value = 2000 },
		{ ID = 3074, Name = "wand of vortex", Value = 100 },
		{ ID = 3075, Name = "wand of dragonbreath", Value = 200 },
		{ ID = 3076, Name = "crystal ball", Value = 190 },
		{ ID = 3077, Name = "ankh", Value = 100 },
		{ ID = 3078, Name = "mysterious fetish", Value = 50 },
		{ ID = 3079, Name = "boots of haste", Value = 30000 },
		{ ID = 3080, Name = "broken amulet", Value = 0 },
		{ ID = 3081, Name = "stone skin amulet", Value = 500 },
		{ ID = 3082, Name = "elven amulet", Value = 100 },
		{ ID = 3083, Name = "garlic necklace", Value = 50 },
		{ ID = 3084, Name = "protection amulet", Value = 100 },
		{ ID = 3085, Name = "dragon necklace", Value = 100 },
		{ ID = 3091, Name = "sword ring", Value = 100 },
		{ ID = 3092, Name = "axe ring", Value = 100 },
		{ ID = 3093, Name = "club ring", Value = 100 },
		{ ID = 3097, Name = "dwarven ring", Value = 100 },
		{ ID = 3098, Name = "ring of healing", Value = 100 },
		{ ID = 3101, Name = "spellbook", Value = 0 },
		{ ID = 3102, Name = "paw amulet", Value = 0 },
		{ ID = 3103, Name = "cornucopia", Value = 0 },
		{ ID = 3104, Name = "banana skin", Value = 0 },
		{ ID = 3105, Name = "dirty fur", Value = 0 },
		{ ID = 3110, Name = "piece of iron", Value = 0 },
		{ ID = 3114, Name = "skull", Value = 0 },
		{ ID = 3115, Name = "bone", Value = 0 },
		{ ID = 3120, Name = "mouldy cheese", Value = 0 },
		{ ID = 3147, Name = "blank rune", Value = 0 },
		{ ID = 3148, Name = "destroy field rune", Value = 0 },
		{ ID = 3149, Name = "energy bomb rune", Value = 0 },
		{ ID = 3152, Name = "intense healing rune", Value = 0 },
		{ ID = 3153, Name = "antIDote rune", Value = 0 },
		{ ID = 3155, Name = "sudden death rune", Value = 0 },
		{ ID = 3156, Name = "wild growth rune", Value = 0 },
		{ ID = 3160, Name = "ultimate healing rune", Value = 0 },
		{ ID = 3161, Name = "avalanche rune", Value = 0 },
		{ ID = 3164, Name = "energy field rune", Value = 0 },
		{ ID = 3165, Name = "paralyze rune", Value = 0 },
		{ ID = 3166, Name = "energy wall rune", Value = 0 },
		{ ID = 3172, Name = "poison field rune", Value = 0 },
		{ ID = 3173, Name = "poison bomb rune", Value = 0 },
		{ ID = 3174, Name = "light magic missile rune", Value = 0 },
		{ ID = 3175, Name = "stone shower rune", Value = 0 },
		{ ID = 3176, Name = "poison wall rune", Value = 0 },
		{ ID = 3177, Name = "convince creature rune", Value = 0 },
		{ ID = 3178, Name = "chameleon rune", Value = 0 },
		{ ID = 3179, Name = "stalagmite rune", Value = 0 },
		{ ID = 3180, Name = "magic wall rune", Value = 0 },
		{ ID = 3182, Name = "holy missile rune", Value = 0 },
		{ ID = 3188, Name = "fire field rune", Value = 0 },
		{ ID = 3189, Name = "fireball rune", Value = 0 },
		{ ID = 3190, Name = "fire wall rune", Value = 0 },
		{ ID = 3191, Name = "great fireball rune", Value = 0 },
		{ ID = 3192, Name = "fire bomb rune", Value = 0 },
		{ ID = 3195, Name = "soulfire rune", Value = 0 },
		{ ID = 3197, Name = "desintegrate rune", Value = 0 },
		{ ID = 3198, Name = "heavy magic missile rune", Value = 0 },
		{ ID = 3200, Name = "explosion rune", Value = 0 },
		{ ID = 3202, Name = "thunderstorm rune", Value = 0 },
		{ ID = 3203, Name = "animate dead rune", Value = 0 },
		{ ID = 3205, Name = "family brooch", Value = 0 },
		{ ID = 3206, Name = "dragonfetish", Value = 0 },
		{ ID = 3207, Name = "skull of ratha", Value = 0 },
		{ ID = 3208, Name = "giant smithhammer", Value = 250 },
		{ ID = 3209, Name = "voodoo doll (king)", Value = 0 },
		{ ID = 3210, Name = "hat of the mad", Value = 0 },
		{ ID = 3211, Name = "witchesbroom", Value = 0 },
		{ ID = 3213, Name = "annihilation bear", Value = 0 },
		{ ID = 3214, Name = "blessed ankh", Value = 0 },
		{ ID = 3215, Name = "phoenix egg", Value = 0 },
		{ ID = 3216, Name = "bill", Value = 0 },
		{ ID = 3217, Name = "letterbag", Value = 0 },
		{ ID = 3218, Name = "present (postman)", Value = 0 },
		{ ID = 3219, Name = "waldo's post horn", Value = 0 },
		{ ID = 3220, Name = "letter to markwin", Value = 0 },
		{ ID = 3222, Name = "helmet ornament", Value = 0 },
		{ ID = 3223, Name = "gem holder", Value = 0 },
		{ ID = 3224, Name = "right horn", Value = 0 },
		{ ID = 3225, Name = "left horn", Value = 0 },
		{ ID = 3226, Name = "damaged helmet", Value = 0 },
		{ ID = 3227, Name = "helmet piece", Value = 0 },
		{ ID = 3228, Name = "helmet adornment", Value = 0 },
		{ ID = 3229, Name = "helmet of the ancients", Value = 0 },
		{ ID = 3230, Name = "full helmet of the ancients", Value = 0 },
		{ ID = 3231, Name = "gemmed lamp", Value = 0 },
		{ ID = 3232, Name = "spyreport", Value = 0 },
		{ ID = 3233, Name = "tear of daraman", Value = 0 },
		{ ID = 3234, Name = "cookbook", Value = 0 },
		{ ID = 3242, Name = "stuffed bunny", Value = 0 },
		{ ID = 3243, Name = "gemmed lamp", Value = 0 },
		{ ID = 3244, Name = "old and used backpack", Value = 0 },
		{ ID = 3245, Name = "ring of wishes", Value = 0 },
		{ ID = 3246, Name = "boots of waterwalking", Value = 0 },
		{ ID = 3247, Name = "djinn's lamp", Value = 0 },
		{ ID = 3249, Name = "frozen starlight", Value = 20000 },
		{ ID = 3250, Name = "the carrot of doom", Value = 0 },
		{ ID = 3253, Name = "backpack of holding", Value = 0 },
		{ ID = 3264, Name = "sword", Value = 25 },
		{ ID = 3265, Name = "two handed sword", Value = 450 },
		{ ID = 3266, Name = "battle axe", Value = 80 },
		{ ID = 3267, Name = "dagger", Value = 2 },
		{ ID = 3268, Name = "hand axe", Value = 5 },
		{ ID = 3269, Name = "halberd", Value = 400 },
		{ ID = 3270, Name = "club", Value = 1 },
		{ ID = 3271, Name = "spike sword", Value = 1000 },
		{ ID = 3272, Name = "rapier", Value = 7 },
		{ ID = 3273, Name = "sabre", Value = 12 },
		{ ID = 3274, Name = "axe", Value = 7 },
		{ ID = 3275, Name = "double axe", Value = 260 },
		{ ID = 3276, Name = "hatchet", Value = 25 },
		{ ID = 3277, Name = "spear", Value = 3 },
		{ ID = 3278, Name = "magic longsword", Value = 0 },
		{ ID = 3279, Name = "war hammer", Value = 1200 },
		{ ID = 3280, Name = "fire sword", Value = 4000 },
		{ ID = 3281, Name = "giant sword", Value = 17000 },
		{ ID = 3282, Name = "morning star", Value = 100 },
		{ ID = 3283, Name = "carlin sword", Value = 118 },
		{ ID = 3284, Name = "ice rapier", Value = 1000 },
		{ ID = 3285, Name = "longsword", Value = 51 },
		{ ID = 3286, Name = "mace", Value = 30 },
		{ ID = 3287, Name = "throwing star", Value = 17 },
		{ ID = 3288, Name = "magic sword", Value = 0 },
		{ ID = 3289, Name = "staff", Value = 1 },
		{ ID = 3290, Name = "silver dagger", Value = 500 },
		{ ID = 3291, Name = "knife", Value = 1 },
		{ ID = 3292, Name = "combat knife", Value = 0 },
		{ ID = 3293, Name = "sickle", Value = 1 },
		{ ID = 3294, Name = "short sword", Value = 10 },
		{ ID = 3295, Name = "bright sword", Value = 0 },
		{ ID = 3296, Name = "warlord sword", Value = 0 },
		{ ID = 3297, Name = "serpent sword", Value = 900 },
		{ ID = 3298, Name = "throwing knife", Value = 2 },
		{ ID = 3299, Name = "poison dagger", Value = 50 },
		{ ID = 3300, Name = "katana", Value = 8 },
		{ ID = 3301, Name = "broadsword", Value = 500 },
		{ ID = 3302, Name = "dragon lance", Value = 9000 },
		{ ID = 3303, Name = "great axe", Value = 300 },
		{ ID = 3304, Name = "crowbar", Value = 0 },
		{ ID = 3305, Name = "battle hammer", Value = 120 },
		{ ID = 3306, Name = "golden sickle", Value = 1000 },
		{ ID = 3307, Name = "scimitar", Value = 150 },
		{ ID = 3308, Name = "machete", Value = 6 },
		{ ID = 3309, Name = "thunder hammer", Value = 450 },
		{ ID = 3310, Name = "iron hammer", Value = 0 },
		{ ID = 3311, Name = "clerical mace", Value = 170 },
		{ ID = 3312, Name = "silver mace", Value = 270 },
		{ ID = 3313, Name = "obsIDian lance", Value = 500 },
		{ ID = 3314, Name = "naginata", Value = 2000 },
		{ ID = 3315, Name = "guardian halberd", Value = 11000 },
		{ ID = 3316, Name = "orcish axe", Value = 350 },
		{ ID = 3317, Name = "barbarian axe", Value = 185 },
		{ ID = 3318, Name = "knight axe", Value = 2000 },
		{ ID = 3319, Name = "stonecutter axe", Value = 0 },
		{ ID = 3320, Name = "fire axe", Value = 8000 },
		{ ID = 3321, Name = "enchanted staff", Value = 0 },
		{ ID = 3322, Name = "dragon hammer", Value = 2000 },
		{ ID = 3323, Name = "dwarven axe", Value = 1500 },
		{ ID = 3324, Name = "skull staff", Value = 6000 },
		{ ID = 3325, Name = "light mace", Value = 0 },
		{ ID = 3326, Name = "epee", Value = 8000 },
		{ ID = 3327, Name = "daramian mace", Value = 110 },
		{ ID = 3328, Name = "daramian waraxe", Value = 1000 },
		{ ID = 3329, Name = "daramian axe", Value = 0 },
		{ ID = 3330, Name = "heavy machete", Value = 90 },
		{ ID = 3331, Name = "ravager's axe", Value = 0 },
		{ ID = 3332, Name = "hammer of wrath", Value = 30000 },
		{ ID = 3333, Name = "crystal mace", Value = 0 },
		{ ID = 3334, Name = "pharaoh sword", Value = 0 },
		{ ID = 3335, Name = "twin axe", Value = 0 },
		{ ID = 3336, Name = "studded club", Value = 0 },
		{ ID = 3337, Name = "bone club", Value = 0 },
		{ ID = 3338, Name = "bone sword", Value = 0 },
		{ ID = 3339, Name = "djinn blade", Value = 0 },
		{ ID = 3340, Name = "heavy mace", Value = 50000 },
		{ ID = 3341, Name = "arcane staff", Value = 42000 },
		{ ID = 3342, Name = "war axe", Value = 12000 },
		{ ID = 3343, Name = "lich staff", Value = 0 },
		{ ID = 3344, Name = "beastslayer axe", Value = 1500 },
		{ ID = 3345, Name = "templar scytheblade", Value = 200 },
		{ ID = 3346, Name = "ripper lance", Value = 500 },
		{ ID = 3347, Name = "hunting spear", Value = 25 },
		{ ID = 3348, Name = "banana staff", Value = 1000 },
		{ ID = 3349, Name = "crossbow", Value = 160 },
		{ ID = 3350, Name = "bow", Value = 130 },
		{ ID = 3351, Name = "steel helmet", Value = 293 },
		{ ID = 3352, Name = "chain helmet", Value = 17 },
		{ ID = 3353, Name = "iron helmet", Value = 150 },
		{ ID = 3354, Name = "brass helmet", Value = 30 },
		{ ID = 3355, Name = "leather helmet", Value = 4 },
		{ ID = 3356, Name = "devil helmet", Value = 1000 },
		{ ID = 3357, Name = "plate armor", Value = 400 },
		{ ID = 3358, Name = "chain armor", Value = 70 },
		{ ID = 3359, Name = "brass armor", Value = 150 },
		{ ID = 3360, Name = "golden armor", Value = 20000 },
		{ ID = 3361, Name = "leather armor", Value = 12 },
		{ ID = 3362, Name = "studded legs", Value = 15 },
		{ ID = 3363, Name = "dragon scale legs", Value = 0 },
		{ ID = 3364, Name = "golden legs", Value = 30000 },
		{ ID = 3365, Name = "golden helmet", Value = 0 },
		{ ID = 3366, Name = "magic plate armor", Value = 90000 },
		{ ID = 3367, Name = "viking helmet", Value = 66 },
		{ ID = 3368, Name = "winged helmet", Value = 0 },
		{ ID = 3369, Name = "warrior helmet", Value = 5000 },
		{ ID = 3370, Name = "knight armor", Value = 5000 },
		{ ID = 3371, Name = "knight legs", Value = 5000 },
		{ ID = 3372, Name = "brass legs", Value = 49 },
		{ ID = 3373, Name = "strange helmet", Value = 500 },
		{ ID = 3374, Name = "legion helmet", Value = 8 },
		{ ID = 3375, Name = "soldier helmet", Value = 16 },
		{ ID = 3376, Name = "studded helmet", Value = 2 },
		{ ID = 3377, Name = "scale armor", Value = 75 },
		{ ID = 3378, Name = "studded armor", Value = 18 },
		{ ID = 3379, Name = "doublet", Value = 1 },
		{ ID = 3380, Name = "noble armor", Value = 900 },
		{ ID = 3381, Name = "crown armor", Value = 12000 },
		{ ID = 3382, Name = "crown legs", Value = 12000 },
		{ ID = 3383, Name = "dark armor", Value = 400 },
		{ ID = 3384, Name = "dark helmet", Value = 250 },
		{ ID = 3385, Name = "crown helmet", Value = 2500 },
		{ ID = 3386, Name = "dragon scale mail", Value = 40000 },
		{ ID = 3387, Name = "demon helmet", Value = 40000 },
		{ ID = 3388, Name = "demon armor", Value = 0 },
		{ ID = 3389, Name = "demon legs", Value = 0 },
		{ ID = 3390, Name = "horned helmet", Value = 0 },
		{ ID = 3391, Name = "crusader helmet", Value = 6000 },
		{ ID = 3392, Name = "royal helmet", Value = 30000 },
		{ ID = 3393, Name = "amazon helmet", Value = 0 },
		{ ID = 3394, Name = "amazon armor", Value = 0 },
		{ ID = 3395, Name = "ceremonial mask", Value = 0 },
		{ ID = 3396, Name = "dwarven helmet", Value = 0 },
		{ ID = 3397, Name = "dwarven armor", Value = 30000 },
		{ ID = 3398, Name = "dwarven legs", Value = 40000 },
		{ ID = 3399, Name = "elven mail", Value = 0 },
		{ ID = 3400, Name = "dragon scale helmet", Value = 0 },
		{ ID = 3401, Name = "elven legs", Value = 0 },
		{ ID = 3402, Name = "native armor", Value = 0 },
		{ ID = 3403, Name = "tribal mask", Value = 250 },
		{ ID = 3404, Name = "leopard armor", Value = 1000 },
		{ ID = 3405, Name = "horseman helmet", Value = 280 },
		{ ID = 3406, Name = "feather headdress", Value = 850 },
		{ ID = 3407, Name = "charmer's tiara", Value = 900 },
		{ ID = 3408, Name = "bonelord helmet", Value = 7500 },
		{ ID = 3409, Name = "steel shield", Value = 80 },
		{ ID = 3410, Name = "plate shield", Value = 45 },
		{ ID = 3411, Name = "brass shield", Value = 16 },
		{ ID = 3412, Name = "wooden shield", Value = 5 },
		{ ID = 3413, Name = "battle shield", Value = 95 },
		{ ID = 3414, Name = "mastermind shield", Value = 50000 },
		{ ID = 3415, Name = "guardian shield", Value = 2000 },
		{ ID = 3416, Name = "dragon shield", Value = 4000 },
		{ ID = 3417, Name = "shield of honour", Value = 0 },
		{ ID = 3418, Name = "bonelord shield", Value = 1200 },
		{ ID = 3419, Name = "crown shield", Value = 8000 },
		{ ID = 3420, Name = "demon shield", Value = 30000 },
		{ ID = 3421, Name = "dark shield", Value = 400 },
		{ ID = 3422, Name = "great shield", Value = 480 },
		{ ID = 3423, Name = "blessed shield", Value = 0 },
		{ ID = 3424, Name = "ornamented shield", Value = 1500 },
		{ ID = 3425, Name = "dwarven shield", Value = 100 },
		{ ID = 3426, Name = "studded shield", Value = 2 },
		{ ID = 3427, Name = "rose shield", Value = 0 },
		{ ID = 3428, Name = "tower shield", Value = 8000 },
		{ ID = 3429, Name = "black shield", Value = 800 },
		{ ID = 3430, Name = "copper shield", Value = 10 },
		{ ID = 3431, Name = "viking shield", Value = 85 },
		{ ID = 3432, Name = "ancient shield", Value = 900 },
		{ ID = 3433, Name = "griffin shield", Value = 59 },
		{ ID = 3434, Name = "vampire shield", Value = 15000 },
		{ ID = 3435, Name = "castle shield", Value = 5000 },
		{ ID = 3436, Name = "medusa shield", Value = 9000 },
		{ ID = 3437, Name = "amazon shield", Value = 0 },
		{ ID = 3438, Name = "eagle shield", Value = 0 },
		{ ID = 3439, Name = "phoenix shield", Value = 16000 },
		{ ID = 3440, Name = "scarab shield", Value = 2000 },
		{ ID = 3441, Name = "bone shield", Value = 80 },
		{ ID = 3442, Name = "tempest shield", Value = 0 },
		{ ID = 3443, Name = "tusk shield", Value = 850 },
		{ ID = 3444, Name = "sentinel shield", Value = 120 },
		{ ID = 3445, Name = "salamander shield", Value = 280 },
		{ ID = 3446, Name = "bolt", Value = 0 },
		{ ID = 3447, Name = "arrow", Value = 0 },
		{ ID = 3448, Name = "poison arrow", Value = 0 },
		{ ID = 3449, Name = "burst arrow", Value = 0 },
		{ ID = 3450, Name = "power bolt", Value = 0 },
		{ ID = 3451, Name = "pitchfork", Value = 0 },
		{ ID = 3452, Name = "rake", Value = 0 },
		{ ID = 3453, Name = "scythe", Value = 10 },
		{ ID = 3454, Name = "broom", Value = 0 },
		{ ID = 3455, Name = "hoe", Value = 0 },
		{ ID = 3456, Name = "pick", Value = 15 },
		{ ID = 3457, Name = "shovel", Value = 8 },
		{ ID = 3459, Name = "wooden hammer", Value = 0 },
		{ ID = 3460, Name = "hammer", Value = 0 },
		{ ID = 3461, Name = "saw", Value = 0 },
		{ ID = 3462, Name = "small axe", Value = 0 },
		{ ID = 3463, Name = "mirror", Value = 10 },
		{ ID = 3464, Name = "baking tray", Value = 0 },
		{ ID = 3465, Name = "pot", Value = 0 },
		{ ID = 3466, Name = "pan", Value = 0 },
		{ ID = 3467, Name = "fork", Value = 0 },
		{ ID = 3468, Name = "spoon", Value = 0 },
		{ ID = 3469, Name = "kitchen knife", Value = 0 },
		{ ID = 3470, Name = "wooden spoon", Value = 0 },
		{ ID = 3471, Name = "cleaver", Value = 0 },
		{ ID = 3472, Name = "oven spatula", Value = 0 },
		{ ID = 3473, Name = "rolling pin", Value = 0 },
		{ ID = 3474, Name = "bowl", Value = 0 },
		{ ID = 3475, Name = "bowl", Value = 0 },
		{ ID = 3476, Name = "bowl", Value = 0 },
		{ ID = 3477, Name = "ewer", Value = 0 },
		{ ID = 3478, Name = "ewer", Value = 0 },
		{ ID = 3479, Name = "ewer", Value = 0 },
		{ ID = 3480, Name = "ewer", Value = 0 },
		{ ID = 3481, Name = "trap", Value = 0 },
		{ ID = 3482, Name = "closed trap", Value = 75 },
		{ ID = 3483, Name = "fishing rod", Value = 40 },
		{ ID = 3492, Name = "worm", Value = 0 },
		{ ID = 3503, Name = "parcel", Value = 0 },
		{ ID = 3504, Name = "stamped parcel", Value = 0 },
		{ ID = 3509, Name = "inkwell", Value = 8 },
		{ ID = 3549, Name = "pair of soft boots", Value = 0 },
		{ ID = 3550, Name = "patched boots", Value = 2000 },
		{ ID = 3551, Name = "sandals", Value = 0 },
		{ ID = 3552, Name = "leather boots", Value = 0 },
		{ ID = 3553, Name = "bunnyslippers", Value = 0 },
		{ ID = 3554, Name = "steel boots", Value = 30000 },
		{ ID = 3555, Name = "golden boots", Value = 0 },
		{ ID = 3556, Name = "crocodile boots", Value = 1000 },
		{ ID = 3557, Name = "plate legs", Value = 115 },
		{ ID = 3558, Name = "chain legs", Value = 25 },
		{ ID = 3559, Name = "leather legs", Value = 1 },
		{ ID = 3560, Name = "bast skirt", Value = 750 },
		{ ID = 3561, Name = "jacket", Value = 1 },
		{ ID = 3562, Name = "coat", Value = 1 },
		{ ID = 3563, Name = "green tunic", Value = 0 },
		{ ID = 3564, Name = "red tunic", Value = 0 },
		{ ID = 3565, Name = "cape", Value = 0 },
		{ ID = 3566, Name = "red robe", Value = 300 },
		{ ID = 3567, Name = "blue robe", Value = 10000 },
		{ ID = 3568, Name = "simple dress", Value = 0 },
		{ ID = 3569, Name = "white dress", Value = 0 },
		{ ID = 3570, Name = "ball gown", Value = 0 },
		{ ID = 3571, Name = "ranger's cloak", Value = 0 },
		{ ID = 3572, Name = "scarf", Value = 0 },
		{ ID = 3573, Name = "magician hat", Value = 0 },
		{ ID = 3574, Name = "mystic turban", Value = 150 },
		{ ID = 3575, Name = "wood cape", Value = 0 },
		{ ID = 3576, Name = "post officer's hat", Value = 0 },
		{ ID = 3577, Name = "meat", Value = 2 },
		{ ID = 3578, Name = "fish", Value = 0 },
		{ ID = 3579, Name = "salmon", Value = 0 },
		{ ID = 3580, Name = "northern pike", Value = 0 },
		{ ID = 3581, Name = "shrimp", Value = 0 },
		{ ID = 3582, Name = "ham", Value = 4 },
		{ ID = 3583, Name = "dragon ham", Value = 0 },
		{ ID = 3584, Name = "pear", Value = 0 },
		{ ID = 3585, Name = "red apple", Value = 0 },
		{ ID = 3586, Name = "orange", Value = 0 },
		{ ID = 3587, Name = "banana", Value = 0 },
		{ ID = 3588, Name = "blueberry", Value = 0 },
		{ ID = 3589, Name = "coconut", Value = 0 },
		{ ID = 3590, Name = "cherry", Value = 0 },
		{ ID = 3591, Name = "strawberry", Value = 0 },
		{ ID = 3592, Name = "grapes", Value = 0 },
		{ ID = 3593, Name = "melon", Value = 0 },
		{ ID = 3594, Name = "pumpkin", Value = 0 },
		{ ID = 3595, Name = "carrot", Value = 0 },
		{ ID = 3596, Name = "tomato", Value = 0 },
		{ ID = 3597, Name = "corncob", Value = 0 },
		{ ID = 3598, Name = "cookie", Value = 0 },
		{ ID = 3599, Name = "candy cane", Value = 0 },
		{ ID = 3600, Name = "bread", Value = 2 },
		{ ID = 3601, Name = "roll", Value = 0 },
		{ ID = 3602, Name = "brown bread", Value = 0 },
		{ ID = 3603, Name = "flour", Value = 0 },
		{ ID = 3604, Name = "lump of dough", Value = 0 },
		{ ID = 3605, Name = "bunch of wheat", Value = 0 },
		{ ID = 3606, Name = "egg", Value = 0 },
		{ ID = 3607, Name = "cheese", Value = 0 },
		{ ID = 3655, Name = "moon flower", Value = 0 },
		{ ID = 3658, Name = "red rose", Value = 0 },
		{ ID = 3659, Name = "blue rose", Value = 0 },
		{ ID = 3660, Name = "yellow rose", Value = 0 },
		{ ID = 3661, Name = "grave flower", Value = 25 },
		{ ID = 3668, Name = "tulip", Value = 0 },
		{ ID = 3673, Name = "orange star", Value = 0 },
		{ ID = 3674, Name = "goat grass", Value = 50 },
		{ ID = 3723, Name = "white mushroom", Value = 0 },
		{ ID = 3724, Name = "red mushroom", Value = 0 },
		{ ID = 3725, Name = "brown mushroom", Value = 0 },
		{ ID = 3726, Name = "orange mushroom", Value = 0 },
		{ ID = 3727, Name = "wood mushroom", Value = 0 },
		{ ID = 3728, Name = "dark mushroom", Value = 0 },
		{ ID = 3729, Name = "some mushrooms (brown)", Value = 0 },
		{ ID = 3730, Name = "some mushrooms", Value = 0 },
		{ ID = 3731, Name = "fire mushroom", Value = 0 },
		{ ID = 3732, Name = "green mushroom", Value = 0 },
		{ ID = 3734, Name = "blood herb", Value = 500 },
		{ ID = 3735, Name = "stone herb", Value = 28 },
		{ ID = 3736, Name = "star herb", Value = 0 },
		{ ID = 3737, Name = "fern", Value = 0 },
		{ ID = 3738, Name = "sling herb", Value = 10 },
		{ ID = 3739, Name = "powder herb", Value = 10 },
		{ ID = 3740, Name = "shadow herb", Value = 20 },
		{ ID = 3741, Name = "troll green", Value = 25 },
		{ ID = 3997, Name = "tibiora's box", Value = 0 },
		{ ID = 4010, Name = "tibiora's box", Value = 0 },
		{ ID = 4033, Name = "draken boots", Value = 40000 },
		{ ID = 4049, Name = "magical measurement device", Value = 0 },
		{ ID = 4050, Name = "spirit cage", Value = 0 },
		{ ID = 4061, Name = "stone of wisdom", Value = 0 },
		{ ID = 4115, Name = "phoenix statue", Value = 0 },
		{ ID = 4827, Name = "whisper moss", Value = 0 },
		{ ID = 4828, Name = "flask of cough syrup", Value = 0 },
		{ ID = 4829, Name = "witches' cap spot", Value = 0 },
		{ ID = 4831, Name = "old parchment", Value = 500 },
		{ ID = 4832, Name = "giant ape's hair", Value = 0 },
		{ ID = 4834, Name = "family brooch (dwarven family)", Value = 0 },
		{ ID = 4835, Name = "snake destroyer", Value = 0 },
		{ ID = 4836, Name = "spectral dress", Value = 18000 },
		{ ID = 4838, Name = "strange powder", Value = 0 },
		{ ID = 4839, Name = "hydra egg", Value = 500 },
		{ ID = 4840, Name = "spectral stone", Value = 0 },
		{ ID = 4841, Name = "memory stone", Value = 0 },
		{ ID = 4842, Name = "sheet of tracing paper", Value = 0 },
		{ ID = 4843, Name = "sheet of tracing paper", Value = 0 },
		{ ID = 4844, Name = "elven poetry book", Value = 0 },
		{ ID = 4845, Name = "dwarven pickaxe", Value = 0 },
		{ ID = 4846, Name = "wrinkled parchment", Value = 0 },
		{ ID = 4847, Name = "funeral urn", Value = 0 },
		{ ID = 4852, Name = "ectoplasm container", Value = 0 },
		{ ID = 4853, Name = "ectoplasm container", Value = 0 },
		{ ID = 4863, Name = "butterfly conservation kit", Value = 0 },
		{ ID = 4864, Name = "butterfly conservation kit", Value = 0 },
		{ ID = 4865, Name = "butterfly conservation kit", Value = 0 },
		{ ID = 4866, Name = "butterfly conservation kit", Value = 0 },
		{ ID = 4867, Name = "botanist's container", Value = 0 },
		{ ID = 4868, Name = "botanist's container", Value = 0 },
		{ ID = 4869, Name = "botanist's container", Value = 0 },
		{ ID = 4870, Name = "botanist's container", Value = 0 },
		{ ID = 4871, Name = "explorer brooch", Value = 50 },
		{ ID = 4872, Name = "ice pick", Value = 0 },
		{ ID = 5014, Name = "mandrake", Value = 0 },
		{ ID = 5021, Name = "orichalcum pearl", Value = 0 },
		{ ID = 5080, Name = "panda teddy", Value = 30000 },
		{ ID = 5086, Name = "monkey statue (no seeing) kit", Value = 0 },
		{ ID = 5087, Name = "monkey statue (no hearing) kit", Value = 0 },
		{ ID = 5088, Name = "monkey statue (no speaking) kit", Value = 0 },
		{ ID = 5089, Name = "butterfly conservation kit", Value = 0 },
		{ ID = 5096, Name = "mango", Value = 0 },
		{ ID = 5460, Name = "helmet of the deep", Value = 0 },
		{ ID = 5461, Name = "pirate boots", Value = 3000 },
		{ ID = 5466, Name = "bunch of sugar cane", Value = 0 },
		{ ID = 5467, Name = "fire bug", Value = 0 },
		{ ID = 5479, Name = "cat's paw", Value = 0 },
		{ ID = 5552, Name = "rum flask", Value = 0 },
		{ ID = 5615, Name = "pirate tapestry", Value = 0 },
		{ ID = 5668, Name = "mysterious voodoo skull", Value = 4000 },
		{ ID = 5678, Name = "tortoise egg", Value = 0 },
		{ ID = 5706, Name = "treasure map (pirate)", Value = 0 },
		{ ID = 5710, Name = "light shovel", Value = 300 },
		{ ID = 5741, Name = "skull helmet", Value = 40000 },
		{ ID = 5786, Name = "wooden whistle", Value = 0 },
		{ ID = 5791, Name = "stuffed dragon", Value = 6000 },
		{ ID = 5792, Name = "dice", Value = 0 },
		{ ID = 5793, Name = "dice", Value = 0 },
		{ ID = 5794, Name = "dice", Value = 0 },
		{ ID = 5795, Name = "dice", Value = 0 },
		{ ID = 5796, Name = "dice", Value = 0 },
		{ ID = 5797, Name = "dice", Value = 0 },
		{ ID = 5801, Name = "jewelled backpack", Value = 0 },
		{ ID = 5802, Name = "message in a bottle", Value = 0 },
		{ ID = 5803, Name = "arbalest", Value = 42000 },
		{ ID = 5804, Name = "nose ring", Value = 0 },
		{ ID = 5808, Name = "orshabaal's brain", Value = 12000 },
		{ ID = 5809, Name = "soul stone", Value = 0 },
		{ ID = 5810, Name = "pirate voodoo doll", Value = 500 },
		{ ID = 5813, Name = "skull candle", Value = 0 },
		{ ID = 5865, Name = "juice squeezer", Value = 100 },
		{ ID = 5875, Name = "sniper gloves", Value = 2000 },
		{ ID = 5876, Name = "lizard leather", Value = 150 },
		{ ID = 5877, Name = "green dragon leather", Value = 100 },
		{ ID = 5878, Name = "minotaur leather", Value = 80 },
		{ ID = 5879, Name = "spIDer silk", Value = 100 },
		{ ID = 5880, Name = "iron ore", Value = 0 },
		{ ID = 5881, Name = "lizard scale", Value = 120 },
		{ ID = 5882, Name = "red dragon scale", Value = 200 },
		{ ID = 5883, Name = "ape fur", Value = 120 },
		{ ID = 5884, Name = "spirit container", Value = 40000 },
		{ ID = 5885, Name = "flask of warrior's sweat", Value = 10000 },
		{ ID = 5886, Name = "spool of yarn", Value = 0 },
		{ ID = 5887, Name = "piece of royal steel", Value = 10000 },
		{ ID = 5888, Name = "piece of hell steel", Value = 500 },
		{ ID = 5889, Name = "piece of draconian steel", Value = 0 },
		{ ID = 5890, Name = "chicken feather", Value = 30 },
		{ ID = 5891, Name = "enchanted chicken wing", Value = 20000 },
		{ ID = 5892, Name = "huge chunk of crude iron", Value = 15000 },
		{ ID = 5893, Name = "perfect behemoth fang", Value = 250 },
		{ ID = 5894, Name = "bat wing", Value = 50 },
		{ ID = 5895, Name = "fish fin", Value = 150 },
		{ ID = 5896, Name = "bear paw", Value = 100 },
		{ ID = 5897, Name = "wolf paw", Value = 70 },
		{ ID = 5898, Name = "bonelord eye", Value = 80 },
		{ ID = 5899, Name = "turtle shell", Value = 90 },
		{ ID = 5900, Name = "dwarven beard", Value = 0 },
		{ ID = 5901, Name = "wood", Value = 0 },
		{ ID = 5902, Name = "honeycomb", Value = 40 },
		{ ID = 5903, Name = "ferumbras' hat", Value = 0 },
		{ ID = 5904, Name = "magic sulphur", Value = 8000 },
		{ ID = 5905, Name = "vampire dust", Value = 100 },
		{ ID = 5906, Name = "demon dust", Value = 300 },
		{ ID = 5907, Name = "slingshot", Value = 0 },
		{ ID = 5908, Name = "obsIDian knife", Value = 0 },
		{ ID = 5909, Name = "white piece of cloth", Value = 100 },
		{ ID = 5910, Name = "green piece of cloth", Value = 200 },
		{ ID = 5911, Name = "red piece of cloth", Value = 300 },
		{ ID = 5912, Name = "blue piece of cloth", Value = 200 },
		{ ID = 5913, Name = "brown piece of cloth", Value = 100 },
		{ ID = 5914, Name = "yellow piece of cloth", Value = 150 },
		{ ID = 5917, Name = "bandana", Value = 0 },
		{ ID = 5918, Name = "pirate knee breeches", Value = 200 },
		{ ID = 5919, Name = "dragon claw", Value = 8000 },
		{ ID = 5920, Name = "green dragon scale", Value = 100 },
		{ ID = 5921, Name = "heaven blossom", Value = 50 },
		{ ID = 5922, Name = "holy orchID", Value = 90 },
		{ ID = 5924, Name = "damaged steel helmet", Value = 0 },
		{ ID = 5925, Name = "hardened bone", Value = 70 },
		{ ID = 5926, Name = "pirate backpack", Value = 0 },
		{ ID = 5927, Name = "pirate bag", Value = 0 },
		{ ID = 5928, Name = "empty goldfish bowl", Value = 0 },
		{ ID = 5929, Name = "goldfish bowl", Value = 0 },
		{ ID = 5930, Name = "behemoth claw", Value = 2000 },
		{ ID = 5937, Name = "griffinclaw container", Value = 0 },
		{ ID = 5938, Name = "ceiron's waterskin", Value = 0 },
		{ ID = 5939, Name = "ceiron's waterskin", Value = 0 },
		{ ID = 5940, Name = "wolf tooth chain", Value = 100 },
		{ ID = 5941, Name = "wooden stake", Value = 0 },
		{ ID = 5942, Name = "blessed wooden stake", Value = 0 },
		{ ID = 5943, Name = "morgaroth's heart", Value = 15000 },
		{ ID = 5944, Name = "soul orb", Value = 25 },
		{ ID = 5945, Name = "coral comb", Value = 0 },
		{ ID = 5946, Name = "comb", Value = 0 },
		{ ID = 5947, Name = "elane's crossbow", Value = 0 },
		{ ID = 5948, Name = "red dragon leather", Value = 200 },
		{ ID = 5949, Name = "beach backpack", Value = 0 },
		{ ID = 5950, Name = "beach bag", Value = 0 },
		{ ID = 5951, Name = "fish tail", Value = 0 },
		{ ID = 5953, Name = "raven herb", Value = 0 },
		{ ID = 5954, Name = "demon horn", Value = 1000 },
		{ ID = 5957, Name = "lottery ticket", Value = 0 },
		{ ID = 5958, Name = "winning lottery ticket", Value = 0 },
		{ ID = 6086, Name = "faked label", Value = 0 },
		{ ID = 6087, Name = "music sheet", Value = 100 },
		{ ID = 6088, Name = "music sheet", Value = 250 },
		{ ID = 6089, Name = "music sheet", Value = 400 },
		{ ID = 6090, Name = "music sheet", Value = 800 },
		{ ID = 6091, Name = "very noble-looking watch", Value = 0 },
		{ ID = 6092, Name = "very noble-looking watch", Value = 0 },
		{ ID = 6093, Name = "crystal ring (eleonore)", Value = 0 },
		{ ID = 6095, Name = "pirate shirt", Value = 500 },
		{ ID = 6096, Name = "pirate hat", Value = 1000 },
		{ ID = 6097, Name = "hook", Value = 0 },
		{ ID = 6098, Name = "eye patch", Value = 0 },
		{ ID = 6099, Name = "brutus bloodbeard's hat", Value = 0 },
		{ ID = 6100, Name = "the lethal lissy's shirt", Value = 0 },
		{ ID = 6101, Name = "ron the ripper's sabre", Value = 0 },
		{ ID = 6102, Name = "deadeye devious' eye patch", Value = 0 },
		{ ID = 6104, Name = "jewel case", Value = 0 },
		{ ID = 6105, Name = "striker's favourite pillow", Value = 0 },
		{ ID = 6106, Name = "bottle of whisper beer", Value = 0 },
		{ ID = 6107, Name = "simon the beggar's favorite staff", Value = 0 },
		{ ID = 6108, Name = "atlas", Value = 0 },
		{ ID = 6113, Name = "letter to eremo", Value = 0 },
		{ ID = 6114, Name = "armor rack kit", Value = 0 },
		{ ID = 6115, Name = "weapon rack kit", Value = 0 },
		{ ID = 6119, Name = "poem scroll", Value = 0 },
		{ ID = 6120, Name = "dragha's spellbook", Value = 0 },
		{ ID = 6124, Name = "damaged logbook", Value = 0 },
		{ ID = 6125, Name = "tortoise egg from nargor", Value = 0 },
		{ ID = 6126, Name = "peg leg", Value = 0 },
		{ ID = 6131, Name = "tortoise shield", Value = 150 },
		{ ID = 6276, Name = "lump of cake dough", Value = 0 },
		{ ID = 6277, Name = "cake", Value = 0 },
		{ ID = 6278, Name = "decorated cake", Value = 0 },
		{ ID = 6279, Name = "party cake", Value = 0 },
		{ ID = 6299, Name = "death ring", Value = 1000 },
		{ ID = 6371, Name = "oven kit", Value = 0 },
		{ ID = 6372, Name = "bookcase kit", Value = 0 },
		{ ID = 6387, Name = "christmas card", Value = 0 },
		{ ID = 6390, Name = "nightmare shield", Value = 0 },
		{ ID = 6392, Name = "valentine's cake", Value = 0 },
		{ ID = 6393, Name = "cream cake", Value = 0 },
		{ ID = 6432, Name = "necromancer shield", Value = 0 },
		{ ID = 6489, Name = "christmas branch", Value = 40 },
		{ ID = 6491, Name = "bat decoration", Value = 0 },
		{ ID = 6496, Name = "christmas present bag", Value = 0 },
		{ ID = 6498, Name = "certificate", Value = 0 },
		{ ID = 6499, Name = "demonic essence", Value = 1000 },
		{ ID = 6500, Name = "gingerbreadman", Value = 0 },
		{ ID = 6505, Name = "christmas present", Value = 0 },
		{ ID = 6509, Name = "christmas present", Value = 0 },
		{ ID = 6510, Name = "christmas present", Value = 0 },
		{ ID = 6511, Name = "santa doll", Value = 0 },
		{ ID = 6522, Name = "gingerbread recipe", Value = 0 },
		{ ID = 6525, Name = "skeleton decoration", Value = 0 },
		{ ID = 6526, Name = "christmas token", Value = 0 },
		{ ID = 6527, Name = "the avenger", Value = 42000 },
		{ ID = 6528, Name = "infernal bolt", Value = 0 },
		{ ID = 6529, Name = "pair of soft boots", Value = 0 },
		{ ID = 6530, Name = "worn soft boots", Value = 0 },
		{ ID = 6531, Name = "santa hat", Value = 0 },
		{ ID = 6534, Name = "the imperor's trIDent", Value = 0 },
		{ ID = 6535, Name = "the plasmother's remains", Value = 0 },
		{ ID = 6536, Name = "countess sorrow's frozen tear", Value = 0 },
		{ ID = 6537, Name = "mr. punish's handcuffs", Value = 0 },
		{ ID = 6539, Name = "the handmaIDen's protector", Value = 0 },
		{ ID = 6540, Name = "piece of massacre's shell", Value = 0 },
		{ ID = 6541, Name = "coloured egg", Value = 0 },
		{ ID = 6542, Name = "coloured egg", Value = 0 },
		{ ID = 6543, Name = "coloured egg", Value = 0 },
		{ ID = 6544, Name = "coloured egg", Value = 0 },
		{ ID = 6545, Name = "coloured egg", Value = 0 },
		{ ID = 6546, Name = "dracola's eye", Value = 0 },
		{ ID = 6547, Name = "yellow powder", Value = 0 },
		{ ID = 6548, Name = "purple powder", Value = 0 },
		{ ID = 6549, Name = "green powder", Value = 0 },
		{ ID = 6550, Name = "red powder", Value = 0 },
		{ ID = 6551, Name = "blue powder", Value = 0 },
		{ ID = 6553, Name = "ruthless axe", Value = 45000 },
		{ ID = 6558, Name = "concentrated demonic blood", Value = 0 },
		{ ID = 6561, Name = "ceremonial ankh", Value = 20000 },
		{ ID = 6566, Name = "stuffed dragon", Value = 6000 },
		{ ID = 6567, Name = "santa doll", Value = 0 },
		{ ID = 6568, Name = "panda teddy", Value = 30000 },
		{ ID = 6569, Name = "candy", Value = 0 },
		{ ID = 6570, Name = "surprise bag", Value = 0 },
		{ ID = 6571, Name = "surprise bag", Value = 0 },
		{ ID = 6572, Name = "party trumpet", Value = 0 },
		{ ID = 6573, Name = "party trumpet", Value = 0 },
		{ ID = 6574, Name = "bar of chocolate", Value = 0 },
		{ ID = 6575, Name = "red balloons", Value = 0 },
		{ ID = 6576, Name = "fireworks rocket", Value = 0 },
		{ ID = 6577, Name = "green balloons", Value = 0 },
		{ ID = 6578, Name = "party hat", Value = 0 },
		{ ID = 7140, Name = "mead horn", Value = 0 },
		{ ID = 7141, Name = "mead horn", Value = 0 },
		{ ID = 7158, Name = "rainbow trout", Value = 0 },
		{ ID = 7159, Name = "green perch", Value = 0 },
		{ ID = 7183, Name = "baby seal doll", Value = 20000 },
		{ ID = 7184, Name = "baby seal doll", Value = 20000 },
		{ ID = 7242, Name = "resonance crystal", Value = 0 },
		{ ID = 7243, Name = "empty jug", Value = 0 },
		{ ID = 7244, Name = "jug (ants)", Value = 0 },
		{ ID = 7245, Name = "piece of cactus", Value = 0 },
		{ ID = 7246, Name = "nilsor's waterskin", Value = 0 },
		{ ID = 7247, Name = "fine sulphur", Value = 0 },
		{ ID = 7248, Name = "frostbite herb", Value = 0 },
		{ ID = 7249, Name = "purple kiss blossom", Value = 0 },
		{ ID = 7250, Name = "hydra tongue", Value = 0 },
		{ ID = 7251, Name = "mushroom spores", Value = 0 },
		{ ID = 7253, Name = "animal cure", Value = 400 },
		{ ID = 7281, Name = "memory crystal", Value = 0 },
		{ ID = 7286, Name = "nilsor's waterskin", Value = 0 },
		{ ID = 7289, Name = "frost charm", Value = 0 },
		{ ID = 7290, Name = "shard", Value = 2000 },
		{ ID = 7314, Name = "scale from a frozen dragon", Value = 0 },
		{ ID = 7315, Name = "resonance crystal (before)", Value = 0 },
		{ ID = 7342, Name = "fur backpack", Value = 0 },
		{ ID = 7343, Name = "fur bag", Value = 0 },
		{ ID = 7363, Name = "piercing bolt", Value = 0 },
		{ ID = 7364, Name = "sniper arrow", Value = 0 },
		{ ID = 7365, Name = "onyx arrow", Value = 0 },
		{ ID = 7366, Name = "viper star", Value = 0 },
		{ ID = 7367, Name = "enchanted spear", Value = 0 },
		{ ID = 7368, Name = "assassin star", Value = 0 },
		{ ID = 7372, Name = "ice cream cone (crispy chocolate chips)", Value = 0 },
		{ ID = 7373, Name = "ice cream cone (venorean dream)", Value = 0 },
		{ ID = 7374, Name = "ice cream cone (blue-barian)", Value = 0 },
		{ ID = 7375, Name = "ice cream cone (chilly cherry)", Value = 0 },
		{ ID = 7376, Name = "ice cream cone", Value = 0 },
		{ ID = 7377, Name = "ice cream cone", Value = 0 },
		{ ID = 7378, Name = "royal spear", Value = 0 },
		{ ID = 7379, Name = "brutetamer's staff", Value = 1500 },
		{ ID = 7380, Name = "headchopper", Value = 0 },
		{ ID = 7381, Name = "mammoth whopper", Value = 0 },
		{ ID = 7382, Name = "demonrage sword", Value = 36000 },
		{ ID = 7383, Name = "relic sword", Value = 25000 },
		{ ID = 7384, Name = "mystic blade", Value = 30000 },
		{ ID = 7385, Name = "crimson sword", Value = 0 },
		{ ID = 7386, Name = "mercenary sword", Value = 12000 },
		{ ID = 7387, Name = "diamond sceptre", Value = 3000 },
		{ ID = 7388, Name = "vile axe", Value = 30000 },
		{ ID = 7389, Name = "heroic axe", Value = 30000 },
		{ ID = 7390, Name = "the justice seeker", Value = 0 },
		{ ID = 7391, Name = "thaian sword", Value = 16000 },
		{ ID = 7392, Name = "orcish maul", Value = 0 },
		{ ID = 7393, Name = "demon trophy", Value = 40000 },
		{ ID = 7394, Name = "wolf trophy", Value = 3000 },
		{ ID = 7395, Name = "orc trophy", Value = 0 },
		{ ID = 7396, Name = "behemoth trophy", Value = 20000 },
		{ ID = 7397, Name = "deer trophy", Value = 3000 },
		{ ID = 7398, Name = "cyclops trophy", Value = 500 },
		{ ID = 7399, Name = "dragon lord trophy", Value = 10000 },
		{ ID = 7400, Name = "lion trophy", Value = 3000 },
		{ ID = 7401, Name = "minotaur trophy", Value = 500 },
		{ ID = 7402, Name = "dragon slayer", Value = 15000 },
		{ ID = 7403, Name = "berserker", Value = 40000 },
		{ ID = 7404, Name = "assassin dagger", Value = 20000 },
		{ ID = 7405, Name = "havoc blade", Value = 0 },
		{ ID = 7406, Name = "blacksteel sword", Value = 0 },
		{ ID = 7407, Name = "haunted blade", Value = 8000 },
		{ ID = 7408, Name = "wyvern fang", Value = 1500 },
		{ ID = 7409, Name = "northern star", Value = 0 },
		{ ID = 7410, Name = "queen's sceptre", Value = 20000 },
		{ ID = 7411, Name = "ornamented axe", Value = 20000 },
		{ ID = 7412, Name = "butcher's axe", Value = 18000 },
		{ ID = 7413, Name = "titan axe", Value = 4000 },
		{ ID = 7414, Name = "abyss hammer", Value = 20000 },
		{ ID = 7415, Name = "cranial basher", Value = 30000 },
		{ ID = 7416, Name = "bloody edge", Value = 30000 },
		{ ID = 7417, Name = "runed sword", Value = 45000 },
		{ ID = 7418, Name = "nightmare blade", Value = 35000 },
		{ ID = 7419, Name = "dreaded cleaver", Value = 15000 },
		{ ID = 7420, Name = "reaper's axe", Value = 0 },
		{ ID = 7421, Name = "onyx flail", Value = 22000 },
		{ ID = 7422, Name = "jade hammer", Value = 25000 },
		{ ID = 7423, Name = "skullcrusher", Value = 0 },
		{ ID = 7424, Name = "lunar staff", Value = 5000 },
		{ ID = 7425, Name = "taurus mace", Value = 500 },
		{ ID = 7426, Name = "amber staff", Value = 8000 },
		{ ID = 7427, Name = "chaos mace", Value = 9000 },
		{ ID = 7428, Name = "bonebreaker", Value = 10000 },
		{ ID = 7429, Name = "blessed sceptre", Value = 0 },
		{ ID = 7430, Name = "dragonbone staff", Value = 3000 },
		{ ID = 7431, Name = "demonbone", Value = 0 },
		{ ID = 7432, Name = "furry club", Value = 1000 },
		{ ID = 7433, Name = "ravenwing", Value = 0 },
		{ ID = 7434, Name = "royal axe", Value = 0 },
		{ ID = 7435, Name = "impaler", Value = 0 },
		{ ID = 7436, Name = "angelic axe", Value = 5000 },
		{ ID = 7437, Name = "sapphire hammer", Value = 7000 },
		{ ID = 7438, Name = "elvish bow", Value = 0 },
		{ ID = 7439, Name = "berserk potion", Value = 0 },
		{ ID = 7440, Name = "mastermind potion", Value = 0 },
		{ ID = 7441, Name = "ice cube", Value = 0 },
		{ ID = 7442, Name = "ice cube", Value = 0 },
		{ ID = 7443, Name = "bullseye potion", Value = 0 },
		{ ID = 7444, Name = "ice cube", Value = 0 },
		{ ID = 7445, Name = "ice mammoth", Value = 0 },
		{ ID = 7446, Name = "small ice statue (fish)", Value = 0 },
		{ ID = 7447, Name = "small ice statue (bird)", Value = 0 },
		{ ID = 7448, Name = "small ice statue", Value = 0 },
		{ ID = 7449, Name = "crystal sword", Value = 600 },
		{ ID = 7450, Name = "hammer of prophecy", Value = 0 },
		{ ID = 7451, Name = "shadow sceptre", Value = 10000 },
		{ ID = 7452, Name = "spiked squelcher", Value = 5000 },
		{ ID = 7453, Name = "executioner", Value = 55000 },
		{ ID = 7454, Name = "glorious axe", Value = 3000 },
		{ ID = 7455, Name = "mythril axe", Value = 0 },
		{ ID = 7456, Name = "noble axe", Value = 10000 },
		{ ID = 7457, Name = "fur boots", Value = 2000 },
		{ ID = 7458, Name = "fur cap", Value = 0 },
		{ ID = 7459, Name = "pair of earmuffs", Value = 1500 },
		{ ID = 7460, Name = "norse shield", Value = 1500 },
		{ ID = 7461, Name = "krimhorn helmet", Value = 200 },
		{ ID = 7462, Name = "ragnir helmet", Value = 400 },
		{ ID = 7463, Name = "mammoth fur cape", Value = 6000 },
		{ ID = 7464, Name = "mammoth fur shorts", Value = 850 },
		{ ID = 7527, Name = "jewel case (nomad)", Value = 0 },
		{ ID = 7528, Name = "piece of a broken amulet", Value = 0 },
		{ ID = 7529, Name = "piece of a broken amulet", Value = 0 },
		{ ID = 7530, Name = "piece of a broken amulet", Value = 0 },
		{ ID = 7531, Name = "piece of a broken amulet", Value = 0 },
		{ ID = 7532, Name = "koshei's ancient amulet", Value = 0 },
		{ ID = 7533, Name = "nomad parchment", Value = 0 },
		{ ID = 7642, Name = "great spirit potion", Value = 0 },
		{ ID = 7643, Name = "ultimate health potion", Value = 310 },
		{ ID = 7644, Name = "antIDote potion", Value = 0 },
		{ ID = 7754, Name = "jerom's family necklace", Value = 0 },
		{ ID = 7773, Name = "steel axe", Value = 0 },
		{ ID = 7774, Name = "jagged sword", Value = 0 },
		{ ID = 7785, Name = "bricklayers' kit", Value = 0 },
		{ ID = 7786, Name = "orc tusk", Value = 0 },
		{ ID = 7864, Name = "chimney kit", Value = 0 },
		{ ID = 7865, Name = "dwarf disguise kit", Value = 0 },
		{ ID = 7866, Name = "deed of ownership", Value = 0 },
		{ ID = 7870, Name = "stolen golden goblet", Value = 0 },
		{ ID = 7871, Name = "the famous mina losa painting", Value = 0 },
		{ ID = 7873, Name = "note from the thieves guild", Value = 0 },
		{ ID = 7876, Name = "small health potion", Value = 0 },
		{ ID = 7889, Name = "lock pick", Value = 0 },
		{ ID = 7924, Name = "the ring of the count", Value = 0 },
		{ ID = 7932, Name = "valuable vase", Value = 0 },
		{ ID = 7933, Name = "invitation", Value = 0 },
		{ ID = 7934, Name = "theodore loveless' key", Value = 0 },
		{ ID = 7935, Name = "compromising letter", Value = 0 },
		{ ID = 7936, Name = "fishnapped goldfish", Value = 0 },
		{ ID = 7939, Name = "precious necklace", Value = 0 },
		{ ID = 7940, Name = "letter to chantalle", Value = 0 },
		{ ID = 7991, Name = "magician's robe", Value = 0 },
		{ ID = 7992, Name = "mage hat", Value = 0 },
		{ ID = 7993, Name = "witchhunter's coat", Value = 0 },
		{ ID = 8010, Name = "potato", Value = 0 },
		{ ID = 8011, Name = "plum", Value = 0 },
		{ ID = 8012, Name = "raspberry", Value = 0 },
		{ ID = 8013, Name = "lemon", Value = 0 },
		{ ID = 8014, Name = "cucumber", Value = 0 },
		{ ID = 8015, Name = "onion", Value = 0 },
		{ ID = 8016, Name = "jalapeño pepper", Value = 0 },
		{ ID = 8017, Name = "beetroot", Value = 0 },
		{ ID = 8018, Name = "lump of chocolate dough", Value = 0 },
		{ ID = 8019, Name = "chocolate cake", Value = 0 },
		{ ID = 8020, Name = "baking tray (with dough)", Value = 0 },
		{ ID = 8021, Name = "modified crossbow", Value = 10000 },
		{ ID = 8022, Name = "chain bolter", Value = 0 },
		{ ID = 8023, Name = "royal crossbow", Value = 0 },
		{ ID = 8024, Name = "the devileye", Value = 0 },
		{ ID = 8025, Name = "the ironworker", Value = 50000 },
		{ ID = 8026, Name = "warsinger bow", Value = 0 },
		{ ID = 8027, Name = "composite hornbow", Value = 25000 },
		{ ID = 8028, Name = "yol's bow", Value = 0 },
		{ ID = 8029, Name = "silkweaver bow", Value = 12000 },
		{ ID = 8030, Name = "elethriel's elemental bow", Value = 0 },
		{ ID = 8031, Name = "spIDer fangs", Value = 10 },
		{ ID = 8032, Name = "spIDerwebs", Value = 0 },
		{ ID = 8037, Name = "dark lord's cape", Value = 0 },
		{ ID = 8038, Name = "robe of the ice queen", Value = 0 },
		{ ID = 8039, Name = "dragon robe", Value = 0 },
		{ ID = 8040, Name = "velvet mantle", Value = 0 },
		{ ID = 8041, Name = "greenwood coat", Value = 0 },
		{ ID = 8042, Name = "spirit cloak", Value = 350 },
		{ ID = 8043, Name = "focus cape", Value = 6000 },
		{ ID = 8044, Name = "belted cape", Value = 500 },
		{ ID = 8045, Name = "hibiscus dress", Value = 3000 },
		{ ID = 8046, Name = "summer dress", Value = 0 },
		{ ID = 8047, Name = "tunic", Value = 0 },
		{ ID = 8048, Name = "girl's dress", Value = 0 },
		{ ID = 8049, Name = "lavos armor", Value = 0 },
		{ ID = 8050, Name = "crystalline armor", Value = 16000 },
		{ ID = 8051, Name = "voltage armor", Value = 0 },
		{ ID = 8052, Name = "swamplair armor", Value = 0 },
		{ ID = 8053, Name = "fireborn giant armor", Value = 0 },
		{ ID = 8054, Name = "earthborn titan armor", Value = 0 },
		{ ID = 8055, Name = "windborn colossus armor", Value = 0 },
		{ ID = 8056, Name = "oceanborn leviathan armor", Value = 0 },
		{ ID = 8057, Name = "divine plate", Value = 55000 },
		{ ID = 8058, Name = "molten plate", Value = 0 },
		{ ID = 8059, Name = "frozen plate", Value = 0 },
		{ ID = 8060, Name = "master archer's armor", Value = 0 },
		{ ID = 8061, Name = "skullcracker armor", Value = 18000 },
		{ ID = 8062, Name = "robe of the underworld", Value = 0 },
		{ ID = 8063, Name = "paladin armor", Value = 15000 },
		{ ID = 8064, Name = "ethno coat", Value = 200 },
		{ ID = 8072, Name = "spellbook of enlightenment", Value = 4000 },
		{ ID = 8073, Name = "spellbook of warding", Value = 8000 },
		{ ID = 8074, Name = "spellbook of mind control", Value = 13000 },
		{ ID = 8075, Name = "spellbook of lost souls", Value = 19000 },
		{ ID = 8076, Name = "spellscroll of prophecies", Value = 0 },
		{ ID = 8077, Name = "rainbow shield", Value = 0 },
		{ ID = 8078, Name = "fiery rainbow shield", Value = 0 },
		{ ID = 8079, Name = "icy rainbow shield", Value = 0 },
		{ ID = 8080, Name = "sparking rainbow shield", Value = 0 },
		{ ID = 8081, Name = "terran rainbow shield", Value = 0 },
		{ ID = 8082, Name = "underworld rod", Value = 4400 },
		{ ID = 8083, Name = "northwind rod", Value = 1500 },
		{ ID = 8084, Name = "springsprout rod", Value = 3600 },
		{ ID = 8090, Name = "spellbook of dark mysteries", Value = 0 },
		{ ID = 8092, Name = "wand of starstorm", Value = 3600 },
		{ ID = 8093, Name = "wand of draconia", Value = 1500 },
		{ ID = 8094, Name = "wand of voodoo", Value = 4400 },
		{ ID = 8095, Name = "ranger legs", Value = 0 },
		{ ID = 8096, Name = "hellforged axe", Value = 0 },
		{ ID = 8097, Name = "solar axe", Value = 0 },
		{ ID = 8098, Name = "demonwing axe", Value = 0 },
		{ ID = 8099, Name = "dark trinity mace", Value = 0 },
		{ ID = 8100, Name = "obsIDian truncheon", Value = 0 },
		{ ID = 8101, Name = "the stomper", Value = 0 },
		{ ID = 8102, Name = "emerald sword", Value = 0 },
		{ ID = 8103, Name = "the epiphany", Value = 0 },
		{ ID = 8104, Name = "the calamity", Value = 0 },
		{ ID = 8117, Name = "theatre script", Value = 0 },
		{ ID = 8143, Name = "gland", Value = 0 },
		{ ID = 8146, Name = "oracle figurine", Value = 0 },
		{ ID = 8147, Name = "oracle figurine", Value = 0 },
		{ ID = 8148, Name = "golden falcon", Value = 0 },
		{ ID = 8149, Name = "tibiacity encyclopedia", Value = 0 },
		{ ID = 8153, Name = "golden newspaper", Value = 0 },
		{ ID = 8154, Name = "norseman doll", Value = 0 },
		{ ID = 8157, Name = "norseman doll", Value = 0 },
		{ ID = 8174, Name = "tibiacity encyclopedia", Value = 0 },
		{ ID = 8175, Name = "golden falcon", Value = 0 },
		{ ID = 8176, Name = "golden newspaper", Value = 0 },
		{ ID = 8177, Name = "yummy gummy worm", Value = 0 },
		{ ID = 8178, Name = "toy spIDer", Value = 0 },
		{ ID = 8179, Name = "toy spIDer", Value = 0 },
		{ ID = 8191, Name = "vampire doll", Value = 0 },
		{ ID = 8192, Name = "vampire lord token", Value = 0 },
		{ ID = 8194, Name = "garlic bread", Value = 0 },
		{ ID = 8195, Name = "lump of holy water dough", Value = 0 },
		{ ID = 8196, Name = "lump of garlic dough", Value = 0 },
		{ ID = 8197, Name = "bulb of garlic", Value = 0 },
		{ ID = 8199, Name = "garlic cookie", Value = 0 },
		{ ID = 8200, Name = "julius' map", Value = 0 },
		{ ID = 8225, Name = "blood crystal", Value = 0 },
		{ ID = 8453, Name = "blood crystal", Value = 0 },
		{ ID = 8531, Name = "blood goblet", Value = 10000 },
		{ ID = 8532, Name = "blood skull", Value = 0 },
		{ ID = 8717, Name = "the dust of boreth", Value = 0 },
		{ ID = 8718, Name = "the dust of lersatio", Value = 0 },
		{ ID = 8719, Name = "the dust of marziel", Value = 0 },
		{ ID = 8720, Name = "the dust of arthei", Value = 0 },
		{ ID = 8746, Name = "ghost's tear", Value = 0 },
		{ ID = 8758, Name = "bottle of bug milk", Value = 0 },
		{ ID = 8759, Name = "sample of venorean spice", Value = 0 },
		{ ID = 8760, Name = "sample of sand wasp honey", Value = 0 },
		{ ID = 8761, Name = "jug of embalming fluID", Value = 0 },
		{ ID = 8762, Name = "piece of royal satin", Value = 0 },
		{ ID = 8763, Name = "bowl of evergreen flowers", Value = 0 },
		{ ID = 8764, Name = "research notes", Value = 0 },
		{ ID = 8772, Name = "food crate", Value = 0 },
		{ ID = 8773, Name = "iriana's chest", Value = 0 },
		{ ID = 8774, Name = "cask of brown ale", Value = 3000 },
		{ ID = 8775, Name = "gear wheel", Value = 0 },
		{ ID = 8777, Name = "rerun's ring", Value = 0 },
		{ ID = 8778, Name = "jester doll", Value = 0 },
		{ ID = 8779, Name = "the head of a jester doll", Value = 0 },
		{ ID = 8780, Name = "the torso of a jester doll", Value = 0 },
		{ ID = 8781, Name = "part of a jester doll", Value = 0 },
		{ ID = 8782, Name = "part of a jester doll", Value = 0 },
		{ ID = 8783, Name = "part of a jester doll", Value = 0 },
		{ ID = 8784, Name = "part of a jester doll", Value = 0 },
		{ ID = 8818, Name = "the alchemists' formulas", Value = 0 },
		{ ID = 8819, Name = "animal cure", Value = 0 },
		{ ID = 8820, Name = "morik's helmet", Value = 0 },
		{ ID = 8822, Name = "ghost charm", Value = 0 },
		{ ID = 8827, Name = "charged ghost charm", Value = 0 },
		{ ID = 8828, Name = "weapon matrix crystal", Value = 0 },
		{ ID = 8829, Name = "food matrix crystal", Value = 0 },
		{ ID = 8853, Name = "suspicious surprise bag", Value = 0 },
		{ ID = 8860, Name = "brocade backpack", Value = 0 },
		{ ID = 8861, Name = "brocade bag", Value = 0 },
		{ ID = 8862, Name = "yalahari armor", Value = 0 },
		{ ID = 8863, Name = "yalahari leg piece", Value = 0 },
		{ ID = 8864, Name = "yalahari mask", Value = 0 },
		{ ID = 8894, Name = "rusty armor", Value = 0 },
		{ ID = 8895, Name = "rusty armor", Value = 0 },
		{ ID = 8896, Name = "rusty armor", Value = 0 },
		{ ID = 8897, Name = "rusty legs", Value = 0 },
		{ ID = 8898, Name = "rusty legs", Value = 0 },
		{ ID = 8899, Name = "rusty legs", Value = 0 },
		{ ID = 8923, Name = "velvet tapestry", Value = 800 },
		{ ID = 9013, Name = "flower wreath", Value = 0 },
		{ ID = 9014, Name = "leaf legs", Value = 0 },
		{ ID = 9015, Name = "flower dress", Value = 0 },
		{ ID = 9016, Name = "flask of rust remover", Value = 0 },
		{ ID = 9017, Name = "coconut shoes", Value = 0 },
		{ ID = 9018, Name = "firewalker boots (in use)", Value = 0 },
		{ ID = 9019, Name = "firewalker boots", Value = 0 },
		{ ID = 9020, Name = "worn firewalker boots", Value = 0 },
		{ ID = 9027, Name = "crystal of focus", Value = 2000 },
		{ ID = 9028, Name = "crystal of balance", Value = 1000 },
		{ ID = 9034, Name = "dracoyle statue", Value = 0 },
		{ ID = 9035, Name = "dracoyle statue", Value = 0 },
		{ ID = 9039, Name = "dracoyle statue", Value = 0 },
		{ ID = 9040, Name = "dracoyle statue", Value = 0 },
		{ ID = 9041, Name = "vampiric crest", Value = 0 },
		{ ID = 9045, Name = "royal tapestry", Value = 1000 },
		{ ID = 9046, Name = "silky tapestry", Value = 0 },
		{ ID = 9053, Name = "glob of mercury", Value = 20 },
		{ ID = 9054, Name = "glob of acID slime", Value = 25 },
		{ ID = 9055, Name = "glob of tar", Value = 30 },
		{ ID = 9056, Name = "black skull", Value = 4000 },
		{ ID = 9057, Name = "small topaz", Value = 200 },
		{ ID = 9058, Name = "gold ingot", Value = 5000 },
		{ ID = 9059, Name = "small lamp", Value = 0 },
		{ ID = 9060, Name = "lit small lamp", Value = 0 },
		{ ID = 9061, Name = "crystal table kit", Value = 0 },
		{ ID = 9063, Name = "crystal pedestal", Value = 0 },
		{ ID = 9064, Name = "crystal pedestal", Value = 0 },
		{ ID = 9065, Name = "crystal pedestal", Value = 0 },
		{ ID = 9066, Name = "crystal pedestal", Value = 0 },
		{ ID = 9067, Name = "crystal of power", Value = 3000 },
		{ ID = 9068, Name = "yalahari figurine", Value = 0 },
		{ ID = 9079, Name = "rotworm stew", Value = 0 },
		{ ID = 9080, Name = "hydra tongue salad", Value = 0 },
		{ ID = 9081, Name = "roasted dragon wings", Value = 0 },
		{ ID = 9082, Name = "tropical fried terrorbird", Value = 0 },
		{ ID = 9083, Name = "banana chocolate shake", Value = 0 },
		{ ID = 9084, Name = "veggie casserole", Value = 0 },
		{ ID = 9085, Name = "filled jalapeño peppers", Value = 0 },
		{ ID = 9086, Name = "blessed steak", Value = 0 },
		{ ID = 9087, Name = "carrot cake", Value = 0 },
		{ ID = 9088, Name = "northern fishburger", Value = 0 },
		{ ID = 9093, Name = "jean pierre's cookbook i", Value = 0 },
		{ ID = 9103, Name = "batwing hat", Value = 8000 },
		{ ID = 9106, Name = "molten wax", Value = 0 },
		{ ID = 9107, Name = "special polish", Value = 0 },
		{ ID = 9109, Name = "fish flakes", Value = 0 },
		{ ID = 9112, Name = "flask with magical oil", Value = 0 },
		{ ID = 9113, Name = "magical cage key", Value = 0 },
		{ ID = 9114, Name = "wooden ties", Value = 0 },
		{ ID = 9115, Name = "metal fitting", Value = 0 },
		{ ID = 9127, Name = "hat for eclesius", Value = 0 },
		{ ID = 9128, Name = "hat for eclesius", Value = 0 },
		{ ID = 9129, Name = "hat for eclesius", Value = 0 },
		{ ID = 9131, Name = "eclesius' sandals", Value = 0 },
		{ ID = 9142, Name = "grodrik's favourite axe", Value = 0 },
		{ ID = 9143, Name = "amarie's favourite book", Value = 0 },
		{ ID = 9144, Name = "epaminondas doll", Value = 0 },
		{ ID = 9145, Name = "epaminondas doll", Value = 0 },
		{ ID = 9172, Name = "prison cell key", Value = 0 },
		{ ID = 9173, Name = "love potion", Value = 0 },
		{ ID = 9181, Name = "the top right part of a map", Value = 0 },
		{ ID = 9182, Name = "the top left part of a map", Value = 0 },
		{ ID = 9183, Name = "the lower right part of a map", Value = 0 },
		{ ID = 9184, Name = "the lower left part of a map", Value = 0 },
		{ ID = 9185, Name = "very old piece of paper", Value = 0 },
		{ ID = 9186, Name = "old encrypted text", Value = 0 },
		{ ID = 9187, Name = "xodet's first wand", Value = 0 },
		{ ID = 9188, Name = "formula for a memory potion", Value = 0 },
		{ ID = 9189, Name = "hand puppets", Value = 0 },
		{ ID = 9190, Name = "hand puppets", Value = 0 },
		{ ID = 9191, Name = "bundle of rags", Value = 0 },
		{ ID = 9201, Name = "heated worm punisher", Value = 0 },
		{ ID = 9204, Name = "old pirate poem", Value = 0 },
		{ ID = 9205, Name = "pirate treasure map", Value = 0 },
		{ ID = 9215, Name = "gold medal", Value = 0 },
		{ ID = 9216, Name = "silver medal", Value = 0 },
		{ ID = 9217, Name = "bronze medal", Value = 0 },
		{ ID = 9232, Name = "cocktail glass", Value = 50 },
		{ ID = 9233, Name = "golem part", Value = 0 },
		{ ID = 9234, Name = "worm punisher", Value = 0 },
		{ ID = 9235, Name = "golem disassembler", Value = 0 },
		{ ID = 9236, Name = "animal fetish", Value = 0 },
		{ ID = 9237, Name = "shadow orb", Value = 0 },
		{ ID = 9238, Name = "dark essence", Value = 0 },
		{ ID = 9239, Name = "worm queen tooth", Value = 0 },
		{ ID = 9240, Name = "deep crystal", Value = 0 },
		{ ID = 9241, Name = "bloodkiss flower", Value = 0 },
		{ ID = 9247, Name = "golem blueprint", Value = 0 },
		{ ID = 9248, Name = "stabilizer", Value = 0 },
		{ ID = 9249, Name = "mago mechanic core", Value = 0 },
		{ ID = 9251, Name = "elemental crystal", Value = 0 },
		{ ID = 9252, Name = "old power core", Value = 0 },
		{ ID = 9255, Name = "golem head", Value = 0 },
		{ ID = 9301, Name = "bonfire amulet", Value = 0 },
		{ ID = 9302, Name = "sacred tree amulet", Value = 0 },
		{ ID = 9303, Name = "leviathan's amulet", Value = 3000 },
		{ ID = 9304, Name = "shockwave amulet", Value = 0 },
		{ ID = 9306, Name = "mechanical fishing rod", Value = 0 },
		{ ID = 9307, Name = "mechanical fish", Value = 0 },
		{ ID = 9308, Name = "nautical map", Value = 0 },
		{ ID = 9372, Name = "meat shield", Value = 0 },
		{ ID = 9373, Name = "glutton's mace", Value = 0 },
		{ ID = 9374, Name = "odd hat", Value = 0 },
		{ ID = 9375, Name = "pointed rabbitslayer", Value = 0 },
		{ ID = 9376, Name = "stale bread of ancientness", Value = 0 },
		{ ID = 9377, Name = "shield of the white knight", Value = 0 },
		{ ID = 9378, Name = "musician's bow", Value = 0 },
		{ ID = 9379, Name = "heavy metal t-shirt", Value = 0 },
		{ ID = 9380, Name = "shield of care", Value = 0 },
		{ ID = 9381, Name = "helmet of ultimate terror", Value = 0 },
		{ ID = 9382, Name = "helmet of nature", Value = 0 },
		{ ID = 9383, Name = "trousers of the ancients", Value = 0 },
		{ ID = 9384, Name = "scythe of the reaper", Value = 0 },
		{ ID = 9385, Name = "club of the fury", Value = 0 },
		{ ID = 9386, Name = "farmer's avenger", Value = 0 },
		{ ID = 9387, Name = "poet's fencing quill", Value = 0 },
		{ ID = 9388, Name = "holy icon", Value = 0 },
		{ ID = 9389, Name = "fan doll of king tibianus", Value = 0 },
		{ ID = 9390, Name = "machine crate", Value = 0 },
		{ ID = 9391, Name = "fan club membership card", Value = 0 },
		{ ID = 9394, Name = "claw of 'the noxious spawn'", Value = 15000 },
		{ ID = 9396, Name = "incredible mumpiz slayer", Value = 0 },
		{ ID = 9399, Name = "mighty helm of green sparks", Value = 0 },
		{ ID = 9400, Name = "the rain coat", Value = 0 },
		{ ID = 9401, Name = "the shield nevermourn", Value = 0 },
		{ ID = 9446, Name = "the rain coat", Value = 0 },
		{ ID = 9447, Name = "the shield nevermourn", Value = 0 },
		{ ID = 9537, Name = "headache pill", Value = 0 },
		{ ID = 9585, Name = "engraved wedding ring", Value = 0 },
		{ ID = 9586, Name = "wedding outfit box", Value = 0 },
		{ ID = 9593, Name = "broken wedding ring", Value = 0 },
		{ ID = 9594, Name = "sneaky stabber of eliteness", Value = 0 },
		{ ID = 9595, Name = "sneaky stabber of eliteness", Value = 0 },
		{ ID = 9596, Name = "squeezing gear of girlpower", Value = 0 },
		{ ID = 9597, Name = "squeezing gear of girlpower", Value = 0 },
		{ ID = 9598, Name = "whacking driller of fate", Value = 0 },
		{ ID = 9599, Name = "whacking driller of fate", Value = 0 },
		{ ID = 9601, Name = "demon backpack", Value = 0 },
		{ ID = 9602, Name = "orange backpack", Value = 0 },
		{ ID = 9603, Name = "orange bag", Value = 0 },
		{ ID = 9604, Name = "moon backpack", Value = 0 },
		{ ID = 9605, Name = "crown backpack", Value = 0 },
		{ ID = 9606, Name = "egg of the many", Value = 15000 },
		{ ID = 9613, Name = "sea serpent trophy", Value = 10000 },
		{ ID = 9615, Name = "mIDnight shard", Value = 0 },
		{ ID = 9616, Name = "bejeweled ship's telescope", Value = 20000 },
		{ ID = 9617, Name = "bejeweled ship's telescope", Value = 20000 },
		{ ID = 9618, Name = "bejeweled ship's telescope", Value = 20000 },
		{ ID = 9619, Name = "bejeweled ship's telescope", Value = 20000 },
		{ ID = 9631, Name = "scarab pincers", Value = 280 },
		{ ID = 9632, Name = "ancient stone", Value = 200 },
		{ ID = 9633, Name = "bloody pincers", Value = 100 },
		{ ID = 9634, Name = "cobra tongue", Value = 15 },
		{ ID = 9635, Name = "elvish talisman", Value = 45 },
		{ ID = 9636, Name = "fiery heart", Value = 375 },
		{ ID = 9637, Name = "hellhound slobber", Value = 500 },
		{ ID = 9638, Name = "cultish mask", Value = 280 },
		{ ID = 9639, Name = "cultish robe", Value = 150 },
		{ ID = 9640, Name = "poisonous slime", Value = 50 },
		{ ID = 9641, Name = "piece of scarab shell", Value = 45 },
		{ ID = 9642, Name = "spooky blue eye", Value = 95 },
		{ ID = 9643, Name = "thorn", Value = 100 },
		{ ID = 9644, Name = "wyvern talisman", Value = 265 },
		{ ID = 9645, Name = "black hood", Value = 190 },
		{ ID = 9646, Name = "book of prayers", Value = 120 },
		{ ID = 9647, Name = "demonic skeletal hand", Value = 80 },
		{ ID = 9648, Name = "frosty ear of a troll", Value = 30 },
		{ ID = 9649, Name = "gauze bandage", Value = 90 },
		{ ID = 9650, Name = "polar bear paw", Value = 30 },
		{ ID = 9651, Name = "scorpion tail", Value = 25 },
		{ ID = 9652, Name = "witch broom", Value = 60 },
		{ ID = 9653, Name = "witch hat", Value = 5000 },
		{ ID = 9654, Name = "war crystal", Value = 460 },
		{ ID = 9655, Name = "gear crystal", Value = 200 },
		{ ID = 9656, Name = "broken gladiator shield", Value = 180 },
		{ ID = 9657, Name = "cyclops toe", Value = 55 },
		{ ID = 9658, Name = "frost giant pelt", Value = 160 },
		{ ID = 9659, Name = "half-eaten brain", Value = 85 },
		{ ID = 9660, Name = "mystical hourglass", Value = 700 },
		{ ID = 9661, Name = "frosty heart", Value = 280 },
		{ ID = 9662, Name = "mutated bat ear", Value = 420 },
		{ ID = 9663, Name = "piece of dead brain", Value = 420 },
		{ ID = 9664, Name = "piece of hellfire armor", Value = 550 },
		{ ID = 9665, Name = "wyrm scale", Value = 400 },
		{ ID = 9666, Name = "sea serpent scale", Value = 520 },
		{ ID = 9667, Name = "boggy dreads", Value = 200 },
		{ ID = 9668, Name = "mutated rat tail", Value = 150 },
		{ ID = 9683, Name = "haunted piece of wood", Value = 115 },
		{ ID = 9684, Name = "tattered piece of robe", Value = 120 },
		{ ID = 9685, Name = "vampire teeth", Value = 275 },
		{ ID = 9686, Name = "swamp grass", Value = 20 },
		{ ID = 9688, Name = "bundle of cursed straw", Value = 800 },
		{ ID = 9689, Name = "bunch of troll hair", Value = 20 },
		{ ID = 9690, Name = "ghostly tissue", Value = 90 },
		{ ID = 9691, Name = "lion's mane", Value = 60 },
		{ ID = 9692, Name = "lump of dirt", Value = 10 },
		{ ID = 9693, Name = "pig foot", Value = 10 },
		{ ID = 9694, Name = "snake skin", Value = 400 },
		{ ID = 9696, Name = "plans for a strange device", Value = 0 },
		{ ID = 9697, Name = "rare crystal", Value = 0 },
		{ ID = 9698, Name = "carrying device", Value = 0 },
		{ ID = 9699, Name = "filled carrying device", Value = 0 },
		{ ID = 9802, Name = "friendship amulet", Value = 0 },
		{ ID = 9803, Name = "friendship amulet", Value = 0 },
		{ ID = 9843, Name = "flask with beaver bait", Value = 0 },
		{ ID = 10009, Name = "flask of crown polisher", Value = 0 },
		{ ID = 10011, Name = "map to the unknown", Value = 0 },
		{ ID = 10025, Name = "almanac of magic", Value = 0 },
		{ ID = 10026, Name = "baby rotworm", Value = 0 },
		{ ID = 10027, Name = "universal tool", Value = 0 },
		{ ID = 10028, Name = "soul contract", Value = 0 },
		{ ID = 10159, Name = "skull of a caveman", Value = 0 },
		{ ID = 10183, Name = "flask of poison", Value = 0 },
		{ ID = 10184, Name = "tactical map", Value = 0 },
		{ ID = 10189, Name = "flask of extra greasy oil", Value = 0 },
		{ ID = 10196, Name = "orc tooth", Value = 150 },
		{ ID = 10198, Name = "tribal crest", Value = 0 },
		{ ID = 10199, Name = "serpent crest", Value = 0 },
		{ ID = 10200, Name = "crystal boots", Value = 0 },
		{ ID = 10201, Name = "dragon scale boots", Value = 0 },
		{ ID = 10202, Name = "heart backpack", Value = 0 },
		{ ID = 10209, Name = "lizard weapon rack kit", Value = 0 },
		{ ID = 10216, Name = "dragon statue kit", Value = 0 },
		{ ID = 10217, Name = "tome of knowledge", Value = 0 },
		{ ID = 10218, Name = "corned fish", Value = 0 },
		{ ID = 10219, Name = "crocodile steak", Value = 0 },
		{ ID = 10227, Name = "nightmare doll", Value = 0 },
		{ ID = 10244, Name = "bonebeast trophy", Value = 6000 },
		{ ID = 10247, Name = "weapons crate", Value = 0 },
		{ ID = 10272, Name = "crab pincers", Value = 35 },
		{ ID = 10273, Name = "terrorbird beak", Value = 95 },
		{ ID = 10274, Name = "skunk tail", Value = 50 },
		{ ID = 10275, Name = "carrion worm fang", Value = 35 },
		{ ID = 10276, Name = "elder bonelord tentacle", Value = 150 },
		{ ID = 10277, Name = "bony tail", Value = 210 },
		{ ID = 10278, Name = "stone wing", Value = 120 },
		{ ID = 10279, Name = "piece of crocodile leather", Value = 15 },
		{ ID = 10280, Name = "giant eye", Value = 380 },
		{ ID = 10281, Name = "tarantula egg", Value = 80 },
		{ ID = 10282, Name = "hydra head", Value = 600 },
		{ ID = 10283, Name = "half-digested piece of meat", Value = 55 },
		{ ID = 10288, Name = "dragon throne kit", Value = 0 },
		{ ID = 10289, Name = "red lantern", Value = 0 },
		{ ID = 10290, Name = "mini mummy", Value = 0 },
		{ ID = 10291, Name = "rotten piece of cloth", Value = 30 },
		{ ID = 10292, Name = "silky fur", Value = 35 },
		{ ID = 10293, Name = "striped fur", Value = 50 },
		{ ID = 10294, Name = "stuffed toad", Value = 0 },
		{ ID = 10295, Name = "winter wolf fur", Value = 20 },
		{ ID = 10296, Name = "acorn", Value = 10 },
		{ ID = 10297, Name = "antlers", Value = 50 },
		{ ID = 10298, Name = "metal spike", Value = 320 },
		{ ID = 10299, Name = "badger fur", Value = 15 },
		{ ID = 10300, Name = "carniphila seeds", Value = 50 },
		{ ID = 10301, Name = "centipede leg", Value = 28 },
		{ ID = 10302, Name = "compass", Value = 45 },
		{ ID = 10303, Name = "dark rosary", Value = 48 },
		{ ID = 10304, Name = "hellspawn tail", Value = 475 },
		{ ID = 10305, Name = "lump of earth", Value = 130 },
		{ ID = 10306, Name = "essence of a bad dream", Value = 360 },
		{ ID = 10307, Name = "thick fur", Value = 150 },
		{ ID = 10308, Name = "mutated flesh", Value = 50 },
		{ ID = 10309, Name = "strand of medusa hair", Value = 600 },
		{ ID = 10310, Name = "shiny stone", Value = 500 },
		{ ID = 10311, Name = "sabretooth", Value = 400 },
		{ ID = 10312, Name = "scythe leg", Value = 450 },
		{ ID = 10313, Name = "winged tail", Value = 800 },
		{ ID = 10314, Name = "nettle blossom", Value = 75 },
		{ ID = 10315, Name = "sulphurous stone", Value = 100 },
		{ ID = 10316, Name = "unholy bone", Value = 480 },
		{ ID = 10317, Name = "werewolf fur", Value = 380 },
		{ ID = 10318, Name = "warwolf fur", Value = 30 },
		{ ID = 10319, Name = "wool", Value = 15 },
		{ ID = 10320, Name = "book of necromantic rituals", Value = 180 },
		{ ID = 10321, Name = "mammoth tusk", Value = 100 },
		{ ID = 10323, Name = "guardian boots", Value = 35000 },
		{ ID = 10324, Name = "expedition backpack", Value = 0 },
		{ ID = 10325, Name = "expedition bag", Value = 0 },
		{ ID = 10326, Name = "dragon backpack", Value = 0 },
		{ ID = 10327, Name = "minotaur backpack", Value = 0 },
		{ ID = 10328, Name = "bunch of ripe rice", Value = 0 },
		{ ID = 10329, Name = "rice ball", Value = 0 },
		{ ID = 10338, Name = "santa teddy", Value = 0 },
		{ ID = 10339, Name = "snowman doll", Value = 0 },
		{ ID = 10341, Name = "phoenix charm", Value = 0 },
		{ ID = 10342, Name = "unity charm", Value = 0 },
		{ ID = 10343, Name = "spiritual charm", Value = 0 },
		{ ID = 10344, Name = "twin sun charm", Value = 0 },
		{ ID = 10345, Name = "solitude charm", Value = 0 },
		{ ID = 10346, Name = "santa backpack", Value = 0 },
		{ ID = 10347, Name = "dragon tapestry", Value = 0 },
		{ ID = 10384, Name = "zaoan armor", Value = 14000 },
		{ ID = 10385, Name = "zaoan helmet", Value = 45000 },
		{ ID = 10386, Name = "zaoan shoes", Value = 5000 },
		{ ID = 10387, Name = "zaoan legs", Value = 14000 },
		{ ID = 10388, Name = "drakinata", Value = 10000 },
		{ ID = 10389, Name = "sais", Value = 16500 },
		{ ID = 10390, Name = "zaoan sword", Value = 30000 },
		{ ID = 10391, Name = "drachaku", Value = 10000 },
		{ ID = 10392, Name = "twin hooks", Value = 500 },
		{ ID = 10397, Name = "weaver's wandtip", Value = 250 },
		{ ID = 10398, Name = "draken trophy", Value = 0 },
		{ ID = 10404, Name = "bone shoulderplate", Value = 150 },
		{ ID = 10405, Name = "warmaster's wristguards", Value = 200 },
		{ ID = 10406, Name = "zaoan halberd", Value = 500 },
		{ ID = 10407, Name = "shaggy tail", Value = 25 },
		{ ID = 10408, Name = "spiked iron ball", Value = 100 },
		{ ID = 10409, Name = "corrupted flag", Value = 700 },
		{ ID = 10410, Name = "cursed shoulder spikes", Value = 320 },
		{ ID = 10411, Name = "wIDow's mandibles", Value = 110 },
		{ ID = 10412, Name = "wailing wIDow's necklace", Value = 3000 },
		{ ID = 10413, Name = "zaogun flag", Value = 600 },
		{ ID = 10414, Name = "zaogun shoulderplates", Value = 150 },
		{ ID = 10415, Name = "high guard flag", Value = 550 },
		{ ID = 10416, Name = "high guard shoulderplates", Value = 130 },
		{ ID = 10417, Name = "legionnaire flags", Value = 500 },
		{ ID = 10418, Name = "broken halberd", Value = 100 },
		{ ID = 10419, Name = "lizard trophy", Value = 0 },
		{ ID = 10420, Name = "petrified scream", Value = 250 },
		{ ID = 10421, Name = "disgusting trophy", Value = 0 },
		{ ID = 10422, Name = "clay lump", Value = 0 },
		{ ID = 10426, Name = "piece of marble rock", Value = 0 },
		{ ID = 10438, Name = "spellweaver's robe", Value = 12000 },
		{ ID = 10439, Name = "zaoan robe", Value = 12000 },
		{ ID = 10444, Name = "dragon priest's wandtip", Value = 175 },
		{ ID = 10449, Name = "ghastly dragon head", Value = 700 },
		{ ID = 10450, Name = "undead heart", Value = 200 },
		{ ID = 10451, Name = "jade hat", Value = 9000 },
		{ ID = 10452, Name = "terramite shell", Value = 170 },
		{ ID = 10453, Name = "terramite eggs", Value = 50 },
		{ ID = 10454, Name = "terramite legs", Value = 60 },
		{ ID = 10455, Name = "lancer beetle shell", Value = 80 },
		{ ID = 10456, Name = "sandcrawler shell", Value = 20 },
		{ ID = 10457, Name = "beetle necklace", Value = 0 },
		{ ID = 10476, Name = "lucky clover amulet", Value = 0 },
		{ ID = 10477, Name = "dragon goblet", Value = 0 },
		{ ID = 10798, Name = "ferumbras doll", Value = 0 },
		{ ID = 10799, Name = "ferumbras doll", Value = 0 },
		{ ID = 10800, Name = "orc's jaw shredder", Value = 0 },
		{ ID = 10801, Name = "orc's jaw shredder", Value = 0 },
		{ ID = 10817, Name = "bag of oriental spices", Value = 0 },
		{ ID = 10818, Name = "bag of oriental spices", Value = 0 },
		{ ID = 11328, Name = "marked crate", Value = 0 },
		{ ID = 11329, Name = "lump of clay", Value = 0 },
		{ ID = 11331, Name = "sacred bowl", Value = 0 },
		{ ID = 11333, Name = "bowl with sacred water", Value = 0 },
		{ ID = 11334, Name = "sacred coal", Value = 0 },
		{ ID = 11339, Name = "unworked sacred wood", Value = 0 },
		{ ID = 11341, Name = "sacred earth", Value = 0 },
		{ ID = 11344, Name = "lump of sacred clay", Value = 0 },
		{ ID = 11347, Name = "sacred bowl of purification", Value = 0 },
		{ ID = 11362, Name = "replica of the sceptre", Value = 0 },
		{ ID = 11364, Name = "flask of plant poison", Value = 0 },
		{ ID = 11367, Name = "the tail of the keeper", Value = 0 },
		{ ID = 11368, Name = "sceptre part", Value = 0 },
		{ ID = 11369, Name = "sceptre part", Value = 0 },
		{ ID = 11370, Name = "sceptre part", Value = 0 },
		{ ID = 11371, Name = "snake sceptre", Value = 0 },
		{ ID = 11372, Name = "interdimensional potion", Value = 0 },
		{ ID = 11426, Name = "scribbled sheet of paper", Value = 0 },
		{ ID = 11443, Name = "girlish hair decoration", Value = 30 },
		{ ID = 11444, Name = "protective charm", Value = 60 },
		{ ID = 11445, Name = "bamboo stick", Value = 30 },
		{ ID = 11446, Name = "hair of a banshee", Value = 350 },
		{ ID = 11447, Name = "battle stone", Value = 290 },
		{ ID = 11448, Name = "black wool", Value = 300 },
		{ ID = 11449, Name = "blood preservation", Value = 320 },
		{ ID = 11450, Name = "small notebook", Value = 480 },
		{ ID = 11451, Name = "broken crossbow", Value = 30 },
		{ ID = 11452, Name = "broken shamanic staff", Value = 35 },
		{ ID = 11453, Name = "broken helmet", Value = 20 },
		{ ID = 11454, Name = "luminous orb", Value = 1000 },
		{ ID = 11455, Name = "cultish symbol", Value = 500 },
		{ ID = 11456, Name = "dirty turban", Value = 120 },
		{ ID = 11457, Name = "dragon's tail", Value = 100 },
		{ ID = 11458, Name = "geomancer's robe", Value = 80 },
		{ ID = 11459, Name = "pineapple", Value = 0 },
		{ ID = 11460, Name = "aubergine", Value = 0 },
		{ ID = 11461, Name = "broccoli", Value = 2 },
		{ ID = 11462, Name = "cauliflower", Value = 0 },
		{ ID = 11463, Name = "geomancer's staff", Value = 120 },
		{ ID = 11464, Name = "elven scouting glass", Value = 50 },
		{ ID = 11465, Name = "elven astral observer", Value = 90 },
		{ ID = 11466, Name = "flask of embalming fluID", Value = 30 },
		{ ID = 11467, Name = "ghoul snack", Value = 60 },
		{ ID = 11468, Name = "ornamented brooch", Value = 0 },
		{ ID = 11469, Name = "hunter's quiver", Value = 80 },
		{ ID = 11470, Name = "jewelled belt", Value = 180 },
		{ ID = 11471, Name = "kongra's shoulderpad", Value = 100 },
		{ ID = 11472, Name = "minotaur horn", Value = 75 },
		{ ID = 11473, Name = "purple robe", Value = 110 },
		{ ID = 11474, Name = "miraculum", Value = 60 },
		{ ID = 11475, Name = "necromantic robe", Value = 250 },
		{ ID = 11476, Name = "nettle spit", Value = 25 },
		{ ID = 11477, Name = "orcish gear", Value = 85 },
		{ ID = 11478, Name = "shamanic hood", Value = 45 },
		{ ID = 11479, Name = "orc leather", Value = 30 },
		{ ID = 11480, Name = "skull belt", Value = 80 },
		{ ID = 11481, Name = "pelvis bone", Value = 30 },
		{ ID = 11482, Name = "piece of warrior armor", Value = 50 },
		{ ID = 11483, Name = "piece of archer armor", Value = 20 },
		{ ID = 11484, Name = "pile of grave earth", Value = 25 },
		{ ID = 11485, Name = "poison spIDer shell", Value = 10 },
		{ ID = 11486, Name = "noble turban", Value = 430 },
		{ ID = 11487, Name = "quara tentacle", Value = 140 },
		{ ID = 11488, Name = "quara eye", Value = 350 },
		{ ID = 11489, Name = "mantassin tail", Value = 280 },
		{ ID = 11490, Name = "quara pincers", Value = 410 },
		{ ID = 11491, Name = "quara bone", Value = 500 },
		{ ID = 11492, Name = "rope belt", Value = 66 },
		{ ID = 11493, Name = "safety pin", Value = 120 },
		{ ID = 11510, Name = "scroll of heroic deeds", Value = 230 },
		{ ID = 11511, Name = "banana sash", Value = 55 },
		{ ID = 11512, Name = "small flask of eyedrops", Value = 95 },
		{ ID = 11513, Name = "small pitchfork", Value = 70 },
		{ ID = 11514, Name = "colourful feather", Value = 110 },
		{ ID = 11515, Name = "trollroot", Value = 50 },
		{ ID = 11539, Name = "goblin ear", Value = 20 },
		{ ID = 11541, Name = "jean pierre's cookbook ii", Value = 0 },
		{ ID = 11545, Name = "exquisite silk", Value = 0 },
		{ ID = 11546, Name = "spectral cloth", Value = 0 },
		{ ID = 11547, Name = "exquisite wood", Value = 0 },
		{ ID = 11548, Name = "strong sinew", Value = 0 },
		{ ID = 11549, Name = "old iron", Value = 0 },
		{ ID = 11550, Name = "flexible dragon scale", Value = 0 },
		{ ID = 11551, Name = "mystic root", Value = 0 },
		{ ID = 11552, Name = "magic crystal", Value = 0 },
		{ ID = 11584, Name = "coconut shrimp bake", Value = 0 },
		{ ID = 11585, Name = "helmet of the deep", Value = 0 },
		{ ID = 11586, Name = "pot of blackjack", Value = 0 },
		{ ID = 11587, Name = "demonic candy ball", Value = 0 },
		{ ID = 11588, Name = "sweet mangonaise elixir", Value = 0 },
		{ ID = 11603, Name = "silver rune emblem", Value = 0 },
		{ ID = 11604, Name = "golden rune emblem", Value = 0 },
		{ ID = 11605, Name = "silver rune emblem", Value = 0 },
		{ ID = 11606, Name = "golden rune emblem", Value = 0 },
		{ ID = 11607, Name = "silver rune emblem", Value = 0 },
		{ ID = 11608, Name = "golden rune emblem", Value = 0 },
		{ ID = 11609, Name = "silver rune emblem", Value = 0 },
		{ ID = 11610, Name = "golden rune emblem", Value = 0 },
		{ ID = 11611, Name = "silver rune emblem", Value = 0 },
		{ ID = 11612, Name = "golden rune emblem", Value = 0 },
		{ ID = 11613, Name = "silver rune emblem", Value = 0 },
		{ ID = 11614, Name = "golden rune emblem", Value = 0 },
		{ ID = 11615, Name = "silver rune emblem", Value = 0 },
		{ ID = 11616, Name = "golden rune emblem", Value = 0 },
		{ ID = 11617, Name = "silver rune emblem", Value = 0 },
		{ ID = 11618, Name = "golden rune emblem", Value = 0 },
		{ ID = 11619, Name = "silver rune emblem", Value = 0 },
		{ ID = 11620, Name = "golden rune emblem", Value = 0 },
		{ ID = 11621, Name = "silver rune emblem", Value = 0 },
		{ ID = 11622, Name = "golden rune emblem", Value = 0 },
		{ ID = 11623, Name = "silver rune emblem", Value = 0 },
		{ ID = 11624, Name = "golden rune emblem", Value = 0 },
		{ ID = 11625, Name = "silver rune emblem", Value = 0 },
		{ ID = 11626, Name = "golden rune emblem", Value = 0 },
		{ ID = 11627, Name = "silver rune emblem", Value = 0 },
		{ ID = 11628, Name = "golden rune emblem", Value = 0 },
		{ ID = 11629, Name = "silver rune emblem", Value = 0 },
		{ ID = 11630, Name = "golden rune emblem", Value = 0 },
		{ ID = 11631, Name = "silver rune emblem", Value = 0 },
		{ ID = 11632, Name = "golden rune emblem", Value = 0 },
		{ ID = 11633, Name = "silver rune emblem", Value = 0 },
		{ ID = 11634, Name = "golden rune emblem", Value = 0 },
		{ ID = 11635, Name = "silver rune emblem", Value = 0 },
		{ ID = 11636, Name = "golden rune emblem", Value = 0 },
		{ ID = 11637, Name = "silver rune emblem", Value = 0 },
		{ ID = 11638, Name = "golden rune emblem", Value = 0 },
		{ ID = 11639, Name = "silver rune emblem", Value = 0 },
		{ ID = 11640, Name = "golden rune emblem", Value = 0 },
		{ ID = 11641, Name = "silver rune emblem", Value = 0 },
		{ ID = 11642, Name = "golden rune emblem", Value = 0 },
		{ ID = 11643, Name = "silver rune emblem", Value = 0 },
		{ ID = 11644, Name = "golden rune emblem", Value = 0 },
		{ ID = 11645, Name = "silver rune emblem", Value = 0 },
		{ ID = 11646, Name = "golden rune emblem", Value = 0 },
		{ ID = 11647, Name = "silver rune emblem", Value = 0 },
		{ ID = 11648, Name = "golden rune emblem", Value = 0 },
		{ ID = 11649, Name = "silver rune emblem", Value = 0 },
		{ ID = 11650, Name = "golden rune emblem", Value = 0 },
		{ ID = 11651, Name = "elite draken mail", Value = 0 },
		{ ID = 11652, Name = "broken key ring", Value = 8000 },
		{ ID = 11657, Name = "twiceslicer", Value = 28000 },
		{ ID = 11658, Name = "draken sulphur", Value = 550 },
		{ ID = 11659, Name = "draken wristbands", Value = 430 },
		{ ID = 11660, Name = "broken draken mail", Value = 340 },
		{ ID = 11661, Name = "broken slicer", Value = 120 },
		{ ID = 11666, Name = "tentacle piece", Value = 5000 },
		{ ID = 11671, Name = "eye of corruption", Value = 390 },
		{ ID = 11672, Name = "tail of corruption", Value = 240 },
		{ ID = 11673, Name = "scale of corruption", Value = 680 },
		{ ID = 11674, Name = "cobra crown", Value = 0 },
		{ ID = 11679, Name = "souleater trophy", Value = 7500 },
		{ ID = 11680, Name = "lizard essence", Value = 300 },
		{ ID = 11681, Name = "ectoplasmic sushi", Value = 300 },
		{ ID = 11682, Name = "dragonfruit", Value = 0 },
		{ ID = 11683, Name = "peas", Value = 0 },
		{ ID = 11684, Name = "downy feather", Value = 20 },
		{ ID = 11685, Name = "cheese cookie", Value = 0 },
		{ ID = 11686, Name = "royal draken mail", Value = 0 },
		{ ID = 11687, Name = "royal scale robe", Value = 0 },
		{ ID = 11688, Name = "shield of corruption", Value = 0 },
		{ ID = 11689, Name = "elite draken helmet", Value = 0 },
		{ ID = 11691, Name = "snake god's wristguard", Value = 0 },
		{ ID = 11692, Name = "snake god's sceptre", Value = 0 },
		{ ID = 11693, Name = "blade of corruption", Value = 60000 },
		{ ID = 11694, Name = "snake god trophy", Value = 0 },
		{ ID = 11695, Name = "black jade cobra", Value = 0 },
		{ ID = 11699, Name = "botany almanach", Value = 0 },
		{ ID = 11700, Name = "sedge hat", Value = 0 },
		{ ID = 11701, Name = "old cape", Value = 0 },
		{ ID = 11702, Name = "brimstone fangs", Value = 350 },
		{ ID = 11703, Name = "brimstone shell", Value = 120 },
		{ ID = 11982, Name = "dry piece of wood", Value = 0 },
		{ ID = 12039, Name = "panther head", Value = 750 },
		{ ID = 12040, Name = "panther paw", Value = 300 },
		{ ID = 12041, Name = "frozen heart", Value = 0 },
		{ ID = 12042, Name = "frozen heart", Value = 0 },
		{ ID = 12043, Name = "draken doll", Value = 0 },
		{ ID = 12044, Name = "draken doll", Value = 0 },
		{ ID = 12045, Name = "music box", Value = 0 },
		{ ID = 12046, Name = "music box", Value = 0 },
		{ ID = 12057, Name = "reward box", Value = 0 },
		{ ID = 12077, Name = "slime gobbler", Value = 0 },
		{ ID = 12123, Name = "ghost duster", Value = 0 },
		{ ID = 12128, Name = "emergency kit", Value = 0 },
		{ ID = 12143, Name = "sweet and sugary substance", Value = 0 },
		{ ID = 12171, Name = "handcrafted ribbon", Value = 0 },
		{ ID = 12172, Name = "rabbit's foot", Value = 50 },
		{ ID = 12173, Name = "rabbit's foot lucky charm", Value = 0 },
		{ ID = 12174, Name = "fake rabbit's foot", Value = 0 },
		{ ID = 12175, Name = "spoon with a ribbon", Value = 0 },
		{ ID = 12178, Name = "demon infant", Value = 0 },
		{ ID = 12179, Name = "demon infant", Value = 0 },
		{ ID = 12180, Name = "demon infant", Value = 0 },
		{ ID = 12181, Name = "demon infant", Value = 0 },
		{ ID = 12182, Name = "demon infant", Value = 0 },
		{ ID = 12186, Name = "net", Value = 0 },
		{ ID = 12229, Name = "screaming cherry", Value = 0 },
		{ ID = 12230, Name = "meaty vortex", Value = 0 },
		{ ID = 12231, Name = "tonguefruit", Value = 0 },
		{ ID = 12232, Name = "rotten witches cauldron seed", Value = 0 },
		{ ID = 12233, Name = "toxic tulip seed", Value = 0 },
		{ ID = 12234, Name = "sprocketwhip cone", Value = 0 },
		{ ID = 12235, Name = "witherblossom", Value = 0 },
		{ ID = 12237, Name = "scum bag", Value = 0 },
		{ ID = 12251, Name = "shapechanger", Value = 0 },
		{ ID = 12260, Name = "hunting horn", Value = 0 },
		{ ID = 12304, Name = "maxilla maximus", Value = 0 },
		{ ID = 12305, Name = "tin key", Value = 0 },
		{ ID = 12306, Name = "leather whip", Value = 0 },
		{ ID = 12307, Name = "harness", Value = 0 },
		{ ID = 12308, Name = "reins", Value = 0 },
		{ ID = 12309, Name = "harness", Value = 0 },
		{ ID = 12310, Name = "haunch of boar", Value = 0 },
		{ ID = 12311, Name = "carrot on a stick", Value = 0 },
		{ ID = 12312, Name = "stampor horn", Value = 280 },
		{ ID = 12313, Name = "stampor talons", Value = 150 },
		{ ID = 12314, Name = "hollow stampor hoof", Value = 400 },
		{ ID = 12315, Name = "maxilla", Value = 250 },
		{ ID = 12316, Name = "cavebear skull", Value = 550 },
		{ ID = 12317, Name = "giant crab pincer", Value = 950 },
		{ ID = 12318, Name = "giant shrimp", Value = 0 },
		{ ID = 12320, Name = "sweet smelling bait", Value = 0 },
		{ ID = 12369, Name = "captured wolf", Value = 0 },
		{ ID = 12413, Name = "belongings of a deceased", Value = 0 },
		{ ID = 12478, Name = "delicate vase", Value = 0 },
		{ ID = 12482, Name = "hieroglyph banner", Value = 0 },
		{ ID = 12483, Name = "pharaoh banner", Value = 0 },
		{ ID = 12509, Name = "scorpion sceptre", Value = 0 },
		{ ID = 12517, Name = "medicine pouch", Value = 0 },
		{ ID = 12519, Name = "slug drug", Value = 0 },
		{ ID = 12541, Name = "demonic finger", Value = 1000 },
		{ ID = 12542, Name = "golden scorpion pendant", Value = 0 },
		{ ID = 12543, Name = "golden hyena pendant", Value = 0 },
		{ ID = 12544, Name = "white deer antlers", Value = 400 },
		{ ID = 12545, Name = "white deer skin", Value = 245 },
		{ ID = 12546, Name = "fist on a stick", Value = 0 },
		{ ID = 12547, Name = "diapason", Value = 0 },
		{ ID = 12548, Name = "bag of apple slices", Value = 0 },
		{ ID = 12549, Name = "bamboo leaves", Value = 0 },
		{ ID = 12550, Name = "golden fir cone", Value = 0 },
		{ ID = 12551, Name = "ominous piece of cloth", Value = 0 },
		{ ID = 12552, Name = "dubious piece of cloth", Value = 0 },
		{ ID = 12553, Name = "voluminous piece of cloth", Value = 0 },
		{ ID = 12554, Name = "obvious piece of cloth", Value = 0 },
		{ ID = 12555, Name = "ludicrous piece of cloth", Value = 0 },
		{ ID = 12556, Name = "luminous piece of cloth", Value = 0 },
		{ ID = 12557, Name = "shimmer swimmer", Value = 3000 },
		{ ID = 12570, Name = "fan doll of queen eloise", Value = 0 },
		{ ID = 12571, Name = "fan doll of queen eloise", Value = 0 },
		{ ID = 12572, Name = "dragon goblet", Value = 0 },
		{ ID = 12575, Name = "whinona", Value = 0 },
		{ ID = 12576, Name = "meandi", Value = 0 },
		{ ID = 12577, Name = "impward", Value = 0 },
		{ ID = 12578, Name = "evilina", Value = 0 },
		{ ID = 12579, Name = "whinona", Value = 0 },
		{ ID = 12580, Name = "meandi", Value = 0 },
		{ ID = 12581, Name = "impward", Value = 0 },
		{ ID = 12582, Name = "evilina", Value = 0 },
		{ ID = 12599, Name = "mage's cap", Value = 0 },
		{ ID = 12600, Name = "coal", Value = 20 },
		{ ID = 12601, Name = "slime mould", Value = 600 },
		{ ID = 12602, Name = "small whistle", Value = 0 },
		{ ID = 12603, Name = "wand of dimensions", Value = 0 },
		{ ID = 12617, Name = "torn teddy", Value = 0 },
		{ ID = 12669, Name = "star ring", Value = 0 },
		{ ID = 12673, Name = "wooden sword", Value = 0 },
		{ ID = 12675, Name = "book of orc language", Value = 0 },
		{ ID = 12683, Name = "heavy trIDent", Value = 2000 },
		{ ID = 12722, Name = "bucket of bog water", Value = 0 },
		{ ID = 12730, Name = "eye of a deepling", Value = 150 },
		{ ID = 12735, Name = "shimmer glower", Value = 0 },
		{ ID = 12736, Name = "babel swimmer", Value = 0 },
		{ ID = 12737, Name = "broken ring of ending", Value = 4000 },
		{ ID = 12742, Name = "yielocks", Value = 600 },
		{ ID = 12786, Name = "plague mask", Value = 0 },
		{ ID = 12787, Name = "plague bell", Value = 0 },
		{ ID = 12801, Name = "golden can of oil", Value = 0 },
		{ ID = 12802, Name = "sugar oat", Value = 0 },
		{ ID = 12803, Name = "elemental spikes", Value = 0 },
		{ ID = 12805, Name = "yielowax", Value = 600 },
		{ ID = 12806, Name = "flintstone", Value = 800 },
		{ ID = 12807, Name = "shimmer ball", Value = 0 },
		{ ID = 12809, Name = "the epic wisdom", Value = 0 },
		{ ID = 12810, Name = "the epic wisdom", Value = 0 },
		{ ID = 12811, Name = "imortus", Value = 0 },
		{ ID = 12812, Name = "imortus", Value = 0 },
		{ ID = 12813, Name = "old radio", Value = 0 },
		{ ID = 12814, Name = "old radio", Value = 0 },
		{ ID = 12819, Name = "prepared bucket", Value = 0 },
		{ ID = 12904, Name = "dread doll", Value = 0 },
		{ ID = 12905, Name = "dread doll", Value = 0 },
		{ ID = 13844, Name = "ice flower seeds", Value = 0 },
		{ ID = 13987, Name = "deepling staff", Value = 4000 },
		{ ID = 13990, Name = "necklace of the deep", Value = 3000 },
		{ ID = 13991, Name = "deepling axe", Value = 40000 },
		{ ID = 13992, Name = "sandfish", Value = 0 },
		{ ID = 13993, Name = "ornate chestplate", Value = 60000 },
		{ ID = 13994, Name = "depth lorica", Value = 30000 },
		{ ID = 13995, Name = "depth galea", Value = 35000 },
		{ ID = 13996, Name = "depth ocrea", Value = 16000 },
		{ ID = 13997, Name = "depth calcei", Value = 25000 },
		{ ID = 13999, Name = "ornate legs", Value = 40000 },
		{ ID = 14000, Name = "ornate shield", Value = 42000 },
		{ ID = 14001, Name = "ornate mace", Value = 42000 },
		{ ID = 14008, Name = "spellsinger's seal", Value = 280 },
		{ ID = 14009, Name = "key to the drowned library", Value = 330 },
		{ ID = 14010, Name = "deepling guard belt buckle", Value = 230 },
		{ ID = 14011, Name = "deepling breaktime snack", Value = 90 },
		{ ID = 14012, Name = "deepling warts", Value = 180 },
		{ ID = 14013, Name = "deeptags", Value = 290 },
		{ ID = 14017, Name = "deepling scales", Value = 80 },
		{ ID = 14018, Name = "the heart of the sea", Value = 0 },
		{ ID = 14019, Name = "small golden anchor", Value = 0 },
		{ ID = 14020, Name = "soul net", Value = 0 },
		{ ID = 14021, Name = "jaul's pearl", Value = 0 },
		{ ID = 14022, Name = "tanjis' sight", Value = 0 },
		{ ID = 14023, Name = "obujos' shell", Value = 0 },
		{ ID = 14025, Name = "party lampions", Value = 0 },
		{ ID = 14026, Name = "party lampions", Value = 0 },
		{ ID = 14027, Name = "party wall tinsel", Value = 0 },
		{ ID = 14028, Name = "party wall snake", Value = 0 },
		{ ID = 14029, Name = "flower pot", Value = 0 },
		{ ID = 14033, Name = "flower pot", Value = 0 },
		{ ID = 14034, Name = "flower pot", Value = 0 },
		{ ID = 14035, Name = "flower pot", Value = 0 },
		{ ID = 14036, Name = "flower pot", Value = 0 },
		{ ID = 14037, Name = "flower pot", Value = 0 },
		{ ID = 14038, Name = "flower pot", Value = 0 },
		{ ID = 14040, Name = "warrior's axe", Value = 11000 },
		{ ID = 14041, Name = "deepling rIDge", Value = 360 },
		{ ID = 14042, Name = "warrior's shield", Value = 9000 },
		{ ID = 14043, Name = "guardian axe", Value = 9000 },
		{ ID = 14044, Name = "deepling claw", Value = 430 },
		{ ID = 14052, Name = "flask of chitin dissolver", Value = 0 },
		{ ID = 14053, Name = "flask of dissolved chitin", Value = 0 },
		{ ID = 14054, Name = "reagent flask", Value = 0 },
		{ ID = 14076, Name = "swarmer antenna", Value = 130 },
		{ ID = 14077, Name = "kollos shell", Value = 420 },
		{ ID = 14078, Name = "spitter nose", Value = 340 },
		{ ID = 14079, Name = "crawler head plating", Value = 210 },
		{ ID = 14080, Name = "waspoID claw", Value = 320 },
		{ ID = 14081, Name = "waspoID wing", Value = 190 },
		{ ID = 14082, Name = "spIDris mandible", Value = 450 },
		{ ID = 14083, Name = "compound eye", Value = 150 },
		{ ID = 14084, Name = "larvae", Value = 0 },
		{ ID = 14085, Name = "deepling filet", Value = 0 },
		{ ID = 14086, Name = "calopteryx cape", Value = 15000 },
		{ ID = 14087, Name = "grasshopper legs", Value = 15000 },
		{ ID = 14088, Name = "carapace shield", Value = 32000 },
		{ ID = 14089, Name = "hive scythe", Value = 17000 },
		{ ID = 14112, Name = "bar of gold", Value = 0 },
		{ ID = 14142, Name = "foxtail", Value = 0 },
		{ ID = 14143, Name = "four-leaf clover", Value = 0 },
		{ ID = 14153, Name = "basket", Value = 0 },
		{ ID = 14156, Name = "dog collar", Value = 0 },
		{ ID = 14172, Name = "gooey mass", Value = 0 },
		{ ID = 14173, Name = "seashell book", Value = 0 },
		{ ID = 14174, Name = "seashell book", Value = 0 },
		{ ID = 14175, Name = "seashell book", Value = 0 },
		{ ID = 14176, Name = "notes and coordinates", Value = 0 },
		{ ID = 14222, Name = "trophy of obujos", Value = 0 },
		{ ID = 14223, Name = "trophy of tanjis", Value = 0 },
		{ ID = 14224, Name = "trophy of jaul", Value = 0 },
		{ ID = 14225, Name = "dung ball", Value = 130 },
		{ ID = 14241, Name = "true heart of the sea", Value = 0 },
		{ ID = 14242, Name = "true heart of the sea", Value = 0 },
		{ ID = 14246, Name = "hive bow", Value = 28000 },
		{ ID = 14247, Name = "ornate crossbow", Value = 12000 },
		{ ID = 14248, Name = "deepling backpack", Value = 0 },
		{ ID = 14249, Name = "buggy backpack", Value = 0 },
		{ ID = 14250, Name = "deepling squelcher", Value = 7000 },
		{ ID = 14251, Name = "tarsal arrow", Value = 0 },
		{ ID = 14252, Name = "vortex bolt", Value = 0 },
		{ ID = 14258, Name = "depth galea", Value = 35000 },
		{ ID = 14671, Name = "delany's golden bug trophy", Value = 0 },
		{ ID = 14672, Name = "bolfrim's golden bug trophy", Value = 0 },
		{ ID = 14673, Name = "siramal's golden bug trophy", Value = 0 },
		{ ID = 14674, Name = "anniversary backpack", Value = 0 },
		{ ID = 14681, Name = "anniversary cake", Value = 0 },
		{ ID = 14682, Name = "chayenne's magical key", Value = 0 },
		{ ID = 14683, Name = "artist's brush", Value = 0 },
		{ ID = 14684, Name = "artist's palette", Value = 0 },
		{ ID = 14685, Name = "artist's canvas", Value = 0 },
		{ ID = 14686, Name = "artist's brush", Value = 0 },
		{ ID = 14741, Name = "easel kit", Value = 0 },
		{ ID = 14751, Name = "pirates surprise", Value = 0 },
		{ ID = 14753, Name = "dung ball", Value = 130 },
		{ ID = 14756, Name = "cake cabinet kit", Value = 0 },
		{ ID = 14758, Name = "premium scroll", Value = 0 },
		{ ID = 14759, Name = "surprise nest", Value = 0 },
		{ ID = 14760, Name = "mathmaster shield", Value = 0 },
		{ ID = 14761, Name = "mathmaster shield", Value = 0 },
		{ ID = 14762, Name = "medusa skull", Value = 0 },
		{ ID = 14763, Name = "medusa skull", Value = 0 },
		{ ID = 14764, Name = "doll of durin the almighty", Value = 0 },
		{ ID = 14765, Name = "doll of durin the almighty", Value = 0 },
		{ ID = 14766, Name = "majestic shield", Value = 0 },
		{ ID = 14767, Name = "majestic shield", Value = 0 },
		{ ID = 14768, Name = "thorn spitter", Value = 0 },
		{ ID = 14769, Name = "spellbook of ancient arcana", Value = 0 },
		{ ID = 15698, Name = "gnomish supply package", Value = 0 },
		{ ID = 15793, Name = "crystalline arrow", Value = 0 },
		{ ID = 16094, Name = "crystal lamp", Value = 0 },
		{ ID = 16095, Name = "lit crystal lamp", Value = 0 },
		{ ID = 16096, Name = "wand of defiance", Value = 6500 },
		{ ID = 16097, Name = "glowing mushroom", Value = 0 },
		{ ID = 16098, Name = "lit glowing mushroom", Value = 0 },
		{ ID = 16099, Name = "mushroom backpack", Value = 0 },
		{ ID = 16100, Name = "crystal backpack", Value = 0 },
		{ ID = 16101, Name = "muck remover", Value = 0 },
		{ ID = 16102, Name = "mucus plug", Value = 0 },
		{ ID = 16103, Name = "mushroom pie", Value = 0 },
		{ ID = 16104, Name = "gill gugel", Value = 0 },
		{ ID = 16105, Name = "gill coat", Value = 0 },
		{ ID = 16106, Name = "gill legs", Value = 0 },
		{ ID = 16107, Name = "spellbook of vigilance", Value = 0 },
		{ ID = 16108, Name = "gill necklace", Value = 0 },
		{ ID = 16109, Name = "prismatic helmet", Value = 0 },
		{ ID = 16110, Name = "prismatic armor", Value = 0 },
		{ ID = 16111, Name = "prismatic legs", Value = 0 },
		{ ID = 16112, Name = "prismatic boots", Value = 0 },
		{ ID = 16113, Name = "prismatic necklace", Value = 0 },
		{ ID = 16114, Name = "prismatic ring", Value = 0 },
		{ ID = 16115, Name = "wand of everblazing", Value = 6000 },
		{ ID = 16116, Name = "prismatic shield", Value = 0 },
		{ ID = 16117, Name = "muck rod", Value = 6000 },
		{ ID = 16118, Name = "glacial rod", Value = 6500 },
		{ ID = 16119, Name = "blue crystal shard", Value = 1500 },
		{ ID = 16120, Name = "violet crystal shard", Value = 1500 },
		{ ID = 16121, Name = "green crystal shard", Value = 1500 },
		{ ID = 16122, Name = "green crystal splinter", Value = 400 },
		{ ID = 16123, Name = "brown crystal splinter", Value = 400 },
		{ ID = 16124, Name = "blue crystal splinter", Value = 400 },
		{ ID = 16125, Name = "cyan crystal fragment", Value = 800 },
		{ ID = 16126, Name = "red crystal fragment", Value = 400 },
		{ ID = 16127, Name = "green crystal fragment", Value = 400 },
		{ ID = 16128, Name = "minor crystalline token", Value = 0 },
		{ ID = 16129, Name = "major crystalline token", Value = 0 },
		{ ID = 16130, Name = "magma clump", Value = 570 },
		{ ID = 16131, Name = "blazing bone", Value = 610 },
		{ ID = 16132, Name = "eye of a weeper", Value = 650 },
		{ ID = 16133, Name = "pulverized ore", Value = 400 },
		{ ID = 16134, Name = "cliff strIDer claw", Value = 800 },
		{ ID = 16135, Name = "vein of ore", Value = 330 },
		{ ID = 16136, Name = "deathstrike's snippet", Value = 0 },
		{ ID = 16137, Name = "stone nose", Value = 590 },
		{ ID = 16138, Name = "crystalline spikes", Value = 440 },
		{ ID = 16139, Name = "humongous chunk", Value = 540 },
		{ ID = 16140, Name = "hIDeous chunk", Value = 510 },
		{ ID = 16141, Name = "prismatic bolt", Value = 0 },
		{ ID = 16142, Name = "drill bolt", Value = 0 },
		{ ID = 16143, Name = "envenomed arrow", Value = 0 },
		{ ID = 16153, Name = "iron loadstone", Value = 0 },
		{ ID = 16154, Name = "glow wine", Value = 0 },
		{ ID = 16155, Name = "decorative ribbon", Value = 0 },
		{ ID = 16160, Name = "crystalline sword", Value = 0 },
		{ ID = 16161, Name = "crystalline axe", Value = 0 },
		{ ID = 16162, Name = "mycological mace", Value = 0 },
		{ ID = 16163, Name = "crystal crossbow", Value = 35000 },
		{ ID = 16164, Name = "mycological bow", Value = 35000 },
		{ ID = 16165, Name = "pet pig", Value = 0 },
		{ ID = 16166, Name = "pet pig", Value = 0 },
		{ ID = 16167, Name = "teleport crystal", Value = 0 },
		{ ID = 16175, Name = "shiny blade", Value = 0 },
		{ ID = 16205, Name = "gnomevil's hat", Value = 0 },
		{ ID = 16206, Name = "abyssador's lash", Value = 0 },
		{ ID = 16229, Name = "tail of abyssador", Value = 0 },
		{ ID = 16230, Name = "torso of abyssador", Value = 0 },
		{ ID = 16231, Name = "head of abyssador", Value = 0 },
		{ ID = 16232, Name = "statue of abyssador", Value = 0 },
		{ ID = 16233, Name = "the legs of deathstrike", Value = 0 },
		{ ID = 16234, Name = "the torso of deathstrike", Value = 0 },
		{ ID = 16235, Name = "head of deathstrike", Value = 0 },
		{ ID = 16236, Name = "statue of deathstrike", Value = 0 },
		{ ID = 16237, Name = "legs of gnomevil", Value = 0 },
		{ ID = 16238, Name = "torso of gnomevil", Value = 0 },
		{ ID = 16239, Name = "head of gnomevil", Value = 0 },
		{ ID = 16240, Name = "statue of gnomevil", Value = 0 },
		{ ID = 16242, Name = "red teleport crystal", Value = 0 },
		{ ID = 16244, Name = "music box", Value = 0 },
		{ ID = 16251, Name = "golem wrench", Value = 0 },
		{ ID = 16252, Name = "gnomish voucher type mb", Value = 0 },
		{ ID = 16253, Name = "gnomish voucher type ma1", Value = 0 },
		{ ID = 16254, Name = "gnomish voucher type ma2", Value = 0 },
		{ ID = 16255, Name = "gnomish voucher type cb", Value = 0 },
		{ ID = 16256, Name = "gnomish voucher type ca1", Value = 0 },
		{ ID = 16257, Name = "gnomish voucher type ca2", Value = 0 },
		{ ID = 16262, Name = "dragon eye", Value = 0 },
		{ ID = 16263, Name = "dragon eye", Value = 0 },
		{ ID = 16275, Name = "noble sword", Value = 0 },
		{ ID = 16276, Name = "noble sword", Value = 0 },
		{ ID = 17457, Name = "insectoID eggs", Value = 0 },
		{ ID = 17458, Name = "damselfly wing", Value = 20 },
		{ ID = 17461, Name = "marsh stalker beak", Value = 65 },
		{ ID = 17462, Name = "marsh stalker feather", Value = 50 },
		{ ID = 17463, Name = "damselfly eye", Value = 25 },
		{ ID = 17809, Name = "bola", Value = 35 },
		{ ID = 17810, Name = "spike shield", Value = 250 },
		{ ID = 17812, Name = "ratana", Value = 500 },
		{ ID = 17813, Name = "life preserver", Value = 300 },
		{ ID = 17817, Name = "cheese cutter", Value = 50 },
		{ ID = 17818, Name = "cheesy figurine", Value = 150 },
		{ ID = 17819, Name = "earflap", Value = 40 },
		{ ID = 17820, Name = "soft cheese", Value = 0 },
		{ ID = 17821, Name = "rat cheese", Value = 0 },
		{ ID = 17822, Name = "swampling moss", Value = 20 },
		{ ID = 17823, Name = "piece of swampling wood", Value = 30 },
		{ ID = 17824, Name = "swampling club", Value = 0 },
		{ ID = 17825, Name = "rat god doll", Value = 0 },
		{ ID = 17826, Name = "lost basher's spike", Value = 190 },
		{ ID = 17827, Name = "bloody dwarven beard", Value = 110 },
		{ ID = 17828, Name = "pair of iron fists", Value = 4000 },
		{ ID = 17829, Name = "buckle", Value = 7000 },
		{ ID = 17830, Name = "bonecarving knife", Value = 140 },
		{ ID = 17831, Name = "bone fetish", Value = 150 },
		{ ID = 17846, Name = "leather harness", Value = 750 },
		{ ID = 17847, Name = "wimp tooth chain", Value = 120 },
		{ ID = 17848, Name = "lost husher's staff", Value = 250 },
		{ ID = 17849, Name = "skull shatterer", Value = 170 },
		{ ID = 17850, Name = "holy ash", Value = 90 },
		{ ID = 17851, Name = "broken throwing axe", Value = 160 },
		{ ID = 17852, Name = "helmet of the lost", Value = 2000 },
		{ ID = 17853, Name = "lost bracers", Value = 140 },
		{ ID = 17854, Name = "mad froth", Value = 80 },
		{ ID = 17855, Name = "red hair dye", Value = 40 },
		{ ID = 17856, Name = "basalt fetish", Value = 130 },
		{ ID = 17857, Name = "basalt figurine", Value = 110 },
		{ ID = 17858, Name = "leech", Value = 0 },
		{ ID = 17859, Name = "spiky club", Value = 300 },
		{ ID = 17972, Name = "canopy bed kit", Value = 200 },
		{ ID = 17974, Name = "venorean cabinet kit", Value = 90 },
		{ ID = 17975, Name = "venorean wardrobe kit", Value = 50 },
		{ ID = 17977, Name = "venorean drawer kit", Value = 40 },
		{ ID = 18327, Name = "jade zaoan queen", Value = 0 },
		{ ID = 18328, Name = "jade zaoan king", Value = 0 },
		{ ID = 18329, Name = "jade zaoan bishop", Value = 0 },
		{ ID = 18330, Name = "jade zaoan knight", Value = 0 },
		{ ID = 18331, Name = "jade zaoan rook", Value = 0 },
		{ ID = 18332, Name = "jade zaoan pawn", Value = 0 },
		{ ID = 18333, Name = "obsIDian zaoan queen", Value = 0 },
		{ ID = 18334, Name = "obsIDian zaoan king", Value = 0 },
		{ ID = 18335, Name = "obsIDian zaoan bishop", Value = 0 },
		{ ID = 18336, Name = "obsIDian zaoan knight", Value = 0 },
		{ ID = 18337, Name = "obsIDian zaoan rook", Value = 0 },
		{ ID = 18338, Name = "obsIDian zaoan pawn", Value = 0 },
		{ ID = 18339, Name = "zaoan chess box", Value = 0 },
		{ ID = 18343, Name = "bookworm doll", Value = 0 },
		{ ID = 18344, Name = "bookworm doll", Value = 0 },
		{ ID = 18924, Name = "tooth file", Value = 60 },
		{ ID = 18925, Name = "lancet", Value = 90 },
		{ ID = 18926, Name = "horoscope", Value = 40 },
		{ ID = 18927, Name = "vampire's cape chain", Value = 150 },
		{ ID = 18928, Name = "blood tincture in a vial", Value = 360 },
		{ ID = 18929, Name = "incantation notes", Value = 90 },
		{ ID = 18930, Name = "pieces of magic chalk", Value = 210 },
		{ ID = 18931, Name = "candle made of human tallow", Value = 0 },
		{ ID = 18933, Name = "incantation fragment", Value = 0 },
		{ ID = 18935, Name = "vampire's signet ring", Value = 0 },
		{ ID = 18936, Name = "the vampire count's medal", Value = 0 },
		{ ID = 18993, Name = "rorc feather", Value = 70 },
		{ ID = 18994, Name = "elven hoof", Value = 115 },
		{ ID = 18995, Name = "venison", Value = 55 },
		{ ID = 18996, Name = "rorc egg", Value = 120 },
		{ ID = 18997, Name = "hatched rorc egg", Value = 30 },
		{ ID = 19082, Name = "golden raID token", Value = 0 },
		{ ID = 19083, Name = "silver raID token", Value = 0 },
		{ ID = 19110, Name = "dowser", Value = 35 },
		{ ID = 19111, Name = "fir cone", Value = 25 },
		{ ID = 19136, Name = "nail case", Value = 0 },
		{ ID = 19146, Name = "torn incantation fragment", Value = 0 },
		{ ID = 19150, Name = "norseman doll", Value = 0 },
		{ ID = 19151, Name = "abacus", Value = 0 },
		{ ID = 19152, Name = "key of numerous locks", Value = 0 },
		{ ID = 19153, Name = "friendship amulet", Value = 0 },
		{ ID = 19154, Name = "the mexcalibur", Value = 0 },
		{ ID = 19155, Name = "orc's jaw shredder", Value = 0 },
		{ ID = 19156, Name = "frozen heart", Value = 0 },
		{ ID = 19159, Name = "pannier backpack", Value = 0 },
		{ ID = 19251, Name = "smoking coal", Value = 0 },
		{ ID = 19356, Name = "triple bolt crossbow", Value = 0 },
		{ ID = 19357, Name = "shrunken head necklace", Value = 0 },
		{ ID = 19358, Name = "albino plate", Value = 1500 },
		{ ID = 19359, Name = "horn", Value = 300 },
		{ ID = 19361, Name = "sun mirror", Value = 0 },
		{ ID = 19362, Name = "icicle bow", Value = 0 },
		{ ID = 19363, Name = "runic ice shield", Value = 0 },
		{ ID = 19365, Name = "trapped lightning", Value = 0 },
		{ ID = 19366, Name = "icy culotte", Value = 0 },
		{ ID = 19369, Name = "eye of the storm", Value = 0 },
		{ ID = 19371, Name = "glass of goo", Value = 0 },
		{ ID = 19372, Name = "goo shell", Value = 4000 },
		{ ID = 19373, Name = "haunted mirror piece", Value = 0 },
		{ ID = 19374, Name = "vampire silk slippers", Value = 0 },
		{ ID = 19391, Name = "furious frock", Value = 0 },
		{ ID = 19397, Name = "memory box", Value = 0 },
	}
	Chuitox.HUD.Items.Data = function(id)
		-- Binary search
		local imin, imax = 1, #Chuitox.HUD.Items.List
		while (imax >= imin) do
			local imid = math.floor((imin + imax) / 2)
			if (Chuitox.HUD.Items.List[imid].ID == id) then
				return Chuitox.HUD.Items.List[imid]
			elseif (Chuitox.HUD.Items.List[imid].ID < id) then
				imin = imid + 1
			else
				imax = imid - 1
			end
		end
		return { ID = 0, Name = "", Value = 0 }
	end

	-- Self
	Chuitox.HUD.Self = {}
	Chuitox.HUD.Self.Stamina = function()
		local current = Self.Stamina()
		local hours = math.floor(current / 60)
		local minutes = math.floor((current / 60 - hours) * 60)
		return string.format("%02d:%02d", hours, minutes)
	end
	Chuitox.HUD.Self.ExperienceLeft = function()
		local level = Self.Level()
		local nextxp = (50 * level * level * level - 150 * level * level + 400 * level) / 3
		return (nextxp - Self.Experience())
	end
	Chuitox.HUD.Self.ExperienceGained = function()
		return (Self.Experience() - Chuitox.HUD.Session.StartExp)
	end
	Chuitox.HUD.Self.ExperiencePerSecond = function()
		return Chuitox.HUD.Math.Round(Chuitox.HUD.Self.ExperienceGained() / os.difftime(os.time(), Chuitox.HUD.Session.StartTime))
	end
	Chuitox.HUD.Self.ExperiencePerMinute = function()
		return (Chuitox.HUD.Self.ExperiencePerSecond() * 60 / 1000)
	end
	Chuitox.HUD.Self.ExperiencePerHour = function()
		return (Chuitox.HUD.Self.ExperiencePerSecond() * 3600 / 1000)
	end

	-- Time
	Chuitox.HUD.Time = {}
	Chuitox.HUD.Time.Hours = function(t, c)
		local seconds = (c) and os.difftime(os.time(), t) or t
		return (math.floor(seconds / 3600))
	end
	Chuitox.HUD.Time.Minutes = function(t, c)
		local seconds = (c) and os.difftime(os.time(), t) or t
		return math.floor((seconds - (Chuitox.HUD.Time.Hours(t, c) * 3600)) / 60)
	end
	Chuitox.HUD.Time.Seconds = function(t, c)
		local seconds = (c) and os.difftime(os.time(), t) or t
		return math.floor(seconds - (Chuitox.HUD.Time.Hours(t, c) * 3600) - (Chuitox.HUD.Time.Minutes(t, c) * 60))
	end
	Chuitox.HUD.Time.Format = function(t, current)
		local c = current or true
		return string.format("%02.f", Chuitox.HUD.Time.Hours(t, c))..':'..string.format("%02.f", Chuitox.HUD.Time.Minutes(t, c))..':'..string.format("%02.f", Chuitox.HUD.Time.Seconds(t, c))
	end

	-- Tools
	Chuitox.HUD.WindowSize = function()
	    local path = "../Screenshots/[Chuitox.HUD]-WindowSize"
	    screenshot(path)
	    local file = io.open(path .. ".bmp", "rb")
	    if (file) then
	        local bitmapHeading = file:read(54)
	        if (bitmapHeading) then
				local _width = (tonumber(bitmapHeading:byte(20) * 256 + bitmapHeading:byte(19)))
				local _height = (tonumber(bitmapHeading:byte(24) * 256 + bitmapHeading:byte(23)))
				file:close()
	            return { Width = _width, Height = _height }
	        end
	    end
	    return { Width = 0, Height = 0 }
	end

	-- Declarations
	Chuitox.HUD.Colors = {}
	Chuitox.HUD.Colors.List =
	{
		{255, 255, 255},
		{255, 212, 191},
		{255, 233, 191},
		{255, 255, 191},
		{233, 255, 191},
		{212, 255, 191},
		{191, 255, 191},
		{191, 255, 212},
		{191, 255, 233},
		{191, 255, 255},
		{191, 233, 255},
		{191, 212, 255},
		{191, 191, 255},
		{212, 191, 255},
		{233, 191, 255},
		{255, 191, 255},
		{255, 191, 233},
		{255, 191, 212},
		{255, 191, 191},
		{218, 218, 218},
		{191, 159, 143},
		{191, 175, 143},
		{191, 191, 143},
		{175, 191, 143},
		{159, 191, 143},
		{143, 191, 143},
		{143, 191, 159},
		{143, 191, 175},
		{143, 191, 191},
		{143, 175, 191},
		{143, 159, 191},
		{143, 143, 191},
		{159, 143, 191},
		{175, 143, 191},
		{191, 143, 191},
		{191, 143, 175},
		{191, 143, 159},
		{191, 143, 143},
		{182, 182, 182},
		{191, 127, 95},
		{191, 151, 95},
		{191, 191, 95},
		{159, 191, 95},
		{127, 191, 95},
		{95, 191, 95},
		{95, 191, 127},
		{95, 191, 159},
		{95, 191, 191},
		{95, 159, 191},
		{95, 127, 191},
		{95, 95, 191},
		{127, 95, 191},
		{159, 95, 191},
		{191, 95, 191},
		{191, 95, 159},
		{191, 95, 127},
		{191, 95, 95},
		{145, 145, 145},
		{191, 106, 63},
		{191, 148, 63},
		{191, 191, 63},
		{148, 191, 63},
		{106, 191, 63},
		{63, 191, 63},
		{63, 191, 106},
		{63, 191, 148},
		{63, 191, 191},
		{63, 148, 191},
		{63, 106, 191},
		{63, 63, 191},
		{148, 63, 191},
		{191, 63, 191},
		{191, 63, 148},
		{191, 63, 106},
		{191, 63, 63},
		{109, 109, 109},
		{255, 85, 0},
		{255, 170, 0},
		{255, 255, 0},
		{169, 255, 0},
		{84, 255, 0},
		{0, 255, 0},
		{0, 255, 85},
		{0, 255, 170},
		{0, 255, 255},
		{0, 169, 255},
		{0, 85, 255},
		{0, 0, 255},
		{83, 0, 255},
		{170, 0, 255},
		{254, 0, 255},
		{255, 0, 169},
		{255, 0, 85},
		{255, 0, 0},
		{72, 72, 72},
		{191, 63, 0},
		{191, 127, 0},
		{191, 191, 0},
		{127, 191, 0},
		{63, 191, 0},
		{0, 191, 0},
		{0, 191, 63},
		{0, 191, 127},
		{0, 191, 191},
		{0, 127, 191},
		{0, 63, 191},
		{0, 0, 191},
		{63, 0, 191},
		{127, 0, 191},
		{191, 0, 191},
		{191, 0, 127},
		{191, 0, 63},
		{191, 0, 0},
		{36, 36, 36},
		{127, 42, 0},
		{127, 85, 0},
		{127, 127, 0},
		{84, 127, 0},
		{42, 127, 0},
		{0, 127, 0},
		{0, 127, 42},
		{0, 127, 85},
		{0, 127, 127},
		{0, 84, 127},
		{0, 42, 127},
		{0, 0, 127},
		{42, 0, 127},
		{85, 0, 127},
		{127, 0, 127},
		{127, 0, 84},
		{127, 0, 42},
		{127, 0, 0}
	}
	Chuitox.HUD.Colors.Default = { head = 78, legs = 86, feet = 1 }
	Chuitox.HUD.Colors.Scheme = Settings.HUD.UseOutfitColors and Self.Outfit() or Chuitox.HUD.Colors.Default
	Chuitox.HUD.Colors.Heading = Chuitox.HUD.Colors.List[(Chuitox.HUD.Colors.Scheme["head"] > 0) and Chuitox.HUD.Colors.Scheme["head"] or 1]
	Chuitox.HUD.Colors.SubHeading = Chuitox.HUD.Colors.List[(Chuitox.HUD.Colors.Scheme["legs"] > 0) and Chuitox.HUD.Colors.Scheme["legs"] or 1]
	Chuitox.HUD.Colors.Text = Chuitox.HUD.Colors.List[(Chuitox.HUD.Colors.Scheme["feet"] > 0) and Chuitox.HUD.Colors.Scheme["feet"] or 1]
	Chuitox.HUD.ScreenSize = Chuitox.HUD.WindowSize()
	Chuitox.HUD.ItemSize = Chuitox.HUD.DisplayImages and 28 or 0
	Chuitox.HUD.Information =
	{
		Text = nil,
		Shadows = nil
	}
	Chuitox.HUD.NearestCity =
	{
		Heading = nil,
		Display = nil,
		Value = nil
	}
	Chuitox.HUD.Level =
	{
		Heading = nil,
		Display = nil,
		Value = nil
	}
	Chuitox.HUD.ExperienceGained =
	{
		Heading = nil,
		Display = nil,
		Value = nil
	}
	Chuitox.HUD.ExperienceLeft =
	{
		Heading = nil,
		Display = nil,
		Value = nil
	}
	Chuitox.HUD.ExperienceRatio =
	{
		Heading = nil,
		Value = nil,
		Raw = 0
	}
	Chuitox.HUD.TimeLeftLevel =
	{
		Heading = nil,
		Display = nil,
		Value = nil
	}
	Chuitox.HUD.ExecutionTime =
	{
		Heading = nil,
		Display = nil,
		Value = nil
	}
	Chuitox.HUD.Script =
	{
		Heading = nil,
		-- Display = nil,
		Value = nil
	}
	Chuitox.HUD.Stamina =
	{
		Heading = nil,
		Display = nil,
		Value = nil
	}
	Chuitox.HUD.Loot = {}
	Chuitox.HUD.Supplies = {}
	Chuitox.HUD.Spacing =
	{
		Shadows =
		{
			x = 1,
			y = 1,
		},
		Loot =
		{
			x = 0,
			y = (Chuitox.HUD.DisplayImages) and 25 or 15,
		},
		Supplies =
		{
			x = 0,
			y = (Chuitox.HUD.DisplayImages) and 25 or 15,
		},
		Line =
		{
			x = 0,
			y = 15,
		},
		Heading =
		{
			x = 0,
			y = 30,
		},
	}

	Chuitox.HUD.Tracker =
	{
		Position =
		{
			x = Chuitox.HUD.ScreenSize.Width - 375,
			y = 30,
		},
		NextLoot =
		{
			x = 20,
			y = 20,
		},
		NextSupply =
		{
			x = 20,
			y = 70,
		}
	}

	Chuitox.HUD.City = function()
		local near = Chuitox.HUD.Map.Cities[1]
		local pos = Self.Position()
		for index, city in ipairs(Chuitox.HUD.Map.Cities) do
			if (Chuitox.HUD.Map.Distance(pos, near.Coordinates) > Chuitox.HUD.Map.Distance(pos, city.Coordinates)) then
				near = Chuitox.HUD.Map.Cities[index]
			end
		end
		return near
	end

	Chuitox.HUD.isDepositing = function()
		local Position = Self.Position()
		for _, depot in ipairs(Chuitox.HUD.Map.DepotLocations) do
			if (Chuitox.HUD.Map.Distance(depot, Position) == 0) then
				return true
			end
		end
		return false
	end

	Chuitox.HUD.ItemCount = function(id)
	    local value = 0
		local slots = {Self.Head, Self.Armor, Self.Legs, Self.Feet, Self.Amulet, Self.Weapon, Self.Ring, Self.Shield, Self.Ammo}
		for i = 1, #slots do
			local slot = slots[i]()
			value = value + ((slot.id == id) and math.max(slot.count, 1) or 0)
		end
	    
		local cont = Container.GetFirst()
		while (cont:isOpen()) do
			local isOpen = cont:isOpen()
			local isCorpse = false
			if (isOpen) then
				for _, name in ipairs({"The", "Demonic", "Dead", "Slain", "Dissolved", "Remains", "Elemental"}) do
					if (cont:Name():find(name)) then
						isCorpse = true
						break
					end
				end
				value = value + (not isCorpse and cont:CountItemsOfID(id) or 0)
			end
			cont = cont:GetNext()
		end
	    return value
	end

	Chuitox.HUD.iLoot = function()
	    local index = 0
	    return function()
			index = index + 1
			if (index > #Chuitox.HUD.Loot["List"]) then
				return nil, nil
			else
				return Chuitox.HUD.Loot["List"][index].ID, Chuitox.HUD.Loot["List"][index]
			end
	    end
	end

	Chuitox.HUD.iLootContains = function(value)
		local index = 0
		for id, item in Chuitox.HUD.iLoot() do
			index = index + 1
			if (value == id) then
				return true, index
			end
		end
		return false, index
	end

	Chuitox.HUD.iSupplies = function()
	    local index = 0
	    return function()
			index = index + 1
			if (index > #Chuitox.HUD.Supplies["List"]) then
				return nil, nil
			else
				return Chuitox.HUD.Supplies["List"][index].ID, Chuitox.HUD.Supplies["List"][index]
			end
	    end
	end

	Chuitox.HUD.iSuppliesContains = function(value)
		local index = 0
		for id, item in Chuitox.HUD.iSupplies() do
			index = index + 1
			if (value == id) then
				return true, index
			end
		end
		return false, index
	end

	Chuitox.HUD.UpdateHeading = function(color)
		Chuitox.HUD.Information.Text:SetTextColor(color[1], color[2], color[3])
		if (Chuitox.HUD.Supplies["Heading"]) then
			Chuitox.HUD.Supplies.Heading:SetTextColor(color[1], color[2], color[3])
		end
		if (Chuitox.HUD.Loot["Heading"]) then
			Chuitox.HUD.Loot.Heading:SetTextColor(color[1], color[2], color[3])
		end
	end

	Chuitox.HUD.UpdateSubHeading = function(color)
		if (Chuitox.HUD["LootWorth"]) then
			Chuitox.HUD.LootWorth.Value:SetTextColor(color[1], color[2], color[3])
			Chuitox.HUD.LootWorth.Heading:SetTextColor(color[1], color[2], color[3])
		end
		if (Chuitox.HUD["SuppliesWorth"]) then
			Chuitox.HUD.SuppliesWorth.Value:SetTextColor(color[1], color[2], color[3])
			Chuitox.HUD.SuppliesWorth.Heading:SetTextColor(color[1], color[2], color[3])
		end
	end

	Chuitox.HUD.UpdateText = function(color)
		Chuitox.HUD.Script.Heading:SetTextColor(color[1], color[2], color[3])
		Chuitox.HUD.Script.Value:SetTextColor(color[1], color[2], color[3])
		Chuitox.HUD.Level.Heading:SetTextColor(color[1], color[2], color[3])
		Chuitox.HUD.Level.Display:SetTextColor(color[1], color[2], color[3])
		Chuitox.HUD.ExperienceGained.Heading:SetTextColor(color[1], color[2], color[3])
		Chuitox.HUD.ExperienceGained.Display:SetTextColor(color[1], color[2], color[3])
		Chuitox.HUD.ExperienceLeft.Heading:SetTextColor(color[1], color[2], color[3])
		Chuitox.HUD.ExperienceLeft.Display:SetTextColor(color[1], color[2], color[3])
		Chuitox.HUD.ExperienceRatio.Heading:SetTextColor(color[1], color[2], color[3])
		Chuitox.HUD.ExperienceRatio.Value:SetTextColor(color[1], color[2], color[3])
		Chuitox.HUD.ExecutionTime.Heading:SetTextColor(color[1], color[2], color[3])
		Chuitox.HUD.ExecutionTime.Display:SetTextColor(color[1], color[2], color[3])
		Chuitox.HUD.TimeLeftLevel.Heading:SetTextColor(color[1], color[2], color[3])
		Chuitox.HUD.TimeLeftLevel.Display:SetTextColor(color[1], color[2], color[3])
		Chuitox.HUD.Stamina.Heading:SetTextColor(color[1], color[2], color[3])
		Chuitox.HUD.Stamina.Display:SetTextColor(color[1], color[2], color[3])
		Chuitox.HUD.NearestCity.Heading:SetTextColor(color[1], color[2], color[3])
		Chuitox.HUD.NearestCity.Display:SetTextColor(color[1], color[2], color[3])
		if (Chuitox.HUD["Loot"]["List"]) then
			local index = 0
			for id, item in Chuitox.HUD.iLoot() do
				index = index + 1
				Chuitox.HUD.Loot["List"][index]["Text"]:SetTextColor(color[1], color[2], color[3])
				Chuitox.HUD.Loot["List"][index]["Name"]:SetTextColor(color[1], color[2], color[3])
			end
		end
		if (Chuitox.HUD["Supplies"]["List"]) then
			local index = 0
			for id, item in Chuitox.HUD.iSupplies() do
				index = index + 1
				Chuitox.HUD.Supplies["List"][index]["Text"]:SetTextColor(color[1], color[2], color[3])
				Chuitox.HUD.Supplies["List"][index]["Name"]:SetTextColor(color[1], color[2], color[3])
			end
		end
	end

	Chuitox.HUD.UpdatePositions = function()
		local SuppliesMultiplier = 1
		local LootCount = 0
		local SuppliesCount = 0
		for id, item in Chuitox.HUD.iLoot() do
			if (item["Name"]) then
				LootCount = LootCount + 1
			end
		end
		for id, item in Chuitox.HUD.iSupplies() do
			if (item["Name"]) then
				SuppliesCount = SuppliesCount + 1
			end
		end
		-- Update loot heading
			-- This heading has a fixed position
		-- Update total loot
		if (Chuitox.HUD["LootWorth"]) then
			Chuitox.HUD.LootWorth.Heading:SetPosition(Chuitox.HUD.Tracker.NextLoot.x, (Chuitox.HUD.Spacing.Loot.y * LootCount) + 55)
			Chuitox.HUD.LootWorth.Value:SetPosition(Chuitox.HUD.Tracker.NextLoot.x + 150, (Chuitox.HUD.Spacing.Loot.y * LootCount) + 55)
		end
		-- Update supplies heading
		if (Chuitox.HUD["Supplies"]["List"]) then
			Chuitox.HUD.Supplies.Shadows:SetPosition(Chuitox.HUD.Tracker.NextLoot.x + 1, (Chuitox.HUD.Spacing.Loot.y * LootCount) + 81)
			Chuitox.HUD.Supplies.Heading:SetPosition(Chuitox.HUD.Tracker.NextLoot.x, (Chuitox.HUD.Spacing.Loot.y * LootCount) + 80)
		end
		-- Update supplies
		for id, item in Chuitox.HUD.iSupplies() do
			if (item["Name"]) then
				item["Item"]:SetPosition(Chuitox.HUD.Tracker.NextLoot.x, (Chuitox.HUD.Spacing.Loot.y * LootCount) + (Chuitox.HUD.Spacing.Supplies.y * SuppliesMultiplier) + 70)
				item["Name"]:SetPosition(Chuitox.HUD.Tracker.NextLoot.x + ((Chuitox.HUD.DisplayImages) and 30 or 0), (Chuitox.HUD.Spacing.Loot.y * LootCount) + (Chuitox.HUD.Spacing.Supplies.y * SuppliesMultiplier) + 80)
				item["Text"]:SetPosition(Chuitox.HUD.Tracker.NextLoot.x + 150, (Chuitox.HUD.Spacing.Loot.y * LootCount) + (Chuitox.HUD.Spacing.Supplies.y * SuppliesMultiplier) + 80)
				SuppliesMultiplier = SuppliesMultiplier + 1
			end
		end
		-- Update total supplies
		if (Chuitox.HUD["SuppliesWorth"]) then
			Chuitox.HUD.SuppliesWorth.Heading:SetPosition(Chuitox.HUD.Tracker.NextLoot.x, (Chuitox.HUD.Spacing.Loot.y * LootCount) + (Chuitox.HUD.Spacing.Supplies.y * SuppliesCount) + 105)
			Chuitox.HUD.SuppliesWorth.Value:SetPosition(Chuitox.HUD.Tracker.NextLoot.x + 150, (Chuitox.HUD.Spacing.Loot.y * LootCount) + (Chuitox.HUD.Spacing.Supplies.y * SuppliesCount) + 105)
		end
		-- Update outcome
		if (Chuitox.HUD["Outcome"]) then
			Chuitox.HUD["Outcome"]["Result"]:SetPosition(Chuitox.HUD.Tracker.NextLoot.x, (Chuitox.HUD.Spacing.Loot.y * LootCount) + (Chuitox.HUD.Spacing.Supplies.y * SuppliesCount) + 130)
			Chuitox.HUD["Outcome"]["Data"]:SetPosition(Chuitox.HUD.Tracker.NextLoot.x + 150, (Chuitox.HUD.Spacing.Loot.y * LootCount) + (Chuitox.HUD.Spacing.Supplies.y * SuppliesCount) + 130)
		end
	end

	Chuitox.HUD.Load = function()

		local Stamina = Self.Stamina()
		Chuitox.HUD.Tracker.Position.x = Chuitox.HUD.ScreenSize.Width - 375
		Chuitox.HUD.Tracker.Position.y = 30

		-- Information
		Chuitox.HUD.Information.Shadows = HUD(
											Chuitox.HUD.Tracker.Position.x + 1,
											Chuitox.HUD.Tracker.Position.y + 11,
											"INFORMATION",
											0,
											0,
											0
										)
		Chuitox.HUD.Information.Text = HUD(
										Chuitox.HUD.Tracker.Position.x,
										Chuitox.HUD.Tracker.Position.y + 10,
										"INFORMATION",
										Chuitox.HUD.Colors.Heading[1],
										Chuitox.HUD.Colors.Heading[2],
										Chuitox.HUD.Colors.Heading[3]
									)
		Chuitox.HUD.Tracker.Position.y = Chuitox.HUD.Tracker.Position.y + 30

		-- Script
		-- WARNING: Display Missing!
		Chuitox.HUD.Script.Heading = HUD(
									Chuitox.HUD.Tracker.Position.x,
									Chuitox.HUD.Tracker.Position.y,
									"Chuitox HUD",
									Chuitox.HUD.Colors.Text[1],
									Chuitox.HUD.Colors.Text[2],
									Chuitox.HUD.Colors.Text[3]
								)
		Chuitox.HUD.Script.Value = HUD(
									Chuitox.HUD.Tracker.Position.x + 100,
									Chuitox.HUD.Tracker.Position.y,
									"v1.2",
									Chuitox.HUD.Colors.Text[1],
									Chuitox.HUD.Colors.Text[2],
									Chuitox.HUD.Colors.Text[3]
								)
		Chuitox.HUD.Tracker.Position.y = Chuitox.HUD.Tracker.Position.y + 15

		-- Level
		Chuitox.HUD.Level.Value = Self.Level()
		Chuitox.HUD.Level.Heading = HUD(
									Chuitox.HUD.Tracker.Position.x,
									Chuitox.HUD.Tracker.Position.y,
									"Level",
									Chuitox.HUD.Colors.Text[1],
									Chuitox.HUD.Colors.Text[2],
									Chuitox.HUD.Colors.Text[3]
								)
		Chuitox.HUD.Level.Display = HUD(
									Chuitox.HUD.Tracker.Position.x + 100,
									Chuitox.HUD.Tracker.Position.y,
									string.format("%s", Chuitox.HUD.Level.Value),
									Chuitox.HUD.Colors.Text[1],
									Chuitox.HUD.Colors.Text[2],
									Chuitox.HUD.Colors.Text[3]
								)
		Chuitox.HUD.Tracker.Position.y = Chuitox.HUD.Tracker.Position.y + 15

		-- Experience gained
		Chuitox.HUD.ExperienceGained.Value = "0 (0k/k)"
		Chuitox.HUD.ExperienceGained.Heading = HUD(
												Chuitox.HUD.Tracker.Position.x,
												Chuitox.HUD.Tracker.Position.y,
												"Exp. Gained",
												Chuitox.HUD.Colors.Text[1],
												Chuitox.HUD.Colors.Text[2],
												Chuitox.HUD.Colors.Text[3]
											)
		Chuitox.HUD.ExperienceGained.Display = HUD(
												Chuitox.HUD.Tracker.Position.x + 100,
												Chuitox.HUD.Tracker.Position.y,
												string.format("%s", Chuitox.HUD.ExperienceGained.Value),
												Chuitox.HUD.Colors.Text[1],
												Chuitox.HUD.Colors.Text[2],
												Chuitox.HUD.Colors.Text[3]
											)
		Chuitox.HUD.Tracker.Position.y = Chuitox.HUD.Tracker.Position.y + 15

		-- Experience left
		Chuitox.HUD.ExperienceLeft.Value = Chuitox.HUD.Self.ExperienceLeft()
		Chuitox.HUD.ExperienceLeft.Heading = HUD(
											Chuitox.HUD.Tracker.Position.x,
											Chuitox.HUD.Tracker.Position.y,
											"Exp. Left",
											Chuitox.HUD.Colors.Text[1],
											Chuitox.HUD.Colors.Text[2],
											Chuitox.HUD.Colors.Text[3]
										)
		Chuitox.HUD.ExperienceLeft.Display = HUD(
											Chuitox.HUD.Tracker.Position.x + 100,
											Chuitox.HUD.Tracker.Position.y,
											string.format("%s", Chuitox.HUD.Math.Format(Chuitox.HUD.ExperienceLeft.Value)),
											Chuitox.HUD.Colors.Text[1],
											Chuitox.HUD.Colors.Text[2],
											Chuitox.HUD.Colors.Text[3]
										)
		Chuitox.HUD.Tracker.Position.y = Chuitox.HUD.Tracker.Position.y + 15

		-- Experience ratio
		-- WARNING: Display Missing!
		Chuitox.HUD.ExperienceRatio.Heading = HUD(
												Chuitox.HUD.Tracker.Position.x,
												Chuitox.HUD.Tracker.Position.y,
												"Best Exp. Ratio",
												Chuitox.HUD.Colors.Text[1],
												Chuitox.HUD.Colors.Text[2],
												Chuitox.HUD.Colors.Text[3]
											)
		Chuitox.HUD.ExperienceRatio.Value = HUD(
											Chuitox.HUD.Tracker.Position.x + 100,
											Chuitox.HUD.Tracker.Position.y,
											"0k/h",
											Chuitox.HUD.Colors.Text[1],
											Chuitox.HUD.Colors.Text[2],
											Chuitox.HUD.Colors.Text[3]
										)
		Chuitox.HUD.Tracker.Position.y = Chuitox.HUD.Tracker.Position.y + 15

		-- Execution time
		Chuitox.HUD.ExecutionTime.Value = Chuitox.HUD.Time.Format(Chuitox.HUD.Session.StartTime)
		Chuitox.HUD.ExecutionTime.Heading = HUD(
											Chuitox.HUD.Tracker.Position.x,
											Chuitox.HUD.Tracker.Position.y,
											"Execution Time",
											Chuitox.HUD.Colors.Text[1],
											Chuitox.HUD.Colors.Text[2],
											Chuitox.HUD.Colors.Text[3]
										)
		Chuitox.HUD.ExecutionTime.Display = HUD(
											Chuitox.HUD.Tracker.Position.x + 100,
											Chuitox.HUD.Tracker.Position.y,
											string.format("%s", Chuitox.HUD.ExecutionTime.Value),
											Chuitox.HUD.Colors.Text[1],
											Chuitox.HUD.Colors.Text[2],
											Chuitox.HUD.Colors.Text[3]
										)
		Chuitox.HUD.Tracker.Position.y = Chuitox.HUD.Tracker.Position.y + 15

		-- Time left to next level
		Chuitox.HUD.TimeLeftLevel.Value = "00:00:00"
		Chuitox.HUD.TimeLeftLevel.Heading = HUD(
											Chuitox.HUD.Tracker.Position.x,
											Chuitox.HUD.Tracker.Position.y,
											"Next Level In",
											Chuitox.HUD.Colors.Text[1],
											Chuitox.HUD.Colors.Text[2],
											Chuitox.HUD.Colors.Text[3]
										)
		Chuitox.HUD.TimeLeftLevel.Display = HUD(
											Chuitox.HUD.Tracker.Position.x + 100,
											Chuitox.HUD.Tracker.Position.y,
											Chuitox.HUD.TimeLeftLevel.Value,
											Chuitox.HUD.Colors.Text[1],
											Chuitox.HUD.Colors.Text[2],
											Chuitox.HUD.Colors.Text[3]
										)
		Chuitox.HUD.Tracker.Position.y = Chuitox.HUD.Tracker.Position.y + 15

		-- Stamina
		Chuitox.HUD.Stamina.Value = Chuitox.HUD.Self.Stamina()
		Chuitox.HUD.Stamina.Heading = HUD(
										Chuitox.HUD.Tracker.Position.x,
										Chuitox.HUD.Tracker.Position.y,
										"Stamina",
										Chuitox.HUD.Colors.Text[1],
										Chuitox.HUD.Colors.Text[2],
										Chuitox.HUD.Colors.Text[3]
									)
		Chuitox.HUD.Stamina.Display = HUD(
										Chuitox.HUD.Tracker.Position.x + 100,
										Chuitox.HUD.Tracker.Position.y,
										string.format("%s", Chuitox.HUD.Stamina.Value),
										Chuitox.HUD.Colors.Text[1],
										Chuitox.HUD.Colors.Text[2],
										Chuitox.HUD.Colors.Text[3]
									)
		if (Stamina > 2400) then
			Chuitox.HUD.Stamina.Display:SetTextColor(0, 255, 0)
		elseif (Stamina >= 840 and Stamina <= 2400) then
			Chuitox.HUD.Stamina.Display:SetTextColor(255, 127, 0)
		elseif (Stamina < 840) then
			Chuitox.HUD.Stamina.Display:SetTextColor(255, 0, 0)
		end
		Chuitox.HUD.Tracker.Position.y = Chuitox.HUD.Tracker.Position.y + 15

		-- Nearest city
		Chuitox.HUD.NearestCity.Value = Chuitox.HUD.City()
		Chuitox.HUD.NearestCity.Heading = HUD(
											Chuitox.HUD.Tracker.Position.x,
											Chuitox.HUD.Tracker.Position.y,
											"Nearest City",
											Chuitox.HUD.Colors.Text[1],
											Chuitox.HUD.Colors.Text[2],
											Chuitox.HUD.Colors.Text[3]
										)
		Chuitox.HUD.NearestCity.Display = HUD(
											Chuitox.HUD.Tracker.Position.x + 100,
											Chuitox.HUD.Tracker.Position.y,
											string.format("%s", Chuitox.HUD.NearestCity.Value.Name),
											Chuitox.HUD.Colors.Text[1],
											Chuitox.HUD.Colors.Text[2],
											Chuitox.HUD.Colors.Text[3]
										)
		Chuitox.HUD.Tracker.Position.x = 20
		Chuitox.HUD.Tracker.Position.y = 30
		wait(1000)
	end

	Chuitox.HUD.Update = function()
		
		-- Validating our session
		if (Chuitox.HUD.Session.Validate()) then
			
			-- Temporary variables
			-- Assigning some variables to local variables to increase performance
			local SecondsPassed = os.difftime(os.time(), Chuitox.HUD.Session.StartTime)
			local ExperienceGained = Chuitox.HUD.Self.ExperienceGained()
			local ExperiencePerSecond = math.floor(ExperienceGained / SecondsPassed)
			local ExperiencePerHour = Chuitox.HUD.Self.ExperiencePerHour()
			local ExperienceGainedFormatted = string.format("%s (%sk/h)", Chuitox.HUD.Math.Format(ExperienceGained), Chuitox.HUD.Math.Round(ExperiencePerHour, true))
			local ExperienceLeft = Chuitox.HUD.Self.ExperienceLeft()
			local ExecutionTime = Chuitox.HUD.Time.Format(Chuitox.HUD.Session.StartTime)
			local ExecutionTimeHours = Chuitox.HUD.Time.Hours(Chuitox.HUD.Session.StartTime, true) + 1
			local Stamina = Self.Stamina()
			local StaminaFormatted = Chuitox.HUD.Self.Stamina()
			local Level = Self.Level()
			local TimeNextLevel = math.floor(ExperienceLeft / ExperiencePerSecond)
			local TimeLeftLevel = Chuitox.HUD.Time.Format(os.time() - TimeNextLevel, false)
			local NearestCity = Chuitox.HUD.City()
			local TotalLoot = 0
			local TotalSupplies = 0
			local TotalOutcome = 0
			
			-- Colors (According to scheme)
			Chuitox.HUD.Colors.Scheme = Settings.HUD.UseOutfitColors and Self.Outfit() or Chuitox.HUD.Colors.Default
			local HeadingIndex = (Chuitox.HUD.Colors.Scheme["head"] > 0) and Chuitox.HUD.Colors.Scheme["head"] or 1
			local SubHeadingIndex = (Chuitox.HUD.Colors.Scheme["legs"] > 0) and Chuitox.HUD.Colors.Scheme["legs"] or 1
			local TextIndex = (Chuitox.HUD.Colors.Scheme["feet"] > 0) and Chuitox.HUD.Colors.Scheme["feet"] or 1
			local UpdateHeading = (Chuitox.HUD.Colors.Heading[1] ~= Chuitox.HUD.Colors.List[HeadingIndex][1] or
									Chuitox.HUD.Colors.Heading[2] ~= Chuitox.HUD.Colors.List[HeadingIndex][2] or
									Chuitox.HUD.Colors.Heading[3] ~= Chuitox.HUD.Colors.List[HeadingIndex][3])
			local UpdateSubHeading = (Chuitox.HUD.Colors.SubHeading[1] ~= Chuitox.HUD.Colors.List[SubHeadingIndex][1] or
										Chuitox.HUD.Colors.SubHeading[2] ~= Chuitox.HUD.Colors.List[SubHeadingIndex][2] or
										Chuitox.HUD.Colors.SubHeading[3] ~= Chuitox.HUD.Colors.List[SubHeadingIndex][3])
			local UpdateText = (Chuitox.HUD.Colors.Text[1] ~= Chuitox.HUD.Colors.List[TextIndex][1] or
								Chuitox.HUD.Colors.Text[2] ~= Chuitox.HUD.Colors.List[TextIndex][2] or
								Chuitox.HUD.Colors.Text[3] ~= Chuitox.HUD.Colors.List[TextIndex][3])
			Chuitox.HUD.Colors.Heading = Chuitox.HUD.Colors.Scheme and Chuitox.HUD.Colors.List[(Chuitox.HUD.Colors.Scheme["head"] > 0) and Chuitox.HUD.Colors.Scheme["head"] or 1]
			Chuitox.HUD.Colors.SubHeading = Chuitox.HUD.Colors.Scheme and Chuitox.HUD.Colors.List[(Chuitox.HUD.Colors.Scheme["legs"] > 0) and Chuitox.HUD.Colors.Scheme["legs"] or 1]
			Chuitox.HUD.Colors.Text = Chuitox.HUD.Colors.Scheme and Chuitox.HUD.Colors.List[(Chuitox.HUD.Colors.Scheme["feet"] > 0) and Chuitox.HUD.Colors.Scheme["feet"] or 1]
			
			if (UpdateHeading) then
				Chuitox.HUD.UpdateHeading(Chuitox.HUD.Colors.Heading)
			end
			if (UpdateSubHeading) then
				Chuitox.HUD.UpdateSubHeading(Chuitox.HUD.Colors.SubHeading)
			end
			if (UpdateText) then
				Chuitox.HUD.UpdateText(Chuitox.HUD.Colors.Text)
			end
			
			-- Best experience per hour ratio
			if (ExperiencePerHour > Chuitox.HUD.ExperienceRatio.Raw) then
				Chuitox.HUD.ExperienceRatio.Raw = ExperiencePerHour
				Chuitox.HUD.ExperienceRatio.Value:SetText(string.format("%sk/h", Chuitox.HUD.Math.Round(Chuitox.HUD.ExperienceRatio.Raw, true)))
			end
			
			-- Nearest city
			if (Chuitox.HUD.NearestCity.Value.Name ~= NearestCity.Name) then
				Chuitox.HUD.NearestCity.Value = NearestCity
				Chuitox.HUD.NearestCity.Display:SetText(Chuitox.HUD.NearestCity.Value.Name)
			end

			-- Experience gained (We want to update this constantly)
			Chuitox.HUD.ExperienceGained.Value = ExperienceGained
			Chuitox.HUD.ExperienceGained.Display:SetText(ExperienceGainedFormatted)
			
			-- Experience left
			if (Chuitox.HUD.ExperienceLeft.Value ~= ExperienceLeft) then
				Chuitox.HUD.ExperienceLeft.Value = ExperienceLeft
				Chuitox.HUD.ExperienceLeft.Display:SetText(Chuitox.HUD.Math.Format(Chuitox.HUD.ExperienceLeft.Value))
			end
			
			-- Execution time
			if (ExecutionTime ~= Chuitox.HUD.ExecutionTime.Value) then
				Chuitox.HUD.ExecutionTime.Value = ExecutionTime
				Chuitox.HUD.ExecutionTime.Display:SetText(Chuitox.HUD.ExecutionTime.Value)
			end
			
			-- Stamina
			if (StaminaFormatted ~= Chuitox.HUD.Stamina.Value) then
				Chuitox.HUD.Stamina.Value = StaminaFormatted
				Chuitox.HUD.Stamina.Display:SetText(Chuitox.HUD.Stamina.Value)
				if (Stamina > 2400) then
					Chuitox.HUD.Stamina.Display:SetTextColor(0, 255, 0)
				elseif (Stamina >= 840 and Stamina <= 2400) then
					Chuitox.HUD.Stamina.Display:SetTextColor(255, 127, 0)
				elseif (Stamina < 840) then
					Chuitox.HUD.Stamina.Display:SetTextColor(255, 0, 0)
				end
			end
			
			-- Level
			if (Level ~= Chuitox.HUD.Level.Value) then
				Chuitox.HUD.Level.Value = Level
				Chuitox.HUD.Level.Display:SetText(string.format("%s", Chuitox.HUD.Level.Value))
			end
			
			-- Estimated time left to next level
			if (TimeLeftLevel ~= Chuitox.HUD.TimeLeftLevel.Value) then
				Chuitox.HUD.TimeLeftLevel.Value = TimeLeftLevel
				Chuitox.HUD.TimeLeftLevel.Display:SetText(Chuitox.HUD.TimeLeftLevel.Value)
			end
			
			-- Loot/Supplies
			if (not Chuitox.HUD.isDepositing()) then
				if (not Chuitox.HUD["Loot"]["List"]) then
					Chuitox.HUD.Loot.List = {}
					Chuitox.HUD.Loot.Shadows = HUD(
												Chuitox.HUD.Tracker.Position.x + 1,
												Chuitox.HUD.Tracker.Position.y + 1,
												"ITEMS LOOTED",
												0,
												0,
												0
											)
					Chuitox.HUD.Loot.Heading = HUD(
												Chuitox.HUD.Tracker.Position.x,
												Chuitox.HUD.Tracker.Position.y,
												"ITEMS LOOTED",
												Chuitox.HUD.Colors.Heading[1],
												Chuitox.HUD.Colors.Heading[2],
												Chuitox.HUD.Colors.Heading[3]
											)
					Chuitox.HUD.Tracker.Position.y = Chuitox.HUD.Tracker.Position.y + 15
				end
				-- Verify we are using the correct settings
				local containsName, index = table.contains(Chuitox.HUD.Data, Chuitox.HUD.Session.Name, "Name")

				if (containsName) then
					-- Updating Loot
					for _, itemid in ipairs(Chuitox.HUD.Data[index].Loot) do
						local data = Chuitox.HUD.Items.Data(itemid)
						local contains, index = Chuitox.HUD.iLootContains(data.ID)
						if (data.ID > 0 and contains) then
							local count = Chuitox.HUD.ItemCount(data.ID)
							if (count > Chuitox.HUD.Loot["List"][index]["Last"]) then
								Chuitox.HUD.Loot["List"][index]["Count"] = Chuitox.HUD.Loot["List"][index]["Count"] - Chuitox.HUD.Loot["List"][index]["Last"] + count					
							end
							Chuitox.HUD.Loot["List"][index]["Last"] = count
							if (Chuitox.HUD.Loot["List"][index]["Count"] > 0) then
								if (not Chuitox.HUD.Loot["List"][index]["Name"]) then
									Chuitox.HUD.Tracker.NextLoot.y = Chuitox.HUD.Tracker.NextLoot.y + (Chuitox.HUD.DisplayImages and 25 or 15)
									Chuitox.HUD.Tracker.NextSupply.y = Chuitox.HUD.Tracker.NextSupply.y + (Chuitox.HUD.DisplayImages and 25 or 15)
									Chuitox.HUD.Loot["List"][index]["Item"] = HUD(
																				Chuitox.HUD.Tracker.NextLoot.x,
																				Chuitox.HUD.Tracker.NextLoot.y,
																				Chuitox.HUD.DisplayImages and data.ID or "",
																				255,
																				255,
																				255
																			)
									Chuitox.HUD.Loot["List"][index]["Name"] = HUD(
																				Chuitox.HUD.Tracker.NextLoot.x + (Chuitox.HUD.DisplayImages and 30 or 0),
																				Chuitox.HUD.Tracker.NextLoot.y + 10,
																				string.format("%s", (#data.Name >= 16) and string.sub(data.Name, 0, 15 - #data.Name) .. "..." or data.Name):titlecase(),
																				Chuitox.HUD.Colors.Text[1],
																				Chuitox.HUD.Colors.Text[2],
																				Chuitox.HUD.Colors.Text[3]
																			)
									Chuitox.HUD.Loot["List"][index]["Text"] = HUD(
																				Chuitox.HUD.Tracker.NextLoot.x + 150,
																				Chuitox.HUD.Tracker.NextLoot.y + 10,
																				string.format("0 (0k)%s", Chuitox.HUD.Details and " (0/h)" or ""),
																				Chuitox.HUD.Colors.Text[1],
																				Chuitox.HUD.Colors.Text[2],
																				Chuitox.HUD.Colors.Text[3]
																			)
									Chuitox.HUD.Loot["List"][index]["Item"]:SetItemSize(Chuitox.HUD.ItemSize)
									Chuitox.HUD.UpdatePositions()
								end
								Chuitox.HUD.Loot["List"][index]["Text"]:SetText(string.format(
																							"%s (%sk)%s",
																							Chuitox.HUD.Math.Format(Chuitox.HUD.Loot["List"][index]["Count"]),
																							Chuitox.HUD.Math.Round(Chuitox.HUD.Loot["List"][index]["Count"] * data.Value / 1000, true),
																							Chuitox.HUD.Details and string.format(" (%s/h)", Chuitox.HUD.Math.Round(Chuitox.HUD.Loot["List"][index]["Count"] / ExecutionTimeHours, true)) or ""
																						))
							end
						else
							table.insert(
											Chuitox.HUD.Loot["List"], 
											{
												ID = data.ID,
												Count = 0,
												Value = data.Value,
												Last = Chuitox.HUD.ItemCount(data.ID),
												Item = nil,
												Name = nil,
												Text = nil,
											}
										)
						end
					end
					if (not Chuitox.HUD["LootWorth"]) then
						Chuitox.HUD.LootWorth = {}
						Chuitox.HUD.LootWorth.Heading = HUD(
														Chuitox.HUD.Tracker.Position.x,
														Chuitox.HUD.Tracker.Position.y + 10,
														"Total",
														Chuitox.HUD.Colors.SubHeading[1],
														Chuitox.HUD.Colors.SubHeading[2],
														Chuitox.HUD.Colors.SubHeading[3]
													)
						Chuitox.HUD.LootWorth.Value = HUD(
														Chuitox.HUD.Tracker.Position.x + 150,
														Chuitox.HUD.Tracker.Position.y + 10,
														"0gp",
														Chuitox.HUD.Colors.SubHeading[1],
														Chuitox.HUD.Colors.SubHeading[2],
														Chuitox.HUD.Colors.SubHeading[3]
													)
					end
					for id, item in Chuitox.HUD.iLoot() do
						TotalLoot = TotalLoot + (item.Count * item.Value)
					end
					Chuitox.HUD.LootWorth.Value:SetText(string.format("%sgp", Chuitox.HUD.Math.Round(TotalLoot, true)))
					if (not Chuitox.HUD["Supplies"]["List"]) then
						Chuitox.HUD.Tracker.Position.y = Chuitox.HUD.Tracker.Position.y + 35
						Chuitox.HUD.Supplies.List = {}
						Chuitox.HUD.Supplies.Shadows = HUD(
														Chuitox.HUD.Tracker.Position.x + 1,
														Chuitox.HUD.Tracker.Position.y + 1,
														"SUPPLIES USED",
														0,
														0,
														0
													)
						Chuitox.HUD.Supplies.Heading = HUD(
														Chuitox.HUD.Tracker.Position.x,
														Chuitox.HUD.Tracker.Position.y,
														"SUPPLIES USED",
														Chuitox.HUD.Colors.Heading[1],
														Chuitox.HUD.Colors.Heading[2],
														Chuitox.HUD.Colors.Heading[3]
													)
						Chuitox.HUD.Tracker.Position.y = Chuitox.HUD.Tracker.Position.y + 15
					end
					-- Updating Supplies
					for _, itemid in ipairs(Chuitox.HUD.Data[index].Supplies) do
						local data = Chuitox.HUD.Items.Data(itemid)
						local contains, index = Chuitox.HUD.iSuppliesContains(data.ID)
						if (data.ID > 0 and contains) then
							if (#Container.GetAll() > 0) then
								local count = Chuitox.HUD.ItemCount(data.ID)
								if (count > 0) then
									if (count < Chuitox.HUD.Supplies["List"][index]["Last"]) then
										Chuitox.HUD.Supplies["List"][index]["Count"] = Chuitox.HUD.Supplies["List"][index]["Count"] + Chuitox.HUD.Supplies["List"][index]["Last"] - count
									end
									Chuitox.HUD.Supplies["List"][index]["Last"] = count
									if (Chuitox.HUD.Supplies["List"][index]["Count"] > 0) then
										if (not Chuitox.HUD.Supplies["List"][index]["Name"]) then
											Chuitox.HUD.Tracker.NextSupply.y = Chuitox.HUD.Tracker.NextSupply.y + (Chuitox.HUD.DisplayImages and 25 or 15)
											Chuitox.HUD.Supplies["List"][index]["Item"] = HUD(
																							Chuitox.HUD.Tracker.NextSupply.x,
																							Chuitox.HUD.Tracker.NextSupply.y,
																							Chuitox.HUD.DisplayImages and data.ID or "",
																							255,
																							255,
																							255
																						)
											Chuitox.HUD.Supplies["List"][index]["Name"] = HUD(
																							Chuitox.HUD.Tracker.NextSupply.x + (Chuitox.HUD.DisplayImages and 30 or 0),
																							Chuitox.HUD.Tracker.NextSupply.y + 10,
																							string.format("%s", (#data.Name >= 16) and string.sub(data.Name, 0, 15 - #data.Name) .. "..." or data.Name):titlecase(),
																							Chuitox.HUD.Colors.Text[1],
																							Chuitox.HUD.Colors.Text[2],
																							Chuitox.HUD.Colors.Text[3]
																						)
											Chuitox.HUD.Supplies["List"][index]["Text"] = HUD(
																							Chuitox.HUD.Tracker.NextSupply.x + 150,
																							Chuitox.HUD.Tracker.NextSupply.y + 10,
																							string.format("0 (0k)%s", Chuitox.HUD.Details and " (0/h)" or ""),
																							Chuitox.HUD.Colors.Text[1],
																							Chuitox.HUD.Colors.Text[2],
																							Chuitox.HUD.Colors.Text[3]
																						)
											Chuitox.HUD.Supplies["List"][index]["Item"]:SetItemSize(Chuitox.HUD.ItemSize)
											Chuitox.HUD.UpdatePositions()
										end
										Chuitox.HUD.Supplies["List"][index]["Text"]:SetText(string.format(
																										"%s (%sk)%s",
																										Chuitox.HUD.Math.Format(Chuitox.HUD.Supplies["List"][index]["Count"]),
																										Chuitox.HUD.Math.Round(Chuitox.HUD.Supplies["List"][index]["Count"] * data.Value / 1000, true),
																										Chuitox.HUD.Details and string.format(" (%s/h)", Chuitox.HUD.Math.Round(Chuitox.HUD.Supplies["List"][index]["Count"] / ExecutionTimeHours, true)) or ""
																									))
									end	
								end
							end
						else
							table.insert(
											Chuitox.HUD.Supplies["List"],
											{
												ID = data.ID,
												Count = 0,
												Value = data.Value,
												Last = Chuitox.HUD.ItemCount(data.ID),
												Item = nil,
												Name = nil,
												Text = nil,
											}
										)
						end
					end
					if (not Chuitox.HUD["SuppliesWorth"]) then
						Chuitox.HUD.SuppliesWorth = {}
						Chuitox.HUD.SuppliesWorth.Heading = HUD(
															Chuitox.HUD.Tracker.Position.x,
															Chuitox.HUD.Tracker.Position.y + 10,
															"Total",
															Chuitox.HUD.Colors.SubHeading[1],
															Chuitox.HUD.Colors.SubHeading[2],
															Chuitox.HUD.Colors.SubHeading[3]
														)
						Chuitox.HUD.SuppliesWorth.Value = HUD(
															Chuitox.HUD.Tracker.Position.x + 150,
															Chuitox.HUD.Tracker.Position.y + 10,
															"0gp",
															Chuitox.HUD.Colors.SubHeading[1],
															Chuitox.HUD.Colors.SubHeading[2],
															Chuitox.HUD.Colors.SubHeading[3]
														)
						Chuitox.HUD.Tracker.Position.y = Chuitox.HUD.Tracker.Position.y + 10
					end
					for id, item in Chuitox.HUD.iSupplies() do
						TotalSupplies = TotalSupplies + (item.Count * item.Value)
					end
					Chuitox.HUD.SuppliesWorth.Value:SetText(string.format("%sgp", Chuitox.HUD.Math.Round(TotalSupplies, true)))
					if (not Chuitox.HUD["Outcome"]) then
						Chuitox.HUD.Tracker.Position.y = Chuitox.HUD.Tracker.Position.y + 25
						Chuitox.HUD["Outcome"] = {}
						Chuitox.HUD["Outcome"]["Result"] = HUD(
															Chuitox.HUD.Tracker.Position.x,
															Chuitox.HUD.Tracker.Position.y,
															"PROFIT",
															0,
															180,
															20
														)
						Chuitox.HUD["Outcome"]["Data"] = HUD(
														Chuitox.HUD.Tracker.Position.x + 150,
														Chuitox.HUD.Tracker.Position.y,
														"0 (0k/h)",
														0,
														180,
														20
													)
					end
					-- Updating Outcome
					TotalOutcome = TotalLoot - TotalSupplies
					Chuitox.HUD["Outcome"]["Data"]:SetText(string.format(
																	"%s (%sk/h)",
																	Chuitox.HUD.Math.Format(TotalOutcome),
																	Chuitox.HUD.Math.Round((TotalOutcome / ExecutionTimeHours) / 1000, true)
																))
					if (TotalOutcome >= 0) then
						Chuitox.HUD["Outcome"]["Result"]:SetText("PROFIT")
						Chuitox.HUD["Outcome"]["Result"]:SetTextColor(0, 180, 20)
						Chuitox.HUD["Outcome"]["Data"]:SetTextColor(0, 180, 20)
					else
						Chuitox.HUD["Outcome"]["Result"]:SetText("WASTE")
						Chuitox.HUD["Outcome"]["Result"]:SetTextColor(255, 0, 0)
						Chuitox.HUD["Outcome"]["Data"]:SetTextColor(255, 0, 0)
					end
				end
			end
		end
	end

	Chuitox.HUD.Load()
	while (true) do
		Chuitox.HUD.Update()
		wait(2000)
	end