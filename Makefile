
go_module_path=$$(grep module proto/go.mod | awk '{ print $$2 }')

.PHONY: go.generate
go.generate:
	protoc\
		--go_out=proto\
		--go_opt=paths=source_relative\
		--go_opt=Mcms/common/gender.proto=$(go_module_path)/cms/common\
		--go_opt=Mcms/common/v0/personal_info.proto=$(go_module_path)/cms/common/v0\
		--go_opt=Mcms/common/v0/biometric_info.proto=$(go_module_path)/cms/common/v0\
		--go_opt=Mcms/common/v0/search_request_filter.proto=$(go_module_path)/cms/common/v0\
		--go_opt=Mcms/apis/v0/identity.proto=$(go_module_path)/cms/apis/v0\
		--go_opt=Mcms/apis/v0/blacklist.proto=$(go_module_path)/cms/apis/v0\
		--go-grpc_out=proto\
		--go-grpc_opt=paths=source_relative\
		--go-grpc_opt=Mcms/common/gender.proto=$(go_module_path)/cms/common\
		--go-grpc_opt=Mcms/common/v0/personal_info.proto=$(go_module_path)/cms/common/v0\
		--go-grpc_opt=Mcms/common/v0/biometric_info.proto=$(go_module_path)/cms/common/v0\
		--go-grpc_opt=Mcms/common/v0/search_request_filter.proto=$(go_module_path)/cms/common/v0\
		--go-grpc_opt=Mcms/apis/v0/identity.proto=$(go_module_path)/cms/apis/v0\
		--go-grpc_opt=Mcms/apis/v0/blacklist.proto=$(go_module_path)/cms/apis/v0\
		cms/common/**/*.proto cms/apis/**/*.proto
	protoc\
		--go_out=proto\
		--go_opt=paths=source_relative\
		--go_opt=Mgdi/common/gender.proto=$(go_module_path)/gdi/common\
		--go_opt=Mgdi/apis/v0/identity.proto=$(go_module_path)/gdi/apis/v0\
		--go-grpc_out=proto\
		--go-grpc_opt=paths=source_relative\
		--go-grpc_opt=Mgdi/common/gender.proto=$(go_module_path)/gdi/common\
		--go-grpc_opt=Mgdi/apis/v0/identity.proto=$(go_module_path)/gdi/apis/v0\
		gdi/common/*.proto gdi/apis/**/*.proto
