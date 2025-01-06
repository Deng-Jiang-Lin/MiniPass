package main

import (
	"github.com/asim/go-micro/plugins/registry/etcd/v3"
	"github.com/asim/go-micro/v3"
	"github.com/asim/go-micro/v3/registry"
)

func main() {

	service := micro.NewService(
		micro.Name("base"),
		micro.Version("latest"),
		micro.Registry(etcd.NewRegistry(
			registry.Addrs("127.0.0.1:2379"),
		)),
	)

	service.Init()

	// Run the server
	service.Run()
}
