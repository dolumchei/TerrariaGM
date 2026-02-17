//using System;
//using Microsoft.Xna.Framework;
//using Microsoft.Xna.Framework.Input;
//
//namespace Terraria;

/* public */ function Player() constructor {
	/* private */ static /* int */ TileRangeX = 5;

	/* private */ static /* int */ TileRangeY = 4;

	/* private */ static /* int */ tileTargetX = undefined;

	/* private */ static /* int */ tileTargetY = undefined;

	/* private */ static /* float */ MaxRunSpeed = 3;

	/* private */ static /* float */ RunAcceleration = 0.08;

	/* private */ static /* float */ RunSlowdown = 0.2;

	/* private */ static /* int */ JumpHeight = 15;

	/* private */ static /* float */ JumpSpeed = 5.01;

	/* private */ static /* float */ Gravity = 0.4;

	/* private */ static /* float */ MaxFallSpeed = 10;

	/* private */ static /* int */ ItemGrabRange = 32;

	/* private */ static /* float */ ItemGrabSpeed = 0.4;

	/* private */ static /* float */ ItemGrabSpeedMax = 4;

	/* public bool */ active = undefined;

	/* public int */ activeNpCs = undefined;

	/* public readonly Item[] */ armor = array_create(3, new Item());

	/* private int */ _body = undefined;

	/* public Rectangle */ bodyFrame = undefined;

	/* public double */ bodyFrameCounter = undefined;

	/* public Vector2 */ bodyPosition = undefined;

	/* public float */ bodyRotation = undefined;

	/* private Vector2 */ _bodyVelocity = undefined;

	/* public int */ changeItem = -1;

	/* public bool */ controlDown = undefined;

	/* private bool */ _controlJump = undefined;

	/* private bool */ _controlLeft = undefined;

	/* private bool */ _controlRight = undefined;

	/* public bool */ controlUp = undefined;

	/* private bool */ _controlUseItem = undefined;

	/* private bool */ _controlUseTile = undefined;

	/* public bool */ dead = undefined;

	/* public bool */ delayUseItem = undefined;

	/* public int */ direction = 1;

	/* private readonly int */ _head = Main.Rand.Next(2);

	/* public Rectangle */ headFrame = undefined;

	/* public double */ headFrameCounter = undefined;

	/* public Vector2 */ headPosition = undefined;

	/* public float */ headRotation = undefined;

	/* private Vector2 */ _headVelocity = undefined;

	/* public readonly int */ height = 42;

	/* private int */ _hitTile = undefined;

	/* private int */ _hitTileX = undefined;

	/* private int */ _hitTileY = undefined;

	/* private bool */ _immune = undefined;

	/* private int */ _immuneAlpha = undefined;

	/* private int */ _immuneAlphaDirection = undefined;

	/* private int */ _immuneTime = undefined;

	/* public readonly Item[] */ inventory = array_create(40, new Item());

	/* public int */ itemAnimation = undefined;

	/* private int */ _itemAnimationMax = undefined;

	/* public int */ itemHeight = undefined;

	/* public Vector2 */ itemLocation = undefined;

	/* public float */ itemRotation = undefined;

	/* private int */ _itemTime = undefined;

	/* public int */ itemWidth = undefined;

	/* private int */ _jump = undefined;

	/* public Rectangle */ legFrame = undefined;

	/* private double */ _legFrameCounter = undefined;

	/* public Vector2 */ legPosition = undefined;

	/* public float */ legRotation = undefined;

	/* private int */ _legs = undefined;

	/* private Vector2 */ _legVelocity = undefined;

	/* public bool */ mouseInterface = undefined;

	/* public string */ name = "";
	/* public Vector2 */ position = undefined;

	/* private bool */ _releaseInventory = undefined;

	/* private bool */ _releaseJump = undefined;

	/* public bool */ releaseUseItem = undefined;

	/* private bool */ _releaseUseTile = undefined;

	/* private int */ _respawnTimer = undefined;

	/* public int */ selectedItem = undefined;

	/* public bool */ showItemIcon = undefined;

	/* public int */ showItemIcon2 = undefined;

	/* public int */ statAttack = 0;

	/* private int */ _statDefense = 10;

	/* public int */ statLife = 100;

	/* public readonly int */ statLifeMax = 100;

	/* private Vector2 */ _velocity = undefined;

	/* public readonly int */ width = 20;

	/* public void */ UpdatePlayer = function(/* int */ i) {
		if (!active) {
			return;
		}
		if (dead) {
			changeItem = -1;
			itemAnimation = 0;
			_immuneAlpha += 2;
			if (_immuneAlpha > 255) {
				_immuneAlpha = 255;
			}
			_respawnTimer--;
			headPosition += _headVelocity;
			bodyPosition += _bodyVelocity;
			legPosition += _legVelocity;
			headRotation += _headVelocity.X * 0.1;
			bodyRotation += _bodyVelocity.X * 0.1;
			legRotation += _legVelocity.X * 0.1;
			_headVelocity.Y += 0.1;
			_bodyVelocity.Y += 0.1;
			_legVelocity.Y += 0.1;
			_headVelocity.X *= 0.99;
			_bodyVelocity.X *= 0.99;
			_legVelocity.X *= 0.99;
			if (_respawnTimer <= 0) {
				Spawn();
			}
			return;
		}

		if (i == Main.MyPlayer) {
			controlUp = false;
			_controlLeft = false;
			controlDown = false;
			_controlRight = false;
			_controlJump = false;
			_controlUseItem = false;
			_controlUseTile = false;
			if (Main.keyState.IsKeyDown(Keys.W)) {
				controlUp = true;
			}
			if (Main.keyState.IsKeyDown(Keys.A)) {
				_controlLeft = true;
			}
			if (Main.keyState.IsKeyDown(Keys.S)) {
				controlDown = true;
			}
			if (Main.keyState.IsKeyDown(Keys.D)) {
				_controlRight = true;
			}
			if (Main.keyState.IsKeyDown(Keys.Space)) {
				_controlJump = true;
			}
			if (Main.mouseState.LeftButton == ButtonState.Pressed && !mouseInterface) {
				_controlUseItem = true;
			}
			if (Main.mouseState.RightButton == ButtonState.Pressed && !mouseInterface) {
				_controlUseTile = true;
			}
			if (Main.keyState.IsKeyDown(Keys.Escape)) {
				if (_releaseInventory) {
					if (!Main.playerInventory) {
						Recipe.FindRecipes();
						Main.playerInventory = true;
						Main.soundMenuOpen.Play();
					} else {
						Main.playerInventory = false;
						Main.soundMenuClose.Play();
					}
				}

				_releaseInventory = false;
			} else {
				_releaseInventory = true;
			}

			if (delayUseItem) {
				if (!_controlUseItem) {
					delayUseItem = false;
				}
				_controlUseItem = false;
			}

			if (itemAnimation == 0 && _itemTime == 0) {
				if (
					(Main.keyState.IsKeyDown(Keys.Q) && inventory[selectedItem].type > 0)
					|| (
						(
							(
								Main.mouseState.LeftButton == ButtonState.Pressed
									&& !mouseInterface
									&& Main.mouseLeftRelease
							) || !Main.playerInventory
						)
							&& Main.mouseItem.type > 0
					)
				) {
					var item = new Item();
					var flag = false;
					if (
						(
							(
								Main.mouseState.LeftButton == ButtonState.Pressed
									&& !mouseInterface
									&& Main.mouseLeftRelease
							) || !Main.playerInventory
						)
						&& Main.mouseItem.type > 0
					) {
						item = inventory[selectedItem];
						inventory[selectedItem] = Main.mouseItem;
						delayUseItem = true;
						_controlUseItem = false;
						flag = true;
					}

					var num = Item.NewItem(
						position.X,
						position.Y,
						width,
						height,
						inventory[selectedItem].type
					);
					if (
						!flag
						&& inventory[selectedItem].type == 8
						&& inventory[selectedItem].stack > 1
					) {
						inventory[selectedItem].stack--;
					} else {
						inventory[selectedItem].position = Main.Item[num].position;
						Main.Item[num] = inventory[selectedItem];
						inventory[selectedItem] = new Item();
					}

					Main.Item[num].noGrabDelay = 100;
					Main.Item[num].velocity.Y = -2;
					Main.Item[num].velocity.X = 4 * direction + _velocity.X;
					if (
						(
							(
								Main.mouseState.LeftButton == ButtonState.Pressed
									&& !mouseInterface
							) || !Main.playerInventory
						)
						&& Main.mouseItem.type > 0
					) {
						inventory[selectedItem] = item;
						Main.mouseItem = new Item();
					} else {
						itemAnimation = 10;
						_itemAnimationMax = 10;
					}

					Recipe.FindRecipes();
				}

				if (!Main.playerInventory) {
					var num2 = selectedItem;
					if (Main.keyState.IsKeyDown(Keys.D1)) {
						selectedItem = 0;
					}
					if (Main.keyState.IsKeyDown(Keys.D2)) {
						selectedItem = 1;
					}
					if (Main.keyState.IsKeyDown(Keys.D3)) {
						selectedItem = 2;
					}
					if (Main.keyState.IsKeyDown(Keys.D4)) {
						selectedItem = 3;
					}
					if (Main.keyState.IsKeyDown(Keys.D5)) {
						selectedItem = 4;
					}
					if (Main.keyState.IsKeyDown(Keys.D6)) {
						selectedItem = 5;
					}
					if (Main.keyState.IsKeyDown(Keys.D7)) {
						selectedItem = 6;
					}
					if (Main.keyState.IsKeyDown(Keys.D8)) {
						selectedItem = 7;
					}
					if (Main.keyState.IsKeyDown(Keys.D9)) {
						selectedItem = 8;
					}
					if (Main.keyState.IsKeyDown(Keys.D0)) {
						selectedItem = 9;
					}
					if (num2 != selectedItem) {
						Main.soundInstanceMenuTick.Play();
					}
					var j;
					for (
						j =
							(
								Main.mouseState.ScrollWheelValue
									- Main.oldMouseState.ScrollWheelValue
							) / 120;
						j > 9;
						j -= 10
					) {}

					for (; j < 0; j += 10) {}

					selectedItem -= j;
					if (j != 0) {
						Main.soundInstanceMenuTick.Play();
					}
					if (changeItem >= 0) {
						if (selectedItem != changeItem) {
							Main.soundInstanceMenuTick.Play();
						}
						selectedItem = changeItem;
						changeItem = -1;
					}

					while (selectedItem > 9) {
						selectedItem -= 10;
					}
					while (selectedItem < 0) {
						selectedItem += 10;
					}
				} else {
					Main.focusRecipe +=
						(
							Main.mouseState.ScrollWheelValue
								- Main.oldMouseState.ScrollWheelValue
						) / 120;
					if (Main.focusRecipe > Main.numAvailableRecipes - 1) {
						Main.focusRecipe = Main.numAvailableRecipes - 1;
					}
					if (Main.focusRecipe < 0) {
						Main.focusRecipe = 0;
					}
				}
			}
		}

		if (mouseInterface) {
			delayUseItem = true;
		}
		tileTargetX = (Main.mouseState.X + Main.screenPosition.X) / 16;
		tileTargetY = (Main.mouseState.Y + Main.screenPosition.Y) / 16;
		if (_immune) {
			_immuneTime--;
			if (_immuneTime <= 0) {
				_immune = false;
			}
			_immuneAlpha += _immuneAlphaDirection * 50;
			if (_immuneAlpha <= 50) {
				_immuneAlphaDirection = 1;
			} else if (_immuneAlpha >= 205) {
				_immuneAlphaDirection = -1;
			}
		} else {
			_immuneAlpha = 0;
		}

		_statDefense = 10;
		for (var k = 0; k < 3; k++) {
			_statDefense += armor[k].defense;
		}
		_body = armor[1].bodySlot;
		_legs = armor[2].legSlot;
		headFrame.Width = 32;
		headFrame.Height = 48;
		bodyFrame.Width = 32;
		bodyFrame.Height = 48;
		legFrame.Width = 32;
		legFrame.Height = 48;
		if (_controlLeft && _velocity.X > 0 - MaxRunSpeed) {
			if (_velocity.X > RunSlowdown) {
				_velocity.X -= RunSlowdown;
			}
			_velocity.X -= RunAcceleration;
			if (itemAnimation == 0 || inventory[selectedItem].useTurn) {
				direction = -1;
			}
		} else if (_controlRight && _velocity.X < MaxRunSpeed) {
			if (_velocity.X < 0 - RunSlowdown) {
				_velocity.X += RunSlowdown;
			}
			_velocity.X += RunAcceleration;
			if (itemAnimation == 0 || inventory[selectedItem].useTurn) {
				direction = 1;
			}
		} else if (_velocity.Y == 0) {
			if (_velocity.X > RunSlowdown) {
				_velocity.X -= RunSlowdown;
			} else if (_velocity.X < 0 - RunSlowdown) {
				_velocity.X += RunSlowdown;
			} else {
				_velocity.X = 0;
			}
		} else if (_velocity.X > RunSlowdown * 0.5) {
			_velocity.X -= RunSlowdown * 0.5;
		} else if (_velocity.X < (0 - RunSlowdown) * 0.5) {
			_velocity.X += RunSlowdown * 0.5;
		} else {
			_velocity.X = 0;
		}

		if (_controlJump) {
			if (_jump > 0) {
				if (_velocity.Y > 0 - JumpSpeed + Gravity * 2) {
					_jump = 0;
				} else {
					_velocity.Y = 0 - JumpSpeed;
					_jump--;
				}
			} else if (_velocity.Y == 0 && _releaseJump) {
				_velocity.Y = 0 - JumpSpeed;
				_jump = JumpHeight;
			}

			_releaseJump = false;
		} else {
			_jump = 0;
			_releaseJump = true;
		}

		_velocity.Y += Gravity;
		if (_velocity.Y > MaxFallSpeed) {
			_velocity.Y = MaxFallSpeed;
		}
		for (var k = 0; k < 1000; k++) {
			if (!Main.Item[k].active || Main.Item[k].noGrabDelay != 0) {
				continue;
			}
			if (
				new Rectangle(position.X, position.Y, width, height).Intersects(
					new Rectangle(
						Main.Item[k].position.X,
						Main.Item[k].position.Y,
						Main.Item[k].width,
						Main.Item[k].height
					)
				)
			) {
				if (inventory[selectedItem].type != 0 || itemAnimation <= 0) {
					Main.Item[k] = GetItem(i, Main.Item[k]);
				}
			} else {
				if (
					!new Rectangle(
						position.X - ItemGrabRange,
						position.Y - ItemGrabRange,
						width + ItemGrabRange * 2,
						height + ItemGrabRange * 2
					).Intersects(
						new Rectangle(
							Main.Item[k].position.X,
							Main.Item[k].position.Y,
							Main.Item[k].width,
							Main.Item[k].height
						)
					) || !ItemSpace(Main.Item[k])
				) {
					continue;
				}
				Main.Item[k].beingGrabbed = true;
				if (
					position.X + width * 0.5
					> Main.Item[k].position.X + Main.Item[k].width * 0.5
				) {
					if (Main.Item[k].velocity.X < ItemGrabSpeedMax + _velocity.X) {
						Main.Item[k].velocity.X += ItemGrabSpeed;
					}
					if (Main.Item[k].velocity.X < 0) {
						Main.Item[k].velocity.X += ItemGrabSpeed * 0.75;
					}
				} else {
					if (Main.Item[k].velocity.X > 0 - ItemGrabSpeedMax + _velocity.X) {
						Main.Item[k].velocity.X -= ItemGrabSpeed;
					}
					if (Main.Item[k].velocity.X > 0) {
						Main.Item[k].velocity.X -= ItemGrabSpeed * 0.75;
					}
				}

				if (
					position.Y + height * 0.5
					> Main.Item[k].position.Y + Main.Item[k].height * 0.5
				) {
					if (Main.Item[k].velocity.Y < ItemGrabSpeedMax) {
						Main.Item[k].velocity.Y += ItemGrabSpeed;
					}
					if (Main.Item[k].velocity.Y < 0) {
						Main.Item[k].velocity.Y += ItemGrabSpeed * 0.75;
					}
				} else {
					if (Main.Item[k].velocity.Y > 0 - ItemGrabSpeedMax) {
						Main.Item[k].velocity.Y -= ItemGrabSpeed;
					}
					if (Main.Item[k].velocity.Y > 0) {
						Main.Item[k].velocity.Y -= ItemGrabSpeed * 0.75;
					}
				}
			}
		}

		if (
			position.X / 16 - TileRangeX <= tileTargetX
			&& (position.X + width) / 16 + TileRangeX - 1 >= tileTargetX
			&& position.Y / 16 - TileRangeY <= tileTargetY
			&& (position.Y + height) / 16 + TileRangeY - 2 >= tileTargetY
			&& Main.Tile[tileTargetX, tileTargetY].active
		) {
			if (Main.Tile[tileTargetX, tileTargetY].type == 4) {
				showItemIcon = true;
				showItemIcon2 = 8;
			}

			if (
				Main.Tile[tileTargetX, tileTargetY].type == 10
				|| Main.Tile[tileTargetX, tileTargetY].type == 11
			) {
				showItemIcon = true;
				showItemIcon2 = 25;
			}

			if (_controlUseTile) {
				if (_releaseUseTile) {
					if (Main.Tile[tileTargetX, tileTargetY].type == 4) {
						WorldGen.KillTile(tileTargetX, tileTargetY);
					} else if (Main.Tile[tileTargetX, tileTargetY].type == 10) {
						WorldGen.OpenDoor(tileTargetX, tileTargetY, direction);
					} else if (Main.Tile[tileTargetX, tileTargetY].type == 11) {
						WorldGen.CloseDoor(tileTargetX, tileTargetY);
					}
				}

				_releaseUseTile = false;
			} else {
				_releaseUseTile = true;
			}
		}

		var rectangle = new Rectangle(position.X, position.Y, width, height);
		for (var k = 0; k < 1000; k++) {
			if (
				Main.Npc[k].active
				&& rectangle.Intersects(
					new Rectangle(
						Main.Npc[k].position.X,
						Main.Npc[k].position.Y,
						Main.Npc[k].width,
						Main.Npc[k].height
					)
				)
			) {
				var hitDirection = -1;
				if (
					Main.Npc[k].position.X + Main.Npc[k].width / 2
					< position.X + width / 2
				) {
					hitDirection = 1;
				}
				Hurt(Main.Npc[k].damage, hitDirection);
			}
		}

		_velocity = Collision.TileCollision(position, _velocity, width, height);
		position += _velocity;
		ItemCheck(i);
		PlayerFrame();
		if (statLife > statLifeMax) {
			statLife = statLifeMax;
		}
	};

	/* private void */ PlayerFrame = function() {
		headFrame.X = 34 * _head;
		bodyFrame.X = 34 * _body;
		legFrame.X = 34 * _legs;
		headFrame.Y = 0;
		if (itemAnimation > 0) {
			if (
				inventory[selectedItem].useStyle == 1
				|| inventory[selectedItem].type == 0
			) {
				if (itemAnimation < _itemAnimationMax * 0.333) {
					bodyFrame.Y = 200;
				} else if (itemAnimation < _itemAnimationMax * 0.666) {
					bodyFrame.Y = 150;
				} else {
					bodyFrame.Y = 100;
				}
			} else if (inventory[selectedItem].useStyle == 2) {
				bodyFrame.Y = itemAnimation < _itemAnimationMax * 0.5 ? 150 : 200;
			} else if (inventory[selectedItem].useStyle == 3) {
				bodyFrame.Y = itemAnimation > _itemAnimationMax * 0.666 ? 100 : 200;
			}
		} else if (inventory[selectedItem].holdStyle == 1) {
			bodyFrame.Y = 200;
		} else if (_velocity.Y < 0) {
			bodyFrame.Y = 50;
		} else if (_velocity.Y > 0) {
			bodyFrame.Y = 50;
		} else {
			bodyFrame.Y = 0;
		}

		if (_velocity.Y < 0) {
			legFrame.Y = 100;
		} else if (_velocity.Y > 0) {
			legFrame.Y = 100;
		} else if (_velocity.X != 0) {
			if ((direction < 0 && _velocity.X > 0) || (direction > 0 && _velocity.X < 0)) {
				_legFrameCounter = 12.0;
			}
			_legFrameCounter += 0.4 + Math.Abs(_velocity.X * 0.4);
			if (_legFrameCounter < 6.0) {
				legFrame.Y = 0;
				return;
			}

			if (_legFrameCounter < 12.0) {
				legFrame.Y = 50;
				return;
			}

			if (_legFrameCounter < 18.0) {
				legFrame.Y = 100;
				return;
			}

			if (_legFrameCounter < 24.0) {
				legFrame.Y = 50;
				return;
			}

			legFrame.Y = 0;
			_legFrameCounter = 0.0;
		} else {
			_legFrameCounter = 6.0;
			legFrame.Y = 0;
		}
	};

	/* public void */ Spawn = function() {
		headPosition = new Vector2(); /* default */
		bodyPosition = new Vector2(); /* default */
		legPosition = new Vector2(); /* default */
		headRotation = 0;
		bodyRotation = 0;
		legRotation = 0;
		statLife = statLifeMax;
		_immune = true;
		dead = false;
		_immuneTime = 0;
		active = true;
		position.X = Main.spawnTileX * 16 + 8 - width / 2;
		position.Y = Main.spawnTileY * 16 - height;
		_velocity.X = 0;
		_velocity.Y = 0;
		for (var i = Main.spawnTileX - 1; i < Main.spawnTileX + 2; i++) {
			for (var j = Main.spawnTileY - 3; j < Main.spawnTileY; j++) {
				if (Main.TileSolid[Main.Tile[i, j].type]) {
					Main.Tile[i, j].active = false;
					Main.Tile[i, j].type = 0;
					WorldGen.SquareTileFrame(i, j);
				}
			}
		}

		Main.screenPosition.X = position.X + width / 2 - Main.ScreenWidth / 2;
		Main.screenPosition.Y = position.Y + height / 2 - Main.ScreenHeight / 2;
	};

	/* private void */ Hurt = function(/* int */ damage, /* int */ hitDirection) {
		if (_immune || Main.GodMode) {
			return;
		}
		var num = Main.CalculateDamage(damage, _statDefense);
		if (!(num >= 1.0)) {
			return;
		}
		statLife -= num;
		_immune = true;
		_immuneTime = 40;
		_velocity.X = 4.5 * hitDirection;
		_velocity.Y = -3.5;
		var num2 = Main.Rand.Next(3);
		Main.SoundInstancePlayerHit[num2].Stop();
		Main.SoundInstancePlayerHit[num2] = Main.SoundPlayerHit[num2].CreateInstance();
		Main.SoundInstancePlayerHit[num2].Play();
		if (statLife > 0) {
			for (var i = 0; i < num / statLifeMax * 100.0; i++) {
				Dust.NewDust(position, width, height, 5, 2 * hitDirection, -2);
			}
			return;
		}

		DropItems();
		Main.soundPlayerKilled.Play();
		_headVelocity.Y = Main.Rand.Next(-40, -10) * 0.1;
		_bodyVelocity.Y = Main.Rand.Next(-40, -10) * 0.1;
		_legVelocity.Y = Main.Rand.Next(-40, -10) * 0.1;
		_headVelocity.X = Main.Rand.Next(-20, 21) * 0.1 + 2 * hitDirection;
		_bodyVelocity.X = Main.Rand.Next(-20, 21) * 0.1 + 2 * hitDirection;
		_legVelocity.X = Main.Rand.Next(-20, 21) * 0.1 + 2 * hitDirection;
		for (var i = 0; i < 20.0 + num / statLifeMax * 100.0; i++) {
			Dust.NewDust(position, width, height, 5, 2 * hitDirection, -2);
		}
		dead = true;
		_respawnTimer = 300;
		_immuneAlpha = 0;
	};

	/* private bool */ ItemSpace = function(/* Item */ newItem) {
		for (var i = 0; i < 40; i++) {
			if (inventory[i].type == 0) {
				return true;
			}
		}
		for (var i = 0; i < 40; i++) {
			if (
				inventory[i].type > 0
				&& inventory[i].stack < inventory[i].maxStack
				&& newItem.IsTheSameAs(inventory[i])
			) {
				return true;
			}
		}
		return false;
	};

	/* private Item */ GetItem = function(/* int */ plr, /* Item */ newItem) {
		if (newItem.noGrabDelay > 0) {
			return newItem;
		}
		for (var i = 0; i < 40; i++) {
			if (
				inventory[i].type <= 0
				|| inventory[i].stack >= inventory[i].maxStack
				|| !newItem.IsTheSameAs(inventory[i])
			) {
				continue;
			}
			Main.soundInstanceGrab.Stop();
			Main.soundInstanceGrab = Main.soundGrab.CreateInstance();
			Main.soundInstanceGrab.Play();
			if (newItem.stack + inventory[i].stack <= inventory[i].maxStack) {
				inventory[i].stack += newItem.stack;
				if (plr == Main.MyPlayer) {
					Recipe.FindRecipes();
				}
				return new Item();
			}

			newItem.stack -= inventory[i].maxStack - inventory[i].stack;
			inventory[i].stack = inventory[i].maxStack;
			if (plr == Main.MyPlayer) {
				Recipe.FindRecipes();
			}
		}

		for (var i = 0; i < 40; i++) {
			if (inventory[i].type == 0) {
				inventory[i] = newItem;
				Main.soundInstanceGrab.Stop();
				Main.soundInstanceGrab = Main.soundGrab.CreateInstance();
				Main.soundInstanceGrab.Play();
				if (plr == Main.MyPlayer) {
					Recipe.FindRecipes();
				}
				return new Item();
			}
		}

		return newItem;
	};

	/* private void */ ItemCheck = function(/* int */ i) {
		if (inventory[selectedItem].autoReuse) {
			releaseUseItem = true;
		}
		if (
			_controlUseItem
			&& itemAnimation == 0
			&& releaseUseItem
			&& inventory[selectedItem].useStyle > 0
		) {
			itemAnimation = inventory[selectedItem].useAnimation;
			_itemAnimationMax = itemAnimation;
			if (inventory[selectedItem].useSound > 0) {
				Main.SoundInstanceItem[inventory[selectedItem].useSound].Play();
			}
		}

		if (itemAnimation > 0) {
			itemHeight = Main.ItemTexture[inventory[selectedItem].type].Height;
			itemWidth = Main.ItemTexture[inventory[selectedItem].type].Width;
			itemAnimation--;
			if (inventory[selectedItem].useStyle == 1) {
				if (itemAnimation < inventory[selectedItem].useAnimation * 0.333) {
					itemLocation.X =
						position.X
						+ width * 0.5
						+ (Main.ItemTexture[inventory[selectedItem].type].Width * 0.5 - 4)
							* direction;
					itemLocation.Y = position.Y + 24;
				} else if (itemAnimation < inventory[selectedItem].useAnimation * 0.666) {
					itemLocation.X =
						position.X
						+ width * 0.5
						+ (
							Main.ItemTexture[inventory[selectedItem].type].Width * 0.5
								- 10
						) * direction;
					itemLocation.Y = position.Y + 10;
				} else {
					itemLocation.X =
						position.X
						+ width * 0.5
						- (Main.ItemTexture[inventory[selectedItem].type].Width * 0.5 - 4)
							* direction;
					itemLocation.Y = position.Y + 6;
				}

				itemRotation =
					(itemAnimation / inventory[selectedItem].useAnimation - 0.5)
						* -direction
						* 3.5
					- direction * 0.3;
			} else if (inventory[selectedItem].useStyle == 2) {
				itemRotation =
					itemAnimation / inventory[selectedItem].useAnimation * direction * 2
					+ -1.4 * direction;
				if (itemAnimation < inventory[selectedItem].useAnimation * 0.5) {
					itemLocation.X =
						position.X
						+ width * 0.5
						+ (
							Main.ItemTexture[inventory[selectedItem].type].Width * 0.5
								- 9
								- itemRotation * 12 * direction
						) * direction;
					itemLocation.Y = position.Y + 38 + itemRotation * direction * 4;
				} else {
					itemLocation.X =
						position.X
						+ width * 0.5
						+ (
							Main.ItemTexture[inventory[selectedItem].type].Width * 0.5
								- 9
								- itemRotation * 16 * direction
						) * direction;
					itemLocation.Y = position.Y + 38 + itemRotation * direction;
				}
			} else if (inventory[selectedItem].useStyle == 3) {
				if (itemAnimation > inventory[selectedItem].useAnimation * 0.666) {
					itemLocation.X = -1000;
					itemLocation.Y = -1000;
					itemRotation = -1.3 * direction;
				} else {
					itemLocation.X =
						position.X
						+ width * 0.5
						+ (Main.ItemTexture[inventory[selectedItem].type].Width * 0.5 - 4)
							* direction;
					itemLocation.Y = position.Y + 24;
					var num =
						itemAnimation
							/ inventory[selectedItem].useAnimation
							* Main.ItemTexture[inventory[selectedItem].type].Width
							* direction
							* inventory[selectedItem].scale
							* 1.2
						- 10 * direction;
					if (num > -4 && direction == -1) {
						num = -4;
					}
					if (num < 4 && direction == 1) {
						num = 4;
					}
					itemLocation.X -= num;
					itemRotation = 0.8 * direction;
				}
			}
		} else if (inventory[selectedItem].holdStyle == 1) {
			itemLocation.X =
				position.X
				+ width * 0.5
				+ (Main.ItemTexture[inventory[selectedItem].type].Width * 0.5 + 4)
					* direction;
			itemLocation.Y = position.Y + 24;
			itemRotation = 0;
		}

		if (inventory[selectedItem].type == 8) {
			var maxValue = 20;
			if (itemAnimation > 0) {
				maxValue = 7;
			}
			if (direction == -1) {
				if (Main.Rand.Next(maxValue) == 0) {
					Dust.NewDust(
						new Vector2(itemLocation.X - 16, itemLocation.Y - 14),
						4,
						4,
						6,
						0,
						0,
						100
					);
				}
				Lighting.AddLight(
					((itemLocation.X - 16 + _velocity.X) / 16),
					((itemLocation.Y - 14) / 16),
					byte.MaxValue
				);
			} else {
				Main.screenPosition.X = position.X + width * 0.5 - Main.ScreenWidth * 0.5;
				Main.screenPosition.Y =
					position.Y
					+ height * 0.5
					- Main.ScreenHeight * 0.5;
				if (Main.Rand.Next(maxValue) == 0) {
					Dust.NewDust(
						new Vector2(itemLocation.X + 6, itemLocation.Y - 14),
						4,
						4,
						6,
						0,
						0,
						100
					);
				}
				Lighting.AddLight(
					((itemLocation.X + 6 + _velocity.X) / 16),
					((itemLocation.Y - 14) / 16),
					byte.MaxValue
				);
			}
		}

		releaseUseItem = !_controlUseItem;
		if (_itemTime > 0) {
			_itemTime--;
		}
		if (i != Main.MyPlayer) {
			return;
		}
		if (
			(
				inventory[selectedItem].pick > 0
					|| inventory[selectedItem].axe > 0
					|| inventory[selectedItem].hammer > 0
			)
			&& position.X / 16 - TileRangeX - inventory[selectedItem].tileBoost
				<= tileTargetX
			&& (position.X + width) / 16
				+ TileRangeX
				+ inventory[selectedItem].tileBoost
				- 1
				>= tileTargetX
			&& position.Y / 16 - TileRangeY - inventory[selectedItem].tileBoost
				<= tileTargetY
			&& (position.Y + height) / 16
				+ TileRangeY
				+ inventory[selectedItem].tileBoost
				- 2
				>= tileTargetY
		) {
			showItemIcon = true;
			if (
				Main.Tile[tileTargetX, tileTargetY].active
				&& _itemTime == 0
				&& itemAnimation > 0
				&& _controlUseItem
			) {
				if (_hitTileX != tileTargetX || _hitTileY != tileTargetY) {
					_hitTile = 0;
					_hitTileX = tileTargetX;
					_hitTileY = tileTargetY;
				}

				if (Main.TileNoFail[Main.Tile[tileTargetX, tileTargetY].type]) {
					_hitTile = 100;
				}
				if (
					Main.Tile[tileTargetX, tileTargetY].type == 5
					|| Main.Tile[tileTargetX, tileTargetY].type == 10
					|| Main.Tile[tileTargetX, tileTargetY].type == 11
				) {
					_hitTile += inventory[selectedItem].axe;
					if (inventory[selectedItem].axe > 0) {
						if (_hitTile >= 100) {
							_hitTile = 0;
							WorldGen.KillTile(tileTargetX, tileTargetY);
						} else {
							WorldGen.KillTile(tileTargetX, tileTargetY, true);
						}

						_itemTime = inventory[selectedItem].useTime;
					}
				} else if (inventory[selectedItem].pick > 0) {
					_hitTile += inventory[selectedItem].pick;
					if (_hitTile >= 100) {
						_hitTile = 0;
						WorldGen.KillTile(tileTargetX, tileTargetY);
					} else {
						WorldGen.KillTile(tileTargetX, tileTargetY, true);
					}

					_itemTime = inventory[selectedItem].useTime;
				}
			}

			if (
				Main.Tile[tileTargetX, tileTargetY].wall > 0
				&& _itemTime == 0
				&& itemAnimation > 0
				&& _controlUseItem
				&& inventory[selectedItem].hammer > 0
			) {
				if (_hitTileX != tileTargetX || _hitTileY != tileTargetY) {
					_hitTile = 0;
					_hitTileX = tileTargetX;
					_hitTileY = tileTargetY;
				}

				_hitTile += inventory[selectedItem].hammer;
				if (_hitTile >= 100) {
					_hitTile = 0;
					WorldGen.KillWall(tileTargetX, tileTargetY);
				} else {
					WorldGen.KillWall(tileTargetX, tileTargetY, true);
				}

				_itemTime = inventory[selectedItem].useTime;
			}
		}

		if (inventory[selectedItem].createTile >= 0) {
			tileTargetX = (Main.mouseState.X + Main.screenPosition.X) / 16;
			tileTargetY = (Main.mouseState.Y + Main.screenPosition.Y) / 16;
			if (
				position.X / 16 - TileRangeX - inventory[selectedItem].tileBoost
					<= tileTargetX
				&& (position.X + width) / 16
					+ TileRangeX
					+ inventory[selectedItem].tileBoost
					- 1
					>= tileTargetX
				&& position.Y / 16 - TileRangeY - inventory[selectedItem].tileBoost
					<= tileTargetY
				&& (position.Y + height) / 16
					+ TileRangeY
					+ inventory[selectedItem].tileBoost
					- 2
					>= tileTargetY
			) {
				showItemIcon = true;
				if (
					!Main.Tile[tileTargetX, tileTargetY].active
					&& _itemTime == 0
					&& itemAnimation > 0
					&& _controlUseItem
					&& (
						Main.Tile[tileTargetX + 1, tileTargetY].active
							|| Main.Tile[tileTargetX + 1, tileTargetY].wall > 0
							|| Main.Tile[tileTargetX - 1, tileTargetY].active
							|| Main.Tile[tileTargetX - 1, tileTargetY].wall > 0
							|| Main.Tile[tileTargetX, tileTargetY + 1].active
							|| Main.Tile[tileTargetX, tileTargetY + 1].wall > 0
							|| Main.Tile[tileTargetX, tileTargetY - 1].active
							|| Main.Tile[tileTargetX, tileTargetY - 1].wall > 0
					)
				) {
					WorldGen.PlaceTile(
						tileTargetX,
						tileTargetY,
						inventory[selectedItem].createTile
					);
					if (Main.Tile[tileTargetX, tileTargetY].active) {
						_itemTime = inventory[selectedItem].useTime;
					}
				}
			}
		}

		if (inventory[selectedItem].createWall >= 0) {
			tileTargetX = (Main.mouseState.X + Main.screenPosition.X) / 16;
			tileTargetY = (Main.mouseState.Y + Main.screenPosition.Y) / 16;
			if (
				position.X / 16 - TileRangeX - inventory[selectedItem].tileBoost
					<= tileTargetX
				&& (position.X + width) / 16
					+ TileRangeX
					+ inventory[selectedItem].tileBoost
					- 1
					>= tileTargetX
				&& position.Y / 16 - TileRangeY - inventory[selectedItem].tileBoost
					<= tileTargetY
				&& (position.Y + height) / 16
					+ TileRangeY
					+ inventory[selectedItem].tileBoost
					- 2
					>= tileTargetY
			) {
				showItemIcon = true;
				if (
					_itemTime == 0
					&& itemAnimation > 0
					&& _controlUseItem
					&& (
						Main.Tile[tileTargetX + 1, tileTargetY].active
							|| Main.Tile[tileTargetX + 1, tileTargetY].wall > 0
							|| Main.Tile[tileTargetX - 1, tileTargetY].active
							|| Main.Tile[tileTargetX - 1, tileTargetY].wall > 0
							|| Main.Tile[tileTargetX, tileTargetY + 1].active
							|| Main.Tile[tileTargetX, tileTargetY + 1].wall > 0
							|| Main.Tile[tileTargetX, tileTargetY - 1].active
							|| Main.Tile[tileTargetX, tileTargetY - 1].wall > 0
					)
					&& Main.Tile[tileTargetX, tileTargetY].wall
						!= inventory[selectedItem].createWall
				) {
					WorldGen.PlaceWall(
						tileTargetX,
						tileTargetY,
						inventory[selectedItem].createWall
					);
					if (
						Main.Tile[tileTargetX, tileTargetY].wall
						== inventory[selectedItem].createWall
					) {
						_itemTime = inventory[selectedItem].useTime;
					}
				}
			}
		}

		if (
			inventory[selectedItem].damage >= 0
			&& inventory[selectedItem].type > 0
			&& itemAnimation > 0
		) {
			var flag = false;
			var rectangle = new Rectangle(
				itemLocation.X,
				itemLocation.Y,
				Main.ItemTexture[inventory[selectedItem].type].Width,
				Main.ItemTexture[inventory[selectedItem].type].Height
			);
			rectangle.Width = rectangle.Width * inventory[selectedItem].scale;
			rectangle.Height = rectangle.Height * inventory[selectedItem].scale;
			if (direction == -1) {
				rectangle.X -= rectangle.Width;
			}
			rectangle.Y -= rectangle.Height;
			if (inventory[selectedItem].useStyle == 1) {
				if (itemAnimation < inventory[selectedItem].useAnimation * 0.333) {
					if (direction == -1) {
						rectangle.X -= rectangle.Width * 1.4 - rectangle.Width;
					}
					rectangle.Width = rectangle.Width * 1.4;
					rectangle.Y += rectangle.Height * 0.5;
					rectangle.Height = rectangle.Height * 1.1;
				} else if (
					!(itemAnimation < inventory[selectedItem].useAnimation * 0.666)
				) {
					if (direction == 1) {
						rectangle.X -= rectangle.Width * 2;
					}
					rectangle.Width *= 2;
					rectangle.Y -= rectangle.Height * 1.4 - rectangle.Height;
					rectangle.Height = rectangle.Height * 1.4;
				}
			} else if (inventory[selectedItem].useStyle == 3) {
				if (itemAnimation > inventory[selectedItem].useAnimation * 0.666) {
					flag = true;
				} else {
					if (direction == -1) {
						rectangle.X -= rectangle.Width * 1.4 - rectangle.Width;
					}
					rectangle.Width = rectangle.Width * 1.4;
					rectangle.Y += rectangle.Height * 0.6;
					rectangle.Height = rectangle.Height * 0.6;
				}
			}

			if (!flag) {
				var num2 = rectangle.X / 16;
				var num3 = (rectangle.X + rectangle.Width) / 16 + 1;
				var num4 = rectangle.Y / 16;
				var num5 = (rectangle.Y + rectangle.Height) / 16 + 1;
				for (var j = num2; j < num3; j++) {
					for (var k = num4; k < num5; k++) {
						if (Main.Tile[j, k].type == 3) {
							WorldGen.KillTile(j, k);
						}
					}
				}

				for (var l = 0; l < 1000; l++) {
					if (
						Main.Npc[l].active
						&& Main.Npc[l].immune[i] == 0
						&& rectangle.Intersects(
							new Rectangle(
								Main.Npc[l].position.X,
								Main.Npc[l].position.Y,
								Main.Npc[l].width,
								Main.Npc[l].height
							)
						)
					) {
						Main.Npc[l].StrikeNpc(
							inventory[selectedItem].damage,
							inventory[selectedItem].knockBack,
							direction
						);
						Main.Npc[l].immune[i] = itemAnimation;
					}
				}
			}
		}

		if (_itemTime == 0 && inventory[selectedItem].healLife > 0 && itemAnimation > 0) {
			statLife += inventory[selectedItem].healLife;
			_itemTime = inventory[selectedItem].useTime;
		}

		if (
			_itemTime == inventory[selectedItem].useTime
			&& inventory[selectedItem].consumable
		) {
			inventory[selectedItem].stack--;
			if (inventory[selectedItem].stack <= 0) {
				_itemTime = itemAnimation;
			}
		}

		if (inventory[selectedItem].stack <= 0 && itemAnimation == 0) {
			inventory[selectedItem] = new Item();
		}
	};

	/* public Color */ GetImmuneAlpha = function(/* Color */ newColor) {
		var r = newColor.R - _immuneAlpha;
		var g = newColor.G - _immuneAlpha;
		var b = newColor.B - _immuneAlpha;
		var num = newColor.A - _immuneAlpha;
		if (num < 0) {
			num = 0;
		}
		if (num > 255) {
			num = 255;
		}
		return new Color(r, g, b, num);
	};

	/* public Color */ GetDeathAlpha = function(/* Color */ newColor) {
		var r = newColor.R + (_immuneAlpha * 0.9);
		var g = newColor.G + (_immuneAlpha * 0.5);
		var b = newColor.B + (_immuneAlpha * 0.5);
		var num = newColor.A + (_immuneAlpha * 0.4);
		if (num < 0) {
			num = 0;
		}
		if (num > 255) {
			num = 255;
		}
		return new Color(r, g, b, num);
	};

	/* private void */ DropItems = function() {
		for (var i = 10; i < 40; i++) {
			var num = Item.NewItem(
				position.X,
				position.Y,
				width,
				height,
				inventory[i].type
			);
			inventory[i].position = Main.Item[num].position;
			Main.Item[num] = inventory[i];
			inventory[i] = new Item();
			selectedItem = 0;
			Main.Item[num].velocity.Y = Main.Rand.Next(-20, 1) * 0.1;
			Main.Item[num].velocity.X = Main.Rand.Next(-20, 21) * 0.1;
			Main.Item[num].noGrabDelay = 100;
		}
	};

	/* public */ static /* void */ SetupPlayers = function() {
		for (var i = 0; i < 16; i++) {
			var __GML_new_Player = new Player();
			with (__GML_new_Player) {
				name = "Some n00b";
				armor = [new Item(), new Item(), new Item()];
			}
			Main.Player[i] = __GML_new_Player;

			for (var j = 0; j < 40; j++) {
				Main.Player[i].inventory[j] = new Item();
			}
			Main.Player[i].inventory[0].SetDefaults("Copper Pickaxe");
			Main.Player[i].inventory[1].SetDefaults("Copper Axe");
			Main.Player[i].inventory[2].SetDefaults("Copper Hammer");
			Main.Player[i].inventory[30].SetDefaults(16);
			Main.Player[i].inventory[31].SetDefaults(18);
			Main.Player[i].armor[1].SetDefaults(15);
			Main.Player[i].armor[2].SetDefaults(17);
		}
	};
}
