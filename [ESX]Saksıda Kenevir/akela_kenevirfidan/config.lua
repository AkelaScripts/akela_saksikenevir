Config = {}

--Bu script Akela tarafından kodlanmıştır. Emeğe saygı.


Config.GubreCount = 5 -- Verilmesi gereken gübre sayısı

Config.SuCount = 5 -- Verilmesi gereken su sayısı

Config.Miktar = math.random(15, 40) -- Alınan kenevir sayısı

Config.Prize = 5000 -- Min. satış fiyatı
Config.Prize2 = 15000 -- Max. satış fiyatı

Config.Area = {
	vector3(362.75, 4314.05, 44.71),
	vector3(352.36, 4295.35, 42.13),
	vector3(323.39, 4272.0, 40.53),
	vector3(293.54, 4268.74, 40.0),
	vector3(281.57, 4285.52, 41.13),				-- Buraları elleşme
	vector3(290.65, 4305.55, 44.44),
	vector3(254.23, 4312.87, 43.05),
	vector3(250.62, 4339.73, 43.43),
	vector3(295.62, 4352.43, 49.03),
	vector3(327.07, 4351.13, 49.85),
	vector3(337.83, 4323.59, 47.5)
}

Config.SellPoint = vector3(435.44, 2997.41, 40.28) 		-- Satış noktası


Config.Job = 'any' -- Hangi meslek satış yapsın (any bırakırsan herkes satabilir)