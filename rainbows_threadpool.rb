worker_processes 4
Rainbows! do
	use :ThreadPool
	worker_connections 100
end
