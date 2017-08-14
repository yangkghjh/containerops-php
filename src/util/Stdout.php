<?php
function stdoutln ($string) {
    fwrite(STDOUT, $string . "\n");
}

function stderrln ($string) {
    fwrite(STDERR, $string . "\n");
}
?>