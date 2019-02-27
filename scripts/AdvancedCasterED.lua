local maxManaPercent = 90
local minManaPercent = 50
local manaActive = false
local manaPotions = {268, 237, 238}
local lastItem = 0
local attacks = {}
local shotBlockers = {230, 240, 241, 242, 243, 253, 254, 255, 256, 257, 258, 259, 260, 261, 262, 263, 264, 265, 267, 356, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 373, 374, 375, 376, 377, 378, 379, 380, 381, 382, 383, 384, 920, 921, 1007, 1008, 1009, 1010, 1011, 1025, 1026, 1027, 1028, 1029, 1030, 1031, 1032, 1033, 1034, 1035, 1036, 1037, 1038, 1039, 1040, 1041, 1042, 1043, 1044, 1045, 1046, 1053, 1081, 1082, 1083, 1084, 1085, 1086, 1087, 1112, 1113, 1114, 1115, 1116, 1117, 1118, 1119, 1120, 1121, 1122, 1127, 1128, 1270, 1271, 1272, 1273, 1274, 1275, 1276, 1277, 1278, 1279, 1280, 1281, 1282, 1283, 1284, 1285, 1286, 1287, 1288, 1289, 1290, 1291, 1292, 1293, 1294, 1295, 1296, 1297, 1298, 1299, 1300, 1301, 1302, 1303, 1304, 1305, 1306, 1307, 1308, 1309, 1310, 1311, 1312, 1313, 1314, 1315, 1316, 1329, 1330, 1331, 1332, 1333, 1334, 1335, 1336, 1337, 1338, 1340, 1341, 1342, 1343, 1344, 1345, 1346, 1347, 1348, 1349, 1350, 1351, 1352, 1353, 1354, 1355, 1356, 1357, 1358, 1359, 1360, 1361, 1362, 1363, 1364, 1373, 1374, 1375, 1376, 1377, 1378, 1379, 1380, 1381, 1382, 1383, 1384, 1385, 1386, 1387, 1388, 1389, 1390, 1391, 1392, 1393, 1394, 1395, 1396, 1397, 1398, 1399, 1400, 1401, 1402, 1409, 1410, 1411, 1412, 1413, 1414, 1415, 1416, 1417, 1418, 1419, 1420, 1421, 1422, 1423, 1424, 1425, 1426, 1427, 1428, 1429, 1430, 1431, 1432, 1433, 1434, 1435, 1436, 1437, 1438, 1439, 1440, 1441, 1442, 1443, 1444, 1445, 1446, 1447, 1448, 1449, 1450, 1451, 1452, 1453, 1454, 1455, 1456, 1457, 1458, 1459, 1460, 1461, 1462, 1463, 1464, 1465, 1466, 1467, 1468, 1469, 1470, 1471, 1472, 1473, 1474, 1475, 1476, 1477, 1478, 1479, 1480, 1481, 1486, 1487, 1488, 1489, 1490, 1491, 1492, 1493, 1494, 1495, 1496, 1497, 1498, 1499, 1500, 1501, 1502, 1503, 1504, 1505, 1506, 1507, 1508, 1509, 1510, 1511, 1512, 1513, 1514, 1515, 1516, 1517, 1518, 1519, 1520, 1521, 1522, 1536, 1539, 1542, 1543, 1544, 1545, 1546, 1547, 1548, 1549, 1550, 1551, 1552, 1553, 1554, 1555, 1556, 1558, 1559, 1560, 1562, 1563, 1564, 1573, 1574, 1575, 1578, 1579, 1580, 1581, 1584, 1585, 1586, 1587, 1589, 1590, 1592, 1597, 1598, 1599, 1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608, 1609, 1610, 1612, 1613, 1614, 1615, 1616, 1617, 1618, 1619, 1620, 1621, 1622, 1623, 1748, 1749, 1750, 2076, 2078, 2092, 2128, 2129, 2170, 2242, 2243, 2244, 2245, 2246, 2247, 2248, 2249, 2250, 2251, 2252, 2738, 2739, 2740, 2741, 2767, 2768, 4140, 4144, 4427, 4429, 4430, 4431, 4432, 4457, 4458, 4459, 4460, 4461, 4462, 4463, 4464, 4465, 4466, 4467, 4468, 4469, 4470, 4471, 4472, 4473, 4474, 4475, 4476, 4477, 4478, 4479, 4480, 4481, 4482, 4483, 4484, 4485, 4486, 4487, 4488, 4489, 4490, 4491, 4492, 4493, 4494, 4495, 4496, 4497, 4498, 4499, 4500, 4501, 4502, 4747, 4748, 4815, 4816, 4881, 4882, 4883, 4884, 4885, 4886, 4887, 4888, 4889, 4890, 4891, 4892, 4893, 4894, 4895, 4896, 4897, 4898, 4899, 4900, 4901, 4902, 4903, 4904, 4905, 4906, 4907, 4908, 4909, 4910, 4915, 4916, 4918, 4919, 4940, 4941, 4942, 4947, 4948, 4949, 4950, 4951, 4952, 4965, 4966, 4967, 4968, 4969, 4970, 4974, 4975, 5002, 5003, 5004, 5005, 5008, 5009, 5010, 5011, 5012, 5033, 5034, 5035, 5036, 5037, 5038, 5039, 5040, 5145, 5146, 5147, 5148, 5149, 5150, 5151, 5152, 5153, 5154, 5260, 5261, 5262, 5263, 5264, 5265, 5266, 5267, 5268, 5269, 5270, 5271, 5272, 5273, 5274, 5441, 5442, 5449, 5451, 5452, 5453, 5454, 5455, 5456, 5457, 5458, 5473, 5474, 5518, 5519, 5597, 5598, 5599, 5600, 5601, 5602, 5603, 5604, 5605, 5606, 5607, 5608, 5609, 5610, 5611, 5612, 5630, 5631, 5632, 5633, 5634, 5635, 5636, 5637, 5638, 5639, 5640, 5641, 5642, 5643, 5644, 5645, 5646, 5647, 5648, 5649, 5650, 5651, 5652, 5653, 5683, 5684, 5685, 5686, 5692, 5693, 5694, 5695, 5696, 5697, 5698, 5699, 5700, 5701, 5702, 5703, 5711, 5712, 5713, 5714, 5715, 5716, 5717, 5718, 5719, 5720, 5721, 5722, 5723, 5724, 5725, 5726, 5777, 5778, 5787, 5788, 5811, 5814, 5852, 5853, 5860, 5861, 6132, 6133, 6134, 6135, 6136, 6138, 6139, 6140, 6141, 6142, 6143, 6144, 6145, 6146, 6147, 6148, 6149, 6150, 6151, 6237, 6238, 6239, 6240, 6241, 6242, 6243, 6244, 6245, 6246, 6247, 6280, 6281, 6282, 6283, 6288, 6289, 6394, 6395, 6396, 6397, 6398, 6399, 6400, 6401, 6402, 6403, 6404, 6405, 6406, 6419, 6420, 6719, 6720, 6721, 6722, 6723, 6724, 6725, 6726, 6727, 6728, 6729, 6730, 6731, 6732, 6733, 6734, 6735, 6736, 6737, 6738, 6739, 6740, 6741, 6742, 6743, 6744, 6745, 6746, 6747, 6748, 6749, 6761, 6762, 6768, 6769, 6770, 6771, 6772, 6773, 6774, 6775, 6776, 6777, 6778, 6779, 6780, 6781, 6782, 6783, 6784, 6785, 6786, 6787, 6822, 6823, 6824, 6825, 6826, 6827, 6828, 6829, 6830, 6831, 6832, 6833, 6834, 6835, 6836, 6837, 6838, 6839, 6840, 6841, 6842, 6843, 6844, 6845, 6846, 6847, 6848, 6849, 6850, 6851, 6852, 6853, 6854, 6855, 6856, 6857, 6858, 6859, 6860, 6861, 6862, 6863, 6864, 6865, 6866, 6867, 6869, 6925, 7102, 7103, 7104, 7105, 7228, 7229, 7230, 7231, 7262, 7263, 7291, 7292, 7293, 7294, 7295, 7296, 7297, 7298, 7299, 7300, 7301, 7302, 7507, 7508, 7541, 7645, 7646, 7647, 7648, 7649, 7650, 7651, 7652, 7653, 7654, 7655, 7656, 7657, 7658, 7659, 7660, 7661, 7662, 7663, 7664, 7665, 7666, 7667, 7668, 7669, 7670, 7671, 7672, 7673, 7674, 7675, 7676, 7677, 7678, 7679, 7680, 7681, 7682, 7683, 7684, 7685, 7686, 7687, 7688, 7689, 7690, 7691, 7692, 7693, 7694, 7695, 7896, 7897, 7898, 7899, 7906, 7907, 7908, 7909, 7953, 7954, 7955, 7956, 8201, 8202, 8203, 8204, 8205, 8206, 8207, 8208, 8209, 8210, 8211, 8212, 8213, 8214, 8215, 8216, 8219, 8220, 8221, 8222, 8223, 8226, 8227, 8231, 8232, 8233, 8234, 8235, 8236, 8237, 8238, 8239, 8240, 8241, 8242, 8267, 8268, 8269, 8270, 8271, 8272, 8291, 8292, 8293, 8294, 8295, 8296, 8297, 8298, 8299, 8300, 8301, 8302, 8303, 8304, 8305, 8306, 8307, 8347, 8348, 8349, 8350, 8372, 8373, 8374, 8375, 8376, 8377, 8378, 8379, 8380, 8381, 8382, 8383, 8454, 8455, 8456, 8457, 8458, 8459, 8460, 8461, 8462, 8463, 8464, 8465, 8466, 8467, 8468, 8469, 8470, 8554, 8569, 8570, 8616, 8617, 8691, 8692, 8739, 8811, 8844, 8845, 8846, 8847, 9246, 9259, 9260, 9261, 9262, 9263, 9264, 9265, 9266, 9267, 9268, 9269, 9270, 9271, 9274, 9275, 9277, 9278, 9309, 9310, 9311, 9312, 9313, 9314, 9315, 9316, 9317, 9318, 9319, 9320, 9321, 9322, 9323, 9324, 9325, 9326, 9327, 9328, 9329, 9330, 9331, 9332, 9333, 9334, 9335, 9336, 9337, 9338, 9339, 9340, 9341, 9342, 9343, 9344, 9369, 9370, 9408, 9409, 9410, 9411, 9412, 9413, 9414, 9415, 9416, 9417, 9418, 9419, 9420, 9421, 9422, 9423, 9518, 9733, 9734, 9735, 9736, 9737, 9738, 9739, 9740, 9741, 9742, 9743, 9744, 9745, 9746, 9747, 9748, 9749, 9750, 9751, 9752, 9753, 9754, 9755, 9756, 9757, 9758, 9759, 9760, 9761, 9762, 9763, 9764, 9765, 9766, 9767, 9768, 9769, 9770, 9771, 9772, 9773, 9893, 9895, 9897, 9898, 9901, 9902, 9903, 9904, 9905, 9906, 9907, 9908, 9909, 9910, 9913, 9914, 9915, 9916, 9917, 9918, 9919, 9920, 9921, 9922, 9923, 9924, 9925, 9926, 9927, 9928, 9963, 9964, 9965, 9966, 10044, 10045, 10062, 10063, 10064, 10065, 10066, 10067, 10090, 10091, 10092, 10093, 10094, 10095, 10181, 10284, 10285, 10378, 10379, 10380, 10381, 10588, 10589, 10590, 10591, 10744, 10746, 10770, 10846, 10877, 10878, 10879, 10880, 10881, 10882, 10883, 10884, 10885, 10886, 10887, 10888, 10889, 10890, 10891, 10892, 10893, 10894, 10895, 10896, 10897, 10898, 10899, 10952, 10953, 10981, 10982, 10983, 10984, 10985, 10987, 10988, 10990, 10993, 10994, 10995, 10996, 11006, 11009, 11014, 11015, 11049, 11067, 11068, 11088, 11089, 11093, 11094, 11117, 11118, 11119, 11120, 11121, 11122, 11123, 11157, 11202, 11203, 11204, 11205, 11206, 11207, 11208, 11209, 11273, 11274, 11275, 11276, 11277, 11310, 11330, 11332, 11335, 11342, 11343, 11346, 11363, 11555, 11556, 11557, 11558, 11559, 11560, 11561, 11562, 11563, 11564, 11565, 11566, 11567, 11568, 11569, 11573, 11574, 11575, 11576, 11577, 11578, 11579, 11580, 11581, 11704, 11706, 11710, 11768, 11769, 11859, 11860, 11870, 11871, 11872, 11873, 11874, 11875, 11876, 11877, 11878, 11879, 11880, 11881, 11882, 11893, 11894, 11895, 11896, 11898, 11899, 11900, 11901, 11902, 11903, 11904, 11905, 11906, 11907, 11908, 11909, 11910, 11911, 11912, 11913, 11914, 11915, 11916, 11917, 11918, 11919, 11920, 11921, 11922, 11923, 11924, 11951, 11952, 11953, 11954, 11955, 11956, 11957, 11958, 11971, 11972, 11973, 11974, 11975, 11976, 11977, 11978, 11979, 11980, 11981, 11983, 11985, 11986, 11988, 11989, 11992, 11993, 11994, 11995, 11996, 11997, 11998, 11999, 12000, 12001, 12002, 12003, 12004, 12005, 12006, 12007, 12008, 12009, 12010, 12011, 12012, 12013, 12014, 12015, 12016, 12017, 12018, 12019, 12037, 12038, 12085, 12086, 12087, 12088, 12089, 12105, 12107, 12109, 12111, 12147, 12148, 12149, 12150, 12151, 12152, 12153, 12154, 12155, 12156, 12157, 12158, 12190, 12191, 12192, 12193, 12195, 12196, 12197, 12199, 12246, 12387, 12388, 12389, 12390, 12391, 12392, 12393, 12394, 12395, 12396, 12397, 12398, 12399, 12400, 12401, 12402, 12403, 12408, 12409, 12410, 12411, 12426, 12428, 12429, 12430, 12604, 12865, 12866, 12867, 12868, 12869, 12870, 12871, 12872, 12873, 12874, 12875, 12876, 12877, 12880, 12881, 12882, 12883, 12884, 12885, 12908, 12909, 12910, 12911, 12912, 12963, 12964, 12965, 12966, 12967, 12968, 12969, 12970, 12971, 12972, 12973, 12974, 12975, 12976, 12977, 12978, 12981, 12982, 12983, 12984, 12985, 12986, 12989, 12990, 12991, 13083, 13084, 13085, 13086, 13087, 13088, 13089, 13090, 13091, 13092, 13093, 13094, 13095, 13096, 13097, 13098, 13099, 13100, 13101, 13102, 13103, 13106, 13107, 13108, 13109, 13110, 13111, 13112, 13113, 13114, 13115, 13116, 13117, 13118, 13119, 13120, 13121, 13182, 13183, 13203, 13204, 13205, 13207, 13208, 13209, 13210, 13211, 13212, 13213, 13214, 13274, 13275, 13277, 13278, 13279, 13280, 13281, 13282, 13283, 13284, 13286, 13287, 13289, 13290, 13291, 13292, 13293, 13294, 13594, 13596, 13597, 13598, 13599, 13600, 13601, 13602, 13603, 13604, 13605, 13606, 13607, 13608, 13609, 13610, 13611, 13612, 13613, 13614, 13615, 13616, 13617, 13618, 13619, 13620, 13621, 13622, 13623, 13624, 13625, 13626, 13627, 13628, 13629, 13630, 13631, 13632, 13633, 13634, 13635, 13636, 13637, 13638, 13639, 13640, 13641, 13642, 13643, 13644, 13645, 13775, 13776, 13777, 13778, 13783, 13784, 13785, 13786, 14158, 14159, 14160, 14161, 14226, 14259, 14842, 14843, 14844, 14845, 14846, 14847, 14848, 14849, 14850, 14851, 14852, 14853, 14854, 14855, 14856, 14857, 14858, 14859, 14860, 14861, 14862, 14863, 14864, 14865, 14866, 14867, 14868, 14869, 14870, 14871, 14872, 14873, 14874, 14875, 14876, 14877, 14878, 14879, 14880, 14881, 14882, 14883, 14884, 14885, 14886, 14887, 14888, 14889, 14890, 14891, 14892, 14893, 14894, 14895, 14896, 14897, 14898, 15060, 15061, 15062, 15063, 15064, 15065, 15066, 15067, 15068, 15069, 15070, 15071, 15072, 15073, 15074, 15075, 15076, 15077, 15078, 15079, 15080, 15081, 15082, 15083, 15084, 15085, 15086, 15087, 15088, 15089, 15090, 15091, 15092, 15093, 15094, 15095, 15096, 15097, 15100, 15101, 15102, 15103, 15104, 15105, 15106, 15107, 15221, 15222, 15223, 15224, 15229, 15230, 15231, 15237, 15238, 15239, 15240, 15251, 15260, 15261, 15262, 15263, 15264, 15265, 15266, 15267, 15268, 15269, 15270, 15271, 15272, 15273, 15274, 15290, 15291, 15292, 15296, 15298, 15299, 15300, 15301, 15309, 15311, 15312, 15313, 15314, 15315, 15316, 15317, 15318, 15345, 15347, 15348, 15349, 15350, 15355, 15356, 15357, 15358, 15359, 15360, 15361, 15362, 15363, 15364, 15365, 15366, 15367, 15368, 15369, 15370, 15371, 15372, 15373, 15374, 15375, 15376, 15377, 15378, 15379, 15380, 15381, 15382, 15383, 15384, 15385, 15386, 15387, 15388, 15389, 15392, 15420, 15421, 15422, 15423, 15424, 15425, 15426, 15427, 15428, 15429, 15430, 15431, 15432, 15433, 15434, 15435, 15436, 15437, 15438, 15439, 15440, 15441, 15442, 15443, 15444, 15445, 15446, 15447, 15448, 15449, 15450, 15451, 15452, 15453, 15679, 15680, 15681, 15682, 15683, 15684, 15685, 15686, 15719, 15720, 15721, 15722, 15723, 15724, 15725, 15726, 15727, 15728, 15729, 15730, 15731, 15732, 15733, 15758, 15771, 15772, 15773, 15876, 15877, 15878, 15879, 15880, 15881, 15882, 15883, 15884, 15885, 15886, 15887, 15914, 15915, 15916, 15917, 15918, 15919, 15920, 15921, 15922, 15923, 15924, 15925, 15926, 15927, 15928, 15929, 15930, 15931, 15932, 15933, 15934, 15935, 15936, 15937, 15938, 15939, 15940, 15941, 15942, 15943, 15944, 15945, 15946, 15947, 15948, 15949, 15950, 15951, 15952, 15953, 15954, 15955, 15956, 16007, 16008, 16009, 16010, 16011, 16012, 16013, 16014, 16015, 16016, 16017, 16018, 16019, 16020, 16021, 16022, 16023, 16024, 16025, 16026, 16027, 16028, 16029, 16030, 16031, 16032, 16033, 16034, 16035, 16036, 16037, 16038, 16039, 16040, 16041, 16042, 16043, 16044, 16045, 16046, 16047, 16048, 16049, 16180, 16181, 16333, 16334, 16335, 16336, 16337, 16338, 16339, 16340, 16341, 16342, 16343, 16344, 16345, 16346, 16347, 16348, 16349, 16350, 16351, 16352, 16353, 16354, 16355, 16356, 16357, 16358, 16359, 16360, 16361, 16362, 16363, 16364, 16365, 16366, 16367, 16368, 16369, 16370, 16371, 16372, 16638, 16639, 16640, 16641, 16642, 16643, 16644, 16645, 16646, 16647, 16648, 16649, 16667, 16668, 16669, 16670, 16671, 16672, 16673, 16674, 16675, 16676, 16677, 16678, 16793, 16794, 16795, 16796, 16797, 16798, 16799, 16800, 16801, 16802, 16803, 16804, 16805, 16806, 16807, 16808, 16809, 16810, 16811, 16812, 16813, 16814, 16815, 16816, 16817, 16818, 16819, 16820, 16821, 16822, 16823, 16824, 16825, 16826, 16827, 16828, 16829, 16830, 16831, 16832, 16833, 16834, 16835, 16836, 16837, 16838, 16839, 16840, 16841, 16842, 16843, 16844, 16845, 16846, 16847, 16848, 16849, 16850, 16851, 16852, 16853, 16854, 16855, 16856, 16857, 16858, 16859, 16860, 16861, 16863, 16866, 16868, 17052, 17053, 17054, 17055, 17056, 17057, 17058, 17059, 17060, 17061, 17062, 17063, 17064, 17065, 17066, 17067, 17068, 17069, 17070, 17071, 17072, 17073, 17074, 17075, 17076, 17077, 17078, 17079, 17080, 17081, 17082, 17083, 17084, 17085, 17086, 17087, 17088, 17089, 17090, 17091, 17092, 17093, 17094, 17095, 17096, 17097, 17098, 17099, 17100, 17101, 17102, 17103, 17104, 17105, 17106, 17107, 17108, 17115, 17116, 17117, 17118, 17119, 17120, 17121, 17122, 17123, 17124, 17125, 17126, 17127, 17128, 17129, 17130, 17131, 17132, 17133, 17134, 17135, 17136, 17137, 17138, 17139, 17140, 17171, 17172, 17173, 17174, 17175, 17176, 17177, 17178, 17179, 17180, 17181, 17182, 17183, 17184, 17185, 17186, 17187, 17188, 17189, 17190, 17191, 17192, 17193, 17194, 17195, 17196, 17197, 17198, 17199, 17200, 17201, 17202, 17203, 17204, 17205, 17206, 17207, 17208, 17209, 17210, 17211, 17212, 17213, 17214, 17215, 17216, 17217, 17218, 17219, 17220, 17221, 17222, 17223, 17224, 17228, 17336, 17337, 17338, 17339, 17340, 17341, 17342, 17343, 17344, 17345, 17405, 17406, 17407, 17408, 17515, 17521, 17522, 17523, 17524, 17578, 17579, 17580, 17581, 17582, 17583, 17584, 17585, 17586, 17587, 17588, 17589, 17590, 17591, 17592, 17593, 17594, 17595, 17596, 17597, 17630, 17631, 17632, 17633, 17634, 17635, 17636, 17637, 17638, 17639, 17640, 17641, 17642, 17643, 17644, 17645, 17646, 17647, 17648, 17649, 17650, 17651, 17652, 17653, 17654, 17655, 17656, 17657, 17803, 17804, 17805, 17806, 17832, 17833, 17874, 17875, 17876, 17877, 17878, 17879, 17880, 17884, 17885, 17886, 17888, 17889, 17890, 17891, 17892, 17895, 17896, 17899, 17910, 17911, 17912, 17913, 17914, 17915, 17916, 18011, 18012, 18027, 18028, 18029}
local stairs = {294, 369, 370, 385, 394, 411, 412, 413, 414, 428, 432, 433, 434, 435, 437, 438, 469, 470, 482, 483, 484, 485, 566, 567, 594, 595, 600, 601, 604, 605, 607, 609, 610, 615, 859, 1067, 1080, 1156, 1931, 4823, 4824, 4825, 4826, 5081, 5544, 5691, 5731, 5763, 6127, 6128, 6129, 6130, 6172, 6173, 6917, 6918, 6919, 6920, 6921, 6922, 6923, 6924, 7053, 7729, 7730, 7731, 7732, 7733, 7734, 7735, 7736, 7750, 7755, 7767, 7768, 8193, 8658, 8690, 8932, 12072, 12203, 12728, 12799, 12961, 15145, 15146, 16265, 16266, 16267, 16268, 16269, 16270, 16271, 16272, 16696, 16697, 16698, 16699, 16700, 16701, 16702, 16703, 16785, 16786, 16787, 16788, 16789, 16790, 16791, 16792, 17239, 17928}

--[[
attack 			- choose an attack from above
names 			- the monsters you will use this attack on 
minAmountHit 	- the minimumamount of monsters that should be hit
minHealth 		- The minimum healthpercentage of target monster to use this attack
maxHealth 		- The maximum healthpercentage of the monster to use this attack
minMana			- The minimum manapercentage that you need to have
maxMana			- The max manapercentage that you can have
minRange 		- Minimum range the monster need to be
maxRange 		- maximum range the monster can be
]]--


function castSetting()
attacks[1] = {attack = eternalWinter, names = {"hero", "Vicious Squire", "Necromancer", "Lich", "Blood Priest", "Renegade Knight", "vile grandmaster", "undead gladiator", "Killer Caiman", "Gnarlhound", "Sandcrawler", "Dragon Hatchling", "Death Blob", "Mutated Tiger", "Mutated Bat"}, minAmountHit  = 5, minRange = 5}
attacks[2] = {attack = wrathOfNature, names = {"hero", "Vicious Squire", "Necromancer", "Lich", "Blood Priest", "Renegade Knight", "vile grandmaster", "undead gladiator", "Killer Caiman", "Gnarlhound", "Sandcrawler", "Dragon Hatchling", "Death Blob", "Mutated Tiger", "Mutated Bat"}, minAmountHit  = 5, minRange = 6}
end

-- Radius, Range and needTarget is already defined, you don't have to worry about these.

-------------------------------------------
--										 --
-- Don't change anything below this line --
--										 --
-------------------------------------------

-- knight attacks
annihilation, berserk, brutalStrike, fierceBerserk, frontSweep, inflictWound, whirlwindThrow, groundshaker = 
0,0,0,0,0,0,0,0
--paladin attacks
divineCaldera, divineMissile, etherealSpear, holyMissileRune, holyFlash, strongEtherealSpear =
0,0,0,0,0,0
-- druid attacks
iceStrike, terraStrike, flameStrike, energyStrike, physicalStrike, apprenticesStrike,
strongIceStrike, strongTerraStrike, ultimateIceStrike, ultimateTerraStrike,
iceWave, strongIceWave, terraWave, envenom,
eternalWinter, wrathOfNature =
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
-- sorc attacks
iceStrike, terraStrike, flameStrike, energyStrike, deathstrike, lightning, apprenticesStrike,
strongEnergyStrike, strongFlameStrike, ultimateEnergyStrike, ultimateFlameStrike, 
fireWave, energyWave, energyBeam, greatEnergyBeam, electrify, ignite, curse,
rageOfTheSkies, hellsCore = 
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
-- rune attacks
avalancheRune, explosionRune, fireballRune, 
greatFireballRune, heavyMagicMissileRune, 
icicleRune, lightMagicMissileRune, lightestMagicMissileRune, soulfireRune, 
stalagmiteRune, stoneShowerRune, suddenDeathRune, thunderstormRune = 
0,0,0,0,0,0,0,0,0,0,0,0,0

function attackSettings()
wave1 = {
{0, 0, 1, 0, 0},
{0, 1, 1, 1, 0},
{0, 1, 1, 1, 0},
{1, 1, 1, 1, 1}}

wave2 = {
{0,1,0},
{0,1,0},
{1,1,1},
{1,1,1},
{1,1,1}}

energyBeamArea = {
{1},
{1},
{1},
{1},
{1}}

greatEnergyBeamArea = {
{1},
{1},
{1},
{1},
{1},
{1},
{1},
{1}}

strongIceWaveArea = {
{0,1,0},
{1,1,1},
{1,1,1}}

frontSweep = {
{1,1,1}}

iceWaveArea = wave1
fireWaveArea = wave1
terraWaveArea = wave2
energyWaveArea = wave2
practiseFireWave = wave1

annihilation = 			{spell = {"exori gran ico", 300}, 	needTarget = true, range = 1}
apprenticesStrike = 	{spell = {"exori min flam", 6}, 	needTarget = true, range = 3}
berserk = 				{spell = {"exori", 115}, 			needTarget = false, radius = 1.5}
brutalStrike = 			{spell = {"exori ico", 30}, 		needTarget = true, range = 1}
curse = 				{spell = {"utori mort", 30}, 		needTarget = true, range = 1}
deathstrike = 			{spell = {"exori mort", 20}, 		needTarget = true, range = 3}
divineCaldera = 		{spell = {"exevo mas san", 160}, 	needTarget = false, radius = 3}
divineMissile = 		{spell = {"exori san", 20}, 		needTarget = true, range = 4}
electrify = 			{spell = {"utori vis", 30}, 		needTarget = true , range = 1}
energyBeam = 			{spell = {"exevo vis lux", 40}, 	needTarget = false, area = energyBeamArea}
energyStrike = 			{spell = {"exori vis", 20}, 		needTarget = true, range = 3}
energyWave = 			{spell = {"exevo vis hur", 170}, 	needTarget = false, area = energyWaveArea}
envenom = 				{spell = {"utori pox", 30}, 		needTarget = true , range = 1}
eternalWinter = 		{spell = {"exevo gran mas frigo", 1050}, needTarget = false, radius = 5}
etherealSpear = 		{spell = {"exori con", 25}, 		needTarget = true, range = 7}
fierceBerserk = 		{spell = {"exori gran", 340}, 		needTarget = false, range = 1}
fireWave = 				{spell = {"exevo flam hur", 25}, 	needTarget = false, area = fireWaveArea}
flameStrike = 			{spell = {"exori flam", 20},		needTarget = true, range = 3}
frontSweep = 			{spell = {"exori min", 200}, 		needTarget = false , area = frontSweep}
greatEnergyBeam = 		{spell = {"exevo gran vis lux", 110}, needTarget = false , area = greatEnergyBeamArea}
groundshaker = 			{spell = {"exori mas", 160}, 		needTarget = false, radius = 3}
hellsCore = 			{spell = {"exevo gran mas flam", 1100}, needTarget = false , radius = 5.5}
holyFlash = 			{spell = {"utori san", 30}, 		needTarget = yes, range = 1}
iceStrike = 			{spell = {"exori frigo", 20}, 		needTarget = true , range = 3}
iceWave = 				{spell = {"exevo frigo hur", 25}, 	needTarget = false, area = iceWaveArea}
ignite = 				{spell = {"utori flam", 30},		needTarget = true, range = 1}
inflictWound = 			{spell = {"utori kor", 30}, 		needTarget = true, range = 1}
lightning = 			{spell = {"exori amp vis", 60}, 	needTarget = true, range = 4}
physicalStrike = 		{spell = {"exori moe ico", 20}, 	needTarget = true, range = 3}
practiseFireWave = 		{spell = {"exevo dis flam hur", 5}, needTarget = false, area = practiseFireWave}
rageOfTheSkies = 		{spell = {"exevo gran mas vis", 600}, needTarget = false, radius = 5}
strongEnergyStrike = 	{spell = {"exori gran vis", 60}, 	needTarget = true , range = 3}
strongEtherealSpear = 	{spell = {"exori gran con", 55}, 	needTarget = true, range = 7}
strongFlameStrike = 	{spell = {"exori gran flam ", 60}, 	needTarget = true, range = 3}
strongIceStrike = 		{spell = {"exori gran frigo", 60}, 	needTarget = true, range = 3}
strongIceWave = 		{spell = {"exevo gran frigo hur", 170}, needTarget = false, area = strongIceWaveArea}
strongTerraStrike = 	{spell = {"exori gran tera ", 60}, 	needTarget = true, range = 3}
terraStrike = 			{spell = {"exori tera", 20}, 		needTarget = false, range = 3}
terraWave = 			{spell = {"exevo tera hur", 210}, 	needTarget = false, area = terraWaveArea}
ultimateEnergyStrike = 	{spell = {"exori max vis", 100}, 	needTarget = true, range = 3}
ultimateFlameStrike = 	{spell = {"exori max flam", 100}, 	needTarget = true, range = 3}
ultimateIceStrike = 	{spell = {"exori max frigo", 100}, 	needTarget = true, range = 3}
ultimateTerraStrike = 	{spell = {"exori max tera", 100},	needTarget = true, range = 3}
whirlwindThrow = 		{spell = {"exori hur", 40}, 		needTarget = true, range = 5}
wrathOfNature = 		{spell = {"exevo gran mas tera", 700}, needTarget = false, radius = 6.5}
avalancheRune = 		{rune = 3161, needTarget = false, 	radius = 3.5}
explosionRune = 		{rune = 3200, needTarget = false, 	radius = 1}
fireballRune = 			{rune = 3189, needTarget = true, 	range = 7}
greatFireballRune = 	{rune = 3191, needTarget = false, 	radius = 3.5}
heavyMagicMissileRune = {rune = 3198, needTarget = true, 	range = 7}
holyMissileRune = 		{rune = 3182, needTarget = true, 	range = 7}
icicleRune = 			{rune = 3158, needTarget = true, 	range = 7}
lightMagicMissileRune = {rune = 3174, needTarget = true, 	range = 7}
soulfireRune = 			{rune = 3195, needTarget = true, 	range = 7}
stalagmiteRune = 		{rune = 3179, needTarget = true, 	radius = 7}
stoneShowerRune = 		{rune = 3175, needTarget = false, 	radius = 3.5}
suddenDeathRune = 		{rune = 3155, needTarget = true, 	range = 7}
thunderstormRune = 		{rune = 3202, needTarget = false, 	radius = 3.5}
end


wait(2000)
displayInformationMessage("Advanced spell caster!\nMade by pixie_frigo.")
wait(2000)
attackSettings()
castSetting()



function attackChecker(at)
	if at.minMana or at.maxMana then
		local mana = (Self.Mana()/Self.MaxMana())*100
		if at.minMana and (mana < at.minMana) then
			return false
		end
		if at.maxMana and (mana > at.maxMana) then
			return false
		end
	end
	if at.lastOne then
		local count = #Self.GetTargets(7)
		if at.lastOneIgnore then
			count = count - countCreaturesWithNames(at.lastOneIgnore)
		end
		if count > 1 then
			return false
		end
	end
	local targetID = Self.TargetID()
	local target = Creature.New(targetID)
	if (at.attack.needTarget or at.needTarget) then
		if (targetID == 0) then
			return false
		end
		if not monsterChecker(at,target) then
			return false
		end
		local distance = target:DistanceFromSelf()
		
		if conditionSet(at.attack.range,7) < distance then
			return false
		end
		if at.minRange and (at.minRange > distance) then
			return false
		end
		if at.maxRange and (at.maxRange < distance) then
			return false
		end
		
	end
	if at.maxAmount or at.minAmount then
		local amount = #getMonsters(at)
		if at.maxAmount and (at.maxAmount < amount) then
			return false
		elseif  at.minAmount and (at.minAmount > amount) then
			return false
		end
	end
	return true
end
function compareStrings(a,b)
	if type(b) == "table" then
		for k,v in ipairs(b) do
			if compareStrings(a,v) then
				return true
			end
		end
	else
		return (string.lower((a:gsub("^%s*(.-)%s*$", "%1"))) == string.lower((b:gsub("^%s*(.-)%s*$", "%1"))))
	end
end
function conditionSet(c,a)
	if c == nil then
		return a
	else
		return c
	end
end



function monsterChecker(at,c)
	if not (c:isValid() and c:isMonster() and c:isAlive() and c:isOnScreen(false)) then
		return false
	end
	if not at then
		return true
	end

	if at.maxHealth or at.minHealth then
		local health = c:HealthPercent()
		local maxi = conditionSet(at.maxHealth, 100)
		local mini = conditionSet(at.minHealth, 0)
		if (health > maxi) or (health < mini) then
			return false
		end
	end
	
	if at.names then
		local name = c:Name()
		if not compareStrings(name, at.names) then
			return false
		end
	end
	return true
end
function itemCoolDown()
	return math.max(1000 - (os.clock() - lastItem)*1000,0)
end
function waitForIt(howLong, maxTime,randomTime)
	if howLong <= 0 then
		return true
	end
	if howLong > maxTime then
		return false
	else
		local r = conditionSet(randomTime,50)
		wait(howLong+r, howLong+2*r)
		return true
	end
end

function fire()
	local specs = Self.GetTargets(7)
	for k,v in ipairs(specs) do
		if compareStrings(v:Name(),"Fire Elemental") then
			return true
		end
	end
end

function openCorpses()
	return Item.isCorpse(Container.GetLast():ID()) 
end

function flipList(list)
	local newList = {}
	local maxi = #list
	for i = 0, (maxi - 1) do
		table.insert(newList, list[maxi - i])
	end
	return newList
end

function manaUp(onlyNoTarget)
	if not manaActive then
		return true
	end
	if onlyNoTarget and ((Self.TargetID() ~= 0)) then
		return false
	end
	if not waitForIt(itemCoolDown(), 200, 20) then
		return false
	end
	local pots = manaPotions
	local mp = (Self.Mana()/Self.MaxMana())*100
	if mp < minManaPercent then
		pots = flipList(pots)
	end
	
	if mp < maxManaPercent then
		for k,pot in ipairs(pots) do
			local startCount = Self.ItemCount(pot)
			if (startCount > 0) then
				for try = 1, 3 do
					local used = Self.UseItemWithMe(pot)
					local w = math.random(200, 300)
					delayWalker(w+100)
					used = used and (used ~= 0)
					
					wait(w)
					
					used = used or (Self.ItemCount(pot) < startCount)
					if used then
						lastItem = os.clock() - w/1000
						return true
					end
				end
			
			end
		end
	end
end

function getMonsters(at)
	local monsters = {}
	local targets = Self.GetTargets(7)
	for k,v in ipairs(targets) do
		if monsterChecker(at,v) then
			table.insert(monsters,v)
		end
	end
	return monsters
end

function distance(pos1, pos2)
	return math.floor(math.sqrt(math.pow((pos1.x-pos2.x),2) + math.pow((pos1.y-pos2.y),2)))
end

function amountAroundPoint(point,positions,radius)
	local count = 0
	for i = 1, #positions do
		if distance(point, positions[i]) <= radius then
			count = count + 1
		end
	end
	return count
end

function getLocs(at)
	local locs = {}
	local monsters = getMonsters(at)
	
	for k,v in ipairs(monsters) do
		local pos = v:Position()
		table.insert(locs, {x = pos.x  ,y = pos.y , z  = pos.z, id = v})
	end
	return locs
end

function turnGood(d)
	
	local turned = goodDirection(d)
	if turned then
		return true
	end
	for tries = 1, 3 do
		if goodDirection(d) or (Self.Turn(d) == 1) then
			return true
		end
		wait(200,350)
	end
	return goodDirection(d)
end
function goodDirection(d)
	return getLookDirection() == d
end

function listContainsSpecial(list, number)
	local i = 1
	for i = 1, #list do
		if (number == list[i]) then
			return true
		elseif list[i] > number then
			return false
		end
	end
	return false
end
function getLookDirection()
	local t =  {"north", "east", "south", "west", "southwest", "southeast", "northwest", "northeast"}
	return t[Self.LookDirection() + 1]	
end
function canStep(pos)
	local id = Map.GetTopUseItem(pos.x, pos.y, pos.z).id
	return (not listContainsSpecial(stairs, id)) and Map.IsTileWalkable(pos.x, pos.y, pos.z)
end

function goodStep(at)
	local target = Creature.New(Self.TargetID())
	if not monsterChecker(at,target) then
		return false
	end
	local p = target:Position()
	local sp = Self.Position()
	local a = p.x - sp.x
	local b = p.y - sp.y
	if a == 0 or b == 0 then
		return true
	end
	local maxArea = #at.attack.area
	local to = false
	local step = false
	local x = math.abs(a)
	local y = math.abs(b)
	function stepOneX()
		if canStep({x = sp.x + sign(a) , y = sp.y, z = sp.z}) then
			to = {x = sp.x + sign(a) , y = sp.y, z = sp.z}
			return true
		end
	end
	function stepOneY()
		if canStep({x = sp.x , y = sp.y + sign(b), z = sp.z}) then
			to = {x = sp.x , y = sp.y + sign(b), z = sp.z}
			return true
		end
	end
	if (x == y) then
		if math.random(1,10) < 5 then
			if not stepOneX() then
				stepOneY()
			end
		else
			if not stepOneY() then
				stepOneX()
			end
		end
	elseif (x < y) then
		if (y <= maxArea) then
			stepOneX()
		else
			stepOneY()
		end
	elseif (x < y) then
		if (y <= maxArea) then
			stepOneX()
		else
			stepOneY()
		end
	end
	
	return stepTo(to)
end

function stepTo(pos)
	if not pos then
		return false
	end
    local p = Self.Position()
    local dx = pos.x - p.x
    local dy = pos.y - p.y
    local d = ""
    if dy == -1 then
        d = "north"
    elseif dy == 1 then
        d = "south"
    end
    if dx == 1 then
        d = d .. "east"
    elseif dx == -1 then
        d = d .. "west"
    end
    if string.len(d) > 0 then
		for i = 1, 3 do 
			local sp = Self.Position()
			if (p.x == sp.x) and (sp.y == p.y) and (sp.z == p.z) then
				Self.Step(d)
				wait(250,450)
			end
			if sp.z ~= p.z then
				return false
			elseif (sp.x == pos.x) and (sp.y == pos.y) then 
				return true
			end
			
		end
    end
end
function getTarget()
	local id = Self.TargetID()
	if id == 0 then
		return false
	end
	return Creature.New(id)
end
function doAreaSpell(at)
	if not attackChecker(at) then
		return false
	end
	local cd = Self.GetSpellCooldown(at.attack.spell[1])
	if cd > 500 then
		return false
	end
	local locs = getLocs(at)
	local a = (at.minAmountHit == 1) and (#locs >= 1)
	local d =  getBestDirection(locs, at.attack.area , at.minAmountHit)
	function turnOn()
		Targeting.Start()
		Looter.Start()
	end
	if a or d then
		Targeting.Stop()
		Looter.Stop()
	else
		return false
	end
	if a and d then
		local target = getTarget()
		if not target then
			turnOn()
			return false
		end
		if target:DistanceFromSelf() == (#at.attack.area -1) then
			if not goodStep(at) then
				turnOn()
				return false
			end
		end
	end
	if a and not d then
		local target = getTarget()
		if not target then
			turnOn()
			return false
		end

		if not goodStep(at) then
			turnOn()
			return false
		end
	end
	locs = getLocs(at)
	d =  getBestDirection(locs, at.attack.area , at.minAmountHit)
	if d then
		for i = 1, 3 do
			if turnGood(d) then
				break
			end
			wait(200,300)
			if i == 3 then
				turnOn()
				return false
			end
		end
	else
		turnOn()
		return false
	end

	cd = Self.GetSpellCooldown(at.attack.spell[1])
	if cd > 0 then
		wait(cd + 50, cd + 150)
	end
	locs = getLocs(at)
	for i = 1, 3 do

		d = getBestDirection(locs, at.attack.area , at.minAmountHit)
		local casted = false
		if d and goodDirection(d) then
			casted = Self.Cast(at.attack.spell[1])	
			casted = casted and (casted ~= 0)
			if casted then
				turnOn()
				return true
			end
			wait(100,200)
		else
			turnOn()
			return false
		end
	end
	turnOn()
	return (Self.GetSpellCooldown(at.attack.spell[1]) > 0)
end

function doRadiusSpell(at)
	local cd = Self.GetSpellCooldown(at.attack.spell[1])
	if cd > 0 then
		return false
	end
	if at.minAmountHit <= amountAroundPoint(Self.Position(),getLocs(at),at.attack.radius) then
		local casted = Self.Cast(at.attack.spell[1])		
		casted = casted and (casted ~= 0)
		return (Self.GetSpellCooldown(at.attack.spell[1]) > 0)
	end
end

function doTargetSpell(at)
	local cd = Self.GetSpellCooldown(at.attack.spell[1])
	if cd > 0 then
		return false
	end
	local casted = Self.Cast(at.attack.spell[1])
	casted = casted and (casted ~= 0)
	wait(100,400)
	return (Self.GetSpellCooldown(at.attack.spell[1]) > 0)
end

function doTargetRune(at)
	local cd = Self.GetSpellCooldown("exori frigo")
	if cd > 0 then
		return false
	end
	if not waitForIt(itemCoolDown(), 200, 20) then
		return false
	end

	local startCount = Self.ItemCount(at.rune)
	local used = Self.UseItemWithTarget(at.attack.rune)
	used = used and (used ~= 0)
	local w = math.random(200, 300)
	if not used then
		wait(w)
	else
		w = 0
	end
	used = used or (Self.ItemCount(at.rune) < startCount)
	if used then
		lastItem = os.clock() - w/1000
	end

end

function doAreaRune(at)
	local cd = Self.GetSpellCooldown("exori frigo")
	if cd > 100 then
		return false
	end
	if not waitForIt(itemCoolDown(), 200, 20) then
		return false
	end
	local locations = getLocs(at)
	local spot = {}

	if (Self.ItemCount(at.attack.rune) > 0) and (at.minAmountHit <= #locations) then
		spot = getBestSpot(locations,at.minAmountHit, at.attack.radius)
	
		
			
			if spot and spot.x ~= nil then
				for tries = 1, 3 do
					local tries = 0
					local startCount = Self.ItemCount(at.attack.rune)
					local used = Self.UseItemWithGround(at.attack.rune,spot.x,spot.y,spot.z)
					used = used and (used ~= 0)
					local w = math.random(200, 300)
					wait(w)
					
					used = used or (Self.ItemCount(at.attack.rune) < startCount)
					if used then
						lastItem = os.clock() - w/1000
						
						return true
					end
				end
				
			
		
		end
	end
	return false
end	


function combo(lst, n)
  local a, number, select, newlist
  newlist = {}
  number = #lst
  select = n
  a = {}
  for i=1,select do
    a[#a+1] = i
  end
  newthing = {}
  while(1) do
    local newrow = {}
    for i = 1,select do
      newrow[#newrow + 1] = lst[a[i]]
    end
    newlist[#newlist + 1] = newrow
    i=select
    while(a[i] == (number - select + i)) do
      i = i - 1
    end
    if(i < 1) then break end
    a[i] = a[i] + 1
    for j=i, select do
      a[j] = a[i] + j - i
    end
  end
  return newlist
end

function getLocList(locations)
	local locs = locations
	local size = #locs
	local list = {}
	for i = 1, size do
		list[i] = {}
	end
	for i = 0, (size-1) do
		list[size-i] = combo(locs,size-i)
	end
	
	return list
end

function findCenter(pos)
	local xt, yt = 0, 0
	for i = 1, #pos do
		xt = xt + pos[i].x
		yt = yt + pos[i].y
	end
	return {x = math.floor(xt/#pos), y = math.floor(yt/#pos)}
end

function comparePos(a,b)
	if b[1] and b[1].x then
		for k,v in ipairs(b) do
			if comparePos(a,v) then
				return true
			end
		end
	else
		return (a.x == b.x) and (a.y == b.y) and (a.z == b.z)
	end
end
function sign(x)
  return x>0 and 1 or x<0 and -1 or 0
end
function getBestDirection(locs, area, minAmount)
	local maxHit = 0
	local maxPoints = 0
	local bestDirection = nil
	local directions = {"north", "south", "east", "west"}
	local maxHitableLeft = #locs
	for i = 1, #directions do
		local amount = getAmountInDirection(locs, area, directions[i])
	
		if (amount >= minAmount) and (amount > maxHit) then
			maxHit = amount
			bestDirection = directions[i]
		end
		maxHitableLeft = maxHitableLeft - amount
	end
	return bestDirection
end
function getAmountInDirection(locs,area,direction)
	local n = #area
	local m = #area[1]
	local mini = ((m - 1)/2)
	local amount = 0
	local sp = Self.Position()
	local cz = sp.z
	if direction == "south" then
		for i = 1, n do
			for j = 1, m do
				if (area[i][j] == 1) then
					local cx = sp.x + j - mini - 1
					local cy = sp.y + i
					if comparePos({x = cx, y = cy, z = cz},locs) then
						amount = amount + 1
					end
				end
			end
		end
	
	elseif direction == "north" then
		for i = 1, n do
			for j = 1, m do
				if (area[i][j] == 1) then
					local cx = sp.x + j - mini - 1
					local cy = sp.y  -i
					if comparePos({x = cx, y = cy, z = cz},locs)  then
						amount = amount + 1
					end
				end
			end
		end
		

	elseif direction == "east" then	
		for i = 1, n do
			for j = 1, m do
				if (area[i][j] == 1) then
					local cy = sp.y + j - mini - 1
					local cx = sp.x + i
					if comparePos({x = cx, y = cy, z = cz},locs)  then
						amount = amount + 1
					end
				end
			end
		end
		
	elseif direction == "west" then	
		for i = 1, n do
			for j = 1, m do
				if (area[i][j] == 1) then
					local cy = sp.y + j - mini - 1
					local cx = sp.x -i
					if comparePos({x = cx, y = cy, z = cz},locs)   then
						amount = amount + 1
					end
				end
			end
		end
	end
	
	return amount
	
end


function printTable(t,name)
	print(name .. "\n")
	if type(t) ~= "table" then
		print(tostring(t))
	end
	for k,v in pairs(t) do
		if type(v) == "table" then
			print(tostring(k) .. "= ")
			printTable(v, tostring(k))
		else
			print(tostring(k) .. "= " .. tostring(v))
		end
	end
	print("\n")
end
function getBestSpot(locations, amount, radius) 
	local posChecked = {}
	local maxHits = 0
	local cz = Self.Position().z
	local amountTargets = #locations
	local locList = getLocList(getLocs(false))
	--table.insert(locList,1,locations)
	local i = #locList
	local bestSpot = false
	local repeatCycle = true
	
	while repeatCycle and (i >= amount) do
		for j, p in ipairs(locList[i]) do
			local spot = findCenter(p)
			spot = {x = spot.x, y = spot.y, z = cz}
			if not comparePos(spot,posChecked) then
				local hits = amountAroundPoint(spot,locations,radius)
				if (hits >= amount) and (hits > maxHits) then
					bestSpot = spot
					maxHits = hits
				end
				if (maxHits >= i) then
					return bestSpot
				end
				table.insert(posChecked,spot)
			end
		end
		i = i - 1
	end
	
	return bestSpot
end

function attack(at)
	if not attackChecker(at) then
		return false,false
	end
	if at.attack.spell then
		if at.attack.area then
			return doAreaSpell(at),true
		elseif at.attack.radius then
			return doRadiusSpell(at),true
		else
			return doTargetSpell(at),true
		end
	else
		if at.attack.radius then
			return doAreaRune(at),false
		else
			return doTargetRune(at),false
		end
	end
	return false,false
end



Module.New('auto_attack', function()
	local used = false
	local spell = false
	local cd = Self.GetSpellCooldown("exori frigo")
	if cd < 500 then
		local attacked = false
		for k,v in ipairs(attacks) do
			attacked,spell = attack(v)
			if attacked then
				if spell then
					wait(200,500)
					manaUp()
				end
				break
			end
		end
	else
		wait(math.min(500,cd/2))
	end
	if not spell then
		manaUp(true)
	end
end)