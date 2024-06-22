MODULE="PackageModules/NetLibrary/Sources/NetLibrary/"
openapi-generator generate -i "OpenLibrary.yaml" -g swift5 -o "libraryapi"
rm -r $MODULE""*
cp -R "libraryapi/OpenAPIClient/Classes/OpenAPIs/". $MODULE
rm -r "libraryapi"
