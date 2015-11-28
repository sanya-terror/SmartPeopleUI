<?php
class template {
	private $title;
	private $header;
	private $content;
	private $footer;
	private $form;
	private $conf;
	
	public function __construct(){
		$this->tmpdir = ($_SERVER['DOCUMENT_ROOT'].'/view/template/');
		ob_start();
		$this->maintpl = require_once($this->tmpdir . 'index.tpl');
		$this->template($this->maintpl);
	}

	public function template($var) {
		$this->html = ob_get_contents();
		ob_end_clean();
		return $this->html;
	}
	
	public function SetPageConfig($var){
		$this->title = $var['title'];
		$this->header = $var['header'];
		$this->content = $var['content'];
		$this->footer = $var['footer'];
		@$this->form = $var['form'];
		@$this->form2 = $var['form2'];
		@$this->conf = $var['conf'];
	}
	
	public function page(){
		ob_start();
		require($this->tmpdir.$this->header.'.tpl');
		$this->html_header = ob_get_contents();
		ob_end_clean();
		
		ob_start();
		require($this->tmpdir.$this->content.'.tpl');
		$this->html_content = ob_get_contents();
		ob_end_clean();
		
		ob_start();
		require($this->tmpdir.$this->footer.'.tpl');
		$this->html_footer = ob_get_contents();
		ob_end_clean();
		
		$this->html = str_replace("{title}", $this->title, $this->html);
		$this->html = str_replace("{header}", $this->html_header, $this->html);
		$this->html = str_replace("{content}", $this->html_content, $this->html);
		$this->html = str_replace("{footer}", $this->html_footer, $this->html);
			
		if (isset($this->form)) {
			ob_start();
			$this->html_form = ob_get_contents();
			ob_end_clean();
			$this->html = str_replace("{form}", $this->html_form, $this->html);
		}
		if (isset($this->form2)) {
			$this->html = str_replace("{message}", $this->form2, $this->html);
		}

		if (isset($this->conf)) { 
			ob_start();
			$this->html_form = ob_get_contents();
			ob_end_clean();
			$this->html = str_replace("{title-message}", $this->conf['1'], $this->html);
			$this->html = str_replace("{help-message}", $this->conf['2'], $this->html);
			$this->html = str_replace("{label}", $this->conf['3'], $this->html);
			$this->html = str_replace("{placeholder}", $this->conf['4'], $this->html);
			$this->html = str_replace("{ids}", $this->conf['5'], $this->html);
			$this->html = str_replace("{type}", $this->conf['6'], $this->html);	
		}
		echo $this->html;
	}
}
?>
