load "libcurl.ring"
curl = curl_easy_init()
curl_easy_setopt(curl,CURLOPT_FOLLOWLOCATION,True)
curl_easy_setopt(curl,CURLOPT_URL,"http://ring-lang.sf.net")
curl_easy_perform(curl)
curl_easy_cleanup(curl)
