#!/usr/bin/env ruby

require 'rubygems'
require 'daemons'

### BEGIN INIT INFO
# Provides:          fitbit
# Required-Start:    $remote_fs $syslog $network $named
# Required-Stop:     $remote_fs $syslog $network $named
# Default-Start:     3 4 5
# Default-Stop:      0 1 2 6
# Short-Description: Start fitbit service at boot.
# Description:       Enable fitbit service.
### END INIT INFO

Daemons.run('fitbit.rb')
