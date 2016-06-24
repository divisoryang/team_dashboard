# Ganglia team_dashboard specification

Some team has multiple ganglia cluster, now we can add multiple ganglia url in plugins.yml like below:

	development:
	
	  ganglia:
	    url: 'http://ganglia.product1.net:81'
	    host: ganglia.awscn.umlife.net

	  ganglia_product2:
	    url: 'http://ganglia.product2.com:8181/ganglia'

Target configuration of widgets that show data from ganglia can be like that:

	host-name@cluster-name(load_one)ganglia_product2

If ganglia_product2 not specified, it use default configuration of ganglia
