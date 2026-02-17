//using Microsoft.Xna.Framework;
//
//namespace Terraria;

/* public */ function Item() constructor {
	/* private */ static /* readonly float */ Gravity = 0.1;

	/* private */ static /* readonly float */ MaxFallSpeed = 10;

	/* public bool */ active = undefined;

	/* public int */ alpha = undefined;

	/* public bool */ autoReuse = undefined;

	/* public int */ axe = undefined;

	/* public bool */ beingGrabbed = undefined;

	/* public int */ bodySlot = undefined;

	/* public Color */ color = undefined;

	/* public bool */ consumable = undefined;

	/* public int */ createTile = -1;

	/* public int */ createWall = -1;

	/* public int */ damage = undefined;

	/* public int */ defense = undefined;

	/* public int */ hammer = undefined;

	/* public int */ headSlot = undefined;

	/* public int */ healLife = undefined;

	/* public int */ height = undefined;

	/* public int */ holdStyle = undefined;

	/* public float */ knockBack = undefined;

	/* public int */ legSlot = undefined;

	/* public int */ maxStack = undefined;

	/* public string */ name = undefined;

	/* public int */ noGrabDelay = undefined;

	/* public int */ pick = undefined;

	/* public Vector2 */ position = undefined;

	/* public float */ scale = 1;

	/* public int */ stack = undefined;

	/* public int */ tileBoost = undefined;

	/* public int */ type = undefined;

	/* public int */ useAnimation = undefined;

	/* public int */ useSound = undefined;

	/* public int */ useStyle = undefined;

	/* public int */ useTime = undefined;

	/* public bool */ useTurn = undefined;

	/* public Vector2 */ velocity = undefined;

	/* public int */ width = undefined;

	/* public void */ SetDefaults = function(/* string */ itemName) {
		if (itemName == "Gold Pickaxe") {
			SetDefaults(1);
			color = new Color(210, 190, 0, 100);
			useTime = 13;
			pick = 65;
			useAnimation = 19;
			scale = 1.1;
			damage = 7;
		}

		if (itemName == "Gold Broadsword") {
			SetDefaults(4);
			color = new Color(210, 190, 0, 100);
			useAnimation = 19;
			damage = 15;
			scale = 1.1;
		}

		if (itemName == "Gold Shortsword") {
			SetDefaults(6);
			color = new Color(210, 190, 0, 100);
			damage = 12;
			useAnimation = 10;
			scale = 1;
		}

		if (itemName == "Gold Axe") {
			SetDefaults(10);
			color = new Color(210, 190, 0, 100);
			useTime = 17;
			axe = 13;
			useAnimation = 25;
			scale = 1.2;
			damage = 8;
		}

		if (itemName == "Gold Hammer") {
			SetDefaults(7);
			color = new Color(210, 190, 0, 100);
			useAnimation = 27;
			useTime = 17;
			hammer = 65;
			scale = 1.3;
			damage = 10;
		}

		if (itemName == "Silver Pickaxe") {
			SetDefaults(1);
			color = new Color(180, 180, 180, 100);
			useTime = 17;
			pick = 55;
			useAnimation = 20;
			scale = 1.05;
			damage = 6;
		}

		if (itemName == "Silver Broadsword") {
			SetDefaults(4);
			color = new Color(180, 180, 180, 100);
			useAnimation = 20;
			damage = 13;
			scale = 1.05;
		}

		if (itemName == "Silver Shortsword") {
			SetDefaults(6);
			color = new Color(180, 180, 180, 100);
			damage = 11;
			useAnimation = 11;
			scale = 0.95;
		}

		if (itemName == "Silver Axe") {
			SetDefaults(10);
			color = new Color(180, 180, 180, 100);
			useTime = 18;
			axe = 11;
			useAnimation = 26;
			scale = 1.15;
			damage = 7;
		}

		if (itemName == "Silver Hammer") {
			SetDefaults(7);
			color = new Color(180, 180, 180, 100);
			useAnimation = 28;
			useTime = 23;
			scale = 1.25;
			damage = 9;
			hammer = 55;
		}

		if (itemName == "Copper Pickaxe") {
			SetDefaults(1);
			color = new Color(180, 100, 45, 80);
			useTime = 15;
			pick = 35;
			useAnimation = 23;
			scale = 0.9;
			tileBoost = -1;
			damage = 2;
		}

		if (itemName == "Copper Broadsword") {
			SetDefaults(4);
			color = new Color(180, 100, 45, 80);
			useAnimation = 23;
			damage = 8;
			scale = 0.9;
		}

		if (itemName == "Copper Shortsword") {
			SetDefaults(6);
			color = new Color(180, 100, 45, 80);
			damage = 6;
			useAnimation = 13;
			scale = 0.8;
		}

		if (itemName == "Copper Axe") {
			SetDefaults(10);
			color = new Color(180, 100, 45, 80);
			useTime = 21;
			axe = 8;
			useAnimation = 30;
			scale = 1;
			damage = 3;
			tileBoost = -1;
		}

		if (itemName == "Copper Hammer") {
			SetDefaults(7);
			color = new Color(180, 100, 45, 80);
			useAnimation = 33;
			useTime = 23;
			scale = 1.1;
			damage = 4;
			hammer = 35;
			tileBoost = -1;
		}

		name = itemName;
	};

	/* public void */ SetDefaults = function(/* int */ itemType) {
		active = true;
		alpha = 0;
		autoReuse = false;
		axe = 0;
		color = c_white; /* default */
		consumable = false;
		createTile = -1;
		createWall = -1;
		damage = -1;
		holdStyle = 0;
		knockBack = 0;
		maxStack = 1;
		pick = 0;
		scale = 1;
		stack = 1;
		tileBoost = 0;
		self.type = itemType;
		useStyle = 0;
		useTurn = false;
		if (self.type == 1) {
			name = "Iron Pickaxe";
			useStyle = 1;
			useTurn = true;
			useAnimation = 20;
			useTime = 13;
			autoReuse = true;
			width = 24;
			height = 28;
			damage = 5;
			pick = 45;
			useSound = 1;
		} else if (self.type == 2) {
			name = "Dirt Block";
			useStyle = 1;
			useTurn = true;
			useAnimation = 15;
			useTime = 10;
			autoReuse = true;
			maxStack = 99;
			consumable = true;
			createTile = 0;
			width = 12;
			height = 12;
		} else if (self.type == 3) {
			name = "Stone Block";
			useStyle = 1;
			useTurn = true;
			useAnimation = 15;
			useTime = 10;
			autoReuse = true;
			maxStack = 99;
			consumable = true;
			createTile = 1;
			width = 12;
			height = 12;
		} else if (self.type == 4) {
			name = "Iron Broadsword";
			useStyle = 1;
			useTurn = false;
			useAnimation = 21;
			useTime = 21;
			width = 24;
			height = 28;
			damage = 10;
			knockBack = 5;
			useSound = 1;
			scale = 1;
		} else if (self.type == 5) {
			name = "Mushroom";
			useStyle = 2;
			useSound = 2;
			useTurn = false;
			useAnimation = 17;
			useTime = 17;
			width = 16;
			height = 18;
			healLife = 20;
			maxStack = 99;
			consumable = true;
		} else if (self.type == 6) {
			name = "Iron Shortsword";
			useStyle = 3;
			useTurn = false;
			useAnimation = 12;
			useTime = 12;
			width = 24;
			height = 28;
			damage = 8;
			knockBack = 4;
			scale = 0.9;
			useSound = 1;
			useTurn = true;
		} else if (self.type == 7) {
			name = "Iron Hammer";
			autoReuse = true;
			useStyle = 1;
			useTurn = true;
			useAnimation = 30;
			useTime = 20;
			hammer = 45;
			width = 24;
			height = 28;
			damage = 7;
			knockBack = 6.5;
			scale = 1.2;
			useSound = 1;
		} else if (self.type == 8) {
			name = "Torch";
			useStyle = 1;
			useTurn = true;
			useAnimation = 15;
			useTime = 10;
			holdStyle = 1;
			autoReuse = true;
			maxStack = 99;
			consumable = true;
			createTile = 4;
			width = 10;
			height = 12;
			damage = 1;
		} else if (self.type == 9) {
			name = "Wood";
			useTurn = true;
			useAnimation = 15;
			useTime = 10;
			autoReuse = true;
			maxStack = 99;
			consumable = true;
			width = 8;
			height = 10;
		} else if (self.type == 10) {
			name = "Iron Axe";
			useStyle = 1;
			useTurn = true;
			useAnimation = 27;
			knockBack = 5.5;
			useTime = 19;
			autoReuse = true;
			width = 24;
			height = 28;
			damage = 5;
			axe = 9;
			scale = 1.1;
			useSound = 1;
		} else if (self.type == 11) {
			name = "Iron Ore";
			useStyle = 1;
			useTurn = true;
			useAnimation = 15;
			useTime = 10;
			autoReuse = true;
			maxStack = 99;
			consumable = true;
			createTile = 6;
			width = 12;
			height = 12;
		} else if (self.type == 12) {
			name = "Copper Ore";
			useStyle = 1;
			useTurn = true;
			useAnimation = 15;
			useTime = 10;
			autoReuse = true;
			maxStack = 99;
			consumable = true;
			createTile = 7;
			width = 12;
			height = 12;
		} else if (self.type == 13) {
			name = "Gold Ore";
			useStyle = 1;
			useTurn = true;
			useAnimation = 15;
			useTime = 10;
			autoReuse = true;
			maxStack = 99;
			consumable = true;
			createTile = 8;
			width = 12;
			height = 12;
		} else if (self.type == 14) {
			name = "Silver Ore";
			useStyle = 1;
			useTurn = true;
			useAnimation = 15;
			useTime = 10;
			autoReuse = true;
			maxStack = 99;
			consumable = true;
			createTile = 9;
			width = 12;
			height = 12;
		} else if (self.type == 15) {
			name = "Green Tunic";
			width = 24;
			height = 28;
			bodySlot = 1;
			defense = 2;
		} else if (self.type == 16) {
			name = "Gray Tunic";
			width = 24;
			height = 28;
			bodySlot = 2;
			defense = 2;
		} else if (self.type == 17) {
			name = "White Pants";
			width = 24;
			height = 28;
			legSlot = 1;
			defense = 1;
		} else if (self.type == 18) {
			name = "Blue Pants";
			width = 24;
			height = 28;
			legSlot = 2;
			defense = 1;
		} else if (self.type == 19) {
			name = "Gold Bar";
			width = 20;
			height = 20;
			maxStack = 99;
		} else if (self.type == 20) {
			name = "Copper Bar";
			width = 20;
			height = 20;
			maxStack = 99;
		} else if (self.type == 21) {
			name = "Silver Bar";
			width = 20;
			height = 20;
			maxStack = 99;
		} else if (self.type == 22) {
			name = "Iron Bar";
			width = 20;
			height = 20;
			maxStack = 99;
		} else if (self.type == 23) {
			name = "Gel";
			width = 20;
			height = 12;
			maxStack = 12;
			alpha = 175;
			color = new Color(0, 80, 255, 100);
		} else if (self.type == 24) {
			name = "Wooden Sword";
			useStyle = 1;
			useTurn = false;
			useAnimation = 25;
			width = 24;
			height = 28;
			damage = 7;
			knockBack = 4;
			scale = 0.95;
			useSound = 1;
		} else if (self.type == 25) {
			name = "Wooden Door";
			useStyle = 1;
			useTurn = true;
			useAnimation = 15;
			useTime = 10;
			maxStack = 99;
			consumable = true;
			createTile = 10;
			width = 14;
			height = 28;
		} else if (self.type == 26) {
			name = "Stone Wall";
			useStyle = 1;
			useTurn = true;
			useAnimation = 15;
			useTime = 10;
			autoReuse = true;
			maxStack = 99;
			consumable = true;
			createWall = 1;
			width = 12;
			height = 12;
		}
	};

	/* public Color */ GetAlpha = function(/* Color */ newColor) {
		var r = newColor.R - alpha;
		var g = newColor.G - alpha;
		var b = newColor.B - alpha;
		var num = newColor.A - alpha;
		if (num < 0) {
			num = 0;
		}
		if (num > 255) {
			num = 255;
		}
		return new Color(r, g, b, num);
	};

	/* public Color*/ GetColor = function(/* Color */ newColor) {
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

	/* public void */ UpdateItem = function(/*int */ i) {
		if (!beingGrabbed) {
			velocity.Y += Gravity;
			if (velocity.Y > MaxFallSpeed) {
				velocity.Y = MaxFallSpeed;
			}
			velocity.X *= 0.95;
			if (velocity.X < 0.1 && velocity.X > -0.1) {
				velocity.X = 0;
			}
			velocity = Collision.TileCollision(position, velocity, width, height);
		} else {
			beingGrabbed = false;
		}

		if (type == 8) {
			Lighting.AddLight(
				int((position.X - 7) / 16),
				int((position.Y - 7) / 16),
				byte.MaxValue
			);
		}
		position += velocity;
		if (noGrabDelay > 0) {
			noGrabDelay--;
		}
	};

	/* public */ static /* int */ NewItem = function(/* int */ x, /* int */ y, /* int */ width, /* int */ height, /* int */ type) {
		var num = -1;
		for (var i = 0; i < 1000; i++) {
			if (!Main.Item[i].active) {
				num = i;
				break;
			}
		}

		if (num == -1) {
			num = 999;
			for (var i = 0; i < 999; i++) {
				Main.Item[i] = new Item();
				Main.Item[i] = Main.Item[i + 1];
			}
		}

		Main.Item[num] = new Item();
		Main.Item[num].SetDefaults(type);
		Main.Item[num].position.X = x + width / 2 - Main.Item[num].width / 2;
		Main.Item[num].position.Y = y + height / 2 - Main.Item[num].height / 2;
		Main.Item[num].velocity.X = Main.Rand.Next(-20, 21) * 0.1;
		Main.Item[num].velocity.Y = Main.Rand.Next(-30, -10) * 0.1;
		Main.Item[num].active = true;
		return num;
	};

	/* public object */ Clone = function() {
		return MemberwiseClone();
	};

	/* public bool */ IsTheSameAs = function(/* Item */ compareItem) {
		if (name == compareItem.name) {
			return true;
		}
		return false;
	};
}
