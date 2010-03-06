require 'mercury'
log = File.new('mercury.log', 'a+')
$stdout.reopen(log)
$stderr.reopen(log)
run Mercury