DROP TABLE IF EXISTS levels;
CREATE TABLE levels (level INT NOT NULL PRIMARY KEY, teamMin INT(3) NOT NULL, teamMax INT(3) NOT NULL, pvpMin INT(3) NOT NULL, pvpMax INT(3) NOT NULL, xpsk INT(11) NOT NULL, tokens INT(3) NOT NULL, missions TEXT NULL);
INSERT INTO levels VALUES(1, 1, 5, 1, 5, 1450, 1, '1');
INSERT INTO levels VALUES(2, 1, 5, 1, 5, 2600, 1, '1,2,3');
INSERT INTO levels VALUES(3, 1, 6, 1, 5, 3100, 1, '2,3,4,5');
INSERT INTO levels VALUES(4, 1, 8, 1, 6, 4000, 1, '2,3,4,5,6,7');
INSERT INTO levels VALUES(5, 1, 10, 1, 9, 4500, 1, '3,4,5,6,7,8');
INSERT INTO levels VALUES(6, 3, 11, 4, 10, 5000, 1, '4,5,6,7,9,10');
INSERT INTO levels VALUES(7, 4, 13, 5, 10, 5500, 1, '4,5,6,7,8,9,10,12');
INSERT INTO levels VALUES(8, 4, 13, 5, 11, 6000, 1, '5,6,7,8,9,10,12,14');
INSERT INTO levels VALUES(9, 5, 15, 5, 14, 6500, 1, '6,7,8,9,10,11,13,16');
INSERT INTO levels VALUES(10, 5, 15, 6, 15, 7000, 1, '7,8,9,10,11,12,13,15,18');
INSERT INTO levels VALUES(11, 6, 15, 8, 15, 7700, 1, '7,8,9,11,12,13,14,16,19');
INSERT INTO levels VALUES(12, 7, 15, 9, 16, 8300, 1, '8,9,10,12,13,14,15,18,21');
INSERT INTO levels VALUES(13, 7, 19, 9, 18, 8900, 1, '9,10,11,13,14,15,16,19,22');
INSERT INTO levels VALUES(14, 9, 19, 9, 19, 9600, 1, '9,10,11,12,14,15,16,18,21,25');
INSERT INTO levels VALUES(15, 9, 21, 10, 20, 10400, 2, '10,11,12,13,15,16,18,19,22,26');
INSERT INTO levels VALUES(16, 12, 24, 12, 21, 11000, 2, '11,12,13,14,16,17,19,20,24,28');
INSERT INTO levels VALUES(17, 13, 24, 13, 23, 11900, 2, '11,12,13,14,15,17,18,20,22,25,30');
INSERT INTO levels VALUES(18, 13, 24, 13, 24, 12700, 2, '12,13,14,15,16,18,19,21,23,27,32');
INSERT INTO levels VALUES(19, 13, 26, 14, 25, 13700, 2, '13,14,15,16,17,19,20,22,24,28,34');
INSERT INTO levels VALUES(20, 15, 27, 15, 26, 15400, 2, '14,15,16,17,18,20,22,24,26,30,36');
INSERT INTO levels VALUES(21, 15, 29, 16, 28, 16400, 2, '14,15,16,17,18,21,23,25,27,31,37');
INSERT INTO levels VALUES(22, 16, 30, 17, 29, 17600, 2, '15,16,17,18,19,22,24,26,28,33,38');
INSERT INTO levels VALUES(23, 16, 31, 17, 30, 18800, 2, '16,17,18,19,20,23,25,27,29,34,41');
INSERT INTO levels VALUES(24, 16, 33, 18, 31, 20100, 2, '16,18,19,20,21,24,26,28,31,36,42');
INSERT INTO levels VALUES(25, 19, 34, 19, 33, 21500, 2, '17,18,20,21,22,25,27,30,32,37,44');
INSERT INTO levels VALUES(26, 19, 35, 20, 34, 22900, 2, '18,19,20,22,23,26,28,31,33,39,46');
INSERT INTO levels VALUES(27, 20, 37, 21, 35, 24500, 2, '18,20,21,22,24,27,29,32,35,40,48');
INSERT INTO levels VALUES(28, 21, 38, 21, 36, 26100, 2, '19,21,22,23,25,28,30,33,36,42,50');
INSERT INTO levels VALUES(29, 21, 40, 22, 38, 27800, 2, '20,21,23,24,26,29,31,34,37,43,51');
INSERT INTO levels VALUES(30, 22, 41, 23, 39, 30900, 2, '21,22,24,25,27,30,33,36,39,45,53');
INSERT INTO levels VALUES(31, 23, 42, 24, 40, 33000, 2, '21,23,24,26,27,31,34,37,40,46,55');
INSERT INTO levels VALUES(32, 24, 44, 25, 41, 35100, 2, '22,24,25,27,28,32,35,38,41,48,56');
INSERT INTO levels VALUES(33, 24, 45, 25, 43, 37400, 2, '23,24,26,28,29,33,36,39,42,49,58');
INSERT INTO levels VALUES(34, 25, 47, 26, 44, 39900, 2, '23,25,27,28,30,34,37,40,44,51,60');
INSERT INTO levels VALUES(35, 26, 48, 27, 45, 42400, 2, '24,26,28,29,31,35,38,42,45,52,62');
INSERT INTO levels VALUES(36, 27, 49, 28, 46, 45100, 2, '25,27,28,30,32,36,39,43,46,54,64');
INSERT INTO levels VALUES(37, 27, 51, 29, 48, 47900, 2, '25,27,29,31,33,37,40,44,48,55,66');
INSERT INTO levels VALUES(38, 28, 52, 29, 49, 50900, 2, '26,28,30,32,34,38,41,45,49,57,68');
INSERT INTO levels VALUES(39, 29, 53, 30, 50, 54000, 2, '27,29,31,33,35,39,42,46,50,58,69');
INSERT INTO levels VALUES(40, 29, 55, 31, 51, 57400, 2, '28,30,32,34,36,40,44,48,52,60,71');
INSERT INTO levels VALUES(41, 30, 56, 32, 53, 60900, 2, '28,30,32,34,36,41,45,49,53,61,73');
INSERT INTO levels VALUES(42, 31, 60, 33, 54, 64500, 2, '29,31,33,35,37,42,46,50,54,63,75');
INSERT INTO levels VALUES(43, 32, 60, 33, 55, 68400, 2, '30,32,34,36,38,43,47,51,55,64,77');
INSERT INTO levels VALUES(44, 32, 60, 34, 56, 76400, 2, '30,33,35,37,39,44,48,52,57,66,78');
INSERT INTO levels VALUES(45, 33, 62, 35, 58, 81000, 2, '31,33,36,38,40,45,49,54,58,67,80');
INSERT INTO levels VALUES(46, 34, 63, 36, 59, 85900, 2, '32,34,36,39,41,46,50,55,59,69,82');
INSERT INTO levels VALUES(47, 34, 65, 37, 60, 91000, 2, '32,35,37,39,42,47,51,56,61,70,84');
INSERT INTO levels VALUES(48, 35, 66, 37, 61, 96400, 2, '33,36,38,40,43,48,52,57,62,72,85');
INSERT INTO levels VALUES(49, 36, 67, 38, 63, 101900, 2, '34,36,39,41,44,49,53,58,63,73,87');
INSERT INTO levels VALUES(50, 37, 69, 39, 64, 108000, 3, '35,37,40,42,45,50,55,60,65,75,89');
INSERT INTO levels VALUES(51, 37, 70, 40, 65, 114300, 3, '35,38,40,43,45,51,56,61,66,76,91');
INSERT INTO levels VALUES(52, 38, 71, 41, 66, 120800, 3, '36,39,41,44,46,52,57,62,67,78,92');
INSERT INTO levels VALUES(53, 39, 73, 41, 68, 127700, 3, '37,39,42,45,47,53,58,63,68,79,95');
INSERT INTO levels VALUES(54, 40, 74, 42, 69, 135000, 3, '37,40,43,45,48,54,59,64,70,81,97');
INSERT INTO levels VALUES(55, 40, 76, 43, 70, 142600, 3, '38,41,44,46,49,55,60,66,71,82,98');
INSERT INTO levels VALUES(56, 41, 77, 44, 71, 150700, 3, '39,42,44,47,50,56,61,67,72,84,100');
INSERT INTO levels VALUES(57, 42, 78, 45, 73, 161900, 3, '39,42,45,48,51,57,62,68,74,85,102');
INSERT INTO levels VALUES(58, 42, 80, 45, 74, 167800, 3, '40,43,46,49,52,58,63,69,75,87,103');
INSERT INTO levels VALUES(59, 42, 81, 46, 75, 177100, 3, '41,44,47,50,53,59,64,70,76,88,105');
INSERT INTO levels VALUES(60, 42, 83, 47, 76, 203500, 3, '42,45,48,51,54,60,66,72,78,90,108');
INSERT INTO levels VALUES(61, 45, 84, 48, 78, 214700, 3, '42,45,48,51,54,61,67,73,79,91,109');
INSERT INTO levels VALUES(62, 45, 85, 49, 79, 226700, 3, '43,46,49,52,55,62,68,74,80,93,110');
INSERT INTO levels VALUES(63, 46, 87, 49, 80, 239100, 3, '44,47,50,53,56,63,69,75,81,94,112');
INSERT INTO levels VALUES(64, 47, 88, 50, 81, 251900, 3, '44,48,51,54,57,64,70,76,83,96,114');
INSERT INTO levels VALUES(65, 47, 89, 51, 83, 265700, 3, '45,48,52,55,58,65,71,78,84,97,116');
INSERT INTO levels VALUES(66, 48, 91, 52, 84, 280000, 3, '46,49,52,56,59,66,72,79,85,99,118');
INSERT INTO levels VALUES(67, 49, 92, 53, 85, 294800, 3, '46,50,53,56,60,67,73,80,87,100,120');
INSERT INTO levels VALUES(68, 50, 94, 53, 86, 310600, 3, '47,51,54,57,61,68,74,81,88,102,121');
INSERT INTO levels VALUES(69, 50, 95, 54, 88, 327000, 3, '48,51,55,58,62,69,75,82,89,103,123');
INSERT INTO levels VALUES(70, 51, 96, 55, 89, 344400, 3, '49,52,56,59,63,70,77,84,91,105,125');
INSERT INTO levels VALUES(71, 52, 98, 56, 90, 362300, 3, '49,53,56,60,63,71,78,85,92,106,127');
INSERT INTO levels VALUES(72, 53, 99, 57, 91, 381100, 3, '50,54,57,61,64,72,79,86,93,108,128');
INSERT INTO levels VALUES(73, 53, 101, 57, 93, 401000, 3, '51,54,58,62,65,73,80,87,94,109,130');
INSERT INTO levels VALUES(74, 54, 102, 58, 94, 421600, 3, '51,55,59,62,66,74,81,88,96,111,132');
INSERT INTO levels VALUES(75, 55, 103, 59, 95, 443300, 4, '52,56,60,63,67,75,82,90,97,112,134');
INSERT INTO levels VALUES(76, 55, 105, 60, 96, 508100, 4, '53,57,60,64,68,76,83,91,98,114,135');
INSERT INTO levels VALUES(77, 56, 106, 61, 98, 534200, 4, '53,57,60,64,69,77,84,91,100,115,137');
INSERT INTO levels VALUES(78, 57, 107, 61, 99, 561600, 4, '54,58,62,66,70,78,85,93,101,117,138');
INSERT INTO levels VALUES(79, 58, 109, 62, 100, 590200, 4, '55,59,63,67,71,79,86,94,102,118,139');
INSERT INTO levels VALUES(80, 58, 110, 63, 101, 620000, 4, '56,60,64,68,72,80,88,96,104,120,144');
INSERT INTO levels VALUES(81, 59, 112, 64, 103, 651000, 4, '56,60,64,68,72,81,89,97,105,121,145');
INSERT INTO levels VALUES(82, 60, 113, 65, 104, 683700, 4, '57,61,65,69,73,82,90,98,106,123,146');
INSERT INTO levels VALUES(83, 60, 114, 65, 105, 717900, 4, '58,62,66,70,74,83,91,99,107,124,148');
INSERT INTO levels VALUES(84, 61, 116, 66, 106, 753500, 4, '58,63,67,71,75,84,92,100,109,126,149');
INSERT INTO levels VALUES(85, 62, 117, 67, 108, 790800, 4, '59,63,68,72,76,85,93,102,110,127,151');
INSERT INTO levels VALUES(86, 63, 119, 68, 109, 829400, 4, '60,64,68,73,77,86,94,103,111,129,154');
INSERT INTO levels VALUES(87, 63, 120, 69, 110, 870000, 4, '60,65,69,73,78,87,95,104,113,130,155');
INSERT INTO levels VALUES(88, 64, 121, 69, 111, 912600, 4, '61,66,70,74,79,88,96,105,114,132,157');
INSERT INTO levels VALUES(89, 65, 123, 70, 113, 956800, 4, '62,66,71,75,80,89,97,106,115,133,159');
INSERT INTO levels VALUES(90, 66, 124, 71, 114, 1003000, 4, '63,67,72,76,81,90,99,108,117,135,161');
INSERT INTO levels VALUES(91, 66, 125, 72, 115, 1051300, 4, '63,68,72,77,81,91,100,109,118,136,163');
INSERT INTO levels VALUES(92, 67, 127, 73, 116, 1101500, 4, '64,69,73,78,82,92,101,110,119,138,164');
INSERT INTO levels VALUES(93, 68, 128, 73, 118, 1153900, 4, '65,69,74,79,83,93,102,111,120,139,166');
INSERT INTO levels VALUES(94, 68, 130, 74, 119, 1208800, 4, '65,70,75,79,84,94,103,112,122,141,168');
INSERT INTO levels VALUES(95, 69, 131, 75, 120, 1266000, 4, '66,71,76,80,85,95,104,114,123,142,170');
INSERT INTO levels VALUES(96, 70, 132, 76, 121, 1325500, 4, '67,72,76,81,86,96,105,115,124,144,171');
INSERT INTO levels VALUES(97, 71, 134, 77, 123, 1387700, 4, '67,72,77,82,87,97,106,116,126,145,173');
INSERT INTO levels VALUES(98, 71, 135, 77, 124, 1452300, 4, '68,73,78,83,88,98,107,117,127,147,175');
INSERT INTO levels VALUES(99, 72, 137, 78, 125, 1519900, 4, '69,74,79,84,89,99,108,118,128,148,177');
INSERT INTO levels VALUES(100, 73, 138, 79, 126, 1590300, 5, '70,75,80,85,90,100,110,120,130,150,179');
INSERT INTO levels VALUES(101, 73, 139, 80, 128, 1663500, 5, '70,75,80,85,90,101,111,121,131,151,184');
INSERT INTO levels VALUES(102, 74, 141, 81, 129, 1739900, 5, '71,76,81,86,91,102,112,122,132,153,186');
INSERT INTO levels VALUES(103, 75, 142, 81, 130, 1819600, 5, '72,77,82,87,92,103,113,123,133,154,185');
INSERT INTO levels VALUES(104, 76, 143, 82, 131, 1902200, 5, '72,78,83,88,93,104,114,124,135,156,187');
INSERT INTO levels VALUES(105, 76, 145, 83, 133, 1988900, 5, '73,78,84,89,94,105,115,126,136,157,188');
INSERT INTO levels VALUES(106, 77, 146, 84, 134, 2078600, 5, '74,79,84,90,95,106,116,127,137,159,189');
INSERT INTO levels VALUES(107, 78, 148, 85, 135, 2172100, 5, '74,80,85,90,96,107,117,128,139,160,191');
INSERT INTO levels VALUES(108, 79, 149, 85, 136, 2269800, 5, '75,81,86,91,97,108,118,129,140,162,193');
INSERT INTO levels VALUES(109, 79, 150, 86, 138, 2371100, 5, '76,81,87,92,98,109,119,130,141,163,195');
INSERT INTO levels VALUES(110, 80, 152, 87, 139, 2476600, 5, '77,82,88,93,99,110,121,132,143,165,197');
INSERT INTO levels VALUES(111, 81, 153, 88, 140, 2586600, 5, '77,83,88,94,99,111,122,133,144,166,198');
INSERT INTO levels VALUES(112, 81, 154, 89, 141, 2701000, 5, '78,84,89,95,100,112,122,134,145,168,200');
INSERT INTO levels VALUES(113, 82, 156, 89, 143, 2819800, 5, '79,84,90,96,101,113,124,135,146,169,202');
INSERT INTO levels VALUES(114, 83, 157, 90, 144, 2943600, 5, '79,85,91,96,102,114,125,136,148,171,204');
INSERT INTO levels VALUES(115, 84, 159, 91, 145, 3072400, 5, '80,86,92,97,103,115,126,138,149,172,206');
INSERT INTO levels VALUES(116, 84, 160, 92, 146, 3205800, 5, '81,87,92,98,104,116,127,139,150,174,208');
INSERT INTO levels VALUES(117, 85, 161, 93, 148, 3345200, 5, '81,87,93,99,105,117,128,140,152,175,210');
INSERT INTO levels VALUES(118, 86, 163, 93, 149, 3489700, 5, '82,88,94,100,106,118,129,141,153,177,211');
INSERT INTO levels VALUES(119, 86, 164, 94, 150, 3640200, 5, '83,89,95,101,107,119,130,142,154,178,214');
INSERT INTO levels VALUES(120, 87, 166, 95, 151, 3796500, 5, '84,90,96,102,108,120,132,144,156,180,215');
INSERT INTO levels VALUES(121, 88, 167, 96, 153, 3958900, 5, '84,90,96,102,108,121,133,145,157,181,217');
INSERT INTO levels VALUES(122, 89, 168, 97, 154, 4128000, 5, '85,91,97,103,109,122,134,146,158,183,218');
INSERT INTO levels VALUES(123, 89, 170, 97, 155, 4303400, 5, '86,92,98,104,110,123,135,147,159,184,220');
INSERT INTO levels VALUES(124, 90, 171, 98, 156, 4485700, 5, '86,93,99,105,111,124,136,148,161,186,222');
INSERT INTO levels VALUES(125, 91, 172, 99, 158, 4674800, 6, '87,93,100,106,112,125,137,150,162,187,224');
INSERT INTO levels VALUES(126, 92, 174, 100, 159, 4871700, 6, '88,94,100,107,113,126,138,151,163,189,225');
INSERT INTO levels VALUES(127, 92, 175, 101, 160, 5075700, 6, '88,95,101,107,114,127,139,152,165,190,225');
INSERT INTO levels VALUES(128, 93, 177, 101, 161, 5288100, 6, '89,96,102,108,115,128,140,153,166,192,226');
INSERT INTO levels VALUES(129, 94, 178, 102, 163, 5508200, 6, '90,96,103,109,116,129,141,154,167,193,227');
INSERT INTO levels VALUES(130, 94, 179, 103, 164, 5736800, 6, '91,97,104,110,117,130,143,156,169,195,232');
INSERT INTO levels VALUES(131, 95, 181, 104, 165, 5974600, 6, '91,98,104,111,117,131,144,157,170,196,235');
INSERT INTO levels VALUES(132, 96, 182, 105, 166, 6220700, 6, '92,99,105,112,118,132,145,158,171,198,236');
INSERT INTO levels VALUES(133, 97, 184, 105, 168, 6474500, 6, '93,99,106,113,119,133,146,159,172,199,237');
INSERT INTO levels VALUES(134, 97, 185, 106, 169, 6742200, 6, '93,100,107,113,120,134,147,160,174,201,238');
INSERT INTO levels VALUES(135, 98, 186, 107, 170, 7017500, 6, '94,101,108,114,121,135,148,162,175,202,239');
INSERT INTO levels VALUES(136, 99, 188, 108, 171, 7303700, 6, '95,102,108,115,122,136,149,163,176,204,243');
INSERT INTO levels VALUES(137, 99, 189, 109, 173, 7600100, 6, '95,102,109,116,123,137,150,164,178,205,245');
INSERT INTO levels VALUES(138, 100, 190, 109, 174, 7907600, 6, '96,103,110,117,124,138,151,165,179,207,246');
INSERT INTO levels VALUES(139, 101, 192, 110, 175, 8227000, 6, '97,104,111,118,125,139,152,166,180,208,248');
INSERT INTO levels VALUES(140, 102, 193, 111, 176, 8557700, 6, '98,105,112,119,126,140,154,168,182,210,250');
INSERT INTO levels VALUES(141, 102, 195, 112, 178, 8901000, 6, '98,105,112,119,126,141,155,169,183,211,250');
INSERT INTO levels VALUES(142, 103, 196, 113, 179, 9256800, 6, '99,106,113,120,127,142,156,170,184,212,250');
INSERT INTO levels VALUES(143, 104, 197, 113, 180, 9625800, 6, '100,107,114,121,128,143,157,171,185,214,250');
INSERT INTO levels VALUES(144, 105, 199, 114, 181, 10008600, 6, '100,108,115,122,129,144,158,172,187,216,250');
INSERT INTO levels VALUES(145, 105, 200, 115, 183, 10405300, 6, '101,108,116,123,130,145,159,174,188,217,250');
INSERT INTO levels VALUES(146, 106, 202, 116, 184, 10816600, 6, '102,109,116,124,131,146,160,175,189,219,250');
INSERT INTO levels VALUES(147, 107, 204, 117, 185, 11242500, 6, '102,110,117,124,132,147,161,176,191,220,250');
INSERT INTO levels VALUES(148, 107, 204, 117, 186, 11684300, 6, '103,111,118,125,133,148,162,177,192,222,250');
INSERT INTO levels VALUES(149, 108, 206, 118, 188, 12141900, 6, '104,111,119,126,134,149,163,178,193,223,250');
INSERT INTO levels VALUES(150, 109, 207, 119, 189, 12616200, 7, '105,112,120,127,135,150,165,180,195,225,250');
INSERT INTO levels VALUES(151, 110, 208, 120, 190, 13107200, 7, '105,113,120,128,135,151,166,181,196,226,250');
INSERT INTO levels VALUES(152, 110, 210, 121, 191, 13616100, 7, '106,114,121,129,136,152,167,182,197,228,250');
INSERT INTO levels VALUES(153, 111, 211, 121, 193, 14143600, 7, '107,114,122,130,137,153,168,183,198,229,250');
INSERT INTO levels VALUES(154, 112, 213, 122, 194, 14689700, 7, '107,115,123,130,138,154,169,184,200,231,250');
INSERT INTO levels VALUES(155, 113, 214, 123, 195, 15255300, 7, '108,116,124,131,139,155,170,186,201,232,250');
INSERT INTO levels VALUES(156, 113, 215, 124, 196, 15841000, 7, '109,117,124,132,140,156,171,187,202,234,250');
INSERT INTO levels VALUES(157, 114, 217, 125, 198, 16447900, 7, '109,117,125,133,141,157,172,188,204,235,250');
INSERT INTO levels VALUES(158, 115, 218, 125, 199, 17075800, 7, '110,119,126,134,142,158,173,189,205,237,250');
INSERT INTO levels VALUES(159, 115, 220, 126, 200, 17725900, 7, '111,119,127,135,143,159,174,190,206,238,250');
INSERT INTO levels VALUES(160, 116, 220, 127, 201, 18399400, 7, '112,120,128,136,144,160,176,192,208,240,250');
INSERT INTO levels VALUES(161, 117, 220, 128, 203, 19096100, 7, '112,120,128,136,144,161,177,193,209,241,250');
INSERT INTO levels VALUES(162, 118, 220, 129, 204, 19817500, 7, '113,121,129,137,145,162,178,194,210,243,250');
INSERT INTO levels VALUES(163, 118, 220, 129, 205, 20564100, 7, '113,122,130,138,146,163,179,195,211,244,250');
INSERT INTO levels VALUES(164, 119, 220, 130, 206, 21336600, 7, '114,123,131,139,147,164,180,196,213,246,250');
INSERT INTO levels VALUES(165, 120, 220, 131, 208, 22136100, 7, '115,123,132,140,148,165,181,198,214,247,250');
INSERT INTO levels VALUES(166, 120, 220, 132, 209, 22963600, 7, '116,124,132,141,149,166,182,199,215,249,250');
INSERT INTO levels VALUES(167, 121, 220, 133, 210, 23819700, 7, '116,125,133,141,150,167,183,200,217,250');
INSERT INTO levels VALUES(168, 122, 220, 133, 211, 24705200, 7, '117,124,134,142,151,168,184,201,218,250');
INSERT INTO levels VALUES(169, 123, 220, 134, 213, 25621100, 7, '118,126,135,143,152,169,185,202,219,250');
INSERT INTO levels VALUES(170, 123, 220, 135, 214, 26569000, 7, '119,127,136,144,153,170,187,204,220,250');
INSERT INTO levels VALUES(171, 124, 220, 136, 215, 27548800, 7, '119,128,136,145,153,171,188,205,222,250');
INSERT INTO levels VALUES(172, 125, 220, 137, 216, 28562900, 7, '120,129,137,146,154,172,189,205,223,250');
INSERT INTO levels VALUES(173, 126, 220, 137, 218, 29611100, 7, '121,129,138,147,155,173,190,207,224,250');
INSERT INTO levels VALUES(174, 126, 220, 138, 219, 30695300, 7, '121,130,139,147,156,174,191,208,226,250');
INSERT INTO levels VALUES(175, 127, 220, 139, 220, 31816300, 8, '122,131,140,148,157,175,192,210,227,250');
INSERT INTO levels VALUES(176, 128, 220, 140, 220, 32975100, 8, '123,132,140,149,158,176,193,211,228,250');
INSERT INTO levels VALUES(177, 128, 220, 141, 220, 34173500, 8, '123,132,141,150,159,177,194,212,230,250');
INSERT INTO levels VALUES(178, 129, 220, 141, 220, 35412500, 8, '124,133,142,151,160,178,195,213,231,250');
INSERT INTO levels VALUES(179, 130, 220, 142, 220, 36692500, 8, '125,134,143,152,161,179,196,214,232,250');
INSERT INTO levels VALUES(180, 131, 220, 143, 220, 38016500, 8, '126,135,144,153,162,180,198,216,233,250');
INSERT INTO levels VALUES(181, 131, 220, 144, 220, 39484400, 8, '126,135,144,153,162,181,199,217,235,250');
INSERT INTO levels VALUES(182, 132, 220, 145, 220, 40797700, 8, '127,136,145,154,163,182,200,218,236,250');
INSERT INTO levels VALUES(183, 133, 220, 145, 220, 42258500, 8, '128,137,146,155,164,183,201,219,237,250');
INSERT INTO levels VALUES(184, 133, 220, 146, 220, 43768300, 8, '128,138,147,156,165,184,202,220,239,250');
INSERT INTO levels VALUES(185, 134, 220, 147, 220, 45328100, 8, '129,138,148,157,166,185,203,222,240,250');
INSERT INTO levels VALUES(186, 135, 220, 148, 220, 46939900, 8, '130,139,148,158,167,186,204,223,241,250');
INSERT INTO levels VALUES(187, 136, 220, 149, 220, 48604900, 8, '130,140,149,158,168,187,205,224,243,250');
INSERT INTO levels VALUES(188, 136, 220, 149, 220, 50324600, 8, '131,141,150,159,169,188,206,225,244,250');
INSERT INTO levels VALUES(189, 137, 220, 150, 220, 52101200, 8, '132,141,151,160,170,189,207,226,245,250');
INSERT INTO levels VALUES(190, 138, 220, 151, 220, 53936300, 9, '133,142,152,161,171,190,209,228,246,250');
INSERT INTO levels VALUES(191, 139, 220, 152, 220, 55831600, 9, '133,143,152,162,171,191,210,229,248,250');
INSERT INTO levels VALUES(192, 139, 220, 153, 220, 57788700, 9, '134,144,153,163,172,192,211,230,249,250');
INSERT INTO levels VALUES(193, 140, 220, 153, 220, 59810000, 9, '135,144,154,164,173,193,212,231,250');
INSERT INTO levels VALUES(194, 141, 220, 154, 220, 61897000, 9, '135,145,155,164,174,194,213,232,250');
INSERT INTO levels VALUES(195, 141, 220, 155, 220, 64052200, 9, '136,146,156,165,175,195,214,234,250');
INSERT INTO levels VALUES(196, 142, 220, 156, 220, 66277200, 9, '137,147,156,166,176,196,215,235,250');
INSERT INTO levels VALUES(197, 143, 220, 157, 220, 68574400, 9, '137,147,157,167,177,197,216,236,250');
INSERT INTO levels VALUES(198, 144, 220, 157, 220, 70945700, 9, '138,148,158,168,178,198,217,237,250');
INSERT INTO levels VALUES(199, 144, 220, 158, 220, 73393900, 9, '139,149,159,169,179,199,218,238,250');
INSERT INTO levels VALUES(200, 145, 220, 159, 220, 80000, 9, '140,150,160,170,180,200,220,240,250');
INSERT INTO levels VALUES(201, 146, 220, 160, 220, 96000, 9, '140,150,160,170,180,201,221,241,250');
INSERT INTO levels VALUES(202, 146, 220, 161, 220, 115200, 9, '141,151,161,171,181,202,222,242,250');
INSERT INTO levels VALUES(203, 147, 220, 161, 220, 138240, 9, '142,152,162,172,182,203,223,243,250');
INSERT INTO levels VALUES(204, 147, 220, 162, 220, 165888, 9, '142,153,163,173,183,204,224,244,250');
INSERT INTO levels VALUES(205, 149, 220, 163, 220, 199066, 9, '143,153,164,174,184,205,225,246,250');
INSERT INTO levels VALUES(206, 149, 220, 164, 220, 238879, 9, '144,154,164,175,185,206,226,247,250');
INSERT INTO levels VALUES(207, 150, 220, 165, 220, 286654, 9, '144,155,165,175,186,207,227,248,250');
INSERT INTO levels VALUES(208, 151, 220, 165, 220, 343985, 9, '145,156,166,176,187,208,228,249,250');
INSERT INTO levels VALUES(209, 152, 220, 166, 220, 412782, 9, '146,156,167,177,188,209,228,250');
INSERT INTO levels VALUES(210, 152, 220, 167, 220, 495339, 9, '147,157,168,178,189,210,231,250');
INSERT INTO levels VALUES(211, 153, 220, 168, 220, 594407, 9, '147,158,168,179,189,211,232,250');
INSERT INTO levels VALUES(212, 154, 220, 169, 220, 713288, 9, '148,159,169,180,190,212,233,250');
INSERT INTO levels VALUES(213, 154, 220, 169, 220, 855946, 9, '149,159,170,181,191,213,234,250');
INSERT INTO levels VALUES(214, 155, 220, 170, 220, 1027135, 9, '149,160,171,181,192,214,235,250');
INSERT INTO levels VALUES(215, 156, 220, 171, 220, 1232562, 9, '150,161,172,182,193,215,236,250');
INSERT INTO levels VALUES(216, 157, 220, 172, 220, 1479074, 9, '151,162,172,183,194,216,237,250');
INSERT INTO levels VALUES(217, 157, 220, 173, 220, 1774889, 9, '151,162,173,184,195,217,238,250');
INSERT INTO levels VALUES(218, 158, 220, 173, 220, 2129867, 9, '152,163,174,185,196,218,239,250');
INSERT INTO levels VALUES(219, 159, 220, 174, 220, 2555840, 9, '153,164,175,186,197,219,240,250');
INSERT INTO levels VALUES(220, 159, 220, 175, 220, 0, 9, '154,165,176,187,198,220,242,250');
