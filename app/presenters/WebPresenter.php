<?php

use Nette\Application\AppForm,
	Nette\Forms\Form;



class WebPresenter extends BasePresenter {

	/********************* view default *********************/


	public function renderDefault() {
	  $this->template->match = dibi::query('select * from [matches] where [datetime] > now() limit 1')->fetch();
	}
	
	
	public function renderMatch($id) {
	  // Load match
	  $this->template->match = $match = dibi::query('select * from [matches] where [mid] = %i', $id)->fetch();
	  
	  // Load teams
	  $this->template->team1 = dibi::query('select * from [teams] where tid = %i', $match->team1)->fetch();
	  $this->template->team2 = dibi::query('select * from [teams] where tid = %i', $match->team2)->fetch();
  }
  
  public function renderMatches() {
	  $this->template->matches = dibi::query('select matches.*, team1.tname as team1name, team2.tname as team2name from [matches]
	    left join teams team1 on team1.tid=matches.team1
	    left join teams team2 on team2.tid=matches.team2')->fetchAll();  
  }
  
  public function renderTeam($id) {
    $this->template->team = dibi::query('select * from [teams] where tid = %i', $id)->fetch();
    $this->template->players = dibi::query('select * from [players] where tid = %i', $id)->fetchAll();
  }
  
  public function renderPlayer($id) {
    $this->template->player = $player = dibi::query('select * from [players] where pid = %i', $id)->fetch();
    $this->template->team = dibi::query('select * from [teams] where tid = %i', $player->tid)->fetch();
  }
  
}
