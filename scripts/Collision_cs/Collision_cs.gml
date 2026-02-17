//using Microsoft.Xna.Framework;
//
//namespace Terraria;

/* public static */ function Collision() constructor {
	/* public */ static /* bool */ EmptyTile = function(/* int */ i, /* int */ j) {
		var rectangle = new Rectangle(i * 16, j * 16, 16, 16);
		if (Main.Tile[i, j].active) {
			return false;
		}
		for (var k = 0; k < 16; k++) {
			if (
				Main.Player[k].active
				&& rectangle.Intersects(
					new Rectangle(
						Main.Player[k].position.X,
						Main.Player[k].position.Y,
						Main.Player[k].width,
						Main.Player[k].height
					)
				)
			) {
				return false;
			}
		}
		for (var k = 0; k < 1000; k++) {
			if (
				Main.Item[k].active
				&& rectangle.Intersects(
					new Rectangle(
						Main.Item[k].position.X,
						Main.Item[k].position.Y,
						Main.Item[k].width,
						Main.Item[k].height
					)
				)
			) {
				return false;
			}
		}
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
				return false;
			}
		}
		return true;
	};

	/*public */ static /* Vector2 */ TileCollision = function(
		/* Vector2 */ position,
		/* Vector2 */ velocity,
		/* int */ width,
		/* int */ height
	) {
		var result = velocity;
		var vector = velocity;
		var vector2 = position + velocity;
		var vector3 = position;
		var num = (position.X / 16) - 1;
		var num2 = ((position.X + width) / 16) + 2;
		var num3 = (position.Y / 16) - 1;
		var num4 = ((position.Y + height) / 16) + 2;
		var num5 = -1;
		var num6 = -1;
		var num7 = -1;
		var num8 = -1;
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
		var vector4 = new Vector2(); /* default(Vector2) */
		for (var i = num; i < num2; i++) {
			for (var j = num3; j < num4; j++) {
				if (!Main.Tile[i, j].active || !Main.TileSolid[Main.Tile[i, j].type]) {
					continue;
				}
				vector4.X = i * 16;
				vector4.Y = j * 16;
				if (
					!(vector2.X + width > vector4.X)
					|| !(vector2.X < vector4.X + 16)
					|| !(vector2.Y + height > vector4.Y)
					|| !(vector2.Y < vector4.Y + 16)
				) {
					continue;
				}
				if (vector3.Y + height <= vector4.Y) {
					num7 = i;
					num8 = j;
					if (num7 != num5) {
						result.Y = vector4.Y - (vector3.Y + height);
					}
				} else if (vector3.X + width <= vector4.X) {
					num5 = i;
					num6 = j;
					if (num6 != num8) {
						result.X = vector4.X - (vector3.X + width);
					}
					if (num7 == num5) {
						result.Y = vector.Y;
					}
				} else if (vector3.X >= vector4.X + 16) {
					num5 = i;
					num6 = j;
					if (num6 != num8) {
						result.X = vector4.X + 16 - vector3.X;
					}
					if (num7 == num5) {
						result.Y = vector.Y;
					}
				} else if (vector3.Y >= vector4.Y + 16) {
					num7 = i;
					num8 = j;
					result.Y = vector4.Y + 16 - vector3.Y;
					if (num8 == num6) {
						result.X = vector.X + 0.01;
					}
				}
			}
		}

		return result;
	};
}
