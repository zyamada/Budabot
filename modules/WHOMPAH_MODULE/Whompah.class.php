<?php

class Whompah {
	public static function find_whompah_path(&$queue, &$whompahs, &$endCity) {
		$current_whompah = array_shift($queue);
		
		if ($current_whompah == false) {
			return false;
		}
		
		if ($current_whompah->id == $endCity) {
			return $current_whompah;
		}
	
		forEach ($whompahs[$current_whompah->id]->connections as $city2_id) {
			if ($whompahs[$city2_id]->visited !== true) {
				$whompahs[$city2_id]->visited = true;
				$next_whompah = new stdClass;
				$next_whompah->id = $city2_id;
				$next_whompah->city_name = $whompahs[$city2_id]->city_name;
				$next_whompah->previous = &$current_whompah;
				$queue []= $next_whompah;
			}
		}
		
		return Whompah::find_whompah_path($queue, $whompahs, $endCity);
	}
	
	public static function find_city($search) {
		$chatBot = Registry::getInstance('chatBot');
		$db = Registry::getInstance('db');
		
		$sql = "SELECT * FROM whompah_cities WHERE city_name LIKE ? OR short_name LIKE ?";
		return $db->queryRow($sql, $search, $search);
	}
	
	public static function build_whompah_network() {
		$chatBot = Registry::getInstance('chatBot');
		$db = Registry::getInstance('db');

		$whompahs = array();

		$sql = "SELECT * FROM `whompah_cities`";
		$data = $db->query($sql);
		forEach ($data as $row) {
			$whompahs[$row->id] = $row;
		}
		
		$sql = "SELECT city1_id, city2_id FROM whompah_cities_rel";
		$data = $db->query($sql);
		forEach ($data as $row) {
			$whompahs[$row->city1_id]->connections[] = $row->city2_id;
		}
		
		return $whompahs;
	}
}