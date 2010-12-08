<?php

use Nette\Application\AppForm,
	Nette\Forms\Form;



class AdminPresenter extends BasePresenter {

  // Ensure login when accessing this presenter
	protected function startup() {
		// user authentication
		if (!$this->user->isLoggedIn()) {
			if ($this->user->logoutReason === Nette\Web\User::INACTIVITY) {
				$this->flashMessage('You have been signed out due to inactivity. Please sign in again.');
			}
			$backlink = $this->application->storeRequest();
			$this->redirect('Sign:in', array('backlink' => $backlink));
		}

		parent::startup();
	}
	
	
}
