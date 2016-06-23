class GangliaUrlBuilder

  def initialize(base_url, config)
    @base_url = base_url
    @config = config
  end

  def datapoints_url(target, from, to)
    cluster, host, metric, node = parse_target(target)
    url = "#{@base_url}/graph.php"
    if not node.to_s == ''
        url = "#{@config[node].url}/graph.php"
    end
    params = { :c => cluster, :h => host, :m => metric, :json => 1 }
    { :url => url, :params => params.merge(custom_range_params(from, to)) }
  end

  def metrics_url(query)
    "#{@base_url}/search.php?q=#{query}"
  end

  def parse_target(target)
    target =~ /(.*)@(.*)\((.*)\)(.*)/
    host    = $1
    cluster = $2
    metric  = $3
    node    = $4
    [cluster, host, metric, node]
  end

  def custom_range_params(from, to)
    { :r => "custom", :cs => format(from), :ce => format(to) }
  end

  def format(timestamp)
    time = Time.at(timestamp)
    time.strftime("%m/%d/%Y %H:%M")
  end

end
