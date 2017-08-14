<?php
class Composer {
    public static function exec($input) {
        Git::clone($input[GIT_REPO]);
    } 
}
?>