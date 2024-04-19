<?php

// Parse Bibtex
$content = file_get_contents($argv[1]);
preg_match_all('/\@.+?\{.+?\n\}\s/sm', $content, $out, PREG_PATTERN_ORDER);
$entries = array();
foreach($out[0] as $raw) {
	preg_match_all('/\s+(.+?)\s*=\s*\{\s*(.+?)\s*\}/m', $raw, $item, PREG_SET_ORDER);
	$entry = array();
	foreach($item as $rawitem) {
		$entry[$rawitem[1]] = $rawitem[2];
	}
	$entries[] = $entry;
}

// Convert to our XML
foreach($entries as $entry) {
	$authors = $entry['title'];
	print "  <publication>\n";
	print "    <title>".$entry['title']."</title>\n";
	if(array_key_exists('url', $entry))
		print "    <url>".$entry['url']."</url>\n";
	foreach(preg_split('/\s+and\s+/', $entry['author']) as $author) {
		print "    <person>$author</person>\n";
	}
	$where = array_key_exists('journal', $entry) ? $entry['journal'] :
				(array_key_exists('booktitle', $entry) ? $entry['booktitle'] : $entry['note']);
	if(array_key_exists('volume', $entry)) $where .= " ".$entry['volume'];
	if(array_key_exists('number', $entry)) $where .= "(".$entry['number'].")";
	$where .= ", ".$entry['year'];
	print "    <where>$where</where>\n";
   print "    <project>Interactive Knowledge Capture</project>\n";
	print "  </publication>\n";
}
//print_r($entries);
/*get authors
get title
for where:
	- if(journal) - volume, number
	- booktitle
	- note
+ year
*/

