<?php
	class Pagination{
		private $x_pagina = 0;
		private $tot_righe = 0;
		private $var_query = "";
		private $tot_pagine = 0;
		private $pagina_corrente = 0;
		private $query = "";
		private $record = array();
		private $conn ="";

		public function Pagination($conn, $query, $x_pagina, $var_query){
			// le rendo globali
			$this->x_pagina = $x_pagina;
			$this->var_query = $var_query;
			$this->query = trim($query);
			$this->conn =$conn;

			// pagina corrente sia get che post
			if(isset($_REQUEST[$var_query]) && $_REQUEST[$var_query] > 0 ){
				$this->pagina_corrente=$_REQUEST[$var_query];
			}
			else{
			  $this->pagina_corrente=1;
			}
			
			// inizio record
			$inizio = $x_pagina * ($this->pagina_corrente - 1);

			// eseguo la query per contare i record
			$res_query = mysqli_query($this->conn,$this->query);
			if(!$res_query){
			  die(mysqli_error());
			}
			/* if(!$num_record){ */
			/* 	header('Location: pro-details.php?id='.$_GET['id'].'&action=read_review&ep=er'); */
			/* } */

			// record totali
			$this->tot_righe = mysqli_num_rows($res_query);
			


			// se ci sono record
			if($this->tot_righe > 0){
			  // pagine totali
			  $this->tot_pagine = ceil($this->tot_righe / $x_pagina);
			  //echo "Numero pagine = ".$this->tot_pagine;
			  // scrivo ed eseguo la query mirata
			  $n_righe = " LIMIT " . $inizio . ", " . $x_pagina;
			  if(!$run = mysqli_query($this->conn, $this->query . $n_righe)){
			    echo "ERRORE: ".mysqli_error();
			    die();
			  }
			  
			  
			  for($i=0; $fetch = mysqli_fetch_array($run, MYSQLI_ASSOC); $i++){
			    $record[$i] = $fetch;
			    /* $record[$i]['message']=html_entity_decode($record[$i]['message']); */
			    /* $record[$i]['request']=html_entity_decode($record[$i]['request']); */
			    /* $record[$i]['answer']=html_entity_decode($record[$i]['answer']); */
			    /* // mostrae solo l aparte intera del voto del sondaggio */
			    /* $record[$i]['pvote1']=round($record[$i]['pvote1']); */
			    /* $record[$i]['pvote2']=round($record[$i]['pvote2']); */
			    /* $record[$i]['pvote3']=round($record[$i]['pvote3']); */
			    /* $record[$i]['pvote4']=round($record[$i]['pvote4']); */
			    /* $record[$i]['pvote5']=round($record[$i]['pvote5']); */
			  }
			  $this->record = $record;
			}
			else{
			  $this->record = array();
			}
		}
		
		public function Show(){
		  if(count($this->record) > 0){
		    return $this->record;
		  }
		  else{
		    return false;
		  } 
		}
		
	     public function link($nlink = 4){
		$prec = array();
		$succ = array();
		if($this->pagina_corrente < $nlink){
		  $nlink *= 2;
		  $nlink -= ($this->pagina_corrente - 1);
		}
		elseif($this->pagina_corrente > ($this->tot_pagine - $nlink)){
		  $nlink *= 2;
		  $nlink -= ($this->tot_pagine - $this->pagina_corrente);
		}
		for($i = $nlink; $i>=1; $i--){
		  if(($this->pagina_corrente - $i) >= 1){
		    $prec[] = $this->pagina_corrente - $i;
		  }
		}
		for($i = 1; $i <= $nlink; $i++){
		  if(($this->pagina_corrente + $i) <= $this->tot_pagine){
		    $succ[] = $this->pagina_corrente + $i;
		  }
		  if($this->pagina_corrente == $nlink) $nlink += 1;
		}

		$link["primo"] = 1;
		$link["precedente"] = $prec;
		$link["corrente"] = $this->pagina_corrente;
		$link["successivo"] = $succ;
		$link["ultimo"] = $this->tot_pagine;

		if($this->pagina_corrente <= $this->tot_pagine && $this->tot_pagine > 1){
		  return $link;
		}
		else{
		  return false;
		}
	     }
	}

?>
