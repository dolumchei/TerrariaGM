//using Microsoft.Xna.Framework;
//
//namespace Terraria;

/* public */ function Dust() constructor {
	/* public bool */ active = undefined;

	/* private int */ _alpha = undefined;

	/* public Color */ color = undefined;

	/* public Rectangle */ frame = undefined;
	/* public Vector2 */ position = undefined;

	/* public float */ rotation = undefined;

	/* public float */ scale = undefined;

	/* private int */ type = undefined;

	/* private Vector2 */ _velocity = undefined;

	/* public */ static /* void */ NewDust = function(
		/* position */ position,
		/* int */ width,
		/* int */ height,
		/* int */ type,
		/* float */ speedX = 0,
		/* float */ speedY = 0,
		/* int */ alpha = 0,
		/* Color */ newColor = new Color() /* default */
	) {
		for (var i = 0; i < 1000; i++) {
			if (!Main.Dust[i].active) {
				Main.Dust[i].active = true;
				Main.Dust[i].type = type;
				Main.Dust[i].color = newColor;
				Main.Dust[i]._alpha = alpha;
				Main.Dust[i].position.X = position.X + Main.Rand.Next(width - 4) + 4;
				Main.Dust[i].position.Y = position.Y + Main.Rand.Next(height - 4) + 4;
				Main.Dust[i]._velocity.X = Main.Rand.Next(-20, 21) * 0.1 + speedX;
				Main.Dust[i]._velocity.Y = Main.Rand.Next(-20, 21) * 0.1 + speedY;
				Main.Dust[i].frame.X = 10 * type;
				Main.Dust[i].frame.Y = 10 * Main.Rand.Next(3);
				Main.Dust[i].frame.Width = 8;
				Main.Dust[i].frame.Height = 8;
				Main.Dust[i].rotation = 0;
				Main.Dust[i].scale = 1 + Main.Rand.Next(-20, 21) * 0.01;
				if (Main.Dust[i].type == 6) {
					Main.Dust[i]._velocity.Y = Main.Rand.Next(-10, 6) * 0.1;
					Main.Dust[i]._velocity.X *= 0.3;
					Main.Dust[i].scale *= 0.7;
				}

				break;
			}
		}
	};

	/* public */ static /* void */ UpdateDust = function() {
		for (var i = 0; i < 1000; i++) {
			if (Main.Dust[i].active) {
				Main.Dust[i].position += Main.Dust[i]._velocity;
				if (Main.Dust[i].type == 6) {
					Main.Dust[i]._velocity.Y += 0.05;
				} else {
					Main.Dust[i]._velocity.Y += 0.1;
				}
				Main.Dust[i]._velocity.X *= 0.99;
				Main.Dust[i].rotation += Main.Dust[i]._velocity.X * 0.5;
				Main.Dust[i].scale -= 0.01;
				if (Main.Dust[i].position.Y > Main.screenPosition.Y + Main.ScreenHeight) {
					Main.Dust[i].active = false;
				}
				if (Main.Dust[i].scale < 0.1) {
					Main.Dust[i].active = false;
				}
			}
		}
	};

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
