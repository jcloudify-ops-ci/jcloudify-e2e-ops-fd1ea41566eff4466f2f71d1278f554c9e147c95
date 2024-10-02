sudo apt-get install jq
export API_URL_SSM="`aws ssm get-parameter --name /jcloudify-e2e-ops-fd1ea41566eff4466f2f71d1278f554c9e147c95/$1/api/url`"
export API_URL=`echo $API_URL_SSM | jq -r '.Parameter.Value'`
curl --fail "$API_URL$2"