<?php
$this->load->library('NaverSearch');
$this->naversearch->target = "검색타깃";
$this->naversearch->query = "검색어";
echo $this->naversearch->getSearch();
?>