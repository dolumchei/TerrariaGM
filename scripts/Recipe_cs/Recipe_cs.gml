//namespace Terraria;

/* public */ function Recipe() constructor {
	/* public */ static /* readonly int */ MaxRequirements = 10;

	/* public */ static /* readonly int */ MaxRecipes = 100;

	/* private */ static /* int */ numRecipes = undefined;

	/* private static Recipe */ newRecipe = new Recipe();

	/* public readonly Item */ createItem = new Item();

	/* public readonly Item[] */ requiredItem = array_create(MaxRecipes, new Item());

	/* public Recipe()
    {
        for (var i = 0; i < MaxRequirements; i++) requiredItem[i] = new Item();
    } */

	/* public void */ Create = function() {
		for (var i = 0; i < MaxRequirements && requiredItem[i].type != 0; i++) {
			var num = requiredItem[i].stack;
			for (var j = 0; j < 40; j++) {
				if (Main.Player[Main.MyPlayer].inventory[j].IsTheSameAs(requiredItem[i])) {
					if (Main.Player[Main.MyPlayer].inventory[j].stack > num) {
						Main.Player[Main.MyPlayer].inventory[j].stack -= num;
						num = 0;
					} else {
						num -= Main.Player[Main.MyPlayer].inventory[j].stack;
						Main.Player[Main.MyPlayer].inventory[j] = new Item();
					}
				}

				if (num <= 0) {
					break;
				}
			}
		}

		FindRecipes();
	};

	/* public */ static /* void */ FindRecipes = function() {
		var num = Main.AvailableRecipe[Main.focusRecipe];
		var num2 = Main.AvailableRecipeY[Main.focusRecipe];
		for (var i = 0; i < MaxRecipes; i++) {
			Main.AvailableRecipe[i] = 0;
		}
		Main.numAvailableRecipes = 0;
		for (var i = 0; i < MaxRecipes && Main.Recipe[i].createItem.type != 0; i++) {
			var flag = true;
			for (
				var j = 0;
				j < MaxRequirements && Main.Recipe[i].requiredItem[j].type != 0;
				j++
			) {
				var num3 = Main.Recipe[i].requiredItem[j].stack;
				for (var k = 0; k < 40; k++) {
					if (
						Main.Player[Main.MyPlayer]
							.inventory[k]
							.IsTheSameAs(Main.Recipe[i].requiredItem[j])
					) {
						num3 -= Main.Player[Main.MyPlayer].inventory[k].stack;
					}
					if (num3 <= 0) {
						break;
					}
				}

				if (num3 > 0) {
					flag = false;
					break;
				}
			}

			if (flag) {
				Main.AvailableRecipe[Main.numAvailableRecipes] = i;
				Main.numAvailableRecipes++;
			}
		}

		for (var i = 0; i < Main.numAvailableRecipes; i++) {
			if (num == Main.AvailableRecipe[i]) {
				Main.focusRecipe = i;
				break;
			}
		}

		if (Main.focusRecipe >= Main.numAvailableRecipes) {
			Main.focusRecipe = Main.numAvailableRecipes - 1;
		}
		if (Main.focusRecipe < 0) {
			Main.focusRecipe = 0;
		}
		var num4 = Main.AvailableRecipeY[Main.focusRecipe] - num2;
		for (var i = 0; i < MaxRecipes; i++) {
			Main.AvailableRecipeY[i] -= num4;
		}
	};

	/* public */ static /* void */ SetupRecipes = function() {
		newRecipe.createItem.SetDefaults(8);
		newRecipe.createItem.stack = 3;
		newRecipe.requiredItem[0].SetDefaults(23);
		newRecipe.requiredItem[0].stack = 2;
		newRecipe.requiredItem[1].SetDefaults(9);
		AddRecipe();
		newRecipe.createItem.SetDefaults(26);
		newRecipe.createItem.stack = 4;
		newRecipe.requiredItem[0].SetDefaults(3);
		AddRecipe();
		newRecipe.createItem.SetDefaults(25);
		newRecipe.requiredItem[0].SetDefaults(9);
		newRecipe.requiredItem[0].stack = 5;
		AddRecipe();
		newRecipe.createItem.SetDefaults(24);
		newRecipe.requiredItem[0].SetDefaults(9);
		newRecipe.requiredItem[0].stack = 7;
		AddRecipe();
		newRecipe.createItem.SetDefaults(20);
		newRecipe.requiredItem[0].SetDefaults(12);
		newRecipe.requiredItem[0].stack = 3;
		AddRecipe();
		newRecipe.createItem.SetDefaults("Copper Pickaxe");
		newRecipe.requiredItem[0].SetDefaults(20);
		newRecipe.requiredItem[0].stack = 12;
		newRecipe.requiredItem[1].SetDefaults(9);
		newRecipe.requiredItem[1].stack = 4;
		AddRecipe();
		newRecipe.createItem.SetDefaults("Copper Axe");
		newRecipe.requiredItem[0].SetDefaults(20);
		newRecipe.requiredItem[0].stack = 9;
		newRecipe.requiredItem[1].SetDefaults(9);
		newRecipe.requiredItem[1].stack = 3;
		AddRecipe();
		newRecipe.createItem.SetDefaults("Copper Hammer");
		newRecipe.requiredItem[0].SetDefaults(20);
		newRecipe.requiredItem[0].stack = 10;
		newRecipe.requiredItem[1].SetDefaults(9);
		newRecipe.requiredItem[1].stack = 3;
		AddRecipe();
		newRecipe.createItem.SetDefaults("Copper Broadsword");
		newRecipe.requiredItem[0].SetDefaults(20);
		newRecipe.requiredItem[0].stack = 8;
		AddRecipe();
		newRecipe.createItem.SetDefaults("Copper Shortsword");
		newRecipe.requiredItem[0].SetDefaults(20);
		newRecipe.requiredItem[0].stack = 7;
		AddRecipe();
		newRecipe.createItem.SetDefaults(19);
		newRecipe.requiredItem[0].SetDefaults(13);
		newRecipe.requiredItem[0].stack = 3;
		AddRecipe();
		newRecipe.createItem.SetDefaults("Gold Pickaxe");
		newRecipe.requiredItem[0].SetDefaults(19);
		newRecipe.requiredItem[0].stack = 12;
		newRecipe.requiredItem[1].SetDefaults(9);
		newRecipe.requiredItem[1].stack = 4;
		AddRecipe();
		newRecipe.createItem.SetDefaults("Gold Axe");
		newRecipe.requiredItem[0].SetDefaults(19);
		newRecipe.requiredItem[0].stack = 9;
		newRecipe.requiredItem[1].SetDefaults(9);
		newRecipe.requiredItem[1].stack = 3;
		AddRecipe();
		newRecipe.createItem.SetDefaults("Gold Hammer");
		newRecipe.requiredItem[0].SetDefaults(19);
		newRecipe.requiredItem[0].stack = 10;
		newRecipe.requiredItem[1].SetDefaults(9);
		newRecipe.requiredItem[1].stack = 3;
		AddRecipe();
		newRecipe.createItem.SetDefaults("Gold Broadsword");
		newRecipe.requiredItem[0].SetDefaults(19);
		newRecipe.requiredItem[0].stack = 8;
		AddRecipe();
		newRecipe.createItem.SetDefaults("Gold Shortsword");
		newRecipe.requiredItem[0].SetDefaults(19);
		newRecipe.requiredItem[0].stack = 7;
		AddRecipe();
		newRecipe.createItem.SetDefaults(22);
		newRecipe.requiredItem[0].SetDefaults(11);
		newRecipe.requiredItem[0].stack = 3;
		AddRecipe();
		newRecipe.createItem.SetDefaults(1);
		newRecipe.requiredItem[0].SetDefaults(22);
		newRecipe.requiredItem[0].stack = 12;
		newRecipe.requiredItem[1].SetDefaults(9);
		newRecipe.requiredItem[1].stack = 3;
		AddRecipe();
		newRecipe.createItem.SetDefaults(10);
		newRecipe.requiredItem[0].SetDefaults(22);
		newRecipe.requiredItem[0].stack = 9;
		newRecipe.requiredItem[1].SetDefaults(9);
		newRecipe.requiredItem[1].stack = 3;
		AddRecipe();
		newRecipe.createItem.SetDefaults(7);
		newRecipe.requiredItem[0].SetDefaults(22);
		newRecipe.requiredItem[0].stack = 10;
		newRecipe.requiredItem[1].SetDefaults(9);
		newRecipe.requiredItem[1].stack = 3;
		AddRecipe();
		newRecipe.createItem.SetDefaults(4);
		newRecipe.requiredItem[0].SetDefaults(22);
		newRecipe.requiredItem[0].stack = 8;
		AddRecipe();
		newRecipe.createItem.SetDefaults(6);
		newRecipe.requiredItem[0].SetDefaults(22);
		newRecipe.requiredItem[0].stack = 7;
		AddRecipe();
		newRecipe.createItem.SetDefaults(21);
		newRecipe.requiredItem[0].SetDefaults(14);
		newRecipe.requiredItem[0].stack = 3;
		AddRecipe();
		newRecipe.createItem.SetDefaults("Silver Pickaxe");
		newRecipe.requiredItem[0].SetDefaults(21);
		newRecipe.requiredItem[0].stack = 12;
		newRecipe.requiredItem[1].SetDefaults(9);
		newRecipe.requiredItem[1].stack = 4;
		AddRecipe();
		newRecipe.createItem.SetDefaults("Silver Axe");
		newRecipe.requiredItem[0].SetDefaults(21);
		newRecipe.requiredItem[0].stack = 9;
		newRecipe.requiredItem[1].SetDefaults(9);
		newRecipe.requiredItem[1].stack = 3;
		AddRecipe();
		newRecipe.createItem.SetDefaults("Silver Hammer");
		newRecipe.requiredItem[0].SetDefaults(21);
		newRecipe.requiredItem[0].stack = 10;
		newRecipe.requiredItem[1].SetDefaults(9);
		newRecipe.requiredItem[1].stack = 3;
		AddRecipe();
		newRecipe.createItem.SetDefaults("Silver Broadsword");
		newRecipe.requiredItem[0].SetDefaults(21);
		newRecipe.requiredItem[0].stack = 8;
		AddRecipe();
		newRecipe.createItem.SetDefaults("Silver Shortsword");
		newRecipe.requiredItem[0].SetDefaults(21);
		newRecipe.requiredItem[0].stack = 7;
		AddRecipe();
	};

	/* private */ static /* void */ AddRecipe = function() {
		Main.Recipe[numRecipes] = newRecipe;
		newRecipe = new Recipe();
		numRecipes++;
	};
}
