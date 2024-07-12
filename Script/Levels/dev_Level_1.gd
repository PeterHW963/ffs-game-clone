var is_completed = true
var is_saved = true

var last_enemy_x = 9835

var enemy_data = {
	0: {"position": Vector2(900, 329), "type": "gh"},
	1: {"position": Vector2(1270, 160), "type": "fl"},
	2: {"position": Vector2(1600, 720), "type": "cg"},
	3: {"position": Vector2(1600, 200), "type": "gh"},
	4: {"position": Vector2(1930, 400), "type": "fl"},
	5: {"position": Vector2(2000, 720), "type": "cg"},
	6: {"position": Vector2(2000, 80), "type": "ca"},
	7: {"position": Vector2(2100, 200), "type": "gh"},
	8: {"position": Vector2(2050, 550), "type": "gh"},
	9: {"position": Vector2(2450, 400), "type": "gh"},
	10: {"position": Vector2(2900, 320), "type": "gh"},
	11: {"position": Vector2(3270, 160), "type": "fl"},
	12: {"position": Vector2(4290, 710), "type": "cg"},
	13: {"position": Vector2(3600, 200), "type": "gh"},
	14: {"position": Vector2(3850, 400), "type": "fl"},
	15: {"position": Vector2(4887, 710), "type": "cg"},
	16: {"position": Vector2(4200, 80), "type": "ca"},
	17: {"position": Vector2(4050, 300), "type": "gh"},
	18: {"position": Vector2(4280, 650), "type": "gh"},
	19: {"position": Vector2(4700, 500), "type": "gh"},
	20: {"position": Vector2(4730, 650), "type": "gh"},
	21: {"position": Vector2(4800, 160), "type": "fl"},
	22: {"position": Vector2(4800, 460), "type": "fl"},
	23: {"position": Vector2(4900, 220), "type": "fl"},
	24: {"position": Vector2(4900, 520), "type": "fl"},
	25: {"position": Vector2(5000, 280), "type": "fl"},
	26: {"position": Vector2(5000, 580), "type": "fl"},
	27: {"position": Vector2(5100, 340), "type": "fl"},
	28: {"position": Vector2(5100, 640), "type": "fl"},
	29: {"position": Vector2(5200, 280), "type": "fl"},
	30: {"position": Vector2(5200, 580), "type": "fl"},
	31: {"position": Vector2(5300, 220), "type": "fl"},
	32: {"position": Vector2(5300, 520), "type": "fl"},
	33: {"position": Vector2(5400, 160), "type": "fl"},
	34: {"position": Vector2(5400, 460), "type": "fl"},
	35: {"position": Vector2(6500, 0), "type": "ca"},
	36: {"position": Vector2(6600, 720), "type": "cg"},
	37: {"position": Vector2(6600, 560), "type": "gh"},
	38: {"position": Vector2(6900, 380), "type": "gh"},
	39: {"position": Vector2(7000, 240), "type": "gh"},
	40: {"position": Vector2(7200, 160), "type": "fl"},
	41: {"position": Vector2(7200, 460), "type": "fl"},
	42: {"position": Vector2(7300, 220), "type": "fl"},
	43: {"position": Vector2(7300, 520), "type": "fl"},
	44: {"position": Vector2(7400, 280), "type": "fl"},
	45: {"position": Vector2(7400, 580), "type": "fl"},
	46: {"position": Vector2(7500, 340), "type": "fl"},
	47: {"position": Vector2(7500, 640), "type": "fl"},
	48: {"position": Vector2(7600, 280), "type": "fl"},
	49: {"position": Vector2(7600, 580), "type": "fl"},
	50: {"position": Vector2(7700, 220), "type": "fl"},
	51: {"position": Vector2(7700, 520), "type": "fl"},
	52: {"position": Vector2(7800, 160), "type": "fl"},
	53: {"position": Vector2(7800, 460), "type": "fl"},
	54: {"position": Vector2(8400, 160), "type": "gh"},
	55: {"position": Vector2(8823, 393), "type": "fl"},
	56: {"position": Vector2(8920, 317), "type": "fl"},
	57: {"position": Vector2(9011, 272), "type": "fl"},
	58: {"position": Vector2(9114, 218), "type": "fl"},
	59: {"position": Vector2(8832, 665), "type": "fl"},
	60: {"position": Vector2(8923, 619), "type": "fl"},
	61: {"position": Vector2(9023, 556), "type": "fl"},
	62: {"position": Vector2(9114, 506), "type": "fl"},
	63: {"position": Vector2(9233, 260), "type": "fl"},
	64: {"position": Vector2(9219, 584), "type": "fl"},
	65: {"position": Vector2(8535, 160), "type": "gh"},
	66: {"position": Vector2(9432, 710), "type": "cg"},
	67: {"position": Vector2(9594, 344), "type": "fl"},
	68: {"position": Vector2(9597, 636), "type": "fl"},
	69: {"position": Vector2(9712, 342), "type": "fl"},
	70: {"position": Vector2(9710, 616), "type": "fl"},
	71: {"position": Vector2(9835, 350), "type": "fl"},
	72: {"position": Vector2(9828, 619), "type": "fl"},
	73: {"position": Vector2(9437, 329), "type": "fl"},
	74: {"position": Vector2(9444, 636), "type": "fl"},
	75: {"position": Vector2(9457, 120), "type": "ca"},
	76: {"position": Vector2(8728, 710), "type": "cg"},
	77: {"position": Vector2(9124, 710), "type": "cg"},
	78: {"position": Vector2(8819, 135), "type": "fl"},
}

