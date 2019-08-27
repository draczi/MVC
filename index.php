<?php

  define('DS', DIRECTORY_SEPARATOR); //per jelet helyettesiti
  define('ROOT', dirname(__FILE__)); // documentum gyökérkönyvtára

  //load configuration and helper functions
  require_once(ROOT . DS . 'config' . DS . 'config.php');
  require_once(ROOT . DS . 'app' . DS . 'lib' . DS . 'helpers' . DS . 'functions.php');

  //Autoload classes
  function autoload($className) {
    if(file_exists(ROOT . DS . 'core' . DS . $className . '.php')) {
      require_once(ROOT . DS . 'core' . DS . $className . '.php');
    } else if (file_exists(ROOT . DS . 'app' . DS . 'controllers' . DS . $className . '.php')) {
      require_once(ROOT . DS . 'app' . DS . 'controllers' . DS . $className . '.php');
    } else if (file_exists(ROOT . DS . 'app' . DS . 'models' . DS . $className . '.php')) {
      require_once(ROOT . DS . 'app' . DS . 'models' . DS . $className . '.php');
    }
  }

  spl_autoload_register('autoload');
  session_start();

  $url = isset($_SERVER['PATH_INFO']) ? explode('/', ltrim($_SERVER['PATH_INFO'], '/')) : []; // minden amit a gyökeren kívül bírunk.
  $db = DB::getInstance();

  if(!Session::exists(CURRENT_USER_SESSION_NAME) && COOKIE::exists(REMEMBER_ME_COOKIE_NAME)) {
    Users::loginUserFromCookie();
  }

  // Route the request
  Router::route($url);
