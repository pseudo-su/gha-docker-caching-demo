package servicechecks

import (
	"context"
	"net/http"

	"connectrpc.com/connect"
	deephealth_v1 "github.com/pseudo-su/gha-docker-caching-demo/modules/service-pkg/deephealth/v1"
	"github.com/pseudo-su/gha-docker-caching-demo/modules/service-pkg/deephealth/v1/deephealth_v1connect"
	"google.golang.org/protobuf/types/known/timestamppb"
)

type DeepHealthConnectServer struct {
	deephealth_v1connect.UnimplementedDeepHealthHandler
}

var _ deephealth_v1connect.DeepHealthHandler = &DeepHealthConnectServer{}

func NewDeepHealthConnectServer() *DeepHealthConnectServer {
	return &DeepHealthConnectServer{}
}

func (DeepHealthConnectServer) Check(ctx context.Context, req *connect.Request[deephealth_v1.DeepHealthCheckRequest]) (*connect.Response[deephealth_v1.DeepHealthCheckResponse], error) {
	return connect.NewResponse(
		&deephealth_v1.DeepHealthCheckResponse{
			HealthState:   deephealth_v1.DeepHealthCheckResponse_HEALTH_STATE_OK,
			HttpStatus:    http.StatusOK,
			GeneratedTime: timestamppb.Now(),
			Services:      []*deephealth_v1.Service{},
		},
	), nil
}
