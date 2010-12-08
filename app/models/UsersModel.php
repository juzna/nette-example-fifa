<?php

use Nette\Object,
	Nette\Security\AuthenticationException;


/**
 * Users authenticator.
 */
class UsersModel extends Object implements Nette\Security\IAuthenticator {
  const MODE_PASS = 1;
  const MODE_OPENID = 2;

	/**
	 * Performs an authentication
	 * @param  array
	 * @return IIdentity
	 * @throws AuthenticationException
	 */
	public function authenticate(array $credentials) {
		switch($credentials[0]) {
		  case self::MODE_PASS: return $this->authenticateByPassword($credentials[1], $credentials[2]);
		  case self::MODE_OPENID: return $this->authenticateByOpenId($credentials[1]);
		  default: throw new AuthenticationException("Invalid authentication mode");
	  }
  }
  
  private function authenticateByPassword($username, $password) {
		$row = dibi::select('*')->from('admins')->where('name=%s', $username)->fetch();

		if (!$row) {
			throw new AuthenticationException("User '$username' not found.", self::IDENTITY_NOT_FOUND);
		}

		if ($row->password !== $password) {
			throw new AuthenticationException("Invalid password.", self::INVALID_CREDENTIAL);
		}

		unset($row->password);
		return new Nette\Security\Identity($row->id, NULL, $row);
	}
	
  /**
  * Authenticate via OpenID URI
  */	
	private function authenticateByOpenId($uri) {
	  $row = dibi::select('*')->from('openid')->where('openid=%s', $uri)->fetch();
	  if(!$row) throw new AuthenticationException("Unknown OpenID");
	  
	  // Find user
	  $user = dibi::select('*')->from('admins')->where('id=%i', $row->userid)->fetch();
	
		unset($user->password);
		return new Nette\Security\Identity($user->id, NULL, $user);
	}
}

