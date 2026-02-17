//using System;
//using Microsoft.Xna.Framework;
//
//namespace Terraria;

/* internal */ function WorldGen() constructor {
	/* private */ static /* bool */ mergeUp = undefined;

	/* private */ static /* bool */ mergeDown = undefined;

	/* private */ static /* bool */ mergeLeft = undefined;

	/* private */ static /* bool */ mergeRight = undefined;

	/* private */ static /* bool */ destroyObject = undefined;

	/* public */ static /* void */ GenerateWorld = function() {
		var num = 0;
		var num2 = 0;
		var num3 = 875.3499999999999 * (Main.Rand.Next(90, 110) * 0.01);
		var num4 = (num3 + 375.15) * (Main.Rand.Next(90, 110) * 0.01);
		var num5 = num3;
		var num6 = num3;
		var num7 = num4;
		var num8 = num4;
		for (var i = 0; i < 5001; i++) {
			if (num3 < num5) {
				num5 = num3;
			}
			if (num3 > num6) {
				num6 = num3;
			}
			if (num4 < num7) {
				num7 = num4;
			}
			if (num4 > num8) {
				num8 = num4;
			}
			if (num2 <= 0) {
				num = Main.Rand.Next(0, 5);
				num2 = Main.Rand.Next(5, 40);
				if (num == 0) {
					num2 *= Main.Rand.Next(15, 30) * 0.1;
				}
			}

			num2--;
			if (num == 0) {
				while (Main.Rand.Next(0, 7) == 0) {
					num3 += Main.Rand.Next(-1, 2);
				}
			} else if (num == 1) {
				while (Main.Rand.Next(0, 4) == 0) {
					num3 -= 1.0;
				}
				while (Main.Rand.Next(0, 10) == 0) {
					num3 += 1.0;
				}
			} else if (num == 2) {
				while (Main.Rand.Next(0, 4) == 0) {
					num3 += 1.0;
				}
				while (Main.Rand.Next(0, 10) == 0) {
					num3 -= 1.0;
				}
			} else if (num == 3) {
				while (Main.Rand.Next(0, 2) == 0) {
					num3 -= 1.0;
				}
				while (Main.Rand.Next(0, 6) == 0) {
					num3 += 1.0;
				}
			} else if (num == 4) {
				while (Main.Rand.Next(0, 2) == 0) {
					num3 += 1.0;
				}
				while (Main.Rand.Next(0, 5) == 0) {
					num3 -= 1.0;
				}
			}

			if (num3 < 125.05000000000001) {
				num3 = 125.05000000000001;
				num2 = 0;
			} else if (num3 > 2375.95) {
				num3 = 2375.95;
				num2 = 0;
			}

			while (Main.Rand.Next(0, 3) == 0) {
				num4 += Main.Rand.Next(-2, 3);
			}
			if (num4 < num3 + 125.05000000000001) {
				num4 += 1.0;
			}
			if (num4 > num3 + 625.25) {
				num4 -= 1.0;
			}
			for (var j = 0; j < num3; j++) {
				Main.Tile[i, j].active = false;
				Main.Tile[i, j].lighted = true;
			}

			for (var j = num3; j < 2501; j++) {
				if (j < num4) {
					Main.Tile[i, j].active = true;
					Main.Tile[i, j].type = 0;
					Main.Tile[i, j].frameX = -1;
					Main.Tile[i, j].frameY = -1;
				} else {
					Main.Tile[i, j].active = true;
					Main.Tile[i, j].type = 1;
					Main.Tile[i, j].frameX = -1;
					Main.Tile[i, j].frameY = -1;
				}
			}
		}

		Main.worldSurface = num6;
		for (var k = 0; k < 25015; k++) {
			TileRunner(
				Main.Rand.Next(0, 5001),
				Main.Rand.Next(num5, num8 + 1),
				Main.Rand.Next(2, 7),
				Main.Rand.Next(2, 23),
				1
			);
		}
		for (var k = 0; k < 62537; k++) {
			TileRunner(
				Main.Rand.Next(0, 5001),
				Main.Rand.Next(num7, 2501),
				Main.Rand.Next(2, 6),
				Main.Rand.Next(2, 40),
				0
			);
		}
		for (var k = 0; k < 12507; k++) {
			TileRunner(
				Main.Rand.Next(0, 5001),
				Main.Rand.Next(num6, 2501),
				Main.Rand.Next(2, 5),
				Main.Rand.Next(2, 20),
				-1
			);
		}
		for (var k = 0; k < 12507; k++) {
			TileRunner(
				Main.Rand.Next(0, 5001),
				Main.Rand.Next(num6, 2501),
				Main.Rand.Next(8, 15),
				Main.Rand.Next(7, 30),
				-1
			);
		}
		for (var k = 0; k < 2501; k++) {
			if (num8 <= 2501.0) {
				TileRunner(
					Main.Rand.Next(0, 5001),
					Main.Rand.Next(num8, 2501),
					Main.Rand.Next(10, 20),
					Main.Rand.Next(50, 300),
					-1
				);
			}
		}
		var num9 = 0;
		for (var k = 0; k < 25; k++) {
			num9 = Main.Rand.Next(0, 5001);
			for (var l = 0; l < num6; l++) {
				if (Main.Tile[num9, l].active) {
					TileRunner(
						num9,
						l,
						Main.Rand.Next(3, 6),
						Main.Rand.Next(5, 50),
						-1,
						false,
						Main.Rand.Next(-10, 11) * 0.1,
						1
					);
					break;
				}
			}
		}

		for (var k = 0; k < 40; k++) {
			num9 = Main.Rand.Next(0, 5001);
			for (var l = 0; l < num6; l++) {
				if (Main.Tile[num9, l].active) {
					TileRunner(
						num9,
						l,
						Main.Rand.Next(10, 15),
						Main.Rand.Next(50, 130),
						-1,
						false,
						Main.Rand.Next(-10, 11) * 0.1,
						1
					);
					break;
				}
			}
		}

		for (var k = 0; k < 10; k++) {
			num9 = Main.Rand.Next(0, 5001);
			for (var l = 0; l < num6; l++) {
				if (Main.Tile[num9, l].active) {
					TileRunner(
						num9,
						l,
						Main.Rand.Next(12, 25),
						Main.Rand.Next(100, 400),
						-1,
						false,
						Main.Rand.Next(-10, 11) * 0.1,
						3
					);
					TileRunner(
						num9,
						l,
						Main.Rand.Next(8, 17),
						Main.Rand.Next(60, 200),
						-1,
						false,
						Main.Rand.Next(-10, 11) * 0.1,
						2
					);
					TileRunner(
						num9,
						l,
						Main.Rand.Next(5, 13),
						Main.Rand.Next(40, 170),
						-1,
						false,
						Main.Rand.Next(-10, 11) * 0.1,
						2
					);
					break;
				}
			}
		}

		for (var k = 0; k < 12507; k++) {
			var num10 = Main.Rand.Next(1, 5000);
			var num11 = Main.Rand.Next(num5, num6);
			if (num11 >= 2501) {
				num11 = 2499;
			}
			if (
				Main.Tile[num10 - 1, num11].active
				&& Main.Tile[num10 - 1, num11].type == 0
				&& Main.Tile[num10 + 1, num11].active
				&& Main.Tile[num10 + 1, num11].type == 0
				&& Main.Tile[num10, num11 - 1].active
				&& Main.Tile[num10, num11 - 1].type == 0
				&& Main.Tile[num10, num11 + 1].active
				&& Main.Tile[num10, num11 + 1].type == 0
			) {
				Main.Tile[num10, num11].active = true;
				Main.Tile[num10, num11].type = 2;
			}
		}

		for (var k = 0; k < 625; k++) {
			TileRunner(
				Main.Rand.Next(0, 5001),
				Main.Rand.Next(num5, num6),
				Main.Rand.Next(3, 4),
				Main.Rand.Next(2, 5),
				7
			);
		}
		for (var k = 0; k < 750; k++) {
			TileRunner(
				Main.Rand.Next(0, 5001),
				Main.Rand.Next(num6, num8),
				Main.Rand.Next(3, 6),
				Main.Rand.Next(3, 6),
				7
			);
		}
		for (var k = 0; k < 3752; k++) {
			TileRunner(
				Main.Rand.Next(0, 5001),
				Main.Rand.Next(num7, 2501),
				Main.Rand.Next(4, 9),
				Main.Rand.Next(4, 8),
				7
			);
		}
		for (var k = 0; k < 500; k++) {
			TileRunner(
				Main.Rand.Next(0, 5001),
				Main.Rand.Next(num5, num6),
				Main.Rand.Next(3, 4),
				Main.Rand.Next(2, 5),
				6
			);
		}
		for (var k = 0; k < 625; k++) {
			TileRunner(
				Main.Rand.Next(0, 5001),
				Main.Rand.Next(num6, num8),
				Main.Rand.Next(3, 6),
				Main.Rand.Next(3, 6),
				6
			);
		}
		for (var k = 0; k < 2501; k++) {
			TileRunner(
				Main.Rand.Next(0, 5001),
				Main.Rand.Next(num7, 2501),
				Main.Rand.Next(4, 9),
				Main.Rand.Next(4, 8),
				6
			);
		}
		for (var k = 0; k < 125; k++) {
			TileRunner(
				Main.Rand.Next(0, 5001),
				Main.Rand.Next(num5, num6),
				Main.Rand.Next(3, 4),
				Main.Rand.Next(2, 5),
				9
			);
		}
		for (var k = 0; k < 250; k++) {
			TileRunner(
				Main.Rand.Next(0, 5001),
				Main.Rand.Next(num6, num8),
				Main.Rand.Next(3, 6),
				Main.Rand.Next(3, 6),
				9
			);
		}
		for (var k = 0; k < 1250; k++) {
			TileRunner(
				Main.Rand.Next(0, 5001),
				Main.Rand.Next(num7, 2501),
				Main.Rand.Next(4, 9),
				Main.Rand.Next(4, 8),
				9
			);
		}
		for (var k = 0; k < 62; k++) {
			TileRunner(
				Main.Rand.Next(0, 5001),
				Main.Rand.Next(num5, num6),
				Main.Rand.Next(3, 4),
				Main.Rand.Next(2, 5),
				8
			);
		}
		for (var k = 0; k < 125; k++) {
			TileRunner(
				Main.Rand.Next(0, 5001),
				Main.Rand.Next(num6, num8),
				Main.Rand.Next(3, 6),
				Main.Rand.Next(3, 6),
				8
			);
		}
		for (var k = 0; k < 625; k++) {
			TileRunner(
				Main.Rand.Next(0, 5001),
				Main.Rand.Next(num7, 2501),
				Main.Rand.Next(4, 9),
				Main.Rand.Next(4, 8),
				8
			);
		}
		for (var k = 0; k < 5001; k++) {
			num9 = k;
			for (var l = 0; l < Main.worldSurface - 1.0; l++) {
				if (Main.Tile[num9, l].active) {
					if (Main.Tile[num9, l].type == 0) {
						SpreadGrass(num9, l);
					}
					break;
				}
			}
		}

		for (var j = 0; j < 2501; j++) {
			var i = 2500;
			if (Main.Tile[i, j].active) {
				Main.spawnTileX = i;
				Main.spawnTileY = j;
				Main.Player[0].Spawn();
				break;
			}
		}

		AddTrees();
		EveryTileFrame();
		AddPlants();
	};

	/* public override void */ AddTrees = function() {
		for (var i = 1; i < 5000; i++) {
			for (var j = 20; j < Main.worldSurface; j++) {
				if (
					!Main.Tile[i, j].active
					|| Main.Tile[i, j].type != 2
					|| !Main.Tile[i - 1, j].active
					|| Main.Tile[i - 1, j].type != 2
					|| !Main.Tile[i + 1, j].active
					|| Main.Tile[i + 1, j].type != 2
					|| !EmptyTileCheck(i - 2, i + 2, j - 14, j - 1)
				) {
					continue;
				}
				var flag = false;
				var flag2 = false;
				var num = Main.Rand.Next(5, 15);
				var num2;
				for (var k = j - num; k < j; k++) {
					Main.Tile[i, k].frameNumber = Main.Rand.Next(3);
					Main.Tile[i, k].active = true;
					Main.Tile[i, k].type = 5;
					num2 = Main.Rand.Next(3);
					var num3 = Main.Rand.Next(10);
					if (k == j - 1 || k == j - num) {
						num3 = 0;
					}
					while (
						((num3 == 5 || num3 == 7) && flag)
						|| ((num3 == 6 || num3 == 7) && flag2)
					) {
						num3 = Main.Rand.Next(10);
					}
					flag = false;
					flag2 = false;
					if (num3 == 5 || num3 == 7) {
						flag = true;
					}
					if (num3 == 6 || num3 == 7) {
						flag2 = true;
					}
					switch (num3) {
						case 1:
							if (num2 == 0) {
								Main.Tile[i, k].frameX = 0;
								Main.Tile[i, k].frameY = 66;
							}

							if (num2 == 1) {
								Main.Tile[i, k].frameX = 0;
								Main.Tile[i, k].frameY = 88;
							}

							if (num2 == 2) {
								Main.Tile[i, k].frameX = 0;
								Main.Tile[i, k].frameY = 110;
							}

							break;
						case 2:
							if (num2 == 0) {
								Main.Tile[i, k].frameX = 22;
								Main.Tile[i, k].frameY = 0;
							}

							if (num2 == 1) {
								Main.Tile[i, k].frameX = 22;
								Main.Tile[i, k].frameY = 22;
							}

							if (num2 == 2) {
								Main.Tile[i, k].frameX = 22;
								Main.Tile[i, k].frameY = 44;
							}

							break;
						case 3:
							if (num2 == 0) {
								Main.Tile[i, k].frameX = 44;
								Main.Tile[i, k].frameY = 66;
							}

							if (num2 == 1) {
								Main.Tile[i, k].frameX = 44;
								Main.Tile[i, k].frameY = 88;
							}

							if (num2 == 2) {
								Main.Tile[i, k].frameX = 44;
								Main.Tile[i, k].frameY = 110;
							}

							break;
						case 4:
							if (num2 == 0) {
								Main.Tile[i, k].frameX = 22;
								Main.Tile[i, k].frameY = 66;
							}

							if (num2 == 1) {
								Main.Tile[i, k].frameX = 22;
								Main.Tile[i, k].frameY = 88;
							}

							if (num2 == 2) {
								Main.Tile[i, k].frameX = 22;
								Main.Tile[i, k].frameY = 110;
							}

							break;
						case 5:
							if (num2 == 0) {
								Main.Tile[i, k].frameX = 88;
								Main.Tile[i, k].frameY = 0;
							}

							if (num2 == 1) {
								Main.Tile[i, k].frameX = 88;
								Main.Tile[i, k].frameY = 22;
							}

							if (num2 == 2) {
								Main.Tile[i, k].frameX = 88;
								Main.Tile[i, k].frameY = 44;
							}

							break;
						case 6:
							if (num2 == 0) {
								Main.Tile[i, k].frameX = 66;
								Main.Tile[i, k].frameY = 66;
							}

							if (num2 == 1) {
								Main.Tile[i, k].frameX = 66;
								Main.Tile[i, k].frameY = 88;
							}

							if (num2 == 2) {
								Main.Tile[i, k].frameX = 66;
								Main.Tile[i, k].frameY = 110;
							}

							break;
						case 7:
							if (num2 == 0) {
								Main.Tile[i, k].frameX = 110;
								Main.Tile[i, k].frameY = 66;
							}

							if (num2 == 1) {
								Main.Tile[i, k].frameX = 110;
								Main.Tile[i, k].frameY = 88;
							}

							if (num2 == 2) {
								Main.Tile[i, k].frameX = 110;
								Main.Tile[i, k].frameY = 110;
							}

							break;
						default:
							if (num2 == 0) {
								Main.Tile[i, k].frameX = 0;
								Main.Tile[i, k].frameY = 0;
							}

							if (num2 == 1) {
								Main.Tile[i, k].frameX = 0;
								Main.Tile[i, k].frameY = 22;
							}

							if (num2 == 2) {
								Main.Tile[i, k].frameX = 0;
								Main.Tile[i, k].frameY = 44;
							}

							break;
					}

					if (num3 == 5 || num3 == 7) {
						Main.Tile[i - 1, k].active = true;
						Main.Tile[i - 1, k].type = 5;
						num2 = Main.Rand.Next(3);
						if (Main.Rand.Next(3) < 2) {
							if (num2 == 0) {
								Main.Tile[i - 1, k].frameX = 44;
								Main.Tile[i - 1, k].frameY = 198;
							}

							if (num2 == 1) {
								Main.Tile[i - 1, k].frameX = 44;
								Main.Tile[i - 1, k].frameY = 220;
							}

							if (num2 == 2) {
								Main.Tile[i - 1, k].frameX = 44;
								Main.Tile[i - 1, k].frameY = 242;
							}
						} else {
							if (num2 == 0) {
								Main.Tile[i - 1, k].frameX = 66;
								Main.Tile[i - 1, k].frameY = 0;
							}

							if (num2 == 1) {
								Main.Tile[i - 1, k].frameX = 66;
								Main.Tile[i - 1, k].frameY = 22;
							}

							if (num2 == 2) {
								Main.Tile[i - 1, k].frameX = 66;
								Main.Tile[i - 1, k].frameY = 44;
							}
						}
					}

					if (num3 != 6 && num3 != 7) {
						continue;
					}
					Main.Tile[i + 1, k].active = true;
					Main.Tile[i + 1, k].type = 5;
					num2 = Main.Rand.Next(3);
					if (Main.Rand.Next(3) < 2) {
						if (num2 == 0) {
							Main.Tile[i + 1, k].frameX = 66;
							Main.Tile[i + 1, k].frameY = 198;
						}

						if (num2 == 1) {
							Main.Tile[i + 1, k].frameX = 66;
							Main.Tile[i + 1, k].frameY = 220;
						}

						if (num2 == 2) {
							Main.Tile[i + 1, k].frameX = 66;
							Main.Tile[i + 1, k].frameY = 242;
						}
					} else {
						if (num2 == 0) {
							Main.Tile[i + 1, k].frameX = 88;
							Main.Tile[i + 1, k].frameY = 66;
						}

						if (num2 == 1) {
							Main.Tile[i + 1, k].frameX = 88;
							Main.Tile[i + 1, k].frameY = 88;
						}

						if (num2 == 2) {
							Main.Tile[i + 1, k].frameX = 88;
							Main.Tile[i + 1, k].frameY = 110;
						}
					}
				}

				var num4 = Main.Rand.Next(3);
				if (num4 == 0 || num4 == 1) {
					Main.Tile[i + 1, j - 1].active = true;
					Main.Tile[i + 1, j - 1].type = 5;
					num2 = Main.Rand.Next(3);
					if (num2 == 0) {
						Main.Tile[i + 1, j - 1].frameX = 22;
						Main.Tile[i + 1, j - 1].frameY = 132;
					}

					if (num2 == 1) {
						Main.Tile[i + 1, j - 1].frameX = 22;
						Main.Tile[i + 1, j - 1].frameY = 154;
					}

					if (num2 == 2) {
						Main.Tile[i + 1, j - 1].frameX = 22;
						Main.Tile[i + 1, j - 1].frameY = 176;
					}
				}

				if (num4 == 0 || num4 == 2) {
					Main.Tile[i - 1, j - 1].active = true;
					Main.Tile[i - 1, j - 1].type = 5;
					num2 = Main.Rand.Next(3);
					if (num2 == 0) {
						Main.Tile[i - 1, j - 1].frameX = 44;
						Main.Tile[i - 1, j - 1].frameY = 132;
					}

					if (num2 == 1) {
						Main.Tile[i - 1, j - 1].frameX = 44;
						Main.Tile[i - 1, j - 1].frameY = 154;
					}

					if (num2 == 2) {
						Main.Tile[i - 1, j - 1].frameX = 44;
						Main.Tile[i - 1, j - 1].frameY = 176;
					}
				}

				num2 = Main.Rand.Next(3);
				switch (num4) {
					case 0:
						if (num2 == 0) {
							Main.Tile[i, j - 1].frameX = 88;
							Main.Tile[i, j - 1].frameY = 132;
						}

						if (num2 == 1) {
							Main.Tile[i, j - 1].frameX = 88;
							Main.Tile[i, j - 1].frameY = 154;
						}

						if (num2 == 2) {
							Main.Tile[i, j - 1].frameX = 88;
							Main.Tile[i, j - 1].frameY = 176;
						}

						break;
					case 1:
						if (num2 == 0) {
							Main.Tile[i, j - 1].frameX = 0;
							Main.Tile[i, j - 1].frameY = 132;
						}

						if (num2 == 1) {
							Main.Tile[i, j - 1].frameX = 0;
							Main.Tile[i, j - 1].frameY = 154;
						}

						if (num2 == 2) {
							Main.Tile[i, j - 1].frameX = 0;
							Main.Tile[i, j - 1].frameY = 176;
						}

						break;
					case 2:
						if (num2 == 0) {
							Main.Tile[i, j - 1].frameX = 66;
							Main.Tile[i, j - 1].frameY = 132;
						}

						if (num2 == 1) {
							Main.Tile[i, j - 1].frameX = 66;
							Main.Tile[i, j - 1].frameY = 154;
						}

						if (num2 == 2) {
							Main.Tile[i, j - 1].frameX = 66;
							Main.Tile[i, j - 1].frameY = 176;
						}

						break;
				}

				if (Main.Rand.Next(3) < 2) {
					num2 = Main.Rand.Next(3);
					if (num2 == 0) {
						Main.Tile[i, j - num].frameX = 22;
						Main.Tile[i, j - num].frameY = 198;
					}

					if (num2 == 1) {
						Main.Tile[i, j - num].frameX = 22;
						Main.Tile[i, j - num].frameY = 220;
					}

					if (num2 == 2) {
						Main.Tile[i, j - num].frameX = 22;
						Main.Tile[i, j - num].frameY = 242;
					}
				} else {
					num2 = Main.Rand.Next(3);
					if (num2 == 0) {
						Main.Tile[i, j - num].frameX = 0;
						Main.Tile[i, j - num].frameY = 198;
					}

					if (num2 == 1) {
						Main.Tile[i, j - num].frameX = 0;
						Main.Tile[i, j - num].frameY = 220;
					}

					if (num2 == 2) {
						Main.Tile[i, j - num].frameX = 0;
						Main.Tile[i, j - num].frameY = 242;
					}
				}
			}
		}
	};

	/* public override bool */ EmptyTileCheck = function(/* int /* */ startX, /* int */ endX, /* int */ startY, /* int */ endY) {
		if (startX < 0) {
			return false;
		}
		if (endX >= 5001) {
			return false;
		}
		if (startY < 0) {
			return false;
		}
		if (endY >= 2501) {
			return false;
		}
		for (var i = startX; i < endX + 1; i++) {
			for (var j = startY; j < endY + 1; j++) {
				if (Main.Tile[i, j].active) {
					return false;
				}
			}
		}

		return true;
	};

	/* public override bool */ PlaceDoor = function(/* int */ i, /* int */ j, /* int */ type) {
		try {
			if (
				Main.Tile[i, j - 2].active
				&& Main.TileSolid[Main.Tile[i, j - 2].type]
				&& Main.Tile[i, j + 2].active
				&& Main.TileSolid[Main.Tile[i, j + 2].type]
			) {
				Main.Tile[i, j - 1].active = true;
				Main.Tile[i, j - 1].type = 10;
				Main.Tile[i, j - 1].frameY = 0;
				Main.Tile[i, j - 1].frameX = Main.Rand.Next(3) * 18;
				Main.Tile[i, j].active = true;
				Main.Tile[i, j].type = 10;
				Main.Tile[i, j].frameY = 18;
				Main.Tile[i, j].frameX = Main.Rand.Next(3) * 18;
				Main.Tile[i, j + 1].active = true;
				Main.Tile[i, j + 1].type = 10;
				Main.Tile[i, j + 1].frameY = 36;
				Main.Tile[i, j + 1].frameX = Main.Rand.Next(3) * 18;
				return true;
			}

			return false;
		} catch (__GML_exception) {
			return false;
		}
	};

	/* public override void */ CloseDoor = function(/* int */ i, /* int */ j) {
		var num = 0;
		var num2 = i;
		var num3 = j;
		var frameX = Main.Tile[i, j].frameX;
		var frameY = Main.Tile[i, j].frameY;
		switch (frameX) {
			case 0:
				num2 = i;
				num = 1;
				break;
			case 18:
				num2 = i - 1;
				num = 1;
				break;
			case 36:
				num2 = i + 1;
				num = -1;
				break;
			case 54:
				num2 = i;
				num = -1;
				break;
		}

		switch (frameY) {
			case 0:
				num3 = j;
				break;
			case 18:
				num3 = j - 1;
				break;
			case 36:
				num3 = j - 2;
				break;
		}

		var num4 = num2;
		if (num == -1) {
			num4 = num2 - 1;
		}
		for (var k = num4; k < num4 + 2; k++) {
			for (var l = num3; l < num3 + 3; l++) {
				if (k == num2) {
					Main.Tile[k, l].type = 10;
					Main.Tile[k, l].frameX = Main.Rand.Next(3) * 18;
				} else {
					Main.Tile[k, l].active = false;
				}
			}
		}

		Main.soundInstanceDoorClosed.Stop();
		Main.soundInstanceDoorClosed = Main.soundDoorClosed.CreateInstance();
		Main.soundInstanceDoorClosed.Play();
	};

	/* public override void */ OpenDoor = function(/* int */ i, /* int */ j, /* int */ direction) {
		var num = 0;
		num = Main.Tile[i, j - 1].frameY == 0
		&& Main.Tile[i, j - 1].type == Main.Tile[i, j].type
			? j - 1
			: Main.Tile[i, j - 2].frameY == 0
			&& Main.Tile[i, j - 2].type == Main.Tile[i, j].type
				? j - 2
				: Main.Tile[i, j + 1].frameY != 0
				|| Main.Tile[i, j + 1].type != Main.Tile[i, j].type
					? j
					: j + 1;
		var num2 = i;
		var num3 = 0;
		var num4;
		if (direction == -1) {
			num2 = i - 1;
			num3 = 36;
			num4 = i - 1;
		} else {
			num2 = i;
			num4 = i + 1;
		}

		var flag = true;
		for (var k = num; k < num + 3; k++) {
			if (Main.Tile[num4, k].active) {
				if (Main.Tile[num4, k].type != 3) {
					flag = false;
					break;
				}

				KillTile(num4, k);
			}
		}

		if (flag) {
			Main.soundInstanceDoorOpen.Stop();
			Main.soundInstanceDoorOpen = Main.soundDoorOpen.CreateInstance();
			Main.soundInstanceDoorOpen.Play();
			Main.Tile[num2, num].active = true;
			Main.Tile[num2, num].type = 11;
			Main.Tile[num2, num].frameY = 0;
			Main.Tile[num2, num].frameX = num3;
			Main.Tile[num2 + 1, num].active = true;
			Main.Tile[num2 + 1, num].type = 11;
			Main.Tile[num2 + 1, num].frameY = 0;
			Main.Tile[num2 + 1, num].frameX = num3 + 18;
			Main.Tile[num2, num + 1].active = true;
			Main.Tile[num2, num + 1].type = 11;
			Main.Tile[num2, num + 1].frameY = 18;
			Main.Tile[num2, num + 1].frameX = num3;
			Main.Tile[num2 + 1, num + 1].active = true;
			Main.Tile[num2 + 1, num + 1].type = 11;
			Main.Tile[num2 + 1, num + 1].frameY = 18;
			Main.Tile[num2 + 1, num + 1].frameX = num3 + 18;
			Main.Tile[num2, num + 2].active = true;
			Main.Tile[num2, num + 2].type = 11;
			Main.Tile[num2, num + 2].frameY = 36;
			Main.Tile[num2, num + 2].frameX = num3;
			Main.Tile[num2 + 1, num + 2].active = true;
			Main.Tile[num2 + 1, num + 2].type = 11;
			Main.Tile[num2 + 1, num + 2].frameY = 36;
			Main.Tile[num2 + 1, num + 2].frameX = num3 + 18;
		}
	};

	/* public override void */ PlaceTile = function(/* int */ i, /* int */ j, /* int */ type, /* bool */ mute = false) {
		if (i < 0 || j < 0 || i >= 5001 || j >= 2501 || !Collision.EmptyTile(i, j)) {
			return;
		}
		Main.Tile[i, j].frameY = 0;
		Main.Tile[i, j].frameX = 0;
		switch (type) {
			case 3:
				if (
					j + 1 < 2501
					&& Main.Tile[i, j + 1].type == 2
					&& Main.Tile[i, j + 1].active
				) {
					if (Main.Rand.Next(50) == 0) {
						Main.Tile[i, j].active = true;
						Main.Tile[i, j].type = 3;
						Main.Tile[i, j].frameX = 144;
					} else if (Main.Rand.Next(35) == 0) {
						Main.Tile[i, j].active = true;
						Main.Tile[i, j].type = 3;
						Main.Tile[i, j].frameX = Main.Rand.Next(2) * 18 + 108;
					} else {
						Main.Tile[i, j].active = true;
						Main.Tile[i, j].type = 3;
						Main.Tile[i, j].frameX = Main.Rand.Next(6) * 18;
					}
				}

				break;
			case 4:
				if (
					(
						Main.Tile[i - 1, j].active
							&& (
								Main.TileSolid[Main.Tile[i - 1, j].type]
									|| (
										Main.Tile[i - 1, j].type == 5
											&& Main.Tile[i - 1, j - 1].type == 5
											&& Main.Tile[i - 1, j + 1].type == 5
									)
							)
					)
					|| (
						Main.Tile[i + 1, j].active
							&& (
								Main.TileSolid[Main.Tile[i + 1, j].type]
									|| (
										Main.Tile[i + 1, j].type == 5
											&& Main.Tile[i + 1, j - 1].type == 5
											&& Main.Tile[i + 1, j + 1].type == 5
									)
							)
					)
					|| (
						Main.Tile[i, j + 1].active
							&& Main.TileSolid[Main.Tile[i, j + 1].type]
					)
				) {
					Main.Tile[i, j].active = true;
					Main.Tile[i, j].type = type;
					SquareTileFrame(i, j);
				}

				break;
			case 10:
				if (
					!Main.Tile[i, j - 1].active
					&& !Main.Tile[i, j - 2].active
					&& Main.Tile[i, j - 3].active
					&& Main.TileSolid[Main.Tile[i, j - 3].type]
				) {
					PlaceDoor(i, j - 1, type);
					SquareTileFrame(i, j);
					break;
				}

				if (
					!Main.Tile[i, j + 1].active
					&& !Main.Tile[i, j + 2].active
					&& Main.Tile[i, j + 3].active
					&& Main.TileSolid[Main.Tile[i, j + 3].type]
				) {
					PlaceDoor(i, j + 1, type);
					SquareTileFrame(i, j);
					break;
				}

				return;
			default:
				Main.Tile[i, j].active = true;
				Main.Tile[i, j].type = type;
				SquareTileFrame(i, j);
				break;
		}

		if (Main.Tile[i, j].active && !mute) {
			var num = Main.Rand.Next(3);
			Main.SoundInstanceDig[num].Stop();
			Main.SoundInstanceDig[num] = Main.SoundDig[num].CreateInstance();
			Main.SoundInstanceDig[num].Play();
		}
	};

	/* public override void */ KillWall = function(/* int */ i, /* int */ j, /* bool */ fail = false) {
		if (i < 0 || j < 0 || i >= 5001 || j >= 2501 || Main.Tile[i, j].wall <= 0) {
			return;
		}
		var num = Main.Rand.Next(3);
		Main.SoundInstanceDig[num].Stop();
		Main.SoundInstanceDig[num] = Main.SoundDig[num].CreateInstance();
		Main.SoundInstanceDig[num].Play();
		var num2 = 10;
		if (fail) {
			num2 = 3;
		}
		for (var k = 0; k < num2; k++) {
			var type = 0;
			if (Main.Tile[i, j].wall == 1) {
				type = 1;
			}
			Dust.NewDust(new Vector2(i * 16, j * 16), 16, 16, type);
		}

		if (fail) {
			SquareWallFrame(i, j);
			return;
		}

		var num3 = 0;
		if (Main.Tile[i, j].wall == 1) {
			num3 = 26;
		}
		if (num3 > 0) {
			Item.NewItem(i * 16, j * 16, 16, 16, num3);
		}
		Main.Tile[i, j].wall = 0;
		SquareWallFrame(i, j);
	};

	/* public override void */ KillTile = function(/* int */ i, /* int */ j, /* bool */ fail = false) {
		if (
			i < 0
			|| j < 0
			|| i >= 5001
			|| j >= 2501
			|| !Main.Tile[i, j].active
			|| (
				j >= 1
					&& Main.Tile[i, j - 1].active
					&& Main.Tile[i, j - 1].type == 5
					&& Main.Tile[i, j].type != 5
					&& (
						Main.Tile[i, j - 1].frameX != 66
							|| Main.Tile[i, j - 1].frameY < 0
							|| Main.Tile[i, j - 1].frameY > 44
					)
					&& (
						Main.Tile[i, j - 1].frameX != 88
							|| Main.Tile[i, j - 1].frameY < 66
							|| Main.Tile[i, j - 1].frameY > 110
					)
					&& Main.Tile[i, j - 1].frameY < 198
			)
		) {
			return;
		}
		if (Main.Tile[i, j].type == 3) {
			Main.soundInstanceGrass.Stop();
			Main.soundInstanceGrass = Main.soundGrass.CreateInstance();
			Main.soundInstanceGrass.Play();
			if (Main.Tile[i, j].frameX == 144) {
				Item.NewItem(i * 16, j * 16, 16, 16, 5);
			}
		} else {
			var num = Main.Rand.Next(3);
			Main.SoundInstanceDig[num].Stop();
			Main.SoundInstanceDig[num] = Main.SoundDig[num].CreateInstance();
			Main.SoundInstanceDig[num].Play();
		}

		var num2 = 10;
		if (fail) {
			num2 = 3;
		}
		for (var k = 0; k < num2; k++) {
			var type = 0;
			if (Main.Tile[i, j].type == 0) {
				type = 0;
			}
			if (Main.Tile[i, j].type == 1) {
				type = 1;
			}
			if (Main.Tile[i, j].type == 4) {
				type = 6;
			}
			if (
				Main.Tile[i, j].type == 5
				|| Main.Tile[i, j].type == 10
				|| Main.Tile[i, j].type == 11
			) {
				type = 7;
			}
			if (Main.Tile[i, j].type == 2) {
				type = Main.Rand.Next(2) != 0 ? 2 : 0;
			}
			if (Main.Tile[i, j].type == 6) {
				type = 8;
			}
			if (Main.Tile[i, j].type == 7) {
				type = 9;
			}
			if (Main.Tile[i, j].type == 8) {
				type = 10;
			}
			if (Main.Tile[i, j].type == 9) {
				type = 11;
			}
			if (Main.Tile[i, j].type == 3) {
				type = 3;
			}
			Dust.NewDust(new Vector2(i * 16, j * 16), 16, 16, type);
		}

		if (fail) {
			if (Main.Tile[i, j].type == 2) {
				Main.Tile[i, j].type = 0;
			}
			SquareTileFrame(i, j);
			return;
		}

		var num3 = 0;
		if (Main.Tile[i, j].type == 0 || Main.Tile[i, j].type == 2) {
			num3 = 2;
		} else if (Main.Tile[i, j].type == 1) {
			num3 = 3;
		} else if (Main.Tile[i, j].type == 4) {
			num3 = 8;
		} else if (Main.Tile[i, j].type == 5) {
			num3 = 9;
		} else if (Main.Tile[i, j].type == 6) {
			num3 = 11;
		} else if (Main.Tile[i, j].type == 7) {
			num3 = 12;
		} else if (Main.Tile[i, j].type == 8) {
			num3 = 13;
		} else if (Main.Tile[i, j].type == 9) {
			num3 = 14;
		}
		if (num3 > 0) {
			Item.NewItem(i * 16, j * 16, 16, 16, num3);
		}
		Main.Tile[i, j].active = false;
		Main.Tile[i, j].lighted = false;
		Main.Tile[i, j].frameX = -1;
		Main.Tile[i, j].frameY = -1;
		Main.Tile[i, j].frameNumber = 0;
		Main.Tile[i, j].type = 0;
		SquareTileFrame(i, j);
	};

	/* public override void */ UpdateWorld = function() {
		var num = 0.0002;
		for (var i = 0; i < 12507501 * num; i++) {
			var num2 = Main.Rand.Next(5001);
			var num3 = Main.Rand.Next(Main.worldSurface - 1);
			var num4 = num2 - 1;
			var num5 = num2 + 2;
			var num6 = num3 - 1;
			var num7 = num3 + 2;
			if (num4 < 0) {
				num4 = 0;
			}
			if (num5 > 5001) {
				num5 = 5001;
			}
			if (num6 < 0) {
				num6 = 0;
			}
			if (num7 > 2501) {
				num7 = 2501;
			}
			if (!Main.Tile[num2, num3].active || Main.Tile[num2, num3].type != 2) {
				continue;
			}
			if (!Main.Tile[num2, num6].active && Main.Rand.Next(10) == 0) {
				PlaceTile(num2, num6, 3, true);
			}
			for (var j = num4; j < num5; j++) {
				for (var k = num6; k < num7; k++) {
					if (
						(num2 != j || num3 != k)
						&& Main.Tile[j, k].active
						&& Main.Tile[j, k].type == 0
					) {
						SpreadGrass(j, k, 0, 2, false);
						if (Main.Tile[j, k].type == 2) {
							SquareTileFrame(j, k);
						}
					}
				}
			}
		}
	};

	/* public override void */ PlaceWall = function(/* int */ i, /* int */ j, /* int */ type, /* bool */ mute = false) {
		if (Main.Tile[i, j].wall != type) {
			Main.Tile[i, j].wall = type;
			SquareWallFrame(i, j);
			if (!mute) {
				var num = Main.Rand.Next(3);
				Main.SoundInstanceDig[num].Stop();
				Main.SoundInstanceDig[num] = Main.SoundDig[num].CreateInstance();
				Main.SoundInstanceDig[num].Play();
			}
		}
	};

	/* public override void */ AddPlants = function() {
		for (var i = 0; i < 5001; i++) {
			for (var j = 1; j < 2501; j++) {
				if (
					Main.Tile[i, j].type == 2
					&& Main.Tile[i, j].active
					&& !Main.Tile[i, j - 1].active
				) {
					PlaceTile(i, j - 1, 3, true);
				}
			}
		}
	};

	/* public override void */ SpreadGrass = function(
		/* int */ i,
		/* int */ j,
		/* int */ dirt = 0,
		/* int */ grass = 2,
		/* bool */ repeating = true
	) {
		if (
			Main.Tile[i, j].type != dirt
			|| !Main.Tile[i, j].active
			|| j >= Main.worldSurface
		) {
			return;
		}
		var num = i - 1;
		var num2 = i + 2;
		var num3 = j - 1;
		var num4 = j + 2;
		if (num < 0) {
			num = 0;
		}
		if (num2 > 5001) {
			num2 = 5001;
		}
		if (num3 < 0) {
			num3 = 0;
		}
		if (num4 > 2501) {
			num4 = 2501;
		}
		var flag = true;
		for (var k = num; k < num2; k++) {
			for (var l = num3; l < num4; l++) {
				if (!Main.Tile[k, l].active) {
					flag = false;
					break;
				}
			}
		}

		if (flag) {
			return;
		}
		Main.Tile[i, j].type = grass;
		for (var k = num; k < num2; k++) {
			for (var l = num3; l < num4; l++) {
				if (Main.Tile[k, l].active && Main.Tile[k, l].type == dirt && repeating) {
					SpreadGrass(k, l, dirt, grass);
				}
			}
		}
	};

	/* public override void */ TileRunner = function(
		/* int */ i,
		/* int */ j,
		/* double */ strength,
		/* int */ steps,
		/* int */ type,
		/* bool */ addTile = false,
		/* float */ speedX = 0,
		/* float */ speedY = 0
	) {
		var num = strength;
		var num2 = steps;
		var vector = new Vector2(); /* default(Vector2) */
		vector.X = i;
		vector.Y = j;
		var vector2 = new Vector2(); /* default(Vector2) */
		vector2.X = Main.Rand.Next(-10, 11) * 0.1;
		vector2.Y = Main.Rand.Next(-10, 11) * 0.1;
		if (speedX != 0 || speedY != 0) {
			vector2.X = speedX;
			vector2.Y = speedY;
		}

		while (num > 0.0 && num2 > 0) {
			num = strength * (num2 / steps);
			num2 -= 1;
			var num3 = vector.X - num * 0.5;
			var num4 = vector.X + num * 0.5;
			var num5 = vector.Y - num * 0.5;
			var num6 = vector.Y + num * 0.5;
			if (num3 < 0) {
				num3 = 0;
			}
			if (num4 > 5001) {
				num4 = 5001;
			}
			if (num5 < 0) {
				num5 = 0;
			}
			if (num6 > 2501) {
				num6 = 2501;
			}
			for (var k = num3; k < num4; k++) {
				for (var l = num5; l < num6; l++) {
					if (
						!(
							Math.Abs(k - vector.X) + Math.Abs(l - vector.Y)
								< strength * 0.5 * (1.0 + Main.Rand.Next(-10, 11) * 0.015)
						)
					) {
						continue;
					}
					if (type == -1) {
						Main.Tile[k, l].active = false;
						continue;
					}

					if (addTile) {
						Main.Tile[k, l].active = true;
					}
					Main.Tile[k, l].type = type;
				}
			}

			vector += vector2;
			vector2.X += Main.Rand.Next(-10, 11) * 0.05;
			vector2.Y += Main.Rand.Next(-10, 11) * 0.05;
			if (vector2.X > 1) {
				vector2.X = 1;
			}
			if (vector2.X < -1) {
				vector2.X = -1;
			}
			if (vector2.Y > 1) {
				vector2.Y = 1;
			}
			if (vector2.Y < -1) {
				vector2.Y = -1;
			}
		}
	};

	/* public override void */ SquareTileFrame = function(/* int */ i, /* int */ j, /* bool */ resetFrame = true) {
		TileFrame(i - 1, j - 1);
		TileFrame(i - 1, j);
		TileFrame(i - 1, j + 1);
		TileFrame(i, j - 1);
		TileFrame(i, j, resetFrame);
		TileFrame(i, j + 1);
		TileFrame(i + 1, j - 1);
		TileFrame(i + 1, j);
		TileFrame(i + 1, j + 1);
	};

	/* public override void */ SquareWallFrame = function(/* int */ i, /* int */ j, /* bool */ resetFrame = true) {
		WallFrame(i - 1, j - 1);
		WallFrame(i - 1, j);
		WallFrame(i - 1, j + 1);
		WallFrame(i, j - 1);
		WallFrame(i, j, resetFrame);
		WallFrame(i, j + 1);
		WallFrame(i + 1, j - 1);
		WallFrame(i + 1, j);
		WallFrame(i + 1, j + 1);
	};

	/* public override void */ EveryTileFrame = function() {
		for (var i = 0; i < 5001; i++) {
			for (var j = 0; j < 2501; j++) {
				TileFrame(i, j, true);
			}
		}
	};

	/* public override void */ PlantCheck = function(/* int */ i, /* int */ j) {
		var num = -1;
		var num2 = -1;
		var num3 = -1;
		var num4 = -1;
		var num5 = -1;
		var num6 = -1;
		var num7 = -1;
		var num8 = -1;
		var type = Main.Tile[i, j].type;
		if (i - 1 < 0) {
			num = type;
			num4 = type;
			num6 = type;
		}

		if (i + 1 >= 5001) {
			num3 = type;
			num5 = type;
			num8 = type;
		}

		if (j - 1 < 0) {
			num = type;
			num2 = type;
			num3 = type;
		}

		if (j + 1 >= 2501) {
			num6 = type;
			num7 = type;
			num8 = type;
		}

		if (i - 1 >= 0 && Main.Tile[i - 1, j].active) {
			num4 = Main.Tile[i - 1, j].type;
		}
		if (i + 1 < 5001 && Main.Tile[i + 1, j].active) {
			num5 = Main.Tile[i + 1, j].type;
		}
		if (j - 1 >= 0 && Main.Tile[i, j - 1].active) {
			num2 = Main.Tile[i, j - 1].type;
		}
		if (j + 1 < 2501 && Main.Tile[i, j + 1].active) {
			num7 = Main.Tile[i, j + 1].type;
		}
		if (i - 1 >= 0 && j - 1 >= 0 && Main.Tile[i - 1, j - 1].active) {
			num = Main.Tile[i - 1, j - 1].type;
		}
		if (i + 1 < 5001 && j - 1 >= 0 && Main.Tile[i + 1, j - 1].active) {
			num3 = Main.Tile[i + 1, j - 1].type;
		}
		if (i - 1 >= 0 && j + 1 < 2501 && Main.Tile[i - 1, j + 1].active) {
			num6 = Main.Tile[i - 1, j + 1].type;
		}
		if (i + 1 < 5001 && j + 1 < 2501 && Main.Tile[i + 1, j + 1].active) {
			num8 = Main.Tile[i + 1, j + 1].type;
		}
		if (num7 != 2) {
			KillTile(i, j);
		}
	};

	/* public override void */ WallFrame = function(/* int */ i, /* int */ j, /* bool */ resetFrame = false) {
		var num = -1;
		var num2 = -1;
		var num3 = -1;
		var num4 = -1;
		var num5 = -1;
		var num6 = -1;
		var num7 = -1;
		var num8 = -1;
		var wall = Main.Tile[i, j].wall;
		if (wall == 0) {
			return;
		}
		var wallFrameX = Main.Tile[i, j].wallFrameX;
		var wallFrameY = Main.Tile[i, j].wallFrameY;
		var rectangle = new Rectangle(); /* default(Rectangle) */
		rectangle.X = -1;
		rectangle.Y = -1;
		if (i - 1 < 0) {
			num = wall;
			num4 = wall;
			num6 = wall;
		}

		if (i + 1 >= 5001) {
			num3 = wall;
			num5 = wall;
			num8 = wall;
		}

		if (j - 1 < 0) {
			num = wall;
			num2 = wall;
			num3 = wall;
		}

		if (j + 1 >= 2501) {
			num6 = wall;
			num7 = wall;
			num8 = wall;
		}

		if (i - 1 >= 0) {
			num4 = Main.Tile[i - 1, j].wall;
		}
		if (i + 1 < 5001) {
			num5 = Main.Tile[i + 1, j].wall;
		}
		if (j - 1 >= 0) {
			num2 = Main.Tile[i, j - 1].wall;
		}
		if (j + 1 < 2501) {
			num7 = Main.Tile[i, j + 1].wall;
		}
		if (i - 1 >= 0 && j - 1 >= 0) {
			num = Main.Tile[i - 1, j - 1].wall;
		}
		if (i + 1 < 5001 && j - 1 >= 0) {
			num3 = Main.Tile[i + 1, j - 1].wall;
		}
		if (i - 1 >= 0 && j + 1 < 2501) {
			num6 = Main.Tile[i - 1, j + 1].wall;
		}
		if (i + 1 < 5001 && j + 1 < 2501) {
			num8 = Main.Tile[i + 1, j + 1].wall;
		}
		var num9 = 0;
		if (resetFrame) {
			num9 = Main.Rand.Next(0, 3);
			Main.Tile[i, j].wallFrameNumber = num9;
		} else {
			num9 = Main.Tile[i, j].wallFrameNumber;
		}

		if (rectangle.X < 0 || rectangle.Y < 0) {
			if (num2 == wall && num7 == wall && num4 == wall && num5 == wall) {
				if (num != wall && num3 != wall) {
					if (num9 == 0) {
						rectangle.X = 108;
						rectangle.Y = 18;
					}

					if (num9 == 1) {
						rectangle.X = 126;
						rectangle.Y = 18;
					}

					if (num9 == 2) {
						rectangle.X = 144;
						rectangle.Y = 18;
					}
				} else if (num6 != wall && num8 != wall) {
					if (num9 == 0) {
						rectangle.X = 108;
						rectangle.Y = 36;
					}

					if (num9 == 1) {
						rectangle.X = 126;
						rectangle.Y = 36;
					}

					if (num9 == 2) {
						rectangle.X = 144;
						rectangle.Y = 36;
					}
				} else if (num != wall && num6 != wall) {
					if (num9 == 0) {
						rectangle.X = 180;
						rectangle.Y = 0;
					}

					if (num9 == 1) {
						rectangle.X = 180;
						rectangle.Y = 18;
					}

					if (num9 == 2) {
						rectangle.X = 180;
						rectangle.Y = 36;
					}
				} else if (num3 != wall && num8 != wall) {
					if (num9 == 0) {
						rectangle.X = 198;
						rectangle.Y = 0;
					}

					if (num9 == 1) {
						rectangle.X = 198;
						rectangle.Y = 18;
					}

					if (num9 == 2) {
						rectangle.X = 198;
						rectangle.Y = 36;
					}
				} else {
					if (num9 == 0) {
						rectangle.X = 18;
						rectangle.Y = 18;
					}

					if (num9 == 1) {
						rectangle.X = 36;
						rectangle.Y = 18;
					}

					if (num9 == 2) {
						rectangle.X = 54;
						rectangle.Y = 18;
					}
				}
			} else if (num2 != wall && num7 == wall && num4 == wall && num5 == wall) {
				if (num9 == 0) {
					rectangle.X = 18;
					rectangle.Y = 0;
				}

				if (num9 == 1) {
					rectangle.X = 36;
					rectangle.Y = 0;
				}

				if (num9 == 2) {
					rectangle.X = 54;
					rectangle.Y = 0;
				}
			} else if (num2 == wall && num7 != wall && num4 == wall && num5 == wall) {
				if (num9 == 0) {
					rectangle.X = 18;
					rectangle.Y = 36;
				}

				if (num9 == 1) {
					rectangle.X = 36;
					rectangle.Y = 36;
				}

				if (num9 == 2) {
					rectangle.X = 54;
					rectangle.Y = 36;
				}
			} else if (num2 == wall && num7 == wall && num4 != wall && num5 == wall) {
				if (num9 == 0) {
					rectangle.X = 0;
					rectangle.Y = 0;
				}

				if (num9 == 1) {
					rectangle.X = 0;
					rectangle.Y = 18;
				}

				if (num9 == 2) {
					rectangle.X = 0;
					rectangle.Y = 36;
				}
			} else if (num2 == wall && num7 == wall && num4 == wall && num5 != wall) {
				if (num9 == 0) {
					rectangle.X = 72;
					rectangle.Y = 0;
				}

				if (num9 == 1) {
					rectangle.X = 72;
					rectangle.Y = 18;
				}

				if (num9 == 2) {
					rectangle.X = 72;
					rectangle.Y = 36;
				}
			} else if (num2 != wall && num7 == wall && num4 != wall && num5 == wall) {
				if (num9 == 0) {
					rectangle.X = 0;
					rectangle.Y = 54;
				}

				if (num9 == 1) {
					rectangle.X = 36;
					rectangle.Y = 54;
				}

				if (num9 == 2) {
					rectangle.X = 72;
					rectangle.Y = 54;
				}
			} else if (num2 != wall && num7 == wall && num4 == wall && num5 != wall) {
				if (num9 == 0) {
					rectangle.X = 18;
					rectangle.Y = 54;
				}

				if (num9 == 1) {
					rectangle.X = 54;
					rectangle.Y = 54;
				}

				if (num9 == 2) {
					rectangle.X = 90;
					rectangle.Y = 54;
				}
			} else if (num2 == wall && num7 != wall && num4 != wall && num5 == wall) {
				if (num9 == 0) {
					rectangle.X = 0;
					rectangle.Y = 72;
				}

				if (num9 == 1) {
					rectangle.X = 36;
					rectangle.Y = 72;
				}

				if (num9 == 2) {
					rectangle.X = 72;
					rectangle.Y = 72;
				}
			} else if (num2 == wall && num7 != wall && num4 == wall && num5 != wall) {
				if (num9 == 0) {
					rectangle.X = 18;
					rectangle.Y = 72;
				}

				if (num9 == 1) {
					rectangle.X = 54;
					rectangle.Y = 72;
				}

				if (num9 == 2) {
					rectangle.X = 90;
					rectangle.Y = 72;
				}
			} else if (num2 == wall && num7 == wall && num4 != wall && num5 != wall) {
				if (num9 == 0) {
					rectangle.X = 90;
					rectangle.Y = 0;
				}

				if (num9 == 1) {
					rectangle.X = 90;
					rectangle.Y = 18;
				}

				if (num9 == 2) {
					rectangle.X = 90;
					rectangle.Y = 36;
				}
			} else if (num2 != wall && num7 != wall && num4 == wall && num5 == wall) {
				if (num9 == 0) {
					rectangle.X = 108;
					rectangle.Y = 72;
				}

				if (num9 == 1) {
					rectangle.X = 126;
					rectangle.Y = 72;
				}

				if (num9 == 2) {
					rectangle.X = 144;
					rectangle.Y = 72;
				}
			} else if (num2 != wall && num7 == wall && num4 != wall && num5 != wall) {
				if (num9 == 0) {
					rectangle.X = 108;
					rectangle.Y = 0;
				}

				if (num9 == 1) {
					rectangle.X = 126;
					rectangle.Y = 0;
				}

				if (num9 == 2) {
					rectangle.X = 144;
					rectangle.Y = 0;
				}
			} else if (num2 == wall && num7 != wall && num4 != wall && num5 != wall) {
				if (num9 == 0) {
					rectangle.X = 108;
					rectangle.Y = 54;
				}

				if (num9 == 1) {
					rectangle.X = 126;
					rectangle.Y = 54;
				}

				if (num9 == 2) {
					rectangle.X = 144;
					rectangle.Y = 54;
				}
			} else if (num2 != wall && num7 != wall && num4 != wall && num5 == wall) {
				if (num9 == 0) {
					rectangle.X = 162;
					rectangle.Y = 0;
				}

				if (num9 == 1) {
					rectangle.X = 162;
					rectangle.Y = 18;
				}

				if (num9 == 2) {
					rectangle.X = 162;
					rectangle.Y = 36;
				}
			} else if (num2 != wall && num7 != wall && num4 == wall && num5 != wall) {
				if (num9 == 0) {
					rectangle.X = 216;
					rectangle.Y = 0;
				}

				if (num9 == 1) {
					rectangle.X = 216;
					rectangle.Y = 18;
				}

				if (num9 == 2) {
					rectangle.X = 216;
					rectangle.Y = 36;
				}
			} else if (num2 != wall && num7 != wall && num4 != wall && num5 != wall) {
				if (num9 == 0) {
					rectangle.X = 162;
					rectangle.Y = 54;
				}

				if (num9 == 1) {
					rectangle.X = 180;
					rectangle.Y = 54;
				}

				if (num9 == 2) {
					rectangle.X = 198;
					rectangle.Y = 54;
				}
			}
		}

		if (rectangle.X <= -1 || rectangle.Y <= -1) {
			if (num9 <= 0) {
				rectangle.X = 18;
				rectangle.Y = 18;
			}

			if (num9 == 1) {
				rectangle.X = 36;
				rectangle.Y = 18;
			}

			if (num9 >= 2) {
				rectangle.X = 54;
				rectangle.Y = 18;
			}
		}

		Main.Tile[i, j].wallFrameX = rectangle.X;
		Main.Tile[i, j].wallFrameY = rectangle.Y;
		/* what?
		if (
            rectangle.X != wallFrameX
            && rectangle.Y != wallFrameY
            && wallFrameX >= 0
            && wallFrameY < 0
        )
            ;
		*/
	};

	/* public override void */ TileFrame = function(/* int */ i, /* int */ j, /* bool */ resetFrame = false) {
		if (i < 0 || j < 0 || i >= 5001 || j >= 2501 || !Main.Tile[i, j].active) {
			return;
		}
		var num = -1;
		var num2 = -1;
		var num3 = -1;
		var num4 = -1;
		var num5 = -1;
		var num6 = -1;
		var num7 = -1;
		var num8 = -1;
		var type = Main.Tile[i, j].type;
		var frameX = Main.Tile[i, j].frameX;
		var frameY = Main.Tile[i, j].frameY;
		var rectangle = new Rectangle(); /* default(Rectangle) */
		rectangle.X = -1;
		rectangle.Y = -1;
		if (type == 3) {
			PlantCheck(i, j);
			return;
		}

		mergeUp = false;
		mergeDown = false;
		mergeLeft = false;
		mergeRight = false;
		if (i - 1 < 0) {
			num = type;
			num4 = type;
			num6 = type;
		}

		if (i + 1 >= 5001) {
			num3 = type;
			num5 = type;
			num8 = type;
		}

		if (j - 1 < 0) {
			num = type;
			num2 = type;
			num3 = type;
		}

		if (j + 1 >= 2501) {
			num6 = type;
			num7 = type;
			num8 = type;
		}

		if (i - 1 >= 0 && Main.Tile[i - 1, j].active) {
			num4 = Main.Tile[i - 1, j].type;
		}
		if (i + 1 < 5001 && Main.Tile[i + 1, j].active) {
			num5 = Main.Tile[i + 1, j].type;
		}
		if (j - 1 >= 0 && Main.Tile[i, j - 1].active) {
			num2 = Main.Tile[i, j - 1].type;
		}
		if (j + 1 < 2501 && Main.Tile[i, j + 1].active) {
			num7 = Main.Tile[i, j + 1].type;
		}
		if (i - 1 >= 0 && j - 1 >= 0 && Main.Tile[i - 1, j - 1].active) {
			num = Main.Tile[i - 1, j - 1].type;
		}
		if (i + 1 < 5001 && j - 1 >= 0 && Main.Tile[i + 1, j - 1].active) {
			num3 = Main.Tile[i + 1, j - 1].type;
		}
		if (i - 1 >= 0 && j + 1 < 2501 && Main.Tile[i - 1, j + 1].active) {
			num6 = Main.Tile[i - 1, j + 1].type;
		}
		if (i + 1 < 5001 && j + 1 < 2501 && Main.Tile[i + 1, j + 1].active) {
			num8 = Main.Tile[i + 1, j + 1].type;
		}
		switch (type) {
			case 4:
				if (num7 >= 0 && Main.TileSolid[num7]) {
					Main.Tile[i, j].frameX = 0;
				} else if (
					(num4 >= 0 && Main.TileSolid[num4])
					|| (num4 == 5 && num == 5 && num6 == 5)
				) {
					Main.Tile[i, j].frameX = 22;
				} else if (
					(num5 >= 0 && Main.TileSolid[num5])
					|| (num5 == 5 && num3 == 5 && num8 == 5)
				) {
					Main.Tile[i, j].frameX = 44;
				} else {
					KillTile(i, j);
				}
				return;
			case 10:
				if (!destroyObject) {
					var frameY2 = Main.Tile[i, j].frameY;
					var num9 = j;
					var flag = false;
					if (frameY2 == 0) {
						num9 = j;
					}
					if (frameY2 == 18) {
						num9 = j - 1;
					}
					if (frameY2 == 36) {
						num9 = j - 2;
					}
					if (
						!Main.Tile[i, num9 - 1].active
						|| !Main.TileSolid[Main.Tile[i, num9 - 1].type]
					) {
						flag = true;
					}
					if (
						!Main.Tile[i, num9 + 3].active
						|| !Main.TileSolid[Main.Tile[i, num9 + 3].type]
					) {
						flag = true;
					}
					if (!Main.Tile[i, num9].active || Main.Tile[i, num9].type != type) {
						flag = true;
					}
					if (
						!Main.Tile[i, num9 + 1].active
						|| Main.Tile[i, num9 + 1].type != type
					) {
						flag = true;
					}
					if (
						!Main.Tile[i, num9 + 2].active
						|| Main.Tile[i, num9 + 2].type != type
					) {
						flag = true;
					}
					if (flag) {
						destroyObject = true;
						KillTile(i, num9);
						KillTile(i, num9 + 1);
						KillTile(i, num9 + 2);
						Item.NewItem(i * 16, j * 16, 16, 16, 25);
					}

					destroyObject = false;
				}

				return;
			case 11: {
				if (destroyObject) {
					return;
				}
				var num10 = 0;
				var num11 = i;
				var num9 = j;
				var frameX2 = Main.Tile[i, j].frameX;
				var frameY2 = Main.Tile[i, j].frameY;
				var flag = false;
				switch (frameX2) {
					case 0:
						num11 = i;
						num10 = 1;
						break;
					case 18:
						num11 = i - 1;
						num10 = 1;
						break;
					case 36:
						num11 = i + 1;
						num10 = -1;
						break;
					case 54:
						num11 = i;
						num10 = -1;
						break;
				}

				switch (frameY2) {
					case 0:
						num9 = j;
						break;
					case 18:
						num9 = j - 1;
						break;
					case 36:
						num9 = j - 2;
						break;
				}

				if (
					!Main.Tile[num11, num9 - 1].active
					|| !Main.TileSolid[Main.Tile[num11, num9 - 1].type]
					|| !Main.Tile[num11, num9 + 3].active
					|| !Main.TileSolid[Main.Tile[num11, num9 + 3].type]
				) {
					flag = true;
					destroyObject = true;
					Item.NewItem(i * 16, j * 16, 16, 16, 25);
				}

				var num12 = num11;
				if (num10 == -1) {
					num12 = num11 - 1;
				}
				for (var k = num12; k < num12 + 2; k++) {
					for (var l = num9; l < num9 + 3; l++) {
						if (
							!flag
							&& (Main.Tile[k, l].type != 11 || !Main.Tile[k, l].active)
						) {
							destroyObject = true;
							Item.NewItem(i * 16, j * 16, 16, 16, 25);
							flag = true;
							k = num12;
							l = num9;
						}

						if (flag) {
							KillTile(k, l);
						}
					}
				}

				destroyObject = false;
				return;
			}
			case 5:
				if (num7 != type && num7 != -1) {
					if (
						Main.Tile[i, j].frameX >= 22
						&& Main.Tile[i, j].frameX <= 44
						&& Main.Tile[i, j].frameY >= 132
						&& Main.Tile[i, j].frameY <= 176
						&& num4 != type
						&& num5 != type
					) {
						KillTile(i, j);
					}
				} else if (
					(
						Main.Tile[i, j].frameX == 88
							&& Main.Tile[i, j].frameY >= 0
							&& Main.Tile[i, j].frameY <= 44
					)
					|| (
						Main.Tile[i, j].frameX == 66
							&& Main.Tile[i, j].frameY >= 66
							&& Main.Tile[i, j].frameY <= 130
					)
					|| (
						Main.Tile[i, j].frameX == 110
							&& Main.Tile[i, j].frameY >= 66
							&& Main.Tile[i, j].frameY <= 110
					)
					|| (
						Main.Tile[i, j].frameX == 132
							&& Main.Tile[i, j].frameY >= 0
							&& Main.Tile[i, j].frameY <= 176
					)
				) {
					if (num4 == type && num5 == type) {
						if (Main.Tile[i, j].frameNumber == 0) {
							Main.Tile[i, j].frameX = 110;
							Main.Tile[i, j].frameY = 66;
						}

						if (Main.Tile[i, j].frameNumber == 1) {
							Main.Tile[i, j].frameX = 110;
							Main.Tile[i, j].frameY = 88;
						}

						if (Main.Tile[i, j].frameNumber == 2) {
							Main.Tile[i, j].frameX = 110;
							Main.Tile[i, j].frameY = 110;
						}
					} else if (num4 == type) {
						if (Main.Tile[i, j].frameNumber == 0) {
							Main.Tile[i, j].frameX = 88;
							Main.Tile[i, j].frameY = 0;
						}

						if (Main.Tile[i, j].frameNumber == 1) {
							Main.Tile[i, j].frameX = 88;
							Main.Tile[i, j].frameY = 22;
						}

						if (Main.Tile[i, j].frameNumber == 2) {
							Main.Tile[i, j].frameX = 88;
							Main.Tile[i, j].frameY = 44;
						}
					} else if (num5 == type) {
						if (Main.Tile[i, j].frameNumber == 0) {
							Main.Tile[i, j].frameX = 66;
							Main.Tile[i, j].frameY = 66;
						}

						if (Main.Tile[i, j].frameNumber == 1) {
							Main.Tile[i, j].frameX = 66;
							Main.Tile[i, j].frameY = 88;
						}

						if (Main.Tile[i, j].frameNumber == 2) {
							Main.Tile[i, j].frameX = 66;
							Main.Tile[i, j].frameY = 110;
						}
					} else {
						if (Main.Tile[i, j].frameNumber == 0) {
							Main.Tile[i, j].frameX = 0;
							Main.Tile[i, j].frameY = 22;
						}

						if (Main.Tile[i, j].frameNumber == 1) {
							Main.Tile[i, j].frameX = 0;
							Main.Tile[i, j].frameY = 22;
						}

						if (Main.Tile[i, j].frameNumber == 2) {
							Main.Tile[i, j].frameX = 0;
							Main.Tile[i, j].frameY = 22;
						}
					}
				}

				if (
					Main.Tile[i, j].frameY >= 132
					&& Main.Tile[i, j].frameY <= 176
					&& (
						Main.Tile[i, j].frameX == 0
							|| Main.Tile[i, j].frameX == 66
							|| Main.Tile[i, j].frameX == 88
					)
				) {
					if (num4 != type && num5 != type) {
						if (Main.Tile[i, j].frameNumber == 0) {
							Main.Tile[i, j].frameX = 0;
							Main.Tile[i, j].frameY = 0;
						}

						if (Main.Tile[i, j].frameNumber == 1) {
							Main.Tile[i, j].frameX = 0;
							Main.Tile[i, j].frameY = 22;
						}

						if (Main.Tile[i, j].frameNumber == 2) {
							Main.Tile[i, j].frameX = 0;
							Main.Tile[i, j].frameY = 44;
						}
					} else if (num4 != type) {
						if (Main.Tile[i, j].frameNumber == 0) {
							Main.Tile[i, j].frameX = 0;
							Main.Tile[i, j].frameY = 132;
						}

						if (Main.Tile[i, j].frameNumber == 1) {
							Main.Tile[i, j].frameX = 0;
							Main.Tile[i, j].frameY = 154;
						}

						if (Main.Tile[i, j].frameNumber == 2) {
							Main.Tile[i, j].frameX = 0;
							Main.Tile[i, j].frameY = 176;
						}
					} else if (num5 != type) {
						if (Main.Tile[i, j].frameNumber == 0) {
							Main.Tile[i, j].frameX = 66;
							Main.Tile[i, j].frameY = 132;
						}

						if (Main.Tile[i, j].frameNumber == 1) {
							Main.Tile[i, j].frameX = 66;
							Main.Tile[i, j].frameY = 154;
						}

						if (Main.Tile[i, j].frameNumber == 2) {
							Main.Tile[i, j].frameX = 66;
							Main.Tile[i, j].frameY = 176;
						}
					} else {
						if (Main.Tile[i, j].frameNumber == 0) {
							Main.Tile[i, j].frameX = 88;
							Main.Tile[i, j].frameY = 132;
						}

						if (Main.Tile[i, j].frameNumber == 1) {
							Main.Tile[i, j].frameX = 88;
							Main.Tile[i, j].frameY = 154;
						}

						if (Main.Tile[i, j].frameNumber == 2) {
							Main.Tile[i, j].frameX = 88;
							Main.Tile[i, j].frameY = 176;
						}
					}
				}

				if (
					(
						Main.Tile[i, j].frameX == 66
							&& (
								Main.Tile[i, j].frameY == 0
									|| Main.Tile[i, j].frameY == 22
									|| Main.Tile[i, j].frameY == 44
							)
					)
					|| (
						Main.Tile[i, j].frameX == 88
							&& (
								Main.Tile[i, j].frameY == 66
									|| Main.Tile[i, j].frameY == 88
									|| Main.Tile[i, j].frameY == 110
							)
					)
					|| (
						Main.Tile[i, j].frameX == 44
							&& (
								Main.Tile[i, j].frameY == 198
									|| Main.Tile[i, j].frameY == 220
									|| Main.Tile[i, j].frameY == 242
							)
					)
					|| (
						Main.Tile[i, j].frameX == 66
							&& (
								Main.Tile[i, j].frameY == 198
									|| Main.Tile[i, j].frameY == 220
									|| Main.Tile[i, j].frameY == 242
							)
					)
				) {
					if (num4 != type && num5 != type) {
						KillTile(i, j);
					}
				} else if (num7 == -1) {
					KillTile(i, j);
				} else if (
					num2 != type
					&& Main.Tile[i, j].frameY < 198
					&& (
						(Main.Tile[i, j].frameX != 22 && Main.Tile[i, j].frameX != 44)
							|| Main.Tile[i, j].frameY < 132
					)
				) {
					if (num4 == type || num5 == type) {
						if (num7 == type) {
							if (num4 == type && num5 == type) {
								if (Main.Tile[i, j].frameNumber == 0) {
									Main.Tile[i, j].frameX = 132;
									Main.Tile[i, j].frameY = 132;
								}

								if (Main.Tile[i, j].frameNumber == 1) {
									Main.Tile[i, j].frameX = 132;
									Main.Tile[i, j].frameY = 154;
								}

								if (Main.Tile[i, j].frameNumber == 2) {
									Main.Tile[i, j].frameX = 132;
									Main.Tile[i, j].frameY = 176;
								}
							} else if (num4 == type) {
								if (Main.Tile[i, j].frameNumber == 0) {
									Main.Tile[i, j].frameX = 132;
									Main.Tile[i, j].frameY = 0;
								}

								if (Main.Tile[i, j].frameNumber == 1) {
									Main.Tile[i, j].frameX = 132;
									Main.Tile[i, j].frameY = 22;
								}

								if (Main.Tile[i, j].frameNumber == 2) {
									Main.Tile[i, j].frameX = 132;
									Main.Tile[i, j].frameY = 44;
								}
							} else if (num5 == type) {
								if (Main.Tile[i, j].frameNumber == 0) {
									Main.Tile[i, j].frameX = 132;
									Main.Tile[i, j].frameY = 66;
								}

								if (Main.Tile[i, j].frameNumber == 1) {
									Main.Tile[i, j].frameX = 132;
									Main.Tile[i, j].frameY = 88;
								}

								if (Main.Tile[i, j].frameNumber == 2) {
									Main.Tile[i, j].frameX = 132;
									Main.Tile[i, j].frameY = 110;
								}
							}
						} else if (num4 == type && num5 == type) {
							if (Main.Tile[i, j].frameNumber == 0) {
								Main.Tile[i, j].frameX = 154;
								Main.Tile[i, j].frameY = 132;
							}

							if (Main.Tile[i, j].frameNumber == 1) {
								Main.Tile[i, j].frameX = 154;
								Main.Tile[i, j].frameY = 154;
							}

							if (Main.Tile[i, j].frameNumber == 2) {
								Main.Tile[i, j].frameX = 154;
								Main.Tile[i, j].frameY = 176;
							}
						} else if (num4 == type) {
							if (Main.Tile[i, j].frameNumber == 0) {
								Main.Tile[i, j].frameX = 154;
								Main.Tile[i, j].frameY = 0;
							}

							if (Main.Tile[i, j].frameNumber == 1) {
								Main.Tile[i, j].frameX = 154;
								Main.Tile[i, j].frameY = 22;
							}

							if (Main.Tile[i, j].frameNumber == 2) {
								Main.Tile[i, j].frameX = 154;
								Main.Tile[i, j].frameY = 44;
							}
						} else if (num5 == type) {
							if (Main.Tile[i, j].frameNumber == 0) {
								Main.Tile[i, j].frameX = 154;
								Main.Tile[i, j].frameY = 66;
							}

							if (Main.Tile[i, j].frameNumber == 1) {
								Main.Tile[i, j].frameX = 154;
								Main.Tile[i, j].frameY = 88;
							}

							if (Main.Tile[i, j].frameNumber == 2) {
								Main.Tile[i, j].frameX = 154;
								Main.Tile[i, j].frameY = 110;
							}
						}
					} else {
						if (Main.Tile[i, j].frameNumber == 0) {
							Main.Tile[i, j].frameX = 110;
							Main.Tile[i, j].frameY = 0;
						}

						if (Main.Tile[i, j].frameNumber == 1) {
							Main.Tile[i, j].frameX = 110;
							Main.Tile[i, j].frameY = 22;
						}

						if (Main.Tile[i, j].frameNumber == 2) {
							Main.Tile[i, j].frameX = 110;
							Main.Tile[i, j].frameY = 44;
						}
					}
				}

				rectangle.X = Main.Tile[i, j].frameX;
				rectangle.Y = Main.Tile[i, j].frameY;
				break;
		}

		var num13 = 0;
		if (resetFrame) {
			num13 = Main.Rand.Next(0, 3);
			Main.Tile[i, j].frameNumber = num13;
		} else {
			num13 = Main.Tile[i, j].frameNumber;
		}

		if (type == 0) {
			for (var m = 0; m < 12; m++) {
				if (m != 1 && m != 6 && m != 7 && m != 8 && m != 9) {
					continue;
				}
				if (num2 == m) {
					TileFrame(i, j - 1);
					if (mergeDown) {
						num2 = type;
					}
				}

				if (num7 == m) {
					TileFrame(i, j + 1);
					if (mergeUp) {
						num7 = type;
					}
				}

				if (num4 == m) {
					TileFrame(i - 1, j);
					if (mergeRight) {
						num4 = type;
					}
				}

				if (num5 == m) {
					TileFrame(i + 1, j);
					if (mergeLeft) {
						num5 = type;
					}
				}

				if (num == m) {
					num = type;
				}
				if (num3 == m) {
					num3 = type;
				}
				if (num6 == m) {
					num6 = type;
				}
				if (num8 == m) {
					num8 = type;
				}
			}

			if (num2 == 2) {
				num2 = type;
			}
			if (num7 == 2) {
				num7 = type;
			}
			if (num4 == 2) {
				num4 = type;
			}
			if (num5 == 2) {
				num5 = type;
			}
			if (num == 2) {
				num = type;
			}
			if (num3 == 2) {
				num3 = type;
			}
			if (num6 == 2) {
				num6 = type;
			}
			if (num8 == 2) {
				num8 = type;
			}
		}

		if (type == 1 || type == 6 || type == 7 || type == 8 || type == 9) {
			for (var m = 0; m < 12; m++) {
				if (m == 1 || m == 6 || m == 7 || m == 8 || m == 9) {
					if (num2 == 0) {
						num2 = -2;
					}
					if (num7 == 0) {
						num7 = -2;
					}
					if (num4 == 0) {
						num4 = -2;
					}
					if (num5 == 0) {
						num5 = -2;
					}
					if (num == 0) {
						num = -2;
					}
					if (num3 == 0) {
						num3 = -2;
					}
					if (num6 == 0) {
						num6 = -2;
					}
					if (num8 == 0) {
						num8 = -2;
					}
				}
			}
		}

		if (type == 2) {
			var num14 = 0;
			if (num2 != type && num2 != num14 && (num7 == type || num7 == num14)) {
				if (num4 == num14 && num5 == type) {
					if (num13 == 0) {
						rectangle.X = 0;
						rectangle.Y = 198;
					}

					if (num13 == 1) {
						rectangle.X = 18;
						rectangle.Y = 198;
					}

					if (num13 == 2) {
						rectangle.X = 36;
						rectangle.Y = 198;
					}
				} else if (num4 == type && num5 == num14) {
					if (num13 == 0) {
						rectangle.X = 54;
						rectangle.Y = 198;
					}

					if (num13 == 1) {
						rectangle.X = 72;
						rectangle.Y = 198;
					}

					if (num13 == 2) {
						rectangle.X = 90;
						rectangle.Y = 198;
					}
				}
			} else if (num7 != type && num7 != num14 && (num2 == type || num2 == num14)) {
				if (num4 == num14 && num5 == type) {
					if (num13 == 0) {
						rectangle.X = 0;
						rectangle.Y = 216;
					}

					if (num13 == 1) {
						rectangle.X = 18;
						rectangle.Y = 216;
					}

					if (num13 == 2) {
						rectangle.X = 36;
						rectangle.Y = 216;
					}
				} else if (num4 == type && num5 == num14) {
					if (num13 == 0) {
						rectangle.X = 54;
						rectangle.Y = 216;
					}

					if (num13 == 1) {
						rectangle.X = 72;
						rectangle.Y = 216;
					}

					if (num13 == 2) {
						rectangle.X = 90;
						rectangle.Y = 216;
					}
				}
			} else if (num4 != type && num4 != num14 && (num5 == type || num5 == num14)) {
				if (num2 == num14 && num7 == type) {
					if (num13 == 0) {
						rectangle.X = 72;
						rectangle.Y = 144;
					}

					if (num13 == 1) {
						rectangle.X = 72;
						rectangle.Y = 162;
					}

					if (num13 == 2) {
						rectangle.X = 72;
						rectangle.Y = 180;
					}
				} else if (num7 == type && num5 == num2) {
					if (num13 == 0) {
						rectangle.X = 72;
						rectangle.Y = 90;
					}

					if (num13 == 1) {
						rectangle.X = 72;
						rectangle.Y = 108;
					}

					if (num13 == 2) {
						rectangle.X = 72;
						rectangle.Y = 126;
					}
				}
			} else if (num5 != type && num5 != num14 && (num4 == type || num4 == num14)) {
				if (num2 == num14 && num7 == type) {
					if (num13 == 0) {
						rectangle.X = 90;
						rectangle.Y = 144;
					}

					if (num13 == 1) {
						rectangle.X = 90;
						rectangle.Y = 162;
					}

					if (num13 == 2) {
						rectangle.X = 90;
						rectangle.Y = 180;
					}
				} else if (num7 == type && num5 == num2) {
					if (num13 == 0) {
						rectangle.X = 90;
						rectangle.Y = 90;
					}

					if (num13 == 1) {
						rectangle.X = 90;
						rectangle.Y = 108;
					}

					if (num13 == 2) {
						rectangle.X = 90;
						rectangle.Y = 126;
					}
				}
			} else if (num2 == type && num7 == type && num4 == type && num5 == type) {
				if (num != type && num3 != type && num6 != type && num8 != type) {
					if (num8 == num14) {
						if (num13 == 0) {
							rectangle.X = 108;
							rectangle.Y = 324;
						}

						if (num13 == 1) {
							rectangle.X = 126;
							rectangle.Y = 324;
						}

						if (num13 == 2) {
							rectangle.X = 144;
							rectangle.Y = 324;
						}
					} else if (num3 == num14) {
						if (num13 == 0) {
							rectangle.X = 108;
							rectangle.Y = 342;
						}

						if (num13 == 1) {
							rectangle.X = 126;
							rectangle.Y = 342;
						}

						if (num13 == 2) {
							rectangle.X = 144;
							rectangle.Y = 342;
						}
					} else if (num6 == num14) {
						if (num13 == 0) {
							rectangle.X = 108;
							rectangle.Y = 360;
						}

						if (num13 == 1) {
							rectangle.X = 126;
							rectangle.Y = 360;
						}

						if (num13 == 2) {
							rectangle.X = 144;
							rectangle.Y = 360;
						}
					} else if (num == num14) {
						if (num13 == 0) {
							rectangle.X = 108;
							rectangle.Y = 378;
						}

						if (num13 == 1) {
							rectangle.X = 126;
							rectangle.Y = 378;
						}

						if (num13 == 2) {
							rectangle.X = 144;
							rectangle.Y = 378;
						}
					} else {
						if (num13 == 0) {
							rectangle.X = 144;
							rectangle.Y = 234;
						}

						if (num13 == 1) {
							rectangle.X = 198;
							rectangle.Y = 234;
						}

						if (num13 == 2) {
							rectangle.X = 252;
							rectangle.Y = 234;
						}
					}
				} else if (num != type && num8 != type) {
					if (num13 == 0) {
						rectangle.X = 36;
						rectangle.Y = 306;
					}

					if (num13 == 1) {
						rectangle.X = 54;
						rectangle.Y = 306;
					}

					if (num13 == 2) {
						rectangle.X = 72;
						rectangle.Y = 306;
					}
				} else if (num3 != type && num6 != type) {
					if (num13 == 0) {
						rectangle.X = 90;
						rectangle.Y = 306;
					}

					if (num13 == 1) {
						rectangle.X = 108;
						rectangle.Y = 306;
					}

					if (num13 == 2) {
						rectangle.X = 126;
						rectangle.Y = 306;
					}
				} else if (num != type && num3 == type && num6 == type && num8 == type) {
					if (num13 == 0) {
						rectangle.X = 54;
						rectangle.Y = 108;
					}

					if (num13 == 1) {
						rectangle.X = 54;
						rectangle.Y = 144;
					}

					if (num13 == 2) {
						rectangle.X = 54;
						rectangle.Y = 180;
					}
				} else if (num == type && num3 != type && num6 == type && num8 == type) {
					if (num13 == 0) {
						rectangle.X = 36;
						rectangle.Y = 108;
					}

					if (num13 == 1) {
						rectangle.X = 36;
						rectangle.Y = 144;
					}

					if (num13 == 2) {
						rectangle.X = 36;
						rectangle.Y = 180;
					}
				} else if (num == type && num3 == type && num6 != type && num8 == type) {
					if (num13 == 0) {
						rectangle.X = 54;
						rectangle.Y = 90;
					}

					if (num13 == 1) {
						rectangle.X = 54;
						rectangle.Y = 126;
					}

					if (num13 == 2) {
						rectangle.X = 54;
						rectangle.Y = 162;
					}
				} else if (num == type && num3 == type && num6 == type && num8 != type) {
					if (num13 == 0) {
						rectangle.X = 36;
						rectangle.Y = 90;
					}

					if (num13 == 1) {
						rectangle.X = 36;
						rectangle.Y = 126;
					}

					if (num13 == 2) {
						rectangle.X = 36;
						rectangle.Y = 162;
					}
				}
			} else if (
				num2 == type
				&& num7 == num14
				&& num4 == type
				&& num5 == type
				&& num == -1
				&& num3 == -1
			) {
				if (num13 == 0) {
					rectangle.X = 108;
					rectangle.Y = 18;
				}

				if (num13 == 1) {
					rectangle.X = 126;
					rectangle.Y = 18;
				}

				if (num13 == 2) {
					rectangle.X = 144;
					rectangle.Y = 18;
				}
			} else if (
				num2 == num14
				&& num7 == type
				&& num4 == type
				&& num5 == type
				&& num6 == -1
				&& num8 == -1
			) {
				if (num13 == 0) {
					rectangle.X = 108;
					rectangle.Y = 36;
				}

				if (num13 == 1) {
					rectangle.X = 126;
					rectangle.Y = 36;
				}

				if (num13 == 2) {
					rectangle.X = 144;
					rectangle.Y = 36;
				}
			} else if (
				num2 == type
				&& num7 == type
				&& num4 == num14
				&& num5 == type
				&& num3 == -1
				&& num8 == -1
			) {
				if (num13 == 0) {
					rectangle.X = 198;
					rectangle.Y = 0;
				}

				if (num13 == 1) {
					rectangle.X = 198;
					rectangle.Y = 18;
				}

				if (num13 == 2) {
					rectangle.X = 198;
					rectangle.Y = 36;
				}
			} else if (
				num2 == type
				&& num7 == type
				&& num4 == type
				&& num5 == num14
				&& num == -1
				&& num6 == -1
			) {
				if (num13 == 0) {
					rectangle.X = 180;
					rectangle.Y = 0;
				}

				if (num13 == 1) {
					rectangle.X = 180;
					rectangle.Y = 18;
				}

				if (num13 == 2) {
					rectangle.X = 180;
					rectangle.Y = 36;
				}
			} else if (num2 == type && num7 == num14 && num4 == type && num5 == type) {
				if (num3 != -1) {
					if (num13 == 0) {
						rectangle.X = 54;
						rectangle.Y = 108;
					}

					if (num13 == 1) {
						rectangle.X = 54;
						rectangle.Y = 144;
					}

					if (num13 == 2) {
						rectangle.X = 54;
						rectangle.Y = 180;
					}
				} else if (num != -1) {
					if (num13 == 0) {
						rectangle.X = 36;
						rectangle.Y = 108;
					}

					if (num13 == 1) {
						rectangle.X = 36;
						rectangle.Y = 144;
					}

					if (num13 == 2) {
						rectangle.X = 36;
						rectangle.Y = 180;
					}
				}
			} else if (num2 == num14 && num7 == type && num4 == type && num5 == type) {
				if (num8 != -1) {
					if (num13 == 0) {
						rectangle.X = 54;
						rectangle.Y = 90;
					}

					if (num13 == 1) {
						rectangle.X = 54;
						rectangle.Y = 126;
					}

					if (num13 == 2) {
						rectangle.X = 54;
						rectangle.Y = 162;
					}
				} else if (num6 != -1) {
					if (num13 == 0) {
						rectangle.X = 36;
						rectangle.Y = 90;
					}

					if (num13 == 1) {
						rectangle.X = 36;
						rectangle.Y = 126;
					}

					if (num13 == 2) {
						rectangle.X = 36;
						rectangle.Y = 162;
					}
				}
			} else if (num2 == type && num7 == type && num4 == type && num5 == num14) {
				if (num != -1) {
					if (num13 == 0) {
						rectangle.X = 54;
						rectangle.Y = 90;
					}

					if (num13 == 1) {
						rectangle.X = 54;
						rectangle.Y = 126;
					}

					if (num13 == 2) {
						rectangle.X = 54;
						rectangle.Y = 162;
					}
				} else if (num6 != -1) {
					if (num13 == 0) {
						rectangle.X = 54;
						rectangle.Y = 108;
					}

					if (num13 == 1) {
						rectangle.X = 54;
						rectangle.Y = 144;
					}

					if (num13 == 2) {
						rectangle.X = 54;
						rectangle.Y = 180;
					}
				}
			} else if (num2 == type && num7 == type && num4 == num14 && num5 == type) {
				if (num3 != -1) {
					if (num13 == 0) {
						rectangle.X = 36;
						rectangle.Y = 90;
					}

					if (num13 == 1) {
						rectangle.X = 36;
						rectangle.Y = 126;
					}

					if (num13 == 2) {
						rectangle.X = 36;
						rectangle.Y = 162;
					}
				} else if (num8 != -1) {
					if (num13 == 0) {
						rectangle.X = 36;
						rectangle.Y = 108;
					}

					if (num13 == 1) {
						rectangle.X = 36;
						rectangle.Y = 144;
					}

					if (num13 == 2) {
						rectangle.X = 36;
						rectangle.Y = 180;
					}
				}
			} else if (
				(num2 == num14 && num7 == type && num4 == type && num5 == type)
				|| (num2 == type && num7 == num14 && num4 == type && num5 == type)
				|| (num2 == type && num7 == type && num4 == num14 && num5 == type)
				|| (num2 == type && num7 == type && num4 == type && num5 == num14)
			) {
				if (num13 == 0) {
					rectangle.X = 18;
					rectangle.Y = 18;
				}

				if (num13 == 1) {
					rectangle.X = 36;
					rectangle.Y = 18;
				}

				if (num13 == 2) {
					rectangle.X = 54;
					rectangle.Y = 18;
				}
			}

			if (
				(num2 == type || num2 == num14)
				&& (num7 == type || num7 == num14)
				&& (num4 == type || num4 == num14)
				&& (num5 == type || num5 == num14)
			) {
				if (
					num != type
					&& num != num14
					&& (num3 == type || num3 == num14)
					&& (num6 == type || num6 == num14)
					&& (num8 == type || num8 == num14)
				) {
					if (num13 == 0) {
						rectangle.X = 54;
						rectangle.Y = 108;
					}

					if (num13 == 1) {
						rectangle.X = 54;
						rectangle.Y = 144;
					}

					if (num13 == 2) {
						rectangle.X = 54;
						rectangle.Y = 180;
					}
				} else if (
					num3 != type
					&& num3 != num14
					&& (num == type || num == num14)
					&& (num6 == type || num6 == num14)
					&& (num8 == type || num8 == num14)
				) {
					if (num13 == 0) {
						rectangle.X = 36;
						rectangle.Y = 108;
					}

					if (num13 == 1) {
						rectangle.X = 36;
						rectangle.Y = 144;
					}

					if (num13 == 2) {
						rectangle.X = 36;
						rectangle.Y = 180;
					}
				} else if (
					num6 != type
					&& num6 != num14
					&& (num == type || num == num14)
					&& (num3 == type || num3 == num14)
					&& (num8 == type || num8 == num14)
				) {
					if (num13 == 0) {
						rectangle.X = 54;
						rectangle.Y = 90;
					}

					if (num13 == 1) {
						rectangle.X = 54;
						rectangle.Y = 126;
					}

					if (num13 == 2) {
						rectangle.X = 54;
						rectangle.Y = 162;
					}
				} else if (
					num8 != type
					&& num8 != num14
					&& (num == type || num == num14)
					&& (num6 == type || num6 == num14)
					&& (num3 == type || num3 == num14)
				) {
					if (num13 == 0) {
						rectangle.X = 36;
						rectangle.Y = 90;
					}

					if (num13 == 1) {
						rectangle.X = 36;
						rectangle.Y = 126;
					}

					if (num13 == 2) {
						rectangle.X = 36;
						rectangle.Y = 162;
					}
				}
			}

			if (
				num2 != num14
				&& num2 != type
				&& num7 == type
				&& num4 != num14
				&& num4 != type
				&& num5 == type
				&& num8 != num14
				&& num8 != type
			) {
				if (num13 == 0) {
					rectangle.X = 90;
					rectangle.Y = 270;
				}

				if (num13 == 1) {
					rectangle.X = 108;
					rectangle.Y = 270;
				}

				if (num13 == 2) {
					rectangle.X = 126;
					rectangle.Y = 270;
				}
			} else if (
				num2 != num14
				&& num2 != type
				&& num7 == type
				&& num4 == type
				&& num5 != num14
				&& num5 != type
				&& num6 != num14
				&& num6 != type
			) {
				if (num13 == 0) {
					rectangle.X = 144;
					rectangle.Y = 270;
				}

				if (num13 == 1) {
					rectangle.X = 162;
					rectangle.Y = 270;
				}

				if (num13 == 2) {
					rectangle.X = 180;
					rectangle.Y = 270;
				}
			} else if (
				num7 != num14
				&& num7 != type
				&& num2 == type
				&& num4 != num14
				&& num4 != type
				&& num5 == type
				&& num3 != num14
				&& num3 != type
			) {
				if (num13 == 0) {
					rectangle.X = 90;
					rectangle.Y = 288;
				}

				if (num13 == 1) {
					rectangle.X = 108;
					rectangle.Y = 288;
				}

				if (num13 == 2) {
					rectangle.X = 126;
					rectangle.Y = 288;
				}
			} else if (
				num7 != num14
				&& num7 != type
				&& num2 == type
				&& num4 == type
				&& num5 != num14
				&& num5 != type
				&& num != num14
				&& num != type
			) {
				if (num13 == 0) {
					rectangle.X = 144;
					rectangle.Y = 288;
				}

				if (num13 == 1) {
					rectangle.X = 162;
					rectangle.Y = 288;
				}

				if (num13 == 2) {
					rectangle.X = 180;
					rectangle.Y = 288;
				}
			} else if (
				num2 != type
				&& num2 != num14
				&& num7 == type
				&& num4 == type
				&& num5 == type
				&& num6 != type
				&& num6 != num14
				&& num8 != type
				&& num8 != num14
			) {
				if (num13 == 0) {
					rectangle.X = 144;
					rectangle.Y = 216;
				}

				if (num13 == 1) {
					rectangle.X = 198;
					rectangle.Y = 216;
				}

				if (num13 == 2) {
					rectangle.X = 252;
					rectangle.Y = 216;
				}
			} else if (
				num7 != type
				&& num7 != num14
				&& num2 == type
				&& num4 == type
				&& num5 == type
				&& num != type
				&& num != num14
				&& num3 != type
				&& num3 != num14
			) {
				if (num13 == 0) {
					rectangle.X = 144;
					rectangle.Y = 252;
				}

				if (num13 == 1) {
					rectangle.X = 198;
					rectangle.Y = 252;
				}

				if (num13 == 2) {
					rectangle.X = 252;
					rectangle.Y = 252;
				}
			} else if (
				num4 != type
				&& num4 != num14
				&& num7 == type
				&& num2 == type
				&& num5 == type
				&& num3 != type
				&& num3 != num14
				&& num8 != type
				&& num8 != num14
			) {
				if (num13 == 0) {
					rectangle.X = 126;
					rectangle.Y = 234;
				}

				if (num13 == 1) {
					rectangle.X = 180;
					rectangle.Y = 234;
				}

				if (num13 == 2) {
					rectangle.X = 234;
					rectangle.Y = 234;
				}
			} else if (
				num5 != type
				&& num5 != num14
				&& num7 == type
				&& num2 == type
				&& num4 == type
				&& num != type
				&& num != num14
				&& num6 != type
				&& num6 != num14
			) {
				if (num13 == 0) {
					rectangle.X = 162;
					rectangle.Y = 234;
				}

				if (num13 == 1) {
					rectangle.X = 216;
					rectangle.Y = 234;
				}

				if (num13 == 2) {
					rectangle.X = 270;
					rectangle.Y = 234;
				}
			} else if (
				num2 != num14
				&& num2 != type
				&& (num7 == num14 || num7 == type)
				&& num4 == num14
				&& num5 == num14
			) {
				if (num13 == 0) {
					rectangle.X = 36;
					rectangle.Y = 270;
				}

				if (num13 == 1) {
					rectangle.X = 54;
					rectangle.Y = 270;
				}

				if (num13 == 2) {
					rectangle.X = 72;
					rectangle.Y = 270;
				}
			} else if (
				num7 != num14
				&& num7 != type
				&& (num2 == num14 || num2 == type)
				&& num4 == num14
				&& num5 == num14
			) {
				if (num13 == 0) {
					rectangle.X = 36;
					rectangle.Y = 288;
				}

				if (num13 == 1) {
					rectangle.X = 54;
					rectangle.Y = 288;
				}

				if (num13 == 2) {
					rectangle.X = 72;
					rectangle.Y = 288;
				}
			} else if (
				num4 != num14
				&& num4 != type
				&& (num5 == num14 || num5 == type)
				&& num2 == num14
				&& num7 == num14
			) {
				if (num13 == 0) {
					rectangle.X = 0;
					rectangle.Y = 270;
				}

				if (num13 == 1) {
					rectangle.X = 0;
					rectangle.Y = 288;
				}

				if (num13 == 2) {
					rectangle.X = 0;
					rectangle.Y = 306;
				}
			} else if (
				num5 != num14
				&& num5 != type
				&& (num4 == num14 || num4 == type)
				&& num2 == num14
				&& num7 == num14
			) {
				if (num13 == 0) {
					rectangle.X = 18;
					rectangle.Y = 270;
				}

				if (num13 == 1) {
					rectangle.X = 18;
					rectangle.Y = 288;
				}

				if (num13 == 2) {
					rectangle.X = 18;
					rectangle.Y = 306;
				}
			} else if (num2 == type && num7 == num14 && num4 == num14 && num5 == num14) {
				if (num13 == 0) {
					rectangle.X = 198;
					rectangle.Y = 288;
				}

				if (num13 == 1) {
					rectangle.X = 216;
					rectangle.Y = 288;
				}

				if (num13 == 2) {
					rectangle.X = 234;
					rectangle.Y = 288;
				}
			} else if (num2 == num14 && num7 == type && num4 == num14 && num5 == num14) {
				if (num13 == 0) {
					rectangle.X = 198;
					rectangle.Y = 270;
				}

				if (num13 == 1) {
					rectangle.X = 216;
					rectangle.Y = 270;
				}

				if (num13 == 2) {
					rectangle.X = 234;
					rectangle.Y = 270;
				}
			} else if (num2 == num14 && num7 == num14 && num4 == type && num5 == num14) {
				if (num13 == 0) {
					rectangle.X = 198;
					rectangle.Y = 306;
				}

				if (num13 == 1) {
					rectangle.X = 216;
					rectangle.Y = 306;
				}

				if (num13 == 2) {
					rectangle.X = 234;
					rectangle.Y = 306;
				}
			} else if (num2 == num14 && num7 == num14 && num4 == num14 && num5 == type) {
				if (num13 == 0) {
					rectangle.X = 144;
					rectangle.Y = 306;
				}

				if (num13 == 1) {
					rectangle.X = 162;
					rectangle.Y = 306;
				}

				if (num13 == 2) {
					rectangle.X = 180;
					rectangle.Y = 306;
				}
			}

			if (
				num2 != type
				&& num2 != num14
				&& num7 == type
				&& num4 == type
				&& num5 == type
			) {
				if ((num6 == num14 || num6 == type) && num8 != num14 && num8 != type) {
					if (num13 == 0) {
						rectangle.X = 0;
						rectangle.Y = 324;
					}

					if (num13 == 1) {
						rectangle.X = 18;
						rectangle.Y = 324;
					}

					if (num13 == 2) {
						rectangle.X = 36;
						rectangle.Y = 324;
					}
				} else if (
					(num8 == num14 || num8 == type)
					&& num6 != num14
					&& num6 != type
				) {
					if (num13 == 0) {
						rectangle.X = 54;
						rectangle.Y = 324;
					}

					if (num13 == 1) {
						rectangle.X = 72;
						rectangle.Y = 324;
					}

					if (num13 == 2) {
						rectangle.X = 90;
						rectangle.Y = 324;
					}
				}
			} else if (
				num7 != type
				&& num7 != num14
				&& num2 == type
				&& num4 == type
				&& num5 == type
			) {
				if ((num == num14 || num == type) && num3 != num14 && num3 != type) {
					if (num13 == 0) {
						rectangle.X = 0;
						rectangle.Y = 342;
					}

					if (num13 == 1) {
						rectangle.X = 18;
						rectangle.Y = 342;
					}

					if (num13 == 2) {
						rectangle.X = 36;
						rectangle.Y = 342;
					}
				} else if ((num3 == num14 || num3 == type) && num != num14 && num != type) {
					if (num13 == 0) {
						rectangle.X = 54;
						rectangle.Y = 342;
					}

					if (num13 == 1) {
						rectangle.X = 72;
						rectangle.Y = 342;
					}

					if (num13 == 2) {
						rectangle.X = 90;
						rectangle.Y = 342;
					}
				}
			} else if (
				num4 != type
				&& num4 != num14
				&& num2 == type
				&& num7 == type
				&& num5 == type
			) {
				if ((num3 == num14 || num3 == type) && num8 != num14 && num8 != type) {
					if (num13 == 0) {
						rectangle.X = 54;
						rectangle.Y = 360;
					}

					if (num13 == 1) {
						rectangle.X = 72;
						rectangle.Y = 360;
					}

					if (num13 == 2) {
						rectangle.X = 90;
						rectangle.Y = 360;
					}
				} else if (
					(num8 == num14 || num8 == type)
					&& num3 != num14
					&& num3 != type
				) {
					if (num13 == 0) {
						rectangle.X = 0;
						rectangle.Y = 360;
					}

					if (num13 == 1) {
						rectangle.X = 18;
						rectangle.Y = 360;
					}

					if (num13 == 2) {
						rectangle.X = 36;
						rectangle.Y = 360;
					}
				}
			} else if (
				num5 != type
				&& num5 != num14
				&& num2 == type
				&& num7 == type
				&& num4 == type
			) {
				if ((num == num14 || num == type) && num6 != num14 && num6 != type) {
					if (num13 == 0) {
						rectangle.X = 0;
						rectangle.Y = 378;
					}

					if (num13 == 1) {
						rectangle.X = 18;
						rectangle.Y = 378;
					}

					if (num13 == 2) {
						rectangle.X = 36;
						rectangle.Y = 378;
					}
				} else if ((num6 == num14 || num6 == type) && num != num14 && num != type) {
					if (num13 == 0) {
						rectangle.X = 54;
						rectangle.Y = 378;
					}

					if (num13 == 1) {
						rectangle.X = 72;
						rectangle.Y = 378;
					}

					if (num13 == 2) {
						rectangle.X = 90;
						rectangle.Y = 378;
					}
				}
			}

			if (
				(num2 == type || num2 == num14)
				&& (num7 == type || num7 == num14)
				&& (num4 == type || num4 == num14)
				&& (num5 == type || num5 == num14)
				&& num != -1
				&& num3 != -1
				&& num6 != -1
				&& num8 != -1
			) {
				if (num13 == 0) {
					rectangle.X = 18;
					rectangle.Y = 18;
				}

				if (num13 == 1) {
					rectangle.X = 36;
					rectangle.Y = 18;
				}

				if (num13 == 2) {
					rectangle.X = 54;
					rectangle.Y = 18;
				}
			}

			if (num2 == num14) {
				num2 = -2;
			}
			if (num7 == num14) {
				num7 = -2;
			}
			if (num4 == num14) {
				num4 = -2;
			}
			if (num5 == num14) {
				num5 = -2;
			}
			if (num == num14) {
				num = -2;
			}
			if (num3 == num14) {
				num3 = -2;
			}
			if (num6 == num14) {
				num6 = -2;
			}
			if (num8 == num14) {
				num8 = -2;
			}
		}

		if (
			(type == 1 || type == 2 || type == 6 || type == 7)
			&& rectangle.X == -1
			&& rectangle.Y == -1
		) {
			if (num2 >= 0 && num2 != type) {
				num2 = -1;
			}
			if (num7 >= 0 && num7 != type) {
				num7 = -1;
			}
			if (num4 >= 0 && num4 != type) {
				num4 = -1;
			}
			if (num5 >= 0 && num5 != type) {
				num5 = -1;
			}
			if (num2 != -1 && num7 != -1 && num4 != -1 && num5 != -1) {
				if (num2 == -2 && num7 == type && num4 == type && num5 == type) {
					if (num13 == 0) {
						rectangle.X = 144;
						rectangle.Y = 108;
					}

					if (num13 == 1) {
						rectangle.X = 162;
						rectangle.Y = 108;
					}

					if (num13 == 2) {
						rectangle.X = 180;
						rectangle.Y = 108;
					}

					mergeUp = true;
				} else if (num2 == type && num7 == -2 && num4 == type && num5 == type) {
					if (num13 == 0) {
						rectangle.X = 144;
						rectangle.Y = 90;
					}

					if (num13 == 1) {
						rectangle.X = 162;
						rectangle.Y = 90;
					}

					if (num13 == 2) {
						rectangle.X = 180;
						rectangle.Y = 90;
					}

					mergeDown = true;
				} else if (num2 == type && num7 == type && num4 == -2 && num5 == type) {
					if (num13 == 0) {
						rectangle.X = 162;
						rectangle.Y = 126;
					}

					if (num13 == 1) {
						rectangle.X = 162;
						rectangle.Y = 144;
					}

					if (num13 == 2) {
						rectangle.X = 162;
						rectangle.Y = 162;
					}

					mergeLeft = true;
				} else if (num2 == type && num7 == type && num4 == type && num5 == -2) {
					if (num13 == 0) {
						rectangle.X = 144;
						rectangle.Y = 126;
					}

					if (num13 == 1) {
						rectangle.X = 144;
						rectangle.Y = 144;
					}

					if (num13 == 2) {
						rectangle.X = 144;
						rectangle.Y = 162;
					}

					mergeRight = true;
				} else if (num2 == -2 && num7 == type && num4 == -2 && num5 == type) {
					if (num13 == 0) {
						rectangle.X = 36;
						rectangle.Y = 90;
					}

					if (num13 == 1) {
						rectangle.X = 36;
						rectangle.Y = 126;
					}

					if (num13 == 2) {
						rectangle.X = 36;
						rectangle.Y = 162;
					}

					mergeUp = true;
					mergeLeft = true;
				} else if (num2 == -2 && num7 == type && num4 == type && num5 == -2) {
					if (num13 == 0) {
						rectangle.X = 54;
						rectangle.Y = 90;
					}

					if (num13 == 1) {
						rectangle.X = 54;
						rectangle.Y = 126;
					}

					if (num13 == 2) {
						rectangle.X = 54;
						rectangle.Y = 162;
					}

					mergeUp = true;
					mergeRight = true;
				} else if (num2 == type && num7 == -2 && num4 == -2 && num5 == type) {
					if (num13 == 0) {
						rectangle.X = 36;
						rectangle.Y = 108;
					}

					if (num13 == 1) {
						rectangle.X = 36;
						rectangle.Y = 144;
					}

					if (num13 == 2) {
						rectangle.X = 36;
						rectangle.Y = 180;
					}

					mergeDown = true;
					mergeLeft = true;
				} else if (num2 == type && num7 == -2 && num4 == type && num5 == -2) {
					if (num13 == 0) {
						rectangle.X = 54;
						rectangle.Y = 108;
					}

					if (num13 == 1) {
						rectangle.X = 54;
						rectangle.Y = 144;
					}

					if (num13 == 2) {
						rectangle.X = 54;
						rectangle.Y = 180;
					}

					mergeDown = true;
					mergeRight = true;
				} else if (num2 == type && num7 == type && num4 == -2 && num5 == -2) {
					if (num13 == 0) {
						rectangle.X = 180;
						rectangle.Y = 126;
					}

					if (num13 == 1) {
						rectangle.X = 180;
						rectangle.Y = 144;
					}

					if (num13 == 2) {
						rectangle.X = 180;
						rectangle.Y = 162;
					}

					mergeLeft = true;
					mergeRight = true;
				} else if (num2 == -2 && num7 == -2 && num4 == type && num5 == type) {
					if (num13 == 0) {
						rectangle.X = 144;
						rectangle.Y = 180;
					}

					if (num13 == 1) {
						rectangle.X = 162;
						rectangle.Y = 180;
					}

					if (num13 == 2) {
						rectangle.X = 180;
						rectangle.Y = 180;
					}

					mergeUp = true;
					mergeDown = true;
				} else if (num2 == -2 && num7 == type && num4 == -2 && num5 == -2) {
					if (num13 == 0) {
						rectangle.X = 198;
						rectangle.Y = 90;
					}

					if (num13 == 1) {
						rectangle.X = 198;
						rectangle.Y = 108;
					}

					if (num13 == 2) {
						rectangle.X = 198;
						rectangle.Y = 126;
					}

					mergeUp = true;
					mergeLeft = true;
					mergeRight = true;
				} else if (num2 == type && num7 == -2 && num4 == -2 && num5 == -2) {
					if (num13 == 0) {
						rectangle.X = 198;
						rectangle.Y = 144;
					}

					if (num13 == 1) {
						rectangle.X = 198;
						rectangle.Y = 162;
					}

					if (num13 == 2) {
						rectangle.X = 198;
						rectangle.Y = 180;
					}

					mergeDown = true;
					mergeLeft = true;
					mergeRight = true;
				} else if (num2 == -2 && num7 == -2 && num4 == type && num5 == -2) {
					if (num13 == 0) {
						rectangle.X = 216;
						rectangle.Y = 144;
					}

					if (num13 == 1) {
						rectangle.X = 216;
						rectangle.Y = 162;
					}

					if (num13 == 2) {
						rectangle.X = 216;
						rectangle.Y = 180;
					}

					mergeUp = true;
					mergeDown = true;
					mergeRight = true;
				} else if (num2 == -2 && num7 == -2 && num4 == -2 && num5 == type) {
					if (num13 == 0) {
						rectangle.X = 216;
						rectangle.Y = 90;
					}

					if (num13 == 1) {
						rectangle.X = 216;
						rectangle.Y = 108;
					}

					if (num13 == 2) {
						rectangle.X = 216;
						rectangle.Y = 126;
					}

					mergeUp = true;
					mergeDown = true;
					mergeLeft = true;
				} else if (num2 == -2 && num7 == -2 && num4 == -2 && num5 == -2) {
					if (num13 == 0) {
						rectangle.X = 108;
						rectangle.Y = 198;
					}

					if (num13 == 1) {
						rectangle.X = 126;
						rectangle.Y = 198;
					}

					if (num13 == 2) {
						rectangle.X = 144;
						rectangle.Y = 198;
					}

					mergeUp = true;
					mergeDown = true;
					mergeLeft = true;
					mergeRight = true;
				} else if (num2 == type && num7 == type && num4 == type && num5 == type) {
					if (num == -2) {
						if (num13 == 0) {
							rectangle.X = 18;
							rectangle.Y = 108;
						}

						if (num13 == 1) {
							rectangle.X = 18;
							rectangle.Y = 144;
						}

						if (num13 == 2) {
							rectangle.X = 18;
							rectangle.Y = 180;
						}
					}

					if (num3 == -2) {
						if (num13 == 0) {
							rectangle.X = 0;
							rectangle.Y = 108;
						}

						if (num13 == 1) {
							rectangle.X = 0;
							rectangle.Y = 144;
						}

						if (num13 == 2) {
							rectangle.X = 0;
							rectangle.Y = 180;
						}
					}

					if (num6 == -2) {
						if (num13 == 0) {
							rectangle.X = 18;
							rectangle.Y = 90;
						}

						if (num13 == 1) {
							rectangle.X = 18;
							rectangle.Y = 126;
						}

						if (num13 == 2) {
							rectangle.X = 18;
							rectangle.Y = 162;
						}
					}

					if (num8 == -2) {
						if (num13 == 0) {
							rectangle.X = 0;
							rectangle.Y = 90;
						}

						if (num13 == 1) {
							rectangle.X = 0;
							rectangle.Y = 126;
						}

						if (num13 == 2) {
							rectangle.X = 0;
							rectangle.Y = 162;
						}
					}
				}
			} else if (num2 != -1 && num7 != -1 && num4 == -1 && num5 == type) {
				if (num2 == -2 && num7 == type) {
					if (num13 == 0) {
						rectangle.X = 72;
						rectangle.Y = 144;
					}

					if (num13 == 1) {
						rectangle.X = 72;
						rectangle.Y = 162;
					}

					if (num13 == 2) {
						rectangle.X = 72;
						rectangle.Y = 180;
					}

					mergeUp = true;
				} else if (num7 == -2 && num2 == type) {
					if (num13 == 0) {
						rectangle.X = 72;
						rectangle.Y = 90;
					}

					if (num13 == 1) {
						rectangle.X = 72;
						rectangle.Y = 108;
					}

					if (num13 == 2) {
						rectangle.X = 72;
						rectangle.Y = 126;
					}

					mergeDown = true;
				}
			} else if (num2 != -1 && num7 != -1 && num4 == type && num5 == -1) {
				if (num2 == -2 && num7 == type) {
					if (num13 == 0) {
						rectangle.X = 90;
						rectangle.Y = 144;
					}

					if (num13 == 1) {
						rectangle.X = 90;
						rectangle.Y = 162;
					}

					if (num13 == 2) {
						rectangle.X = 90;
						rectangle.Y = 180;
					}

					mergeUp = true;
				} else if (num7 == -2 && num2 == type) {
					if (num13 == 0) {
						rectangle.X = 90;
						rectangle.Y = 90;
					}

					if (num13 == 1) {
						rectangle.X = 90;
						rectangle.Y = 108;
					}

					if (num13 == 2) {
						rectangle.X = 90;
						rectangle.Y = 126;
					}

					mergeDown = true;
				}
			} else if (num2 == -1 && num7 == type && num4 != -1 && num5 != -1) {
				if (num4 == -2 && num5 == type) {
					if (num13 == 0) {
						rectangle.X = 0;
						rectangle.Y = 198;
					}

					if (num13 == 1) {
						rectangle.X = 18;
						rectangle.Y = 198;
					}

					if (num13 == 2) {
						rectangle.X = 36;
						rectangle.Y = 198;
					}

					mergeLeft = true;
				} else if (num5 == -2 && num4 == type) {
					if (num13 == 0) {
						rectangle.X = 54;
						rectangle.Y = 198;
					}

					if (num13 == 1) {
						rectangle.X = 72;
						rectangle.Y = 198;
					}

					if (num13 == 2) {
						rectangle.X = 90;
						rectangle.Y = 198;
					}

					mergeRight = true;
				}
			} else if (num2 == type && num7 == -1 && num4 != -1 && num5 != -1) {
				if (num4 == -2 && num5 == type) {
					if (num13 == 0) {
						rectangle.X = 0;
						rectangle.Y = 216;
					}

					if (num13 == 1) {
						rectangle.X = 18;
						rectangle.Y = 216;
					}

					if (num13 == 2) {
						rectangle.X = 36;
						rectangle.Y = 216;
					}

					mergeLeft = true;
				} else if (num5 == -2 && num4 == type) {
					if (num13 == 0) {
						rectangle.X = 54;
						rectangle.Y = 216;
					}

					if (num13 == 1) {
						rectangle.X = 72;
						rectangle.Y = 216;
					}

					if (num13 == 2) {
						rectangle.X = 90;
						rectangle.Y = 216;
					}

					mergeRight = true;
				}
			} else if (num2 != -1 && num7 != -1 && num4 == -1 && num5 == -1) {
				if (num2 == -2 && num7 == -2) {
					if (num13 == 0) {
						rectangle.X = 108;
						rectangle.Y = 216;
					}

					if (num13 == 1) {
						rectangle.X = 108;
						rectangle.Y = 234;
					}

					if (num13 == 2) {
						rectangle.X = 108;
						rectangle.Y = 252;
					}

					mergeUp = true;
					mergeDown = true;
				} else if (num2 == -2) {
					if (num13 == 0) {
						rectangle.X = 126;
						rectangle.Y = 144;
					}

					if (num13 == 1) {
						rectangle.X = 126;
						rectangle.Y = 162;
					}

					if (num13 == 2) {
						rectangle.X = 126;
						rectangle.Y = 180;
					}

					mergeUp = true;
				} else if (num7 == -2) {
					if (num13 == 0) {
						rectangle.X = 126;
						rectangle.Y = 90;
					}

					if (num13 == 1) {
						rectangle.X = 126;
						rectangle.Y = 108;
					}

					if (num13 == 2) {
						rectangle.X = 126;
						rectangle.Y = 126;
					}

					mergeDown = true;
				}
			} else if (num2 == -1 && num7 == -1 && num4 != -1 && num5 != -1) {
				if (num4 == -2 && num5 == -2) {
					if (num13 == 0) {
						rectangle.X = 162;
						rectangle.Y = 198;
					}

					if (num13 == 1) {
						rectangle.X = 180;
						rectangle.Y = 198;
					}

					if (num13 == 2) {
						rectangle.X = 198;
						rectangle.Y = 198;
					}

					mergeLeft = true;
					mergeRight = true;
				} else if (num4 == -2) {
					if (num13 == 0) {
						rectangle.X = 0;
						rectangle.Y = 252;
					}

					if (num13 == 1) {
						rectangle.X = 18;
						rectangle.Y = 252;
					}

					if (num13 == 2) {
						rectangle.X = 36;
						rectangle.Y = 252;
					}

					mergeLeft = true;
				} else if (num5 == -2) {
					if (num13 == 0) {
						rectangle.X = 54;
						rectangle.Y = 252;
					}

					if (num13 == 1) {
						rectangle.X = 72;
						rectangle.Y = 252;
					}

					if (num13 == 2) {
						rectangle.X = 90;
						rectangle.Y = 252;
					}

					mergeRight = true;
				}
			} else if (num2 == -2 && num7 == -1 && num4 == -1 && num5 == -1) {
				if (num13 == 0) {
					rectangle.X = 108;
					rectangle.Y = 144;
				}

				if (num13 == 1) {
					rectangle.X = 108;
					rectangle.Y = 162;
				}

				if (num13 == 2) {
					rectangle.X = 108;
					rectangle.Y = 180;
				}

				mergeUp = true;
			} else if (num2 == -1 && num7 == -2 && num4 == -1 && num5 == -1) {
				if (num13 == 0) {
					rectangle.X = 108;
					rectangle.Y = 90;
				}

				if (num13 == 1) {
					rectangle.X = 108;
					rectangle.Y = 108;
				}

				if (num13 == 2) {
					rectangle.X = 108;
					rectangle.Y = 126;
				}

				mergeDown = true;
			} else if (num2 == -1 && num7 == -1 && num4 == -2 && num5 == -1) {
				if (num13 == 0) {
					rectangle.X = 0;
					rectangle.Y = 234;
				}

				if (num13 == 1) {
					rectangle.X = 18;
					rectangle.Y = 234;
				}

				if (num13 == 2) {
					rectangle.X = 36;
					rectangle.Y = 234;
				}

				mergeLeft = true;
			} else if (num2 == -1 && num7 == -1 && num4 == -1 && num5 == -2) {
				if (num13 == 0) {
					rectangle.X = 54;
					rectangle.Y = 234;
				}

				if (num13 == 1) {
					rectangle.X = 72;
					rectangle.Y = 234;
				}

				if (num13 == 2) {
					rectangle.X = 90;
					rectangle.Y = 234;
				}

				mergeRight = true;
			}
		}

		if (rectangle.X < 0 || rectangle.Y < 0) {
			if (type == 2) {
				if (num2 == -2) {
					num2 = type;
				}
				if (num7 == -2) {
					num7 = type;
				}
				if (num4 == -2) {
					num4 = type;
				}
				if (num5 == -2) {
					num5 = type;
				}
				if (num == -2) {
					num = type;
				}
				if (num3 == -2) {
					num3 = type;
				}
				if (num6 == -2) {
					num6 = type;
				}
				if (num8 == -2) {
					num8 = type;
				}
			}

			if (num2 == type && num7 == type && num4 == type && num5 == type) {
				if (num != type && num3 != type) {
					if (num13 == 0) {
						rectangle.X = 108;
						rectangle.Y = 18;
					}

					if (num13 == 1) {
						rectangle.X = 126;
						rectangle.Y = 18;
					}

					if (num13 == 2) {
						rectangle.X = 144;
						rectangle.Y = 18;
					}
				} else if (num6 != type && num8 != type) {
					if (num13 == 0) {
						rectangle.X = 108;
						rectangle.Y = 36;
					}

					if (num13 == 1) {
						rectangle.X = 126;
						rectangle.Y = 36;
					}

					if (num13 == 2) {
						rectangle.X = 144;
						rectangle.Y = 36;
					}
				} else if (num != type && num6 != type) {
					if (num13 == 0) {
						rectangle.X = 180;
						rectangle.Y = 0;
					}

					if (num13 == 1) {
						rectangle.X = 180;
						rectangle.Y = 18;
					}

					if (num13 == 2) {
						rectangle.X = 180;
						rectangle.Y = 36;
					}
				} else if (num3 != type && num8 != type) {
					if (num13 == 0) {
						rectangle.X = 198;
						rectangle.Y = 0;
					}

					if (num13 == 1) {
						rectangle.X = 198;
						rectangle.Y = 18;
					}

					if (num13 == 2) {
						rectangle.X = 198;
						rectangle.Y = 36;
					}
				} else {
					if (num13 == 0) {
						rectangle.X = 18;
						rectangle.Y = 18;
					}

					if (num13 == 1) {
						rectangle.X = 36;
						rectangle.Y = 18;
					}

					if (num13 == 2) {
						rectangle.X = 54;
						rectangle.Y = 18;
					}
				}
			} else if (num2 != type && num7 == type && num4 == type && num5 == type) {
				if (num13 == 0) {
					rectangle.X = 18;
					rectangle.Y = 0;
				}

				if (num13 == 1) {
					rectangle.X = 36;
					rectangle.Y = 0;
				}

				if (num13 == 2) {
					rectangle.X = 54;
					rectangle.Y = 0;
				}
			} else if (num2 == type && num7 != type && num4 == type && num5 == type) {
				if (num13 == 0) {
					rectangle.X = 18;
					rectangle.Y = 36;
				}

				if (num13 == 1) {
					rectangle.X = 36;
					rectangle.Y = 36;
				}

				if (num13 == 2) {
					rectangle.X = 54;
					rectangle.Y = 36;
				}
			} else if (num2 == type && num7 == type && num4 != type && num5 == type) {
				if (num13 == 0) {
					rectangle.X = 0;
					rectangle.Y = 0;
				}

				if (num13 == 1) {
					rectangle.X = 0;
					rectangle.Y = 18;
				}

				if (num13 == 2) {
					rectangle.X = 0;
					rectangle.Y = 36;
				}
			} else if (num2 == type && num7 == type && num4 == type && num5 != type) {
				if (num13 == 0) {
					rectangle.X = 72;
					rectangle.Y = 0;
				}

				if (num13 == 1) {
					rectangle.X = 72;
					rectangle.Y = 18;
				}

				if (num13 == 2) {
					rectangle.X = 72;
					rectangle.Y = 36;
				}
			} else if (num2 != type && num7 == type && num4 != type && num5 == type) {
				if (num13 == 0) {
					rectangle.X = 0;
					rectangle.Y = 54;
				}

				if (num13 == 1) {
					rectangle.X = 36;
					rectangle.Y = 54;
				}

				if (num13 == 2) {
					rectangle.X = 72;
					rectangle.Y = 54;
				}
			} else if (num2 != type && num7 == type && num4 == type && num5 != type) {
				if (num13 == 0) {
					rectangle.X = 18;
					rectangle.Y = 54;
				}

				if (num13 == 1) {
					rectangle.X = 54;
					rectangle.Y = 54;
				}

				if (num13 == 2) {
					rectangle.X = 90;
					rectangle.Y = 54;
				}
			} else if (num2 == type && num7 != type && num4 != type && num5 == type) {
				if (num13 == 0) {
					rectangle.X = 0;
					rectangle.Y = 72;
				}

				if (num13 == 1) {
					rectangle.X = 36;
					rectangle.Y = 72;
				}

				if (num13 == 2) {
					rectangle.X = 72;
					rectangle.Y = 72;
				}
			} else if (num2 == type && num7 != type && num4 == type && num5 != type) {
				if (num13 == 0) {
					rectangle.X = 18;
					rectangle.Y = 72;
				}

				if (num13 == 1) {
					rectangle.X = 54;
					rectangle.Y = 72;
				}

				if (num13 == 2) {
					rectangle.X = 90;
					rectangle.Y = 72;
				}
			} else if (num2 == type && num7 == type && num4 != type && num5 != type) {
				if (num13 == 0) {
					rectangle.X = 90;
					rectangle.Y = 0;
				}

				if (num13 == 1) {
					rectangle.X = 90;
					rectangle.Y = 18;
				}

				if (num13 == 2) {
					rectangle.X = 90;
					rectangle.Y = 36;
				}
			} else if (num2 != type && num7 != type && num4 == type && num5 == type) {
				if (num13 == 0) {
					rectangle.X = 108;
					rectangle.Y = 72;
				}

				if (num13 == 1) {
					rectangle.X = 126;
					rectangle.Y = 72;
				}

				if (num13 == 2) {
					rectangle.X = 144;
					rectangle.Y = 72;
				}
			} else if (num2 != type && num7 == type && num4 != type && num5 != type) {
				if (num13 == 0) {
					rectangle.X = 108;
					rectangle.Y = 0;
				}

				if (num13 == 1) {
					rectangle.X = 126;
					rectangle.Y = 0;
				}

				if (num13 == 2) {
					rectangle.X = 144;
					rectangle.Y = 0;
				}
			} else if (num2 == type && num7 != type && num4 != type && num5 != type) {
				if (num13 == 0) {
					rectangle.X = 108;
					rectangle.Y = 54;
				}

				if (num13 == 1) {
					rectangle.X = 126;
					rectangle.Y = 54;
				}

				if (num13 == 2) {
					rectangle.X = 144;
					rectangle.Y = 54;
				}
			} else if (num2 != type && num7 != type && num4 != type && num5 == type) {
				if (num13 == 0) {
					rectangle.X = 162;
					rectangle.Y = 0;
				}

				if (num13 == 1) {
					rectangle.X = 162;
					rectangle.Y = 18;
				}

				if (num13 == 2) {
					rectangle.X = 162;
					rectangle.Y = 36;
				}
			} else if (num2 != type && num7 != type && num4 == type && num5 != type) {
				if (num13 == 0) {
					rectangle.X = 216;
					rectangle.Y = 0;
				}

				if (num13 == 1) {
					rectangle.X = 216;
					rectangle.Y = 18;
				}

				if (num13 == 2) {
					rectangle.X = 216;
					rectangle.Y = 36;
				}
			} else if (num2 != type && num7 != type && num4 != type && num5 != type) {
				if (num13 == 0) {
					rectangle.X = 162;
					rectangle.Y = 54;
				}

				if (num13 == 1) {
					rectangle.X = 180;
					rectangle.Y = 54;
				}

				if (num13 == 2) {
					rectangle.X = 198;
					rectangle.Y = 54;
				}
			}
		}

		if (rectangle.X <= -1 || rectangle.Y <= -1) {
			if (num13 <= 0) {
				rectangle.X = 18;
				rectangle.Y = 18;
			}

			if (num13 == 1) {
				rectangle.X = 36;
				rectangle.Y = 18;
			}

			if (num13 >= 2) {
				rectangle.X = 54;
				rectangle.Y = 18;
			}
		}

		Main.Tile[i, j].frameX = rectangle.X;
		Main.Tile[i, j].frameY = rectangle.Y;
		if (rectangle.X != frameX && rectangle.Y != frameY && frameX >= 0 && frameY >= 0) {
			var flag2 = mergeUp;
			var flag3 = mergeDown;
			var flag4 = mergeLeft;
			var flag5 = mergeRight;
			TileFrame(i - 1, j);
			TileFrame(i + 1, j);
			TileFrame(i, j - 1);
			TileFrame(i, j + 1);
			mergeUp = flag2;
			mergeDown = flag3;
			mergeLeft = flag4;
			mergeRight = flag5;
		}
	};
}
