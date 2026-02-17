//using System;
//using Microsoft.Xna.Framework;
//
//namespace Terraria;

/* public static */ function Lighting() constructor {
	/* public const int */ offScreenTiles = 21;

	/* private */ static /* Color */ lightColor = Color.Black;

	/* private */ static /* int */ firstTileX = undefined;

	/* private */ static /* int */ lastTileX = undefined;

	/* private */ static /* int */ firstTileY = undefined;

	/* private */ static /* int */ lastTileY = undefined;

	/* public */ static /* Color[,] */ color = []; /* new Color[
        Main.ScreenWidth / 16 + 42 + 10,
        Main.ScreenHeight / 16 + 42 + 10
    ]; */

	/* private */ static /* readonly int */ MaxTempLights = 100;

	/* private */ static /* readonly int[] */ TempLightX = array_create(MaxTempLights, 0);

	/* private */ static /* readonly int[] */ TempLightY = array_create(MaxTempLights, 0);

	/* private */ static /* readonly int[] */ TempLight = array_create(MaxTempLights, 0);

	/* private */ static /* int */ tempLightCount = undefined;

	/* private */ static /* int */ firstToLightX = undefined;

	/* private */ static /* int */ firstToLightY = undefined;

	/* private */ static /* int */ lastToLightX = undefined;

	/* private */ static /* int */ lastToLightY = undefined;

	/* public */ static /* void */ LightTiles = function(
		/* int */ firstX,
		/* int */ lastX,
		/* int */ firstY,
		/* int */ lastY
	) {
		firstTileX = firstX;
		lastTileX = lastX;
		firstTileY = firstY;
		lastTileY = lastY;
		firstToLightX = firstTileX - 21;
		firstToLightY = firstTileY - 21;
		lastToLightX = lastTileX + 21;
		lastToLightY = lastTileY + 21;
		for (var i = 0; i < Main.ScreenWidth / 16 + 42 + 10; i++) {
			for (var j = 0; j < Main.ScreenHeight / 16 + 42 + 10; j++) {
				/* ref */ var reference = /* ref */ color[i, j];
				reference = Color.Black;
			}
		}

		for (var i = 0; i < tempLightCount; i++) {
			if (
				TempLightX[i] - firstTileX + 21 >= 0
				&& TempLightX[i] - firstTileX + 21 < Main.ScreenWidth / 16 + 42 + 10
				&& TempLightY[i] - firstTileY + 21 >= 0
				&& TempLightY[i] - firstTileY + 21 < Main.ScreenHeight / 16 + 42 + 10
			) {
				/* ref */ var reference2 = /* ref */ color[
					TempLightX[i] - firstTileX + 21,
					TempLightY[i] - firstTileY + 21
				];
				reference2 = new Color(
					TempLight[i],
					TempLight[i],
					TempLight[i],
					TempLight[i]
				);
			}
		}

		tempLightCount = 0;
		for (var i = firstToLightX; i < lastToLightX; i++) {
			for (var j = firstToLightY; j < lastToLightY; j++) {
				if (
					i >= 0
					&& i < 5001
					&& j >= 0
					&& j < 2501
					&& (!Main.Tile[i, j].active || !Main.TileSolid[Main.Tile[i, j].type])
					&& (Main.Tile[i, j].lighted || Main.Tile[i, j].type == 4)
				) {
					if (
						color[i - firstToLightX, j - firstToLightY].R < Main.tileColor.R
						&& Main.tileColor.R
							> color[i - firstToLightX, j - firstToLightY].R
						&& Main.Tile[i, j].wall == 0
					) {
						/* ref */ var reference3 = /* ref */ color[
							i - firstToLightX,
							j - firstToLightY
						];
						reference3 = Main.tileColor;
					}

					if (Main.Tile[i, j].type == 4) {
						/* ref */ var reference4 = /* ref */ color[
							i - firstToLightX,
							j - firstToLightY
						];
						reference4 = Color.White;
					}
				}
			}
		}

		for (var k = 0; k < 2; k++) {
			for (var i = firstToLightX; i < lastToLightX; i++) {
				lightColor = Color.Black;
				for (var j = firstToLightY; j < lastToLightY; j++) {
					LightColor(i, j);
				}
			}

			for (var i = firstToLightX; i < lastToLightX; i++) {
				lightColor = Color.Black;
				for (var j = lastToLightY; j >= firstToLightY; j--) {
					LightColor(i, j);
				}
			}

			for (var j = firstToLightY; j < lastToLightY; j++) {
				lightColor = Color.Black;
				for (var i = firstToLightX; i < lastToLightX; i++) {
					LightColor(i, j);
				}
			}

			for (var j = firstToLightY; j < lastToLightY; j++) {
				lightColor = Color.Black;
				for (var i = lastToLightX; i >= firstToLightX; i--) {
					LightColor(i, j);
				}
			}
		}
	};

	/* public */ static /* void */ AddLight = function(/* int */ i, /* int */ j, /* byte */ lightness) {
		if (
			tempLightCount != MaxTempLights
			&& i - firstTileX + 21 >= 0
			&& i - firstTileX + 21 < Main.ScreenWidth / 16 + 42 + 10
			&& j - firstTileY + 21 >= 0
			&& j - firstTileY + 21 < Main.ScreenHeight / 16 + 42 + 10
		) {
			TempLightX[tempLightCount] = i;
			TempLightY[tempLightCount] = j;
			TempLight[tempLightCount] = lightness;
			tempLightCount++;
		}
	};

	/* private */ static /* void */ LightColor = function(/* int */ i, /* int */ j) {
		var num = i - firstToLightX;
		var num2 = j - firstToLightY;
		try {
			if (color[num, num2].R > lightColor.R) {
				lightColor = color[num, num2];
			} else {
				/* ref */ var reference = /* ref */ color[num, num2];
				reference = lightColor;
			}

			var num3 = Main.Tile[i, j].active && Main.TileSolid[Main.Tile[i, j].type]
				? 40
				: 10;
			var num4 = lightColor.R - num3;
			if (num4 < 0) {
				num4 = 0;
			}
			lightColor.R = num4;
			lightColor.B = lightColor.R;
			lightColor.G = lightColor.R;
			if (
				lightColor.R > 0
				&& (!Main.Tile[i, j].active || !Main.TileSolid[Main.Tile[i, j].type])
				&& j < Main.worldSurface
			) {
				Main.Tile[i, j].lighted = true;
			}
		} /* Exception */ catch (exception) {
			throw new Exception(exception.Message, exception);
		}
	};

	/* public */ static /* int */ LightingX = function(/* int */ lightX) {
		if (lightX < 0) {
			return 0;
		}
		if (lightX >= Main.ScreenWidth / 16 + 42 + 10) {
			return Main.ScreenWidth / 16 + 42 + 10 - 1;
		}
		return lightX;
	};

	/* public */ static /* int */ LightingY = function(/* int */ lightY) {
		if (lightY < 0) {
			return 0;
		}
		if (lightY >= Main.ScreenHeight / 16 + 42 + 10) {
			return Main.ScreenHeight / 16 + 42 + 10 - 1;
		}
		return lightY;
	};
}
