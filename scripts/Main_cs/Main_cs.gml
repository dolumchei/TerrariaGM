//using System;
//using Microsoft.Xna.Framework;
//using Microsoft.Xna.Framework.Audio;
//using Microsoft.Xna.Framework.Graphics;
//using Microsoft.Xna.Framework.Input;
//
//namespace Terraria;

/* public */ function Main() constructor {
	/* public const float */ leftWorld = 0;

	/* public const float */ rightWorld = 80000;

	/* public const float */ topWorld = 0;

	/* public const float */ bottomWorld = 40000;

	/* public const int */ maxTilesX = 5001;

	/* public const int */ maxTilesY = 2501;

	/* public const int */ maxTileSets = 12;

	/* public const int */ maxWallTypes = 2;

	/* public const int */ maxBackgrounds = 3;

	/* public const int */ maxDust = 1000;

	/* public const int */ maxPlayers = 16;

	/* public const int */ maxItemTypes = 27;

	/* public const int */ maxItems = 1000;

	/* public const int */ maxNpcTypes = 2;

	/* public const int */ maxNpCs = 1000;

	/* public const int */ maxInventory = 40;

	/* public const int */ maxItemSounds = 2;

	/* public const int */ maxNpcHitSounds = 1;

	/* public const int */ maxNpcKilledSounds = 1;

	/* public const double */ dayLength = 40000.0;

	/* public const double */ nightLength = 30000.0;

	/* public */ static /* MouseState */ mouseState = Mouse.GetState();

	/* public */ static /* MouseState */ oldMouseState = Mouse.GetState();

	/* public */ static /* KeyboardState */ keyState = Keyboard.GetState();

	/* private */ static /* readonly bool */ DebugMode = false;

	/* public */ static /* readonly bool */ GodMode = true;

	/* public */ static /* readonly bool */ DumbAi = true;

	/* private */ static /* readonly int */ Background = 0;

	/* public */ static /* Color */ tileColor = undefined;

	/* public */ static /* double */ worldSurface = undefined;

	/* private */ static /* bool */ dayTime = true;

	/* private */ static /* double */ time = 10000.0;

	/* private */ static /* int */ moonPhase = undefined;

	/* public */ static /* readonly Random */ Rand = new Random();

	/* private */ static /* Texture2D */ playerHeadTexture = undefined;

	/* private */ static /* Texture2D */ playerBodyTexture = undefined;

	/* private */ static /* Texture2D */ playerLegTexture = undefined;

	/* public */ static /* readonly Texture2D[] */ ItemTexture = array_create(27, new Texture2D());

	/* public */ static /* readonly Texture2D[] */ NpcTexture = array_create(2, new Texture2D());

	/* private */ static /* Texture2D */ hotbarTexture = undefined;

	/* private */ static /* Texture2D */ cursorTexture = undefined;

	/* private */ static /* Texture2D */ dustTexture = undefined;

	/* private */ static /* Texture2D */ sunTexture = undefined;

	/* private */ static /* Texture2D */ moonTexture = undefined;

	/* private */ static /* readonly Texture2D[] */ TileTexture = array_create(12, new Texture2D());

	/* private */ static /* Texture2D */ blackTileTexture = undefined;

	/* private */ static /* readonly Texture2D[] */ WallTexture = array_create(2, new Texture2D());

	/* private */ static /* readonly Texture2D[] */ BackgroundTexture = array_create(3, new Texture2D());

	/* private */ static /* Texture2D */ heartTexture = undefined;

	/* private */ static /* Texture2D */ treeTopTexture = undefined;

	/* private */ static /* Texture2D */ treeBranchTexture = undefined;

	/* private */ static /* Texture2D */ inventoryBackTexture = undefined;

	/* public */ static /* readonly SoundEffect[] */ SoundDig = array_create(3, new SoundEffect());

	/* public */ static /* readonly SoundEffectInstance[] */ SoundInstanceDig = array_create(3, new SoundEffectInstance());

	/* public */ static /* readonly SoundEffect[] */ SoundPlayerHit = array_create(3, new SoundEffect());

	/* public */ static /* readonly SoundEffectInstance[] */ SoundInstancePlayerHit =
		array_create(3, new SoundEffectInstance());

	/* public */ static /* SoundEffect */ soundPlayerKilled = undefined;

	/* public */ static /* SoundEffectInstance */ soundInstancePlayerKilled = undefined;

	/* public */ static /* SoundEffect */ soundGrass = undefined;

	/* public */ static /* SoundEffectInstance */ soundInstanceGrass = undefined;

	/* public */ static /* SoundEffect */ soundGrab = undefined;

	/* public */ static /* SoundEffectInstance */ soundInstanceGrab = undefined;

	/* private */ static /* readonly SoundEffect[] */ SoundItem = array_create(3, new SoundEffect());

	/* public */ static /* readonly SoundEffectInstance[] */ SoundInstanceItem = array_create(3, new SoundEffectInstance());

	/* private */ static /* readonly SoundEffect[] */ SoundNpcHit = array_create(2, new SoundEffect());

	/* public */ static /* readonly SoundEffectInstance[] */ SoundInstanceNpcHit = array_create(2, new SoundEffectInstance());

	/* private */ static /* readonly SoundEffect[] */ SoundNpcKilled = array_create(2, new SoundEffect());

	/* public */ static /* readonly SoundEffectInstance[] */ SoundInstanceNpcKilled =
		array_create(2, new SoundEffectInstance());

	/* public */ static /* SoundEffect */ soundDoorOpen = undefined;

	/* public */ static /* SoundEffectInstance */ soundInstanceDoorOpen = undefined;

	/* public */ static /* SoundEffect */ soundDoorClosed = undefined;

	/* public */ static /* SoundEffectInstance */ soundInstanceDoorClosed = undefined;

	/* public */ static /* SoundEffect */ soundMenuOpen = undefined;

	/* public */ static /* SoundEffect */ soundMenuClose = undefined;

	/* public */ static /* SoundEffect */ soundMenuTick = undefined;

	/* public */ static /* SoundEffectInstance */ soundInstanceMenuTick = undefined;

	/* private */ static /* SpriteFont */ fontItemStack = undefined;

	/* private */ static /* SpriteFont */ fontMouseText = undefined;

	/* private */ static /* SpriteFont */ fontDeathText = undefined;

	/* public */ static /* readonly bool[] */ TileSolid = array_create(12, false);

	/* public */ static /* readonly bool[] */ TileNoFail = array_create(12, false);

	/* private */ static /* readonly int[] */ BackgroundWidth = array_create(3, 0);

	/* private */ static /* readonly int[] */ BackgroundHeight = array_create(3, 0);

	/* public */ static /* readonly Tile[,] */ Tile = ds_grid_create(5001, 2501);
	ds_grid_clear(Tile, new Tile());

	/* public */ static /* readonly Dust[] */ Dust = array_create(1000, new Dust());

	/* public */ static /* readonly Item[] */ Item = array_create(1000, new Item());

	/* public */ static /* readonly Npc[] */ Npc = array_create(1001, new Npc());

	/* public */ static /* Vector2 */ screenPosition = undefined;

	/* public */ static /* readonly int */ ScreenWidth = 800;

	/* public */ static /* readonly int */ ScreenHeight = 600;

	/* private */ static /* readonly float[] */ HotbarScale = [
		1,
		0.75,
		0.75,
		0.75,
		0.75,
		0.75,
		0.75,
		0.75,
		0.75,
		0.75
	];

	/* private */ static /* byte */ mouseTextColor = undefined;

	/* private */ static /* int */ mouseTextColorChange = 1;

	/* public */ static /* bool */ mouseLeftRelease = undefined;

	/* public */ static /* bool */ playerInventory = false;

	/* public */ static /* Item */ mouseItem = new Item();

	/* private */ static /* float */ inventoryScale = 0.75;

	/* public */ static /* readonly Recipe[]*/ Recipe = array_create(Terraria.Recipe.MaxRecipes, new Recipe());

	/* public */ static /* readonly int[] */ AvailableRecipe = array_create(Terraria.Recipe.MaxRecipes, 0);

	/* public */ static /* readonly float[] */ AvailableRecipeY = array_create(Terraria.Recipe.MaxRecipes, 0);

	/* public */ static /* int */ numAvailableRecipes = undefined;

	/* public */ static /* int */ focusRecipe = undefined;

	/* public */ static /* readonly int */ MyPlayer = 0;

	/* public */ static /* readonly Player[] */ Player = array_create(16, new Player());

	/* public */ static /* int */ spawnTileX = undefined;

	/* public */ static /* int */ spawnTileY = undefined;

	/* public */ static /* readonly int[] */ NpcFrameCount = [1, 2];

	/* private readonly GraphicsDeviceManager */ _graphics = undefined;

	/* private SpriteBatch */ _spriteBatch = undefined;

	/* private bool */ _toggleFullscreen = undefined;

	/* public */ Main = function() {
		_graphics = new GraphicsDeviceManager(self);
		Content.RootDirectory = "Content";
	};

	/* protected override void */ Initialize = function() {
		Window.Title = "Terraria: Dig Peon, Dig!";
		for (var i = 0; i < 5001; i++) {
			for (var j = 0; j < 2501; j++) {
				Tile[i, j] = new Tile();
			}
		}

		TileSolid[0] = true;
		TileSolid[1] = true;
		TileSolid[2] = true;
		TileSolid[3] = false;
		TileNoFail[3] = true;
		TileSolid[4] = false;
		TileNoFail[4] = true;
		TileSolid[5] = false;
		TileSolid[6] = true;
		TileSolid[7] = true;
		TileSolid[8] = true;
		TileSolid[9] = true;
		TileSolid[10] = true;
		TileSolid[11] = false;
		for (var i = 0; i < 1000; i++) {
			Dust[i] = new Dust();
		}
		for (var i = 0; i < 1000; i++) {
			Item[i] = new Item();
		}
		for (var i = 0; i < 1000; i++) {
			Npc[i] = new Npc();
		}
		Terraria.Player.SetupPlayers();
		for (var i = 0; i < Terraria.Recipe.MaxRecipes; i++) {
			Recipe[i] = new Recipe();
			AvailableRecipeY[i] = 65 * i;
		}

		Terraria.Recipe.SetupRecipes();
		_graphics.PreferredBackBufferWidth = ScreenWidth;
		_graphics.PreferredBackBufferHeight = ScreenHeight;
		_graphics.ApplyChanges();
		WorldGen.GenerateWorld();
		base.Initialize();
	};

	/* protected override void */ LoadContent = function() {
		_spriteBatch = new SpriteBatch(GraphicsDevice);
		for (var i = 0; i < 12; i++) {
			TileTexture[i] = Content.Load("Texture2D", "Images\\Tiles_" + i);
		}
		for (var i = 1; i < 2; i++) {
			WallTexture[i] = Content.Load("Texture2D", "Images\\Wall_" + i);
		}
		for (var i = 0; i < 3; i++) {
			BackgroundTexture[i] = Content.Load("Texture2D", "Images\\Background_" + i);
			BackgroundWidth[i] = BackgroundTexture[i].Width;
			BackgroundHeight[i] = BackgroundTexture[i].Height;
		}

		for (var i = 0; i < 27; i++) {
			ItemTexture[i] = Content.Load("Texture2D", "Images\\Item_" + i);
		}
		for (var i = 0; i < 2; i++) {
			NpcTexture[i] = Content.Load("Texture2D", "Images\\NPC_" + i);
		}
		hotbarTexture = Content.Load("Texture2D", "Images\\Hotbar");
		dustTexture = Content.Load("Texture2D", "Images\\Dust");
		sunTexture = Content.Load("Texture2D", "Images\\Sun");
		moonTexture = Content.Load("Texture2D", "Images\\Moon");
		blackTileTexture = Content.Load("Texture2D", "Images\\Black_Tile");
		heartTexture = Content.Load("Texture2D", "Images\\Heart");
		cursorTexture = Content.Load("Texture2D", "Images\\Cursor");
		treeTopTexture = Content.Load("Texture2D", "Images\\Tree_Tops");
		treeBranchTexture = Content.Load("Texture2D", "Images\\Tree_Branches");
		inventoryBackTexture = Content.Load("Texture2D", "Images\\Inventory_Back");
		playerHeadTexture = Content.Load("Texture2D", "Images\\Character_Heads");
		playerBodyTexture = Content.Load("Texture2D", "Images\\Character_Bodies");
		playerLegTexture = Content.Load("Texture2D", "Images\\Character_Legs");
		soundGrab = Content.Load("SoundEffect", "Sounds\\Grab");
		soundInstanceGrab = soundGrab.CreateInstance();
		SoundDig[0] = Content.Load("SoundEffect", "Sounds\\Dig_0");
		SoundInstanceDig[0] = SoundDig[0].CreateInstance();
		SoundDig[1] = Content.Load("SoundEffect", "Sounds\\Dig_1");
		SoundInstanceDig[1] = SoundDig[1].CreateInstance();
		SoundDig[2] = Content.Load("SoundEffect", "Sounds\\Dig_2");
		SoundInstanceDig[2] = SoundDig[2].CreateInstance();
		SoundPlayerHit[0] = Content.Load("SoundEffect", "Sounds\\Player_Hit_0");
		SoundInstancePlayerHit[0] = SoundPlayerHit[0].CreateInstance();
		SoundPlayerHit[1] = Content.Load("SoundEffect", "Sounds\\Player_Hit_1");
		SoundInstancePlayerHit[1] = SoundPlayerHit[1].CreateInstance();
		SoundPlayerHit[2] = Content.Load("SoundEffect", "Sounds\\Player_Hit_2");
		SoundInstancePlayerHit[2] = SoundPlayerHit[2].CreateInstance();
		soundPlayerKilled = Content.Load("SoundEffect", "Sounds\\Player_Killed");
		soundInstancePlayerKilled = soundPlayerKilled.CreateInstance();
		soundGrass = Content.Load("SoundEffect", "Sounds\\Grass");
		soundInstanceGrass = soundGrass.CreateInstance();
		soundDoorOpen = Content.Load("SoundEffect", "Sounds\\Door_Opened");
		soundInstanceDoorOpen = soundDoorOpen.CreateInstance();
		soundDoorClosed = Content.Load("SoundEffect", "Sounds\\Door_Closed");
		soundInstanceDoorClosed = soundDoorClosed.CreateInstance();
		soundMenuTick = Content.Load("SoundEffect", "Sounds\\Menu_Tick");
		soundInstanceMenuTick = soundMenuTick.CreateInstance();
		soundMenuOpen = Content.Load("SoundEffect", "Sounds\\Menu_Open");
		soundMenuClose = Content.Load("SoundEffect", "Sounds\\Menu_Close");
		for (var i = 1; i < 3; i++) {
			SoundItem[i] = Content.Load("SoundEffect", "Sounds\\Item_" + i);
			SoundInstanceItem[i] = SoundItem[i].CreateInstance();
		}

		for (var i = 1; i < 2; i++) {
			SoundNpcHit[i] = Content.Load("SoundEffect", "Sounds\\NPC_Hit_" + i);
			SoundInstanceNpcHit[i] = SoundNpcHit[i].CreateInstance();
		}

		for (var i = 1; i < 2; i++) {
			SoundNpcKilled[i] = Content.Load("SoundEffect", "Sounds\\NPC_Killed_" + i);
			SoundInstanceNpcKilled[i] = SoundNpcKilled[i].CreateInstance();
		}

		fontItemStack = Content.Load("SpriteFont", "Fonts\\Item_Stack");
		fontMouseText = Content.Load("SpriteFont", "Fonts\\Mouse_Text");
		fontDeathText = Content.Load("SpriteFont", "Fonts\\Death_Text");
	};

	/* protected override void */ UnloadContent = function() {};

	/* protected override void */ Update = function(/* GameTime */ gameTime) {
		if (!IsActive) {
			IsMouseVisible = true;
			Player[MyPlayer].delayUseItem = true;
			mouseLeftRelease = false;
			return;
		}

		IsMouseVisible = false;
		if (
			keyState.IsKeyDown(Keys.LeftAlt)
			|| (keyState.IsKeyDown(Keys.RightAlt) && keyState.IsKeyDown(Keys.Enter))
		) {
			if (_toggleFullscreen) {
				_graphics.ToggleFullScreen();
			}
			_toggleFullscreen = false;
		} else {
			_toggleFullscreen = true;
		}

		oldMouseState = mouseState;
		mouseState = Mouse.GetState();
		keyState = Keyboard.GetState();
		if (DebugMode) {
			UpdateDebug();
		}
		for (var i = 0; i < 16; i++) {
			Player[i].UpdatePlayer(i);
		}
		Terraria.Npc.SpawnNpc();
		for (var i = 0; i < 16; i++) {
			Player[i].activeNpCs = 0;
		}
		for (var i = 0; i < 1000; i++) {
			Npc[i].UpdateNpc(i);
		}
		for (var i = 0; i < 1000; i++) {
			Item[i].UpdateItem(i);
		}
		Terraria.Dust.UpdateDust();
		UpdateTime();
		WorldGen.UpdateWorld();
		base.Update(gameTime);
	};

	/* protected override void */ Draw = function(/* GameTime */ gameTime) {
		Player[MyPlayer].mouseInterface = false;
		if (!IsActive) {
			return;
		}
		var flag = false;
		if (!DebugMode) {
			var num = mouseState.X;
			var num2 = mouseState.Y;
			if (num < 0) {
				num = 0;
			}
			if (num > ScreenWidth) {
				num = ScreenWidth;
			}
			if (num2 < 0) {
				num2 = 0;
			}
			if (num2 > ScreenHeight) {
				num2 = ScreenHeight;
			}
			screenPosition.X =
				Player[MyPlayer].position.X
				+ Player[MyPlayer].width * 0.5
				- ScreenWidth * 0.5;
			screenPosition.Y =
				Player[MyPlayer].position.Y
				+ Player[MyPlayer].height * 0.5
				- ScreenHeight * 0.5;
		}

		screenPosition.X = screenPosition.X;
		screenPosition.Y = screenPosition.Y;
		if (screenPosition.X < 0) {
			screenPosition.X = 0;
		} else if (screenPosition.X + ScreenWidth > 80000) {
			screenPosition.X = 80000 - ScreenWidth;
		}
		if (screenPosition.Y < 0) {
			screenPosition.Y = 0;
		} else if (screenPosition.Y + ScreenHeight > 40000) {
			screenPosition.Y = 40000 - ScreenHeight;
		}
		GraphicsDevice.Clear(Color.Black);
		base.Draw(gameTime);
		_spriteBatch.Begin();
		var num3 =
			0.0
			- Math.IEEERemainder(screenPosition.X * 0.5, BackgroundWidth[Background])
			- BackgroundWidth[Background] / 2;
		var num4 = ScreenWidth / BackgroundWidth[Background] + 2;
		var num7 =
			(0 - screenPosition.Y)
			/ (worldSurface * 16.0 - ScreenHeight)
			* (BackgroundHeight[Background] - ScreenHeight);
		var white = Color.White;
		var num8 =
			(time / 40000.0 * (ScreenWidth + sunTexture.Width * 2)) - sunTexture.Width;
		var num9 = 0;
		var white2 = Color.White;
		var scale = 1;
		var rotation = (time / 40000.0) * 2 - 7.3;
		var num10 =
			(time / 30000.0 * (ScreenWidth + moonTexture.Width * 2)) - moonTexture.Width;
		var num11 = 0;
		var white3 = Color.White;
		var scale2 = 1;
		var rotation2 = (time / 30000.0) * 2 - 7.3;
		var num12 = 0;
		if (dayTime) {
			var num13;
			if (time < 20000.0) {
				num13 = Math.Pow(1.0 - time / 40000.0 * 2.0, 2.0);
				num9 = num7 + num13 * 250.0 + 180.0;
			} else {
				num13 = Math.Pow((time / 40000.0 - 0.5) * 2.0, 2.0);
				num9 = num7 + num13 * 250.0 + 180.0;
			}

			scale = 1.2 - num13 * 0.4;
		} else {
			var num14;
			if (time < 15000.0) {
				num14 = Math.Pow(1.0 - time / 30000.0 * 2.0, 2.0);
				num11 = num7 + num14 * 250.0 + 180.0;
			} else {
				num14 = Math.Pow((time / 30000.0 - 0.5) * 2.0, 2.0);
				num11 = num7 + num14 * 250.0 + 180.0;
			}

			scale2 = 1.2 - num14 * 0.4;
		}

		if (dayTime) {
			if (time < 10000.0) {
				num12 = time / 10000.0;
				white2.R = num12 * 200 + 55;
				white2.G = num12 * 180 + 75;
				white2.B = num12 * 250 + 5;
				white.R = num12 * 200 + 55;
				white.G = num12 * 200 + 55;
				white.B = num12 * 200 + 55;
			}

			if (time > 34000.0) {
				num12 = 1.0 - (time / 40000.0 - 0.85) * 6.666666666666667;
				white2.R = num12 * 120 + 55;
				white2.G = num12 * 100 + 25;
				white2.B = num12 * 120 + 55;
				white.R = num12 * 200 + 55;
				white.G = num12 * 85 + 55;
				white.B = num12 * 135 + 55;
			} else if (time > 28000.0) {
				num12 = 1.0 - (time / 40000.0 - 0.7) * 6.666666666666667;
				white2.R = num12 * 80 + 175;
				white2.G = num12 * 130 + 125;
				white2.B = num12 * 100 + 155;
				white.R = num12 * 0 + 255;
				white.G = num12 * 115 + 140;
				white.B = num12 * 75 + 180;
			}
		}

		if (!dayTime) {
			if (time < 15000.0) {
				num12 = 1.0 - time / 15000.0;
				white3.R = num12 * 10 + 205;
				white3.G = num12 * 70 + 155;
				white3.B = num12 * 100 + 155;
				white.R = num12 * 40 + 15;
				white.G = num12 * 40 + 15;
				white.B = num12 * 40 + 15;
			} else if (time >= 15000.0) {
				num12 = (time / 30000.0 - 0.5) * 2.0;
				white3.R = num12 * 50 + 205;
				white3.G = num12 * 100 + 155;
				white3.B = num12 * 100 + 155;
				white.R = num12 * 40 + 15;
				white.G = num12 * 40 + 15;
				white.B = num12 * 40 + 15;
			}
		}

		tileColor.A = byte.MaxValue;
		tileColor.R = (white.R + white.B + white.G) / 3;
		tileColor.G = (white.R + white.B + white.G) / 3;
		tileColor.B = (white.R + white.B + white.G) / 3;
		for (var i = 0; i < num4; i++) {
			_spriteBatch.Draw(
				BackgroundTexture[Background],
				new Rectangle(
					num3 + BackgroundWidth[Background] * i,
					num7,
					BackgroundWidth[Background],
					BackgroundHeight[Background]
				),
				white
			);
		}
		if (dayTime) {
			_spriteBatch.Draw(
				sunTexture,
				new Vector2(num8, num9),
				new Rectangle(0, 0, sunTexture.Width, sunTexture.Height),
				white2,
				rotation,
				new Vector2(sunTexture.Width / 2, sunTexture.Height / 2),
				scale,
				SpriteEffects.None,
				0
			);
		}
		if (!dayTime) {
			_spriteBatch.Draw(
				moonTexture,
				new Vector2(num10, num11),
				new Rectangle(
					0,
					moonTexture.Width * moonPhase,
					moonTexture.Width,
					moonTexture.Width
				),
				white3,
				rotation2,
				new Vector2(moonTexture.Width / 2, moonTexture.Width / 2),
				scale2,
				SpriteEffects.None,
				0
			);
		}
		var num15 = screenPosition.X / 16 - 1;
		var num16 = ((screenPosition.X + ScreenWidth) / 16) + 2;
		var num17 = screenPosition.Y / 16 - 1;
		var num18 = ((screenPosition.Y + ScreenHeight) / 16) + 2;
		if (num15 < 0) {
			num15 = 0;
		}
		if (num16 > 5001) {
			num16 = 5001;
		}
		if (num17 < 0) {
			num17 = 0;
		}
		if (num18 > 2501) {
			num18 = 2501;
		}
		Lighting.LightTiles(num15, num16, num17, num18);
		var white4 = Color.White;
		num3 =
			0.0
			- Math.IEEERemainder(screenPosition.X * 1.0, BackgroundWidth[1])
			- BackgroundWidth[1] / 2;
		num4 = ScreenWidth / BackgroundWidth[1] + 2;
		num7 = worldSurface * 16 - BackgroundHeight[1] - screenPosition.Y + 16;
		for (var i = 0; i < num4; i++) {
			for (var j = 0; j < 6; j++) {
				var num21 =
					(num3 + BackgroundWidth[1] * i + screenPosition.X + j * 16) / 16
					- num15
					+ 21;
				var num22 = (num7 + screenPosition.Y) / 16 - num17 + 21;
				if (num21 < 0) {
					num21 = 0;
				}
				if (num21 >= ScreenWidth / 16 + 42 + 10) {
					num21 = ScreenWidth / 16 + 42 + 10 - 1;
				}
				if (num22 < 0) {
					num22 = 0;
				}
				if (num22 >= ScreenHeight / 16 + 42 + 10) {
					num22 = ScreenHeight / 16 + 42 + 10 - 1;
				}
				var color = Lighting.color[num21, num22];
				_spriteBatch.Draw(
					BackgroundTexture[1],
					new Vector2(num3 + BackgroundWidth[1] * i + 16 * j, num7),
					new Rectangle(16 * j, 0, 16, 16),
					color
				);
			}
		}

		num7 = worldSurface * 16 - screenPosition.Y + 16;
		if (worldSurface * 16.0 <= screenPosition.Y + ScreenHeight) {
			num3 =
				0.0
				- Math.IEEERemainder(100.0 + screenPosition.X * 1.0, BackgroundWidth[2])
				- BackgroundWidth[2] / 2;
			num4 = ScreenWidth / BackgroundWidth[2] + 2;
			var num5 = 0;
			var num6 = 0;
			if (worldSurface * 16.0 < screenPosition.Y) {
				num5 =
					Math.IEEERemainder(num7, BackgroundHeight[2]) - BackgroundHeight[2];
				num6 = ScreenHeight / BackgroundHeight[2] + 2;
			} else {
				num5 = num7;
				num6 = (ScreenHeight - num7) / BackgroundHeight[2] + 1;
			}

			for (var i = 0; i < num4; i++) {
				for (var j = 0; j < num6; j++) {
					_spriteBatch.Draw(
						BackgroundTexture[2],
						new Rectangle(
							num3 + BackgroundWidth[2] * i,
							num5 + BackgroundHeight[2] * j,
							BackgroundWidth[2],
							BackgroundHeight[2]
						),
						Color.White
					);
				}
			}
		}

		for (var j = num17; j < num18 + 4; j++) {
			for (var i = num15 - 2; i < num16 + 2; i++) {
				if (
					Lighting.color[i - num15 + 21, j - num17 + 21].R < tileColor.R - 10
					|| j > worldSurface
				) {
					var num23 = 255 - Lighting.color[i - num15 + 21, j - num17 + 21].R;
					if (num23 < 0) {
						num23 = 0;
					}
					if (num23 > 255) {
						num23 = 255;
					}
					white4.A = num23;
					_spriteBatch.Draw(
						blackTileTexture,
						new Vector2(i * 16 - screenPosition.X, j * 16 - screenPosition.Y),
						new Rectangle(Tile[i, j].frameX, Tile[i, j].frameY, 16, 16),
						white4,
						0,
						new Vector2() /* default */,
						1,
						SpriteEffects.None,
						0
					);
				}

				if (Tile[i, j].wall > 0) {
					_spriteBatch.Draw(
						WallTexture[Tile[i, j].wall],
						new Vector2(
							i * 16 - screenPosition.X - 8,
							j * 16 - screenPosition.Y - 8
						),
						new Rectangle(
							Tile[i, j].wallFrameX * 2,
							Tile[i, j].wallFrameY * 2,
							32,
							32
						),
						Lighting.color[i - num15 + 21, j - num17 + 21],
						0,
						new Vector2() /* default */,
						1,
						SpriteEffects.None,
						0
					);
				}
			}
		}

		for (var j = num17; j < num18 + 4; j++) {
			for (var i = num15 - 2; i < num16 + 2; i++) {
				if (!Tile[i, j].active) {
					continue;
				}
				var num19 = Tile[i, j].type != 3
				&& Tile[i, j].type != 4
				&& Tile[i, j].type != 5
					? 16
					: 20;
				var num20 = Tile[i, j].type != 4 && Tile[i, j].type != 5 ? 16 : 20;
				if (Tile[i, j].type == 4 && Rand.Next(40) == 0) {
					if (Tile[i, j].frameX == 22) {
						Terraria
							.Dust
							.NewDust(new Vector2(i * 16 + 6, j * 16), 4, 4, 6, 0, 0, 100);
					}
					Terraria
						.Dust
						.NewDust(
							Tile[i, j].frameX == 44
								? new Vector2(i * 16 + 2, j * 16)
								: new Vector2(i * 16 + 4, j * 16),
							4,
							4,
							6,
							0,
							0,
							100
						);
				}

				if (
					Tile[i, j].type == 5
					&& Tile[i, j].frameY >= 198
					&& Tile[i, j].frameX >= 22
				) {
					var num24 = 0;
					if (Tile[i, j].frameX == 22) {
						if (Tile[i, j].frameY == 220) {
							num24 = 1;
						} else if (Tile[i, j].frameY == 242) {
							num24 = 2;
						}
						_spriteBatch.Draw(
							treeTopTexture,
							new Vector2(
								i * 16 - screenPosition.X - 32,
								j * 16 - screenPosition.Y - 64
							),
							new Rectangle(num24 * 82, 0, 80, 80),
							Lighting.color[i - num15 + 21, j - num17 + 21],
							0,
							new Vector2() /* default */,
							1,
							SpriteEffects.None,
							0
						);
					} else if (Tile[i, j].frameX == 44) {
						if (Tile[i, j].frameY == 220) {
							num24 = 1;
						} else if (Tile[i, j].frameY == 242) {
							num24 = 2;
						}
						_spriteBatch.Draw(
							treeBranchTexture,
							new Vector2(
								i * 16 - screenPosition.X - 24,
								j * 16 - screenPosition.Y - 12
							),
							new Rectangle(0, num24 * 42, 40, 40),
							Lighting.color[i - num15 + 21, j - num17 + 21],
							0,
							new Vector2() /* default */,
							1,
							SpriteEffects.None,
							0
						);
					} else if (Tile[i, j].frameX == 66) {
						if (Tile[i, j].frameY == 220) {
							num24 = 1;
						} else if (Tile[i, j].frameY == 242) {
							num24 = 2;
						}
						_spriteBatch.Draw(
							treeBranchTexture,
							new Vector2(
								i * 16 - screenPosition.X,
								j * 16 - screenPosition.Y - 12
							),
							new Rectangle(42, num24 * 42, 40, 40),
							Lighting.color[i - num15 + 21, j - num17 + 21],
							0,
							new Vector2() /* default */,
							1,
							SpriteEffects.None,
							0
						);
					}
				}

				_spriteBatch.Draw(
					TileTexture[Tile[i, j].type],
					new Vector2(
						i * 16 - screenPosition.X - (num20 - 16) / 2,
						j * 16 - screenPosition.Y
					),
					new Rectangle(Tile[i, j].frameX, Tile[i, j].frameY, num20, num19),
					Lighting.color[i - num15 + 21, j - num17 + 21],
					0,
					new Vector2() /* default */,
					1,
					SpriteEffects.None,
					0
				);
			}
		}

		for (var i = 0; i < 16; i++) {
			if (!Player[i].active) {
				continue;
			}
			var spriteEffects = Player[i].direction == -1
				? SpriteEffects.FlipHorizontally
				: SpriteEffects.None;
			var newColor = Lighting.color[
				Lighting.LightingX(
					(Player[i].position.X + Player[i].width * 0.5) / 16 - num15 + 21
				),
				Lighting.LightingY(
					(Player[i].position.Y + Player[i].height * 0.25) / 16 - num17 + 21
				)
			];
			_spriteBatch.Draw(
				playerHeadTexture,
				new Vector2(
						(
							Player[i].position.X
								- screenPosition.X
								- Player[i].headFrame.Width / 2
								+ Player[i].width / 2
						),
						(
							Player[i].position.Y
								- screenPosition.Y
								+ Player[i].height
								- Player[i].headFrame.Height
								+ 2
						)
					)
					+ Player[i].headPosition
					+ new Vector2(16, 14),
				Player[i].headFrame,
				Player[i].GetImmuneAlpha(newColor),
				Player[i].headRotation,
				new Vector2(16, 14),
				1,
				spriteEffects,
				0
			);
			newColor = Lighting.color[
				Lighting.LightingX(
					(Player[i].position.X + Player[i].width * 0.5) / 16 - num15 + 21
				),
				Lighting.LightingY(
					(Player[i].position.Y + Player[i].height * 0.5) / 16 - num17 + 21
				)
			];
			if (
				(
					Player[i].itemAnimation > 0
						|| Player[i].inventory[Player[i].selectedItem].holdStyle > 0
				)
				&& Player[i].inventory[Player[i].selectedItem].type > 0
			) {
				_spriteBatch.Draw(
					ItemTexture[Player[i].inventory[Player[i].selectedItem].type],
					new Vector2(
						(Player[i].itemLocation.X - screenPosition.X),
						(Player[i].itemLocation.Y - screenPosition.Y)
					),
					new Rectangle(
						0,
						0,
						ItemTexture[
							Player[i].inventory[Player[i].selectedItem].type
						].Width,
						ItemTexture[
							Player[i].inventory[Player[i].selectedItem].type
						].Height
					),
					Player[i].inventory[Player[i].selectedItem].GetAlpha(newColor),
					Player[i].itemRotation,
					new Vector2(
						ItemTexture[
							Player[i].inventory[Player[i].selectedItem].type
						].Width * 0.5
							- ItemTexture[
									Player[i].inventory[Player[i].selectedItem].type
								].Width
								* 0.5
								* Player[i].direction,
						ItemTexture[
							Player[i].inventory[Player[i].selectedItem].type
						].Height
					),
					Player[i].inventory[Player[i].selectedItem].scale,
					spriteEffects,
					0
				);
				if (Player[i].inventory[Player[i].selectedItem].color != Color.Black /* default */) {
					_spriteBatch.Draw(
						ItemTexture[Player[i].inventory[Player[i].selectedItem].type],
						new Vector2(
							(Player[i].itemLocation.X - screenPosition.X),
							(Player[i].itemLocation.Y - screenPosition.Y)
						),
						new Rectangle(
							0,
							0,
							ItemTexture[
								Player[i].inventory[Player[i].selectedItem].type
							].Width,
							ItemTexture[
								Player[i].inventory[Player[i].selectedItem].type
							].Height
						),
						Player[i].inventory[Player[i].selectedItem].GetColor(newColor),
						Player[i].itemRotation,
						new Vector2(
							ItemTexture[
								Player[i].inventory[Player[i].selectedItem].type
							].Width * 0.5
								- ItemTexture[
										Player[i].inventory[Player[i].selectedItem].type
									].Width
									* 0.5
									* Player[i].direction,
							ItemTexture[
								Player[i].inventory[Player[i].selectedItem].type
							].Height
						),
						Player[i].inventory[Player[i].selectedItem].scale,
						spriteEffects,
						0
					);
				}
			}

			_spriteBatch.Draw(
				playerBodyTexture,
				new Vector2(
						(
							Player[i].position.X
								- screenPosition.X
								- Player[i].bodyFrame.Width / 2
								+ Player[i].width / 2
						),
						(
							Player[i].position.Y
								- screenPosition.Y
								+ Player[i].height
								- Player[i].bodyFrame.Height
								+ 2
						)
					)
					+ Player[i].bodyPosition
					+ new Vector2(16, 28),
				Player[i].bodyFrame,
				Player[i].GetImmuneAlpha(newColor),
				Player[i].bodyRotation,
				new Vector2(16, 28),
				1,
				spriteEffects,
				0
			);
			newColor = Lighting.color[
				Lighting.LightingX(
					(Player[i].position.X + Player[i].width * 0.5) / 16 - num15 + 21
				),
				Lighting.LightingY(
					(Player[i].position.Y + Player[i].height * 0.75) / 16 - num17 + 21
				)
			];
			_spriteBatch.Draw(
				playerLegTexture,
				new Vector2(
						(
							Player[i].position.X
								- screenPosition.X
								- Player[i].legFrame.Width / 2
								+ Player[i].width / 2
						),
						(
							Player[i].position.Y
								- screenPosition.Y
								+ Player[i].height
								- Player[i].legFrame.Height
								+ 2
						)
					)
					+ Player[i].legPosition
					+ new Vector2(16, 40),
				Player[i].legFrame,
				Player[i].GetImmuneAlpha(newColor),
				Player[i].legRotation,
				new Vector2(16, 40),
				1,
				spriteEffects,
				0
			);
		}

		var rectangle = new Rectangle(
			screenPosition.X,
			screenPosition.Y,
			ScreenWidth,
			ScreenHeight
		);
		for (var i = 0; i < 1000; i++) {
			if (
				!rectangle.Intersects(
					new Rectangle(
						Npc[i].position.X,
						Npc[i].position.Y,
						Npc[i].width,
						Npc[i].height
					)
				)
			) {
				continue;
			}
			var newColor2 = Lighting.color[
				(Npc[i].position.X + Npc[i].width * 0.5) / 16 - num15 + 21,
				(Npc[i].position.Y + Npc[i].height * 0.5) / 16 - num17 + 21
			];
			if (Npc[i].active && Npc[i].type > 0) {
				_spriteBatch.Draw(
					NpcTexture[Npc[i].type],
					new Vector2(
						Npc[i].position.X
							- screenPosition.X
							+ Npc[i].width / 2
							- NpcTexture[Npc[i].type].Width * Npc[i].scale / 2,
						Npc[i].position.Y
							- screenPosition.Y
							+ Npc[i].height
							- NpcTexture[Npc[i].type].Height
								* Npc[i].scale
								/ NpcFrameCount[Npc[i].type]
							+ 4
					),
					Npc[i].frame,
					Npc[i].GetAlpha(newColor2),
					0,
					new Vector2() /* default */,
					Npc[i].scale,
					SpriteEffects.None,
					0
				);
				if (Npc[i].color != Color.Black /* default */) {
					_spriteBatch.Draw(
						NpcTexture[Npc[i].type],
						new Vector2(
							Npc[i].position.X
								- screenPosition.X
								+ Npc[i].width / 2
								- NpcTexture[Npc[i].type].Width * Npc[i].scale / 2,
							Npc[i].position.Y
								- screenPosition.Y
								+ Npc[i].height
								- NpcTexture[Npc[i].type].Height
									* Npc[i].scale
									/ NpcFrameCount[Npc[i].type]
								+ 4
						),
						Npc[i].frame,
						Npc[i].GetColor(newColor2),
						0,
						new Vector2() /* default */,
						Npc[i].scale,
						SpriteEffects.None,
						0
					);
				}
			}
		}

		for (var i = 0; i < 1000; i++) {
			if (Item[i].active && Item[i].type > 0) {
				var lightX = (Item[i].position.X + Item[i].width * 0.5) / 16 - num15 + 21;
				var lightY =
					(Item[i].position.Y + Item[i].height * 0.5) / 16
					- num17
					+ 21;
				var newColor3 = Lighting.color[
					Lighting.LightingX(lightX),
					Lighting.LightingY(lightY)
				];
				_spriteBatch.Draw(
					ItemTexture[Item[i].type],
					new Vector2(
						Item[i].position.X
							- screenPosition.X
							+ Item[i].width / 2
							- ItemTexture[Item[i].type].Width / 2,
						Item[i].position.Y
							- screenPosition.Y
							+ Item[i].height / 2
							- ItemTexture[Item[i].type].Height / 2
					),
					new Rectangle(
						0,
						0,
						ItemTexture[Item[i].type].Width,
						ItemTexture[Item[i].type].Height
					),
					Item[i].GetAlpha(newColor3),
					0,
					new Vector2() /* default */,
					1,
					SpriteEffects.None,
					0
				);
				if (Item[i].color != Color.Black /* default */) {
					_spriteBatch.Draw(
						ItemTexture[Item[i].type],
						new Vector2(
							Item[i].position.X
								- screenPosition.X
								+ Item[i].width / 2
								- ItemTexture[Item[i].type].Width / 2,
							Item[i].position.Y
								- screenPosition.Y
								+ Item[i].height / 2
								- ItemTexture[Item[i].type].Height / 2
						),
						new Rectangle(
							0,
							0,
							ItemTexture[Item[i].type].Width,
							ItemTexture[Item[i].type].Height
						),
						Item[i].GetColor(newColor3),
						0,
						new Vector2() /* default */,
						1,
						SpriteEffects.None,
						0
					);
				}
			}
		}

		for (var i = 0; i < 1000; i++) {
			if (Dust[i].active) {
				var newColor4 = Lighting.color[
					Lighting.LightingX((Dust[i].position.X + 4.0) / 16 - num15 + 21),
					Lighting.LightingY((Dust[i].position.Y + 4.0) / 16 - num17 + 21)
				];
				if (Dust[i].type == 6) {
					newColor4 = Color.White;
				}
				_spriteBatch.Draw(
					dustTexture,
					Dust[i].position - screenPosition,
					Dust[i].frame,
					Dust[i].GetAlpha(newColor4),
					Dust[i].rotation,
					new Vector2(4, 4),
					Dust[i].scale,
					SpriteEffects.None,
					0
				);
				if (Dust[i].color != Color.Black /* default */) {
					_spriteBatch.Draw(
						dustTexture,
						Dust[i].position - screenPosition,
						Dust[i].frame,
						Dust[i].GetColor(newColor4),
						Dust[i].rotation,
						new Vector2(4, 4),
						Dust[i].scale,
						SpriteEffects.None,
						0
					);
				}
			}
		}

		var num25 = 20;
		for (var i = 1; i < Player[MyPlayer].statLifeMax / num25 + 1; i++) {
			var num26 = 255;
			var num27 = 1;
			if (Player[MyPlayer].statLife >= i * num25) {
				num26 = 255;
			} else {
				var num28 = (Player[MyPlayer].statLife - (i - 1) * num25) / num25;
				num26 = 30 + 225 * num28;
				if (num26 < 30) {
					num26 = 30;
				}
				num27 = num28 / 4 + 0.75;
				if (num27 < 0.75) {
					num27 = 0.75;
				}
			}

			var num29 = 0;
			var num30 = 0;
			if (i > 10) {
				num29 -= 260;
				num30 += 26;
			}

			_spriteBatch.Draw(
				heartTexture,
				new Vector2(
					500 + 26 * (i - 1) + num29,
					32 + (heartTexture.Height - heartTexture.Height * num27) / 2 + num30
				),
				new Rectangle(0, 0, heartTexture.Width, heartTexture.Height),
				new Color(num26, num26, num26, num26),
				0,
				new Vector2() /* default */,
				num27,
				SpriteEffects.None,
				0
			);
		}

		var text = "";
		if (playerInventory) {
			inventoryScale = 0.75;
			for (var k = 0; k < 10; k++) {
				for (var l = 0; l < 4; l++) {
					var num31 = 20 + k * 56 * inventoryScale;
					var num32 = 20 + l * 56 * inventoryScale;
					var i = k + l * 10;
					var color2 = new Color(255, 255, 255, 255);
					if (
						mouseState.X >= num31
						&& mouseState.X <= num31 + hotbarTexture.Width * inventoryScale
						&& mouseState.Y >= num32
						&& mouseState.Y <= num32 + hotbarTexture.Height * inventoryScale
					) {
						Player[MyPlayer].mouseInterface = true;
						if (
							mouseLeftRelease
							&& mouseState.LeftButton == ButtonState.Pressed
							&& (
								Player[MyPlayer].selectedItem != i
									|| Player[MyPlayer].itemAnimation <= 0
							)
						) {
							var __GML_mouseItem = mouseItem;
							var __GML_Player_MyPlayer__inventory_i_ = Player[
								MyPlayer
							].inventory[i];

							mouseItem = __GML_Player_MyPlayer__inventory_i_;
							Player[MyPlayer].inventory[i] = __GML_mouseItem;

							//(mouseItem, Player[MyPlayer].inventory[i]) = (Player[MyPlayer].inventory[i], mouseItem);

							if (
								Player[MyPlayer].inventory[i].type == 0
								|| Player[MyPlayer].inventory[i].stack < 1
							) {
								Player[MyPlayer].inventory[i] = new Item();
							}
							if (
								mouseItem.IsTheSameAs(Player[MyPlayer].inventory[i])
								&& Player[MyPlayer].inventory[i].stack
									!= Player[MyPlayer].inventory[i].maxStack
								&& mouseItem.stack != mouseItem.maxStack
							) {
								if (
									mouseItem.stack + Player[MyPlayer].inventory[i].stack
									<= mouseItem.maxStack
								) {
									Player[MyPlayer].inventory[i].stack +=
										mouseItem.stack;
									mouseItem.stack = 0;
								} else {
									var num33 =
										mouseItem.maxStack
										- Player[MyPlayer].inventory[i].stack;
									Player[MyPlayer].inventory[i].stack += num33;
									mouseItem.stack -= num33;
								}
							}

							if (mouseItem.type == 0 || mouseItem.stack < 1) {
								mouseItem = new Item();
							}
							if (
								mouseItem.type > 0
								|| Player[MyPlayer].inventory[i].type > 0
							) {
								Terraria.Recipe.FindRecipes();
								soundInstanceGrab.Stop();
								soundInstanceGrab = soundGrab.CreateInstance();
								soundInstanceGrab.Play();
							}
						}

						text = Player[MyPlayer].inventory[i].name;
						if (Player[MyPlayer].inventory[i].stack > 1) {
							var obj = text;
							text = string_concat(
								obj,
								" (",
								Player[MyPlayer].inventory[i].stack,
								")"
							);
						}
					}

					_spriteBatch.Draw(
						hotbarTexture,
						new Vector2(num31, num32),
						new Rectangle(0, 0, hotbarTexture.Width, hotbarTexture.Height),
						color2,
						0,
						new Vector2() /* default */,
						inventoryScale,
						SpriteEffects.None,
						0
					);
					_spriteBatch.Draw(
						inventoryBackTexture,
						new Vector2(num31, num32),
						new Rectangle(
							0,
							0,
							inventoryBackTexture.Width,
							inventoryBackTexture.Height
						),
						new Color(200, 200, 200, 200),
						0,
						new Vector2() /* default */,
						inventoryScale,
						SpriteEffects.None,
						0
					);
					color2 = Color.White;
					if (
						Player[MyPlayer].inventory[i].type > 0
						&& Player[MyPlayer].inventory[i].stack > 0
					) {
						var num34 = 1;
						if (
							ItemTexture[Player[MyPlayer].inventory[i].type].Width > 32
							|| ItemTexture[Player[MyPlayer].inventory[i].type].Height > 32
						) {
							num34 = ItemTexture[Player[MyPlayer].inventory[i].type].Width
							<= ItemTexture[Player[MyPlayer].inventory[i].type].Height
								? 32
									/ ItemTexture[
										Player[MyPlayer].inventory[i].type
									].Height
								: 32
									/ ItemTexture[
										Player[MyPlayer].inventory[i].type
									].Width;
						}
						num34 *= inventoryScale;
						_spriteBatch.Draw(
							ItemTexture[Player[MyPlayer].inventory[i].type],
							new Vector2(
								num31
									+ 26 * inventoryScale
									- ItemTexture[
											Player[MyPlayer].inventory[i].type
										].Width
										* 0.5
										* num34,
								num32
									+ 26 * inventoryScale
									- ItemTexture[
											Player[MyPlayer].inventory[i].type
										].Height
										* 0.5
										* num34
							),
							new Rectangle(
								0,
								0,
								ItemTexture[Player[MyPlayer].inventory[i].type].Width,
								ItemTexture[Player[MyPlayer].inventory[i].type].Height
							),
							Player[MyPlayer].inventory[i].GetAlpha(color2),
							0,
							new Vector2() /* default */,
							num34,
							SpriteEffects.None,
							0
						);
						if (Player[MyPlayer].inventory[i].color != Color.Black /* default */) {
							_spriteBatch.Draw(
								ItemTexture[Player[MyPlayer].inventory[i].type],
								new Vector2(
									num31
										+ 26 * inventoryScale
										- ItemTexture[
												Player[MyPlayer].inventory[i].type
											].Width
											* 0.5
											* num34,
									num32
										+ 26 * inventoryScale
										- ItemTexture[
												Player[MyPlayer].inventory[i].type
											].Height
											* 0.5
											* num34
								),
								new Rectangle(
									0,
									0,
									ItemTexture[Player[MyPlayer].inventory[i].type].Width,
									ItemTexture[Player[MyPlayer].inventory[i].type].Height
								),
								Player[MyPlayer].inventory[i].GetColor(color2),
								0,
								new Vector2() /* default */,
								num34,
								SpriteEffects.None,
								0
							);
						}
						if (Player[MyPlayer].inventory[i].stack > 1) {
							_spriteBatch.DrawString(
								fontItemStack,
								string.Concat(Player[MyPlayer].inventory[i].stack),
								new Vector2(
									num31 + 10 * inventoryScale,
									num32 + 26 * inventoryScale
								),
								color2,
								0,
								new Vector2() /* default */,
								num34,
								SpriteEffects.None,
								0
							);
						}
					}
				}
			}

			for (var i = 0; i < 3; i++) {
				var num31 = 330;
				var num32 = 238 + i * 56 * inventoryScale;
				var color2 = new Color(255, 255, 255, 255);
				if (
					mouseState.X >= num31
					&& mouseState.X <= num31 + hotbarTexture.Width * inventoryScale
					&& mouseState.Y >= num32
					&& mouseState.Y <= num32 + hotbarTexture.Height * inventoryScale
				) {
					Player[MyPlayer].mouseInterface = true;
					if (
						mouseLeftRelease
						&& mouseState.LeftButton == ButtonState.Pressed
						&& (
							mouseItem.type == 0
								|| (mouseItem.headSlot > 0 && i == 0)
								|| (mouseItem.bodySlot > 0 && i == 1)
								|| (mouseItem.legSlot > 0 && i == 2)
						)
					) {
						var __GML_mouseItem = mouseItem;
						var __GML_Player_MyPlayer__armor_i_ = Player[MyPlayer].armor[i];

						mouseItem = __GML_Player_MyPlayer__armor_i_;
						Player[MyPlayer].armor[i] = __GML_mouseItem;

						//(mouseItem, Player[MyPlayer].armor[i]) = (Player[MyPlayer].armor[i], mouseItem);

						if (
							Player[MyPlayer].armor[i].type == 0
							|| Player[MyPlayer].armor[i].stack < 1
						) {
							Player[MyPlayer].armor[i] = new Item();
						}
						if (mouseItem.type == 0 || mouseItem.stack < 1) {
							mouseItem = new Item();
						}
						if (mouseItem.type > 0 || Player[MyPlayer].armor[i].type > 0) {
							Terraria.Recipe.FindRecipes();
							soundInstanceGrab.Stop();
							soundInstanceGrab = soundGrab.CreateInstance();
							soundInstanceGrab.Play();
						}
					}

					text = Player[MyPlayer].armor[i].name;
					if (Player[MyPlayer].armor[i].stack > 1) {
						var obj = text;
						text = string_concat(
							obj,
							" (",
							Player[MyPlayer].armor[i].stack,
							")"
						);
					}
				}

				_spriteBatch.Draw(
					hotbarTexture,
					new Vector2(num31, num32),
					new Rectangle(0, 0, hotbarTexture.Width, hotbarTexture.Height),
					color2,
					0,
					new Vector2() /* default */,
					inventoryScale,
					SpriteEffects.None,
					0
				);
				_spriteBatch.Draw(
					inventoryBackTexture,
					new Vector2(num31, num32),
					new Rectangle(
						0,
						0,
						inventoryBackTexture.Width,
						inventoryBackTexture.Height
					),
					new Color(200, 200, 200, 200),
					0,
					new Vector2() /* default */,
					inventoryScale,
					SpriteEffects.None,
					0
				);
				color2 = Color.White;
				if (
					Player[MyPlayer].armor[i].type > 0
					&& Player[MyPlayer].armor[i].stack > 0
				) {
					var num34 = 1;
					if (
						ItemTexture[Player[MyPlayer].armor[i].type].Width > 32
						|| ItemTexture[Player[MyPlayer].armor[i].type].Height > 32
					) {
						num34 = ItemTexture[Player[MyPlayer].armor[i].type].Width
						<= ItemTexture[Player[MyPlayer].armor[i].type].Height
							? 32 / ItemTexture[Player[MyPlayer].armor[i].type].Height
							: 32 / ItemTexture[Player[MyPlayer].armor[i].type].Width;
					}
					num34 *= inventoryScale;
					_spriteBatch.Draw(
						ItemTexture[Player[MyPlayer].armor[i].type],
						new Vector2(
							num31
								+ 26 * inventoryScale
								- ItemTexture[Player[MyPlayer].armor[i].type].Width
									* 0.5
									* num34,
							num32
								+ 26 * inventoryScale
								- ItemTexture[Player[MyPlayer].armor[i].type].Height
									* 0.5
									* num34
						),
						new Rectangle(
							0,
							0,
							ItemTexture[Player[MyPlayer].armor[i].type].Width,
							ItemTexture[Player[MyPlayer].armor[i].type].Height
						),
						Player[MyPlayer].armor[i].GetAlpha(color2),
						0,
						new Vector2() /* default */,
						num34,
						SpriteEffects.None,
						0
					);
					if (Player[MyPlayer].armor[i].color != Color.Black /* default */) {
						_spriteBatch.Draw(
							ItemTexture[Player[MyPlayer].armor[i].type],
							new Vector2(
								num31
									+ 26 * inventoryScale
									- ItemTexture[Player[MyPlayer].armor[i].type].Width
										* 0.5
										* num34,
								num32
									+ 26 * inventoryScale
									- ItemTexture[Player[MyPlayer].armor[i].type].Height
										* 0.5
										* num34
							),
							new Rectangle(
								0,
								0,
								ItemTexture[Player[MyPlayer].armor[i].type].Width,
								ItemTexture[Player[MyPlayer].armor[i].type].Height
							),
							Player[MyPlayer].armor[i].GetColor(color2),
							0,
							new Vector2() /* default */,
							num34,
							SpriteEffects.None,
							0
						);
					}
					if (Player[MyPlayer].armor[i].stack > 1) {
						_spriteBatch.DrawString(
							fontItemStack,
							string_concat(Player[MyPlayer].armor[i].stack),
							new Vector2(
								num31 + 10 * inventoryScale,
								num32 + 26 * inventoryScale
							),
							color2,
							0,
							new Vector2() /* default */,
							num34,
							SpriteEffects.None,
							0
						);
					}
				}
			}

			for (var i = 0; i < Terraria.Recipe.MaxRecipes; i++) {
				inventoryScale = 100 / (Math.Abs(AvailableRecipeY[i]) + 100);
				if (inventoryScale < 0.75) {
					inventoryScale = 0.75;
				}
				if (AvailableRecipeY[i] < (i - focusRecipe) * 65) {
					if (AvailableRecipeY[i] == 0) {
						soundInstanceMenuTick.Play();
					}
					AvailableRecipeY[i] += 6.5;
				} else if (AvailableRecipeY[i] > (i - focusRecipe) * 65) {
					if (AvailableRecipeY[i] == 0) {
						soundInstanceMenuTick.Play();
					}
					AvailableRecipeY[i] -= 6.5;
				}

				if (i >= numAvailableRecipes || Math.Abs(AvailableRecipeY[i]) > 250) {
					continue;
				}
				var num31 = 46 - 26 * inventoryScale;
				var num32 =
					400
					+ AvailableRecipeY[i] * inventoryScale
					- 30 * inventoryScale;
				var num35 = 255.0;
				if (Math.Abs(AvailableRecipeY[i]) > 150) {
					num35 = 255 * (100 - (Math.Abs(AvailableRecipeY[i]) - 150)) * 0.01;
				}
				var color2 = Color.White;
				color2.R = num35;
				color2.G = num35;
				color2.B = num35;
				color2.A = num35;
				if (
					mouseState.X >= num31
					&& mouseState.X <= num31 + hotbarTexture.Width * inventoryScale
					&& mouseState.Y >= num32
					&& mouseState.Y <= num32 + hotbarTexture.Height * inventoryScale
				) {
					Player[MyPlayer].mouseInterface = true;
					if (mouseLeftRelease && mouseState.LeftButton == ButtonState.Pressed) {
						if (focusRecipe == i) {
							if (
								mouseItem.type == 0
								|| (
									mouseItem.IsTheSameAs(
										Recipe[AvailableRecipe[i]].createItem
									)
										&& mouseItem.stack
											+ Recipe[AvailableRecipe[i]].createItem.stack
											<= mouseItem.maxStack
								)
							) {
								var stack = mouseItem.stack;
								mouseItem = Item;
								Recipe[AvailableRecipe[i]].createItem.Clone();
								mouseItem.stack += stack;
								Recipe[AvailableRecipe[i]].Create();
								if (
									mouseItem.type > 0
									|| Recipe[AvailableRecipe[i]].createItem.type > 0
								) {
									soundInstanceGrab.Stop();
									soundInstanceGrab = soundGrab.CreateInstance();
									soundInstanceGrab.Play();
								}
							}
						} else {
							focusRecipe = i;
						}
					}

					text = Recipe[AvailableRecipe[i]].createItem.name;
					if (Recipe[AvailableRecipe[i]].createItem.stack > 1) {
						var obj = text;
						text = string_concat(
							obj,
							" (",
							Recipe[AvailableRecipe[i]].createItem.stack,
							")"
						);
					}
				}

				_spriteBatch.Draw(
					hotbarTexture,
					new Vector2(num31, num32),
					new Rectangle(0, 0, hotbarTexture.Width, hotbarTexture.Height),
					color2,
					0,
					new Vector2() /* default */,
					inventoryScale,
					SpriteEffects.None,
					0
				);
				num35 -= 50.0;
				if (num35 < 0.0) {
					num35 = 0.0;
				}
				_spriteBatch.Draw(
					inventoryBackTexture,
					new Vector2(num31, num32),
					new Rectangle(
						0,
						0,
						inventoryBackTexture.Width,
						inventoryBackTexture.Height
					),
					new Color(num35, num35, num35, num35),
					0,
					new Vector2() /* default */,
					inventoryScale,
					SpriteEffects.None,
					0
				);
				if (
					Recipe[AvailableRecipe[i]].createItem.type > 0
					&& Recipe[AvailableRecipe[i]].createItem.stack > 0
				) {
					var num34 = 1;
					if (
						ItemTexture[Recipe[AvailableRecipe[i]].createItem.type].Width > 32
						|| ItemTexture[Recipe[AvailableRecipe[i]].createItem.type].Height
							> 32
					) {
						num34 = ItemTexture[
							Recipe[AvailableRecipe[i]].createItem.type
						].Width
						<= ItemTexture[Recipe[AvailableRecipe[i]].createItem.type].Height
							? 32
								/ ItemTexture[
									Recipe[AvailableRecipe[i]].createItem.type
								].Height
							: 32
								/ ItemTexture[
									Recipe[AvailableRecipe[i]].createItem.type
								].Width;
					}
					num34 *= inventoryScale;
					_spriteBatch.Draw(
						ItemTexture[Recipe[AvailableRecipe[i]].createItem.type],
						new Vector2(
							num31
								+ 26 * inventoryScale
								- ItemTexture[
										Recipe[AvailableRecipe[i]].createItem.type
									].Width
									* 0.5
									* num34,
							num32
								+ 26 * inventoryScale
								- ItemTexture[
										Recipe[AvailableRecipe[i]].createItem.type
									].Height
									* 0.5
									* num34
						),
						new Rectangle(
							0,
							0,
							ItemTexture[Recipe[AvailableRecipe[i]].createItem.type].Width,
							ItemTexture[Recipe[AvailableRecipe[i]].createItem.type].Height
						),
						Recipe[AvailableRecipe[i]].createItem.GetAlpha(color2),
						0,
						new Vector2() /* default */,
						num34,
						SpriteEffects.None,
						0
					);
					if (Recipe[AvailableRecipe[i]].createItem.color != Color.Black /* default */) {
						_spriteBatch.Draw(
							ItemTexture[Recipe[AvailableRecipe[i]].createItem.type],
							new Vector2(
								num31
									+ 26 * inventoryScale
									- ItemTexture[
											Recipe[AvailableRecipe[i]].createItem.type
										].Width
										* 0.5
										* num34,
								num32
									+ 26 * inventoryScale
									- ItemTexture[
											Recipe[AvailableRecipe[i]].createItem.type
										].Height
										* 0.5
										* num34
							),
							new Rectangle(
								0,
								0,
								ItemTexture[
									Recipe[AvailableRecipe[i]].createItem.type
								].Width,
								ItemTexture[
									Recipe[AvailableRecipe[i]].createItem.type
								].Height
							),
							Recipe[AvailableRecipe[i]].createItem.GetColor(color2),
							0,
							new Vector2() /* default */,
							num34,
							SpriteEffects.None,
							0
						);
					}
					if (Recipe[AvailableRecipe[i]].createItem.stack > 1) {
						_spriteBatch.DrawString(
							fontItemStack,
							string.Concat(Recipe[AvailableRecipe[i]].createItem.stack),
							new Vector2(
								num31 + 10 * inventoryScale,
								num32 + 26 * inventoryScale
							),
							color2,
							0,
							new Vector2() /* default */,
							num34,
							SpriteEffects.None,
							0
						);
					}
				}
			}

			if (numAvailableRecipes > 0) {
				for (
					var i = 0;
					i < Terraria.Recipe.MaxRequirements
						&& Recipe[AvailableRecipe[focusRecipe]].requiredItem[i].type != 0;
					i++
				) {
					var num31 = 80 + i * 40;
					var num32 = 380;
					var num35 = 255.0;
					var color2 = Color.White;
					num35 = 255 - Math.Abs(AvailableRecipeY[focusRecipe]) * 3;
					if (num35 < 0.0) {
						num35 = 0.0;
					}
					color2.R = num35;
					color2.G = num35;
					color2.B = num35;
					color2.A = num35;
					inventoryScale = 0.6;
					if (num35 == 0.0) {
						break;
					}
					if (
						mouseState.X >= num31
						&& mouseState.X <= num31 + hotbarTexture.Width * inventoryScale
						&& mouseState.Y >= num32
						&& mouseState.Y <= num32 + hotbarTexture.Height * inventoryScale
					) {
						Player[MyPlayer].mouseInterface = true;
						text = Recipe[AvailableRecipe[focusRecipe]].requiredItem[i].name;
						if (
							Recipe[AvailableRecipe[focusRecipe]].requiredItem[i].stack > 1
						) {
							var obj = text;
							text = string_concat(
								obj,
								" (",
								Recipe[AvailableRecipe[focusRecipe]]
									.requiredItem[i]
									.stack,
								")"
							);
						}
					}

					_spriteBatch.Draw(
						hotbarTexture,
						new Vector2(num31, num32),
						new Rectangle(0, 0, hotbarTexture.Width, hotbarTexture.Height),
						color2,
						0,
						new Vector2() /* default */,
						inventoryScale,
						SpriteEffects.None,
						0
					);
					num35 -= 50.0;
					if (num35 < 0.0) {
						num35 = 0.0;
					}
					_spriteBatch.Draw(
						inventoryBackTexture,
						new Vector2(num31, num32),
						new Rectangle(
							0,
							0,
							inventoryBackTexture.Width,
							inventoryBackTexture.Height
						),
						new Color(num35, num35, num35, num35),
						0,
						new Vector2() /* default */,
						inventoryScale,
						SpriteEffects.None,
						0
					);
					if (
						Recipe[AvailableRecipe[focusRecipe]].requiredItem[i].type > 0
						&& Recipe[AvailableRecipe[focusRecipe]].requiredItem[i].stack > 0
					) {
						var num34 = 1;
						if (
							ItemTexture[
								Recipe[AvailableRecipe[focusRecipe]].requiredItem[i].type
							].Width > 32
							|| ItemTexture[
								Recipe[AvailableRecipe[focusRecipe]].requiredItem[i].type
							].Height > 32
						) {
							num34 = ItemTexture[
								Recipe[AvailableRecipe[focusRecipe]].requiredItem[i].type
							].Width
							<= ItemTexture[
								Recipe[AvailableRecipe[focusRecipe]].requiredItem[i].type
							].Height
								? 32
									/ ItemTexture[
										Recipe[AvailableRecipe[focusRecipe]]
											.requiredItem[i]
											.type
									].Height
								: 32
									/ ItemTexture[
										Recipe[AvailableRecipe[focusRecipe]]
											.requiredItem[i]
											.type
									].Width;
						}
						num34 *= inventoryScale;
						_spriteBatch.Draw(
							ItemTexture[
								Recipe[AvailableRecipe[focusRecipe]].requiredItem[i].type
							],
							new Vector2(
								num31
									+ 26 * inventoryScale
									- ItemTexture[
											Recipe[AvailableRecipe[focusRecipe]]
												.requiredItem[i]
												.type
										].Width
										* 0.5
										* num34,
								num32
									+ 26 * inventoryScale
									- ItemTexture[
											Recipe[AvailableRecipe[focusRecipe]]
												.requiredItem[i]
												.type
										].Height
										* 0.5
										* num34
							),
							new Rectangle(
								0,
								0,
								ItemTexture[
									Recipe[AvailableRecipe[focusRecipe]]
										.requiredItem[i]
										.type
								].Width,
								ItemTexture[
									Recipe[AvailableRecipe[focusRecipe]]
										.requiredItem[i]
										.type
								].Height
							),
							Recipe[AvailableRecipe[focusRecipe]]
								.requiredItem[i]
								.GetAlpha(color2),
							0,
							new Vector2() /* default */,
							num34,
							SpriteEffects.None,
							0
						);
						if (
							Recipe[AvailableRecipe[focusRecipe]].requiredItem[i].color
							!= Color.Black /* default */
						) {
							_spriteBatch.Draw(
								ItemTexture[
									Recipe[AvailableRecipe[focusRecipe]]
										.requiredItem[i]
										.type
								],
								new Vector2(
									num31
										+ 26 * inventoryScale
										- ItemTexture[
												Recipe[AvailableRecipe[focusRecipe]]
													.requiredItem[i]
													.type
											].Width
											* 0.5
											* num34,
									num32
										+ 26 * inventoryScale
										- ItemTexture[
												Recipe[AvailableRecipe[focusRecipe]]
													.requiredItem[i]
													.type
											].Height
											* 0.5
											* num34
								),
								new Rectangle(
									0,
									0,
									ItemTexture[
										Recipe[AvailableRecipe[focusRecipe]]
											.requiredItem[i]
											.type
									].Width,
									ItemTexture[
										Recipe[AvailableRecipe[focusRecipe]]
											.requiredItem[i]
											.type
									].Height
								),
								Recipe[AvailableRecipe[focusRecipe]]
									.requiredItem[i]
									.GetColor(color2),
								0,
								new Vector2() /* default */,
								num34,
								SpriteEffects.None,
								0
							);
						}
						if (
							Recipe[AvailableRecipe[focusRecipe]].requiredItem[i].stack > 1
						) {
							_spriteBatch.DrawString(
								fontItemStack,
								string_concat(
									Recipe[AvailableRecipe[focusRecipe]]
										.requiredItem[i]
										.stack
								),
								new Vector2(
									num31 + 10 * inventoryScale,
									num32 + 26 * inventoryScale
								),
								color2,
								0,
								new Vector2() /* default */,
								num34,
								SpriteEffects.None,
								0
							);
						}
					}
				}
			}
		}

		if (!playerInventory) {
			var num36 = 20;
			for (var i = 0; i < 10; i++) {
				if (i == Player[MyPlayer].selectedItem) {
					if (HotbarScale[i] < 1) {
						HotbarScale[i] += 0.05;
					}
				} else if (HotbarScale[i] > 0.75) {
					HotbarScale[i] -= 0.05;
				}

				var num37 = 20 + 22 * (1 - HotbarScale[i]);
				var color3 = new Color(255, 255, 255, (75 + 150 * HotbarScale[i]));
				_spriteBatch.Draw(
					hotbarTexture,
					new Vector2(num36, num37),
					new Rectangle(0, 0, hotbarTexture.Width, hotbarTexture.Height),
					color3,
					0,
					new Vector2() /* default */,
					HotbarScale[i],
					SpriteEffects.None,
					0
				);
				if (
					mouseState.X >= num36
					&& mouseState.X <= num36 + hotbarTexture.Width * HotbarScale[i]
					&& mouseState.Y >= num37
					&& mouseState.Y <= num37 + hotbarTexture.Height * HotbarScale[i]
				) {
					Player[MyPlayer].mouseInterface = true;
					if (mouseState.LeftButton == ButtonState.Pressed) {
						Player[MyPlayer].changeItem = i;
					}
					Player[MyPlayer].showItemIcon = false;
					text = Player[MyPlayer].inventory[i].name;
					if (Player[MyPlayer].inventory[i].stack > 1) {
						var obj = text;
						text = string_concat(
							obj,
							" (",
							Player[MyPlayer].inventory[i].stack,
							")"
						);
					}
				}

				if (
					Player[MyPlayer].inventory[i].type > 0
					&& Player[MyPlayer].inventory[i].stack > 0
				) {
					var num34 = 1;
					if (
						ItemTexture[Player[MyPlayer].inventory[i].type].Width > 32
						|| ItemTexture[Player[MyPlayer].inventory[i].type].Height > 32
					) {
						num34 = ItemTexture[Player[MyPlayer].inventory[i].type].Width
						<= ItemTexture[Player[MyPlayer].inventory[i].type].Height
							? 32 / ItemTexture[Player[MyPlayer].inventory[i].type].Height
							: 32 / ItemTexture[Player[MyPlayer].inventory[i].type].Width;
					}
					num34 *= HotbarScale[i];
					_spriteBatch.Draw(
						ItemTexture[Player[MyPlayer].inventory[i].type],
						new Vector2(
							num36
								+ 26 * HotbarScale[i]
								- ItemTexture[Player[MyPlayer].inventory[i].type].Width
									* 0.5
									* num34,
							num37
								+ 26 * HotbarScale[i]
								- ItemTexture[Player[MyPlayer].inventory[i].type].Height
									* 0.5
									* num34
						),
						new Rectangle(
							0,
							0,
							ItemTexture[Player[MyPlayer].inventory[i].type].Width,
							ItemTexture[Player[MyPlayer].inventory[i].type].Height
						),
						Player[MyPlayer].inventory[i].GetAlpha(color3),
						0,
						new Vector2() /* default */,
						num34,
						SpriteEffects.None,
						0
					);
					if (Player[MyPlayer].inventory[i].color != Color.Black /* default */) {
						_spriteBatch.Draw(
							ItemTexture[Player[MyPlayer].inventory[i].type],
							new Vector2(
								num36
									+ 26 * HotbarScale[i]
									- ItemTexture[
											Player[MyPlayer].inventory[i].type
										].Width
										* 0.5
										* num34,
								num37
									+ 26 * HotbarScale[i]
									- ItemTexture[
											Player[MyPlayer].inventory[i].type
										].Height
										* 0.5
										* num34
							),
							new Rectangle(
								0,
								0,
								ItemTexture[Player[MyPlayer].inventory[i].type].Width,
								ItemTexture[Player[MyPlayer].inventory[i].type].Height
							),
							Player[MyPlayer].inventory[i].GetColor(color3),
							0,
							new Vector2() /* default */,
							num34,
							SpriteEffects.None,
							0
						);
					}
					if (Player[MyPlayer].inventory[i].stack > 1) {
						_spriteBatch.DrawString(
							fontItemStack,
							string.Concat(Player[MyPlayer].inventory[i].stack),
							new Vector2(
								num36 + 10 * HotbarScale[i],
								num37 + 26 * HotbarScale[i]
							),
							color3,
							0,
							new Vector2() /* default */,
							num34,
							SpriteEffects.None,
							0
						);
					}
				}

				num36 += (hotbarTexture.Width * HotbarScale[i]) + 4;
			}
		}

		if (!string.IsNullOrEmpty(text) && mouseItem.type == 0) {
			Player[MyPlayer].showItemIcon = false;
			_spriteBatch.DrawString(
				fontMouseText,
				text,
				new Vector2(mouseState.X + 10, mouseState.Y + 10),
				new Color(mouseTextColor, mouseTextColor, mouseTextColor, mouseTextColor),
				0,
				new Vector2() /* default */,
				1,
				SpriteEffects.None,
				0
			);
			flag = true;
		}

		if (Player[MyPlayer].dead) {
			var text2 = Player[MyPlayer].name + " was slain...";
			_spriteBatch.DrawString(
				fontDeathText,
				text2,
				new Vector2(ScreenWidth / 2 - text2.Length * 10, ScreenHeight / 2 - 20),
				Player[MyPlayer].GetDeathAlpha(new Color(0, 0, 0, 0)),
				0,
				new Vector2() /* default */,
				1,
				SpriteEffects.None,
				0
			);
		}

		_spriteBatch.Draw(
			cursorTexture,
			new Vector2(mouseState.X, mouseState.Y),
			new Rectangle(0, 0, cursorTexture.Width, cursorTexture.Height),
			Color.White,
			0,
			new Vector2() /* default */,
			1,
			SpriteEffects.None,
			0
		);
		if (mouseItem.type > 0 && mouseItem.stack > 0) {
			Player[MyPlayer].showItemIcon = false;
			Player[MyPlayer].showItemIcon2 = 0;
			flag = true;
			var num34 = 1;
			if (
				ItemTexture[mouseItem.type].Width > 32
				|| ItemTexture[mouseItem.type].Height > 32
			) {
				num34 = ItemTexture[mouseItem.type].Width
				<= ItemTexture[mouseItem.type].Height
					? 32 / ItemTexture[mouseItem.type].Height
					: 32 / ItemTexture[mouseItem.type].Width;
			}
			var num38 = 1;
			var white5 = Color.White;
			num34 *= num38;
			_spriteBatch.Draw(
				ItemTexture[mouseItem.type],
				new Vector2(
					mouseState.X
						+ 26 * num38
						- ItemTexture[mouseItem.type].Width * 0.5 * num34,
					mouseState.Y
						+ 26 * num38
						- ItemTexture[mouseItem.type].Height * 0.5 * num34
				),
				new Rectangle(
					0,
					0,
					ItemTexture[mouseItem.type].Width,
					ItemTexture[mouseItem.type].Height
				),
				mouseItem.GetAlpha(white5),
				0,
				new Vector2() /* default */,
				num34,
				SpriteEffects.None,
				0
			);
			if (mouseItem.color != Color.Black /* default */) {
				_spriteBatch.Draw(
					ItemTexture[mouseItem.type],
					new Vector2(
						mouseState.X
							+ 26 * num38
							- ItemTexture[mouseItem.type].Width * 0.5 * num34,
						mouseState.Y
							+ 26 * num38
							- ItemTexture[mouseItem.type].Height * 0.5 * num34
					),
					new Rectangle(
						0,
						0,
						ItemTexture[mouseItem.type].Width,
						ItemTexture[mouseItem.type].Height
					),
					mouseItem.GetColor(white5),
					0,
					new Vector2() /* default */,
					num34,
					SpriteEffects.None,
					0
				);
			}
			if (mouseItem.stack > 1) {
				_spriteBatch.DrawString(
					fontItemStack,
					string.Concat(mouseItem.stack),
					new Vector2(mouseState.X + 10 * num38, mouseState.Y + 26 * num38),
					white5,
					0,
					new Vector2() /* default */,
					num34,
					SpriteEffects.None,
					0
				);
			}
		}

		var rectangle2 = new Rectangle(
			(mouseState.X + screenPosition.X),
			(mouseState.Y + screenPosition.Y),
			1,
			1
		);
		mouseTextColor += mouseTextColorChange;
		if (mouseTextColor >= 250) {
			mouseTextColorChange = -4;
		}
		if (mouseTextColor <= 175) {
			mouseTextColorChange = 4;
		}
		if (!flag) {
			var num39 = 26 * Player[MyPlayer].statLifeMax / num25;
			var num40 = 0;
			if (Player[MyPlayer].statLifeMax > 200) {
				num39 -= 260;
				num40 += 26;
			}

			if (
				mouseState.X > 500
				&& mouseState.X < 500 + num39
				&& mouseState.Y > 32
				&& mouseState.Y < 32 + heartTexture.Height + num40
			) {
				Player[MyPlayer].showItemIcon = false;
				var text3 =
					"Life: "
					+ Player[MyPlayer].statLife
					+ "/"
					+ Player[MyPlayer].statLifeMax;
				_spriteBatch.DrawString(
					fontMouseText,
					text3,
					new Vector2(mouseState.X + 10, mouseState.Y + 10),
					new Color(
						mouseTextColor,
						mouseTextColor,
						mouseTextColor,
						mouseTextColor
					),
					0,
					new Vector2() /* default */,
					1,
					SpriteEffects.None,
					0
				);
				flag = true;
			}
		}

		if (!flag) {
			for (var i = 0; i < 1000; i++) {
				if (
					Item[i].active
					&& rectangle2.Intersects(
						new Rectangle(
							(
								Item[i].position.X
									+ Item[i].width * 0.5
									- ItemTexture[Item[i].type].Width * 0.5
							),
							(
								Item[i].position.Y
									+ Item[i].height
									- ItemTexture[Item[i].type].Height
							),
							ItemTexture[Item[i].type].Width,
							ItemTexture[Item[i].type].Height
						)
					)
				) {
					Player[MyPlayer].showItemIcon = false;
					var text3 = Item[i].name;
					if (Item[i].stack > 1) {
						var obj = text3;
						text3 = string_concat(obj, " (", Item[i].stack, ")");
					}

					_spriteBatch.DrawString(
						fontMouseText,
						text3,
						new Vector2(mouseState.X + 10, mouseState.Y + 10),
						new Color(
							mouseTextColor,
							mouseTextColor,
							mouseTextColor,
							mouseTextColor
						),
						0,
						new Vector2() /* default */,
						1,
						SpriteEffects.None,
						0
					);
					flag = true;
					break;
				}
			}
		}

		if (!flag) {
			for (var i = 0; i < 1000; i++) {
				if (
					Npc[i].active
					&& rectangle2.Intersects(
						new Rectangle(
							(
								Npc[i].position.X
									+ Npc[i].width * 0.5
									- NpcTexture[Npc[i].type].Width * 0.5
							),
							(
								Npc[i].position.Y
									+ Npc[i].height
									- NpcTexture[Npc[i].type].Height
										/ NpcFrameCount[Npc[i].type]
							),
							NpcTexture[Npc[i].type].Width,
							NpcTexture[Npc[i].type].Height / NpcFrameCount[Npc[i].type]
						)
					)
				) {
					Player[MyPlayer].showItemIcon = false;
					var text3 = Npc[i].name + ": " + Npc[i].life + "/" + Npc[i].lifeMax;
					_spriteBatch.DrawString(
						fontMouseText,
						text3,
						new Vector2(mouseState.X + 10, mouseState.Y + 10),
						new Color(
							mouseTextColor,
							mouseTextColor,
							mouseTextColor,
							mouseTextColor
						),
						0,
						new Vector2() /* default */,
						1,
						SpriteEffects.None,
						0
					);
					break;
				}
			}
		}

		if (
			Player[MyPlayer].showItemIcon
			&& (
				Player[MyPlayer].inventory[Player[MyPlayer].selectedItem].type > 0
					|| Player[MyPlayer].showItemIcon2 > 0
			)
		) {
			var num41 = Player[MyPlayer].inventory[Player[MyPlayer].selectedItem].type;
			var color4 = Player[MyPlayer]
				.inventory[Player[MyPlayer].selectedItem]
				.GetAlpha(Color.White);
			var color5 = Player[MyPlayer]
				.inventory[Player[MyPlayer].selectedItem]
				.GetColor(Color.White);
			if (Player[MyPlayer].showItemIcon2 > 0) {
				num41 = Player[MyPlayer].showItemIcon2;
				color4 = Color.White;
				color5 = Color.Black;
			}

			_spriteBatch.Draw(
				ItemTexture[num41],
				new Vector2(mouseState.X + 10, mouseState.Y + 10),
				new Rectangle(0, 0, ItemTexture[num41].Width, ItemTexture[num41].Height),
				color4,
				0,
				new Vector2() /* default */,
				1,
				SpriteEffects.None,
				0
			);
			if (
				Player[MyPlayer].showItemIcon2 == 0
				&& Player[MyPlayer].inventory[Player[MyPlayer].selectedItem].color
					!= Color.Black /* default */
			) {
				_spriteBatch.Draw(
					ItemTexture[
						Player[MyPlayer].inventory[Player[MyPlayer].selectedItem].type
					],
					new Vector2(mouseState.X + 10, mouseState.Y + 10),
					new Rectangle(
						0,
						0,
						ItemTexture[
							Player[MyPlayer].inventory[Player[MyPlayer].selectedItem].type
						].Width,
						ItemTexture[
							Player[MyPlayer].inventory[Player[MyPlayer].selectedItem].type
						].Height
					),
					color5,
					0,
					new Vector2() /* default */,
					1,
					SpriteEffects.None,
					0
				);
			}
		}

		Player[MyPlayer].showItemIcon = false;
		Player[MyPlayer].showItemIcon2 = 0;
		_spriteBatch.End();
		mouseLeftRelease = mouseState.LeftButton != ButtonState.Pressed;
	};

	/* private override void */ UpdateTime = function() {
		time += 1.0;
		if (!dayTime) {
			if (time > 30000.0) {
				time = 0.0;
				dayTime = true;
				moonPhase++;
				if (moonPhase >= 8) {
					moonPhase = 0;
				}
			}
		} else if (time > 40000.0) {
			time = 0.0;
			dayTime = false;
		}
	};

	/* public */ static /* double */ CalculateDamage = function(/* int */ damage, /* int */ defense) {
		return damage / (defense * 0.1);
	};

	/* private override void */ UpdateDebug = function() {
		if (keyState.IsKeyDown(Keys.Left)) {
			screenPosition.X -= 8;
		}
		if (keyState.IsKeyDown(Keys.Right)) {
			screenPosition.X += 8;
		}
		if (keyState.IsKeyDown(Keys.Up)) {
			screenPosition.Y -= 8;
		}
		if (keyState.IsKeyDown(Keys.Down)) {
			screenPosition.Y += 8;
		}
		var num = 0;
		var num2 = 0;
		num = (mouseState.X + screenPosition.X) / 16;
		num2 = (mouseState.Y + screenPosition.Y) / 16;
		if (
			mouseState.X >= ScreenWidth
			|| mouseState.Y >= ScreenHeight
			|| num < 0
			|| num2 < 0
			|| num >= 5001
			|| num2 >= 2501
		) {
			return;
		}
		if (
			mouseState.RightButton == ButtonState.Pressed
			&& mouseState.LeftButton == ButtonState.Pressed
		) {
			if (Player[MyPlayer].releaseUseItem) {
				var num3 = Terraria
					.Npc
					.NewNpc(
						(mouseState.X + screenPosition.X),
						(mouseState.Y + screenPosition.Y),
						1
					);
				dayTime = true;
				Npc[num3].name = "Yellow Slime";
				Npc[num3].scale = 1.2;
				Npc[num3].damage = 15;
				Npc[num3].defense = 15;
				Npc[num3].life = 50;
				Npc[num3].lifeMax = Npc[num3].life;
				Npc[num3].color = new Color(255, 200, 0, 100);
			}
		} else if (mouseState.RightButton == ButtonState.Pressed) {
			if (!Tile[num, num2].active) {
				WorldGen.PlaceTile(num, num2, 4);
			}
		} else if (mouseState.LeftButton != ButtonState.Pressed) {}
	};
}
