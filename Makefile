dev:
	@echo $$AWS_ACCESS_KEY_ID
	jq '.profile |= "uneet-dev" |.stages.production |= (.domain = "case.dev.unee-t.com" ) | .error_pages.variables.support_email |= ["support+casedev@unee-t.com"]' up.json.in > up.json
	up deploy production

demo:
	@echo $$AWS_ACCESS_KEY_ID
	jq '.profile |= "uneet-demo" |.stages.production |= (.domain = "case.demo.unee-t.com" ) | .error_pages.variables.support_email |= ["support+casedemo@unee-t.com"]' up.json.in > up.json
	up deploy production

prod:
	@echo $$AWS_ACCESS_KEY_ID
	jq '.profile |= "uneet-prod" |.stages.production |= (.domain = "case.unee-t.com" ) | .error_pages.variables.support_email |= ["support+caseprod@unee-t.com"]' up.json.in > up.json
	up deploy production

testdev:
	curl --header "Host: case.dev.unee-t.com" https://d2t68qen40kgoi.cloudfront.net

testdemo:
	curl --header "Host: case.demo.unee-t.com" https://d1rysjyc8h5lzr.cloudfront.net

testprod:
	curl --header "Host: case.unee-t.com" https://d751dqzf054b6.cloudfront.net
