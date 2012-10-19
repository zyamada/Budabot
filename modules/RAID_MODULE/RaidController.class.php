<?php

/**
 * Authors: 
 *	- Derroylo (RK2)
 *  - Marinerecon (RK2)
 *  - Tyrence (RK2)
 *
 * @Instance
 *
 * Commands this class contains:
 *	@DefineCommand(
 *		command     = 'loot',
 *		accessLevel = 'all',
 *		description = 'Show the loot list',
 *		help        = 'flatroll.txt'
 *	)
 *	@DefineCommand(
 *		command     = 'loot .+',
 *		accessLevel = 'rl',
 *		description = 'Modify the loot list',
 *		help        = 'flatroll.txt'
 *	)
 *	@DefineCommand(
 *		command     = 'multiloot',
 *		accessLevel = 'rl',
 *		description = 'Add items with more than one quantity to the loot list',
 *		help        = 'flatroll.txt'
 *	)
 *	@DefineCommand(
 *		command     = 'remloot',
 *		accessLevel = 'rl',
 *		description = 'Remove item from loot list',
 *		help        = 'flatroll.txt'
 *	)
 *	@DefineCommand(
 *		command     = 'reroll',
 *		accessLevel = 'rl',
 *		description = 'Reroll the residual loot list',
 *		help        = 'flatroll.txt'
 *	)
 *	@DefineCommand(
 *		command     = 'flatroll',
 *		accessLevel = 'rl',
 *		description = 'Roll the loot list',
 *		help        = 'flatroll.txt'
 *	)
 *	@DefineCommand(
 *		command     = 'add',
 *		accessLevel = 'all',
 *		description = 'Add a player to a roll slot',
 *		help        = 'add_rem.txt'
 *	)
 *	@DefineCommand(
 *		command     = 'rem',
 *		accessLevel = 'all',
 *		description = 'Remove a player from a roll slot',
 *		help        = 'add_rem.txt'
 *	)
 */
class RaidController {

	/**
	 * Name of the module.
	 * Set automatically by module loader.
	 */
	public $moduleName;
	
	/** @Inject */
	public $db;
	
	/** @Inject */
	public $chatBot;
	
	/** @Inject */
	public $setting;
	
	/** @Inject */
	public $commandAlias;

	/** @Inject */
	public $text;
	
	/**
	 * @Setup
	 */
	public function setup() {
		$this->setting->add($this->moduleName, "add_on_loot", "Adding to loot show on", "edit", "options", "2", "tells;privatechat;privatechat and tells", '1;2;3', "mod");
		
		$this->commandAlias->register($this->moduleName, "flatroll", "rollloot");
		$this->commandAlias->register($this->moduleName, "flatroll", "result");
		$this->commandAlias->register($this->moduleName, "flatroll", "win");
		
		$this->commandAlias->register($this->moduleName, "loot", "list");
	}
	
	/**
	 * @HandlesCommand("loot")
	 * @Matches("/^loot$/i")
	 */
	public function lootCommand($message, $channel, $sender, $sendto, $args) {
		$msg = Raid::get_current_loot_list();
		$sendto->reply($msg);
	}
	
	/**
	 * @HandlesCommand("loot .+")
	 * @Matches("/^loot clear$/i")
	 */
	public function lootClearCommand($message, $channel, $sender, $sendto, $args) {
		global $loot;
		global $residual;
		$loot = "";
		$residual = "";
		$msg = "Loot has been cleared by <highlight>$sender<end>.";
		$this->chatBot->sendPrivate($msg);

		if ($channel != 'priv') {
			$sendto->reply($msg);
		}
	}
	
	/**
	 * @HandlesCommand("loot .+")
	 * @Matches("/^loot ([0-9]+)$/i")
	 */
	public function lootAddByIdCommand($message, $channel, $sender, $sendto, $args) {
		global $loot;
		$id = $args[1];

		$sql = "SELECT * FROM raid_loot WHERE id = ?";
		$item = $this->db->queryRow($sql, $id);

		if ($item === null) {
			$msg = "Could not find item with id <highlight>$id<end> to add.";
			$sendto->reply($msg);
			return;
		}

		$dontadd = 0;
		forEach ($loot as $key => $value) {
			if ($value["name"] == $item->name){
				$loot[$key]["multiloot"] = $value["multiloot"]+1;
				$total = $value["multiloot"]+1;
				$dontadd = 1;
				$slot = $key;
			}
		}

		if ($dontadd == 0) {
			if (is_array($loot)) {
				$nextloot = count($loot) + 1;
			} else {
				$nextloot = 1;
			}
			$loot[$nextloot]["name"] = $item->name;
			$loot[$nextloot]["linky"] = $this->text->make_item($item->lowid, $item->highid, $item->ql, $item->name);
			$loot[$nextloot]["icon"] = $item->imageid;
			$loot[$nextloot]["multiloot"] = 1;
			$msg = "<highlight>".$item->name."<end> will be rolled in Slot <highlight>#".$nextloot;
		} else {
			$msg = "<highlight>".$item->name."<end> will be rolled in Slot <highlight>#".$slot."<end> as multiloot. Total: <yellow>".$total."<end>";
		}
		$msg .= "\nTo add use <symbol>add ".$nextloot.", or <symbol>rem to remove yourself";
		$this->chatBot->sendPrivate($msg);
	}

	/**
	 * @HandlesCommand("loot .+")
	 * @Matches("/^loot (.+)$/i")
	 */
	public function lootAddCommand($message, $channel, $sender, $sendto, $args) {
		global $loot;
		global $residual;
		$lootitem = $args[1];

		//Check if the item is a link
		if (preg_match("/^<a href=\"itemref:\/\/([0-9]+)\/([0-9]+)\/([0-9]+)\">(.+)<\/a>(.*)$/i", $lootitem, $item)) {
			$item_ql = $item[3];
			$item_highid = $item[1];
			$item_lowid = $item[2];
			$item_name = $item[4];
		} else if (preg_match("/^(.+)<a href=\"itemref:\/\/([0-9]+)\/([0-9]+)\/([0-9]+)\">(.+)<\/a>(.*)$/i", $lootitem, $item)){
			$item_ql = $item[4];
			$item_highid = $item[2];
			$item_lowid = $item[3];
			$item_name = $item[5];
		} else {
			$item_name = $lootitem;
		}

		//Check if the item is already on the list (i.e. SMART LOOT)
		forEach ($loot as $key => $item) {
			if (strtolower($item["name"]) == strtolower($item_name)) {
				if ($item["multiloot"]) {
					if ($multiloot) {
						$loot[$key]["multiloot"] = $item["multiloot"] + $multiloot;
					} else {
						$loot[$key]["multiloot"] = $item["multiloot"] + 1;
					}
				} else {
					if ($multiloot) {
						$loot[$key]["multiloot"] = 1 + $multiloot;
					} else {
						$loot[$key]["multiloot"] = 2;
					}
				}
				$dontadd = 1;
				$itmref = $key;
			}
		}

		//get a slot for the item
		if (is_array($loot)) {
			$num_loot = count($loot);
			$num_loot++;
		} else {
			$num_loot = 1;
		}

		//Check if max slots is reached
		if ($num_loot >= 30) {
			$msg = "You can only roll 30 items max at one time!";
			$this->chatBot->sendPrivate($msg);
			return;
		}

		//Check if there is a icon available
		$row = $this->db->queryRow("SELECT * FROM aodb WHERE `name` LIKE ?", $item_name);
		if ($row !== null) {
			$item_name = $row->name;

			//Save the icon
			$looticon = $row->icon;
			//Save the aoid and ql if not set yet
			if (!isset($item_highid)) {
				$item_lowid = $row->lowid;
				$item_highid = $row->highid;
				$item_ql = $row->highql;
			}
		}

		//Save item
		if (!$dontadd) {
			if (isset($item_highid)) {
				$loot[$num_loot]["linky"] = $this->text->make_item($item_lowid, $item_highid, $item_ql, $item_name);
			}

			$loot[$num_loot]["name"] = $item_name;
			$loot[$num_loot]["icon"] = $looticon;

			//Save the person who has added the loot item
			$loot[$num_loot]["added_by"] = $sender;

			//Save multiloot
			$loot[$num_loot]["multiloot"] = $multiloot;

			//Send info
			if ($multiloot) {
				$this->chatBot->sendPrivate($multiloot."x <highlight>{$loot[$num_loot]["name"]}<end> will be rolled in Slot <highlight>#$num_loot<end>");
			} else {
				$this->chatBot->sendPrivate("<highlight>{$loot[$num_loot]["name"]}<end> will be rolled in Slot <highlight>#$num_loot<end>");
			}
			$this->chatBot->sendPrivate("To add use <symbol>add $num_loot, or <symbol>rem to remove yourself");
		} else {
			//Send info in case of SMART
			if ($multiloot) {
				$this->chatBot->sendPrivate($multiloot."x <highlight>{$loot[$itmref]["name"]}<end> added to Slot <highlight>#$itmref<end> as multiloot. Total: <yellow>{$loot[$itmref]["multiloot"]}<end>");
			} else {
				$this->chatBot->sendPrivate("<highlight>{$loot[$itmref]["name"]}<end> added to Slot <highlight>#$itmref<end> as multiloot. Total: <yellow>{$loot[$itmref]["multiloot"]}<end>");
			}
			$this->chatBot->sendPrivate("To add use <symbol>add $itmref, or <symbol>rem to remove yourself");
			$dontadd = 0;
			$itmref = 0;
			if (is_array($residual)) {
				$residual = "";
			}
		}
	}
	
	/**
	 * @HandlesCommand("multiloot")
	 * @Matches("/^multiloot (.+)$/i")
	 */
	public function multilootCommand($message, $channel, $sender, $sendto, $args) {
		global $loot;
		global $residual;
		$input = $args[1];

		//Check if it is a valid multiloot
		if(preg_match("/^([0-9]+)x (.+)$/i", $input, $lewt) || preg_match("/^([0-9]+) (.+)$/i", $input, $lewt)){
			$multiloot = $lewt[1];
		} else {
			$this->chatBot->sendPrivate("The data you entered is not a multiloot. Please check <highlight>/tell <myname> <symbol>help multiloot<end> for the correct syntax.");
			return;
		}

		//Check if the item is a link
		if (preg_match("/^<a href=\"itemref:\/\/([0-9]+)\/([0-9]+)\/([0-9]+)\">(.+)<\/a>(.*)$/i", $lewt[2], $item)) {
			$item_ql = $item[3];
			$item_highid = $item[1];
			$item_lowid = $item[2];
			$item_name = $item[4];
		} else if (preg_match("/^(.+)<a href=\"itemref:\/\/([0-9]+)\/([0-9]+)\/([0-9]+)\">(.+)<\/a>(.*)$/i", $lewt[2], $item)){
			$item_ql = $item[4];
			$item_highid = $item[2];
			$item_lowid = $item[3];
			$item_name = $item[5];

		} else {
			$item_name = $lewt[2];
		}

		//Check if the item is already on the list (i.e. SMART LOOT)
		forEach ($loot as $key => $item) {
			if (strtolower($item["name"]) == strtolower($item_name)) {
				if ($item["multiloot"]) {
					if ($multiloot){
						$loot[$key]["multiloot"] = $item["multiloot"] + $multiloot;
					} else {
						$loot[$key]["multiloot"] = $item["multiloot"] + 1;
					}
				} else {
					if($multiloot){
						$loot[$key]["multiloot"] = 1 + $multiloot;
					} else{
						$loot[$key]["multiloot"] = 2;
					}
				}
				$dontadd = 1;
				$itmref = $key;
			}
		}

		//get a slot for the item
		if (is_array($loot)) {
			$num_loot = count($loot);
			$num_loot++;
		} else {
			$num_loot = 1;
		}

		//Check if max slots is reached
		if ($num_loot >= 30) {
			$msg = "You can only roll 30items max at one time!";
			$this->chatBot->sendPrivate($msg);
			return;
		}

		//Check if there is a icon available
		$row = $this->db->queryRow("SELECT * FROM aodb WHERE `name` LIKE ?", $item_name);
		if ($row !== null) {
			$item_name = $row->name;

			//Save the icon
			$looticon = $row->icon;
			//Save the aoid and ql if not set yet
			if (!isset($item_highid)) {
				$item_lowid = $row->lowid;
				$item_highid = $row->highid;
				$item_ql = $row->highql;
			}
		}


		//Save item
		if (!$dontadd) {
			if (isset($item_highid)) {
				$loot[$num_loot]["linky"] = $this->text->make_item($item_lowid, $item_highid, $item_ql, $item_name);
			}

			$loot[$num_loot]["name"] = $item_name;
			$loot[$num_loot]["icon"] = $looticon;

			//Save the person who has added the loot item
			$loot[$num_loot]["added_by"] = $sender;

			//Save multiloot
			$loot[$num_loot]["multiloot"] = $multiloot;

			//Send info
			if ($multiloot) {
				$this->chatBot->sendPrivate($multiloot."x <highlight>{$loot[$num_loot]["name"]}<end> will be rolled in Slot <highlight>#$num_loot<end>");
			}
			$this->chatBot->sendPrivate("To add use <symbol>add $num_loot, or <symbol>rem to remove yourself");
		} else {
			//Send info in case of SMART
			if ($multiloot) {
				$this->chatBot->sendPrivate($multiloot."x <highlight>{$loot[$itmref]["name"]}<end> added to Slot <highlight>#$itmref<end> as multiloot. Total: <yellow>{$loot[$itmref]["multiloot"]}<end>");
			}

			$this->chatBot->sendPrivate("To add use <symbol>add $itmref, or <symbol>rem to remove yourself");
			$dontadd = 0;
			$itmref = 0;
			if (is_array($residual)) {
				$residual = "";
			}
		}
	}
	
	/**
	 * @HandlesCommand("remloot")
	 * @Matches("/^remloot ([0-9]+)$/i")
	 */
	public function remlootCommand($message, $channel, $sender, $sendto, $args) {
		global $loot;
		$key = $args[1];
		// validate item existance on loot list
		if ($key > 0 && $key <= count($loot)) {
			// if removing this item empties the list, clear the loot list properly
			if (count($loot) <= 1) {
				$loot = "";
				$this->chatBot->sendPrivate("Item in slot <highlight>#".$key."<end> was the last item in the list. The list has been cleared.");
			} else {
				// remove the item by shifting lower items up one slot and remove last slot
				$loop = $key;
				while($loop < count($loot)){
					$loot[$loop] = $loot[$loop+1];
					$loop++;
				}
				unset($loot[count($loot)]);
				$this->chatBot->sendPrivate("Deleting item in slot <highlight>#".$key."<end>");
			}
		} else {
			$this->chatBot->sendPrivate("There is no item at slot <highlight>#".$key."<end>");
		}
	}
	
	/**
	 * @HandlesCommand("reroll")
	 * @Matches("/^reroll$/i")
	 */
	public function rerollCommand($message, $channel, $sender, $sendto, $args) {
		global $loot;
		global $residual;

		//Check if a residual list exits
		if (!is_array($residual)) {
			$msg = "There are no remaining items to re-add.";
			$sendto->reply($msg);
			return;
		}

		// Readd remaining loot
		forEach ($residual as $key => $item) {
			$loot[$key]["name"] = $item["name"];
			$loot[$key]["icon"] = $item["icon"];
			$loot[$key]["linky"] = $item["linky"];
			$loot[$key]["multiloot"] = $item["multiloot"];
			$loot[$key]["added_by"] = $sender;
		}

		//Reset residual list
		$residual = "";
		//Show winner list
		$msg = "All remaining items have been re-added by <highlight>$sender<end>. Check <symbol>list.";
		$this->chatBot->sendPrivate($msg);
		if ($channel != 'priv') {
			$sendto->reply($msg);
		}
		if (is_array($loot)) {
			$list = "\n\nUse <symbol>flatroll to roll.\n\n";
			forEach ($loot as $key => $item) {
				$add = $this->text->make_chatcmd("Add", "/tell <myname> add $key");
				$rem = $this->text->make_chatcmd("Remove", "/tell <myname> rem");
				$added_players = count($item["users"]);

				$list .= "<u>Slot #<font color='#FF00AA'>$key</font></u>\n";
				if ($item["icon"] != "") {
					$list .= $this->text->make_image($item["icon"]) . "\n";
				}

				if ($item["multiloot"] > 1) {
					$ml = " <yellow>(x".$item["multiloot"].")<end>";
				} else {
					$ml = "";
				}

				if ($item["linky"]) {
					$itmnm = $item["linky"];
				} else {
					$itmnm = $item["name"];
				}

				$list .= "Item: <orange>$itmnm<end>".$ml."\n";

				$list .= "<highlight>$added_players<end> Total ($add/$rem)\n";
				$list .= "Players added:";
				if (count($item["users"]) > 0) {
					forEach ($item["users"] as $key => $value) {
						$list .= " [<yellow>$key<end>]";
					}
				} else {
					$list .= " None added yet.";
				}

				$list .= "\n\n";
			}
			$msg2 = $this->text->make_blob("Loot List", $list);
		} else {
			$msg2 = "No List exists yet.";
		}
		$sendto->reply($msg2);
	}
	
	/**
	 * @HandlesCommand("flatroll")
	 * @Matches("/^flatroll$/i")
	 */
	public function flatrollCommand($message, $channel, $sender, $sendto, $args) {
		global $loot;
		global $loot_winners;
		global $residual;
		//Check if a loot list exits
		if (!is_array($loot)) {
			$msg = "There is nothing to roll atm.";
			$sendto->reply($msg);
			return;
		}

		srand(((int)((double)microtime() * 1000003))); // get a good seed

		$list = '';
		//Roll the loot
		$resnum = 1;
		forEach ($loot as $key => $item) {
			$list .= "Item: <orange>{$item["name"]}<end>\n";
			$list .= "Winner(s): ";
			$users = count($item["users"]);
			if ($users == 0) {
				$list .= "<highlight>None added.<end>\n\n";
				$residual[$resnum]["name"] = $item["name"];
				$residual[$resnum]["icon"] = $item["icon"];
				$residual[$resnum]["linky"] = $item["linky"];
				$residual[$resnum]["multiloot"] = $item["multiloot"];
				$resnum++;
			} else {
				if ($item["multiloot"] > 1) {
					if ($item["multiloot"] > sizeof($item["users"])) {
						$arrolnum = sizeof($item["users"]);
					} else {
						$arrolnum = $item["multiloot"];
					}

					for ($i = 0; $i < $arrolnum; $i++) {
						$winner = array_rand($item["users"], 1);
						unset($item["users"][$winner]);
						$list .= "<red>$winner<end> ";
					}

					if ($arrolnum < $item["multiloot"]) {
						$newmultiloot = $item["multiloot"]-$arrolnum;
						$residual[$resnum]["name"] = $item["name"];
						$residual[$resnum]["icon"] = $item["icon"];
						$residual[$resnum]["linky"] = $item["linky"];
						$residual[$resnum]["multiloot"] = $newmultiloot;
						$resnum++;
					}
				} else {
					$winner = array_rand($item["users"], 1);
					$list .= "<red>$winner<end>";
				}
				$list .= "\n\n";
			}
		}
		//Reset loot
		$winner = "";
		$arrolnum = "";
		$loot = "";
		//Show winner list
		$msg = $this->text->make_blob("Winner List", $list);
		if (is_array($residual)) {
			$rerollmsg = " (There are item(s) left to be rolled. To re-add, type <symbol>reroll)";
		} else {
			$rerollmsg = "";
		}

		$this->chatBot->sendPrivate($msg.$rerollmsg);

		if ($channel != 'priv') {
			$sendto->reply($msg.$rerollmsg);
		}
	}
	
	/**
	 * @HandlesCommand("add")
	 * @Matches("/^add ([0-9]+)$/i")
	 */
	public function addCommand($message, $channel, $sender, $sendto, $args) {
		global $loot;
		$slot = $args[1];
		$found = false;
		if (count($loot) > 0) {
			//Check if the slot exists
			if (!isset($loot[$slot])) {
				$msg = "The slot you are trying to add in does not exist.";
				$this->chatBot->sendTell($msg, $sender);
				return;
			}

			//Remove the player from other slots if set
			$found = false;
			forEach ($loot as $key => $item) {
				if ($loot[$key]["users"][$sender] == true) {
					unset($loot[$key]["users"][$sender]);
					$found = true;
				}
			}

			//Add the player to the choosen slot
			$loot[$slot]["users"][$sender] = true;

			if ($found == false) {
				$msg = "$sender has added to <highlight>\"{$loot[$slot]["name"]}\"<end>.";
			} else {
				$msg = "$sender has moved to <highlight>\"{$loot[$slot]["name"]}\"<end>.";
			}

			$this->chatBot->sendPrivate($msg);
		} else {
			$this->chatBot->sendTell("No loot list available.", $sender);
		}
	}
	
	/**
	 * @HandlesCommand("rem")
	 * @Matches("/^rem$/i")
	 */
	public function remCommand($message, $channel, $sender, $sendto, $args) {
		global $loot;
		if (count($loot) > 0) {
			forEach ($loot as $key => $item) {
				if ($loot[$key]["users"][$sender] == true) {
					unset($loot[$key]["users"][$sender]);
				}
			}

			$msg = "$sender has been removed from all rolls.";
			$this->chatBot->sendPrivate($msg, 'priv');
		} else {
			$this->chatBot->sendTell("There is nothing to remove you from.", $sender);
		}
	}
}

?>