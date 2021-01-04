gpio2 = 4;
gpio.mode(gpio2,gpio.OUTPUT)
wifi.setmode(wifi.STATION)
wifi.sta.config {ssid="SSID", pwd="PASSWORD"}
srv=net.createServer(net.TCP) 
srv:listen(80,function(conn) 
 conn:on('receive',function(conn,payload) 
  gpio.serout(gpio2, gpio.HIGH, {1000000,1000000}, 4, function() conn:send('<h1> Hello, NodeMCU.</h1>') end)
 end) 
end)