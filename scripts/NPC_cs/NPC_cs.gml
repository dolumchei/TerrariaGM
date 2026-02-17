//using System;
//using Microsoft.Xna.Framework;
//
//namespace Terraria;

/* public */ function Npc() constructor {
	/* public */ static /* int */ immuneTime = 20;

	/* private */ static /* readonly int */ MaxAi = 10;

	/* private */ static /* readonly float */ Gravity = 0.3;

	/* private */ static /* readonly float */ MaxFallSpeed = 10;

	/* private */ static /* readonly int */ SpawnSpaceX = 4;

	/* private */ static /* readonly int */ SpawnSpaceY = 4;

	/* private */ static /* readonly int */ SpawnRangeX = Main.ScreenWidth / 16 * 1.2;

	/* private */ static /* readonly int */ SpawnRangeY = Main.ScreenHeight / 16 * 1.2;

	/* private */ static /* readonly int */ SafeRangeX = Main.ScreenWidth / 16 * 0.55;

	/* private */ static /* readonly int */ SafeRangeY = Main.ScreenHeight / 16 * 0.55;

	/* private */ static /* readonly int */ ActiveRangeX = Main.ScreenWidth * 2;

	/* private */ static /* readonly int */ ActiveRangeY = Main.ScreenHeight * 2;

	/* private */ static /* readonly int */ ActiveTime = 1000;

	/* private */ static /* readonly int */ DefaultSpawnRate = 700;

	/* private */ static /* readonly int */ DefaultMaxSpawns = 6;

	/* private */ static /* int */ spawnRate = DefaultSpawnRate;

	/* private */ static /* int */ maxSpawns = DefaultMaxSpawns;

	/* public bool */ active = undefined;

	/* private readonly double[] */ _ai = array_create(MaxAi, 0);

	/* private int */ _aiAction = undefined;

	/* private int */ _aiStyle = undefined;

	/* private int */ _alpha = undefined;

	/* public Color */ color = undefined;

	/* public int */ damage = undefined;

	/* public int */ defense = undefined;

	/* private int */ _direction = 1;

	/* public Rectangle */ frame = undefined;

	/* private double */ _frameCounter = undefined;

	/* public int */ height = undefined;

	/* public readonly int[] */ immune = array_create(16, 0);

	/* private float */ _knockBackResist = 1;

	/* public int */ life = undefined;

	/* public int */ lifeMax = undefined;

	/* public string */ name = undefined;

	/* public Vector2 */ position = undefined;

	/* public float */ scale = 1;

	/* private int */ _soundHit = undefined;

	/* private int */ _soundKilled = undefined;

	/* private int */ _target = -1;

	/* private Rectangle */ _targetRect = undefined;

	/* private int */ _timeLeft = undefined;

	/* public int */ type = undefined;

	/* private Vector2 */ _velocity = undefined;

	/* public int */ width = undefined;

	/* private void */ SetDefaults = function(/* int */ npcType) {
		active = true;
		_alpha = 0;
		color = new Color(); /* default */
		_frameCounter = 0.0;
		_knockBackResist = 1;
		scale = 1;
		_soundHit = 0;
		_soundKilled = 0;
		_target = -1;
		_targetRect = new Rectangle(); /* default*/
		_timeLeft = ActiveTime;
		self.type = npcType;
		for (var i = 0; i < MaxAi; i++) {
			_ai[i] = 0.0;
		}
		if (self.type == 1) {
			name = "Blue Slime";
			width = 24;
			height = 18;
			_aiStyle = 1;
			damage = 7;
			defense = 10;
			lifeMax = 30;
			_soundHit = 1;
			_soundKilled = 1;
			_alpha = 175;
			color = new Color(0, 80, 255, 100);
		}

		frame = new Rectangle(
			0,
			0,
			Main.NpcTexture[self.type].Width,
			Main.NpcTexture[self.type].Height / Main.NpcFrameCount[self.type]
		);
		width = width * scale;
		height = height * scale;
		life = lifeMax;
		if (Main.DumbAi) {
			_aiStyle = 0;
		}
	};

	/* private void */ Ai = function() {
		if (_aiStyle == 0) {
			_velocity.X *= 0.93;
			if (_velocity.X > -0.1 && _velocity.X < 0.1) {
				_velocity.X = 0;
			}
		} else {
			if (_aiStyle != 1) {
				return;
			}
			_aiAction = 0;
			if (_ai[2] == 0.0) {
				_ai[0] = -100.0;
				_ai[2] = 1.0;
			}

			if (_velocity.Y == 0) {
				_velocity.X *= 0.8;
				if (_velocity.X > -0.1 && _velocity.X < 0.1) {
					_velocity.X = 0;
				}
				_ai[0] += 1.0;
				if (_ai[0] >= 0.0) {
					_direction = FindTarget();
					if (Math.Abs(_ai[1] - 2.0) < 0.01) {
						_velocity.Y = -8;
						_velocity.X += 3 * _direction;
						_ai[0] = -100.0;
						_ai[1] = 0.0;
					} else {
						_velocity.Y = -5.5;
						_velocity.X += 2 * _direction;
						_ai[0] = -60.0;
						_ai[1] += 1.0;
					}
				} else if (_ai[0] >= -30.0) {
					_aiAction = 1;
				}
			} else if (
				_target >= 0
				&& (
					(_direction == 1 && _velocity.X < 3)
						|| (_direction == -1 && _velocity.X > -3)
				)
			) {
				if (
					(_direction == -1 && _velocity.X < 0.1)
					|| (_direction == 1 && _velocity.X > -0.1)
				) {
					_velocity.X += 0.2 * _direction;
				} else {
					_velocity.X *= 0.93;
				}
			}
		}
	};

	/* private void */ FindFrame = function() {
		var num = Main.NpcTexture[type].Height / Main.NpcFrameCount[type];
		var num2 = 0;
		if (_aiAction == 0) {
			num2 = (((_velocity.Y < 0
				? 2
				: _velocity.Y > 0)
					? 3
					: _velocity.X != 0)
						? 1
						: 0);
		} else if (_aiAction == 1) {
			num2 = 4;
		}
		if (type == 1) {
			_frameCounter += 1.0;
			if (num2 > 0) {
				_frameCounter += 1.0;
			}
			if (num2 == 4) {
				_frameCounter += 1.0;
			}
			if (_frameCounter >= 8.0) {
				frame.Y += num;
				_frameCounter = 0.0;
			}

			if (frame.Y >= num * Main.NpcFrameCount[type]) {
				frame.Y = 0;
			}
		}
	};

	/* private int */ FindTarget = function() {
		if (_target == -1) {
			var num = -1;
			for (var i = 0; i < 16; i++) {
				if (
					Main.Player[i].active
					&& !Main.Player[i].dead
					&& (
						Math.Abs(
							Main.Player[i].position.X
								+ Main.Player[i].width / 2
								- position.X
								+ width / 2
						)
							+ Math.Abs(
								Main.Player[i].position.Y
									+ Main.Player[i].height / 2
									- position.Y
									+ height / 2
							)
							< num
					)
				) {
					_target = i;
				}
			}
		}

		if (_target == -1) {
			_target = 0;
		}
		_targetRect = new Rectangle(
			Main.Player[_target].position.X,
			Main.Player[_target].position.Y,
			Main.Player[_target].width,
			Main.Player[_target].height
		);
		if (_targetRect.X + _targetRect.Width / 2 < position.X + width / 2) {
			return -1;
		}
		return 1;
	};

	/* private void */ CheckActive = function() {
		if (!active) {
			return;
		}
		var flag = false;
		var rectangle = new Rectangle(
			(position.X + width / 2 - ActiveRangeX),
			(position.Y + height / 2 - ActiveRangeY),
			ActiveRangeX * 2,
			ActiveRangeY * 2
		);
		var rectangle2 = new Rectangle(
			(position.X + width / 2 - Main.ScreenWidth * 0.5 - width),
			(position.Y + height / 2 - Main.ScreenHeight * 0.5 - height),
			Main.ScreenWidth + width * 2,
			Main.ScreenHeight + height * 2
		);
		for (var i = 0; i < 16; i++) {
			if (Main.Player[i].active) {
				if (
					rectangle.Intersects(
						new Rectangle(
							Main.Player[i].position.X,
							Main.Player[i].position.Y,
							Main.Player[i].width,
							Main.Player[i].height
						)
					)
				) {
					flag = true;
					Main.Player[i].activeNpCs++;
				}

				if (
					rectangle2.Intersects(
						new Rectangle(
							Main.Player[i].position.X,
							Main.Player[i].position.Y,
							Main.Player[i].width,
							Main.Player[i].height
						)
					)
				) {
					_timeLeft = ActiveTime;
				}
			}
		}

		_timeLeft--;
		if (_timeLeft <= 0) {
			flag = false;
		}
		if (!flag) {
			active = false;
		}
	};

	/* public */ static /* void */ SpawnNpc = function() {
		var flag = false;
		var num = 0;
		var num2 = 0;
		for (var i = 0; i < 16; i++) {
			spawnRate = DefaultSpawnRate;
			maxSpawns = DefaultMaxSpawns;
			if (!Main.dayTime) {
				spawnRate = spawnRate * 1.8;
				maxSpawns = maxSpawns * 1.8;
			}

			if (Main.Player[i].position.Y > Main.worldSurface * 16.0 + Main.ScreenHeight) {
				spawnRate = spawnRate * 1.2;
				maxSpawns = maxSpawns * 1.2;
			}

			if (
				Main.Player[i].active
				&& !Main.Player[i].dead
				&& Main.Player[i].activeNpCs < maxSpawns
				&& Main.Rand.Next(spawnRate) == 0
			) {
				var num4 = (Main.Player[i].position.X / 16) - SpawnRangeX;
				var num5 = (Main.Player[i].position.X / 16) + SpawnRangeX;
				var num6 = (Main.Player[i].position.Y / 16) - SpawnRangeY;
				var num7 = (Main.Player[i].position.Y / 16) + SpawnRangeY;
				var num8 = (Main.Player[i].position.X / 16) - SafeRangeX;
				var num9 = (Main.Player[i].position.X / 16) + SafeRangeX;
				var num10 = (Main.Player[i].position.Y / 16) - SafeRangeY;
				var num11 = (Main.Player[i].position.Y / 16) + SafeRangeY;
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
				for (var j = 0; j < spawnRate; j++) {
					var num12 = Main.Rand.Next(num4, num5);
					var num13 = Main.Rand.Next(num6, num7);
					if (
						!Main.Tile[num12, num13].active
						|| !Main.TileSolid[Main.Tile[num12, num13].type]
					) {
						if (Main.Tile[num12, num13].wall == 1) {
							continue;
						}
						for (var k = num13; k < 2501; k++) {
							if (
								Main.Tile[num12, k].active
								&& Main.TileSolid[Main.Tile[num12, k].type]
							) {
								if (
									num12 < num8
									|| num12 > num9
									|| k < num10
									|| k > num11
								) {
									num = num12;
									num2 = k;
									flag = true;
								}

								break;
							}
						}

						if (flag) {
							var num14 = num - SpawnSpaceX / 2;
							var num15 = num + SpawnSpaceX / 2;
							var num16 = num2 - SpawnSpaceY;
							var num17 = num2;
							if (num14 < 0) {
								flag = false;
							}
							if (num15 > 5001) {
								flag = false;
							}
							if (num16 < 0) {
								flag = false;
							}
							if (flag) {
								for (var l = num14; l < num15; l++) {
									for (var k = num16; k < num17; k++) {
										if (
											Main.Tile[l, k].active
											&& Main.TileSolid[Main.Tile[l, k].type]
										) {
											flag = false;
											break;
										}
									}
								}
							}
						}
					}

					if (flag) {
						break;
					}
				}
			}

			if (!flag) {
				continue;
			}
			if (num2 <= Main.worldSurface) {
				if (Main.dayTime) {
					var num18 = NewNpc(num * 16 + 8, num2 * 16, 1);
					if (Main.Rand.Next(3) == 0) {
						Main.Npc[num18].name = "Green Slime";
						Main.Npc[num18].scale = 0.9;
						Main.Npc[num18].damage = 8;
						Main.Npc[num18].defense = 7;
						Main.Npc[num18].life = 25;
						Main.Npc[num18]._knockBackResist = 1.2;
						Main.Npc[num18].lifeMax = Main.Npc[num18].life;
						Main.Npc[num18].color = new Color(0, 255, 30, 100);
					}
				} else {
					var num18 = NewNpc(num * 16 + 8, num2 * 16, 1);
					if (Main.Rand.Next(2) == 0) {
						Main.Npc[num18].name = "Purple Slime";
						Main.Npc[num18].scale = 1.2;
						Main.Npc[num18].damage = 13;
						Main.Npc[num18].defense = 15;
						Main.Npc[num18].life = 45;
						Main.Npc[num18]._knockBackResist = 0.9;
						Main.Npc[num18].lifeMax = Main.Npc[num18].life;
						Main.Npc[num18].color = new Color(200, 0, 255, 150);
					}
				}
			} else if (Main.dayTime) {
				var num18 = NewNpc(num * 16 + 8, num2 * 16, 1);
				Main.Npc[num18].name = "Red Slime";
				Main.Npc[num18].damage = 12;
				Main.Npc[num18].defense = 10;
				Main.Npc[num18].life = 40;
				Main.Npc[num18].lifeMax = Main.Npc[num18].life;
				Main.Npc[num18].color = new Color(255, 30, 0, 100);
			} else {
				var num18 = NewNpc(num * 16 + 8, num2 * 16, 1);
				Main.Npc[num18].name = "Yellow Slime";
				Main.Npc[num18].scale = 1.2;
				Main.Npc[num18].damage = 15;
				Main.Npc[num18].defense = 15;
				Main.Npc[num18].life = 50;
				Main.Npc[num18].lifeMax = Main.Npc[num18].life;
				Main.Npc[num18].color = new Color(255, 200, 0, 100);
			}

			break;
		}
	};

	/* public */ static /* int */ NewNpc = function(/* int */ x, /* int */ y, /* int */ type) {
		var num = -1;
		for (var i = 0; i < 1000; i++) {
			if (!Main.Npc[i].active) {
				num = i;
				break;
			}
		}

		if (num >= 0) {
			Main.Npc[num] = new Npc();
			Main.Npc[num].SetDefaults(type);
			Main.Npc[num].position.X = x - Main.Npc[num].width / 2;
			Main.Npc[num].position.Y = y - Main.Npc[num].height;
			Main.Npc[num].active = true;
			Main.Npc[num]._timeLeft = ActiveTime;
			return num;
		}

		return 1001;
	};

	/* public double */ StrikeNpc = function(/* int */ takenDamage, /* float */ knockBack, /* int */ hitDirection) {
		var num = Main.CalculateDamage(takenDamage, defense);
		if (num >= 1.0) {
			life -= num;
			if (knockBack > 0) {
				_velocity.Y = (0 - knockBack) * 0.75 * _knockBackResist;
				_velocity.X = knockBack * hitDirection * _knockBackResist;
			}

			HitEffect(hitDirection, num);
			if (_soundHit > 0) {
				Main.SoundInstanceNpcHit[_soundHit].Play();
			}
			if (life <= 0) {
				if (_soundKilled > 0) {
					Main.SoundInstanceNpcKilled[_soundKilled].Play();
				}
				NpcLoot();
				active = false;
			}

			return num;
		}

		return 0.0;
	};

	/* private void */ NpcLoot = function() {
		var num = 0;
		if (type == 1 && Main.Rand.Next(3) <= 1) {
			num = 23;
		}
		if (num > 0) {
			var num2 = Item.NewItem(position.X, position.Y, width, height, num);
			if (type == 1) {
				Main.Item[num2].color = color;
				Main.Item[num2].alpha = _alpha;
			}
		}
	};

	/* private void */ HitEffect(/* int */ hitDirection == 0, /* double */ dmg == 10.0);
	{
		if (type != 1) {
			return;
		}
		if (life > 0) {
			for (var i = 0; i < dmg / lifeMax * 100.0; i++) {
				Dust.NewDust(position, width, height, 4, hitDirection, -1, _alpha, color);
			}
		} else {
			for (var i = 0; i < 50; i++) {
				Dust.NewDust(
					position,
					width,
					height,
					4,
					2 * hitDirection,
					-2,
					_alpha,
					color
				);
			}
		}
	}

	/* public void */ UpdateNpc(/* int */ i);
	{
		if (!active) {
			return;
		}
		Ai();
		for (var j = 0; j < 16; j++) {
			if (immune[j] > 0) {
				immune[j]--;
			}
		}
		_velocity.Y += Gravity;
		if (_velocity.Y > MaxFallSpeed) {
			_velocity.Y = MaxFallSpeed;
		}
		if (_velocity.X < 0.1 && _velocity.X > -0.1) {
			_velocity.X = 0;
		}
		_velocity = Collision.TileCollision(position, _velocity, width, height);
		position += _velocity;
		FindFrame();
		CheckActive();
	}

	/* public Color */ GetAlpha = function(/* Color */ newColor) {
		var r = newColor.R - _alpha;
		var g = newColor.G - _alpha;
		var b = newColor.B - _alpha;
		var num = newColor.A - _alpha;
		if (num < 0) {
			num = 0;
		}
		if (num > 255) {
			num = 255;
		}
		return new Color(r, g, b, num);
	};

	/* public Color */ GetColor = function(/* Color */ newColor) {
		var num = color.R - (255 - newColor.R);
		var num2 = color.G - (255 - newColor.G);
		var num3 = color.B - (255 - newColor.B);
		var num4 = color.A - (255 - newColor.A);
		if (num < 0) {
			num = 0;
		}
		if (num2 < 0) {
			num2 = 0;
		}
		if (num3 < 0) {
			num3 = 0;
		}
		if (num4 < 0) {
			num4 = 0;
		}
		return new Color(num, num2, num3, num4);
	};
}
