<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Noticias extends CI_Controller {
    
    function __construct() {
        parent::__construct();
        $this->load->model('login_model', 'login');
        $this->membership->logado();
    }
    
    public function index() {
        
        $this->load->view('login/area_restrita_view');
        
    }
}