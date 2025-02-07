#/*
#**	Project : Programming Without Coding Technology (PWCT) Version 2.0
#**	File Purpose :  libcurl_easysetopt Component
#**	Date : 2018.03.29
#**	Author :  Mahmoud Fayed <msfclipper@yahoo.com>
#*/
class libcurl_easysetoptComponentController from ComponentControllerParent
	oView = new libcurl_easysetoptComponentView
	func GenerateAction  { 
		switch Variable(:Value2) { 
			case 1
				cFunc = "CURLOPT_ACCEPT_ENCODING"
			case 2
				cFunc = "CURLOPT_ADDRESS_SCOPE"
			case 3
				cFunc = "CURLOPT_APPEND"
			case 4
				cFunc = "CURLOPT_AUTOREFERER"
			case 5
				cFunc = "CURLOPT_BUFFERSIZE"
			case 6
				cFunc = "CURLOPT_CAINFO"
			case 7
				cFunc = "CURLOPT_CAPATH"
			case 8
				cFunc = "CURLOPT_CERTINFO"
			case 9
				cFunc = "CURLOPT_CHUNK_BGN_FUNCTION"
			case 10
				cFunc = "CURLOPT_CHUNK_DATA"
			case 11
				cFunc = "CURLOPT_CHUNK_END_FUNCTION"
			case 12
				cFunc = "CURLOPT_CLOSESOCKETDATA"
			case 13
				cFunc = "CURLOPT_CLOSESOCKETFUNCTION"
			case 14
				cFunc = "CURLOPT_CONNECTTIMEOUT"
			case 15
				cFunc = "CURLOPT_CONNECTTIMEOUT_MS"
			case 16
				cFunc = "CURLOPT_CONNECT_ONLY"
			case 17
				cFunc = "CURLOPT_CONV_FROM_NETWORK_FUNCTION"
			case 18
				cFunc = "CURLOPT_CONV_FROM_UTF8_FUNCTION"
			case 19
				cFunc = "CURLOPT_CONV_TO_NETWORK_FUNCTION"
			case 20
				cFunc = "CURLOPT_COOKIE"
			case 21
				cFunc = "CURLOPT_COOKIEFILE"
			case 22
				cFunc = "CURLOPT_COOKIEJAR"
			case 23
				cFunc = "CURLOPT_COOKIELIST"
			case 24
				cFunc = "CURLOPT_COOKIESESSION"
			case 25
				cFunc = "CURLOPT_COPYPOSTFIELDS"
			case 26
				cFunc = "CURLOPT_CRLF"
			case 27
				cFunc = "CURLOPT_CRLFILE"
			case 28
				cFunc = "CURLOPT_CUSTOMREQUEST"
			case 29
				cFunc = "CURLOPT_DEBUGDATA"
			case 30
				cFunc = "CURLOPT_DEBUGFUNCTION"
			case 31
				cFunc = "CURLOPT_DIRLISTONLY"
			case 32
				cFunc = "CURLOPT_DNS_CACHE_TIMEOUT"
			case 33
				cFunc = "CURLOPT_DNS_USE_GLOBAL_CACHE"
			case 34
				cFunc = "CURLOPT_EGDSOCKET"
			case 35
				cFunc = "CURLOPT_ERRORBUFFER"
			case 36
				cFunc = "CURLOPT_FAILONERROR"
			case 37
				cFunc = "CURLOPT_FILETIME"
			case 38
				cFunc = "CURLOPT_FNMATCH_DATA"
			case 39
				cFunc = "CURLOPT_FNMATCH_FUNCTION"
			case 40
				cFunc = "CURLOPT_FOLLOWLOCATION"
			case 41
				cFunc = "CURLOPT_FORBID_REUSE"
			case 42
				cFunc = "CURLOPT_FRESH_CONNECT"
			case 43
				cFunc = "CURLOPT_FTPPORT"
			case 44
				cFunc = "CURLOPT_FTPSSLAUTH"
			case 45
				cFunc = "CURLOPT_FTP_ACCOUNT"
			case 46
				cFunc = "CURLOPT_FTP_ALTERNATIVE_TO_USER"
			case 47
				cFunc = "CURLOPT_FTP_CREATE_MISSING_DIRS"
			case 48
				cFunc = "CURLOPT_FTP_FILEMETHOD"
			case 49
				cFunc = "CURLOPT_FTP_RESPONSE_TIMEOUT"
			case 50
				cFunc = "CURLOPT_FTP_SKIP_PASV_IP"
			case 51
				cFunc = "CURLOPT_FTP_SSL_CCC"
			case 52
				cFunc = "CURLOPT_FTP_USE_EPRT"
			case 53
				cFunc = "CURLOPT_FTP_USE_EPSV"
			case 54
				cFunc = "CURLOPT_FTP_USE_PRET"
			case 55
				cFunc = "CURLOPT_GSSAPI_DELEGATION"
			case 56
				cFunc = "CURLOPT_HEADER"
			case 57
				cFunc = "CURLOPT_HEADERDATA"
			case 58
				cFunc = "CURLOPT_HEADERFUNCTION"
			case 59
				cFunc = "CURLOPT_HTTP200ALIASES"
			case 60
				cFunc = "CURLOPT_HTTPAUTH"
			case 61
				cFunc = "CURLOPT_HTTPGET"
			case 62
				cFunc = "CURLOPT_HTTPHEADER"
			case 63
				cFunc = "CURLOPT_HTTPPOST"
			case 64
				cFunc = "CURLOPT_HTTPPROXYTUNNEL"
			case 65
				cFunc = "CURLOPT_HTTP_CONTENT_DECODING"
			case 66
				cFunc = "CURLOPT_HTTP_TRANSFER_DECODING"
			case 67
				cFunc = "CURLOPT_HTTP_VERSION"
			case 68
				cFunc = "CURLOPT_IGNORE_CONTENT_LENGTH"
			case 69
				cFunc = "CURLOPT_INFILESIZE"
			case 70
				cFunc = "CURLOPT_INFILESIZE_LARGE"
			case 71
				cFunc = "CURLOPT_INTERFACE"
			case 72
				cFunc = "CURLOPT_INTERLEAVEDATA"
			case 73
				cFunc = "CURLOPT_INTERLEAVEFUNCTION"
			case 74
				cFunc = "CURLOPT_IOCTLDATA"
			case 75
				cFunc = "CURLOPT_IOCTLFUNCTION"
			case 76
				cFunc = "CURLOPT_IPRESOLVE"
			case 77
				cFunc = "CURLOPT_ISSUERCERT"
			case 78
				cFunc = "CURLOPT_KEYPASSWD"
			case 79
				cFunc = "CURLOPT_KRBLEVEL"
			case 80
				cFunc = "CURLOPT_LOCALPORT"
			case 81
				cFunc = "CURLOPT_LOCALPORTRANGE"
			case 82
				cFunc = "CURLOPT_LOW_SPEED_LIMIT"
			case 83
				cFunc = "CURLOPT_LOW_SPEED_TIME"
			case 84
				cFunc = "CURLOPT_MAIL_FROM"
			case 85
				cFunc = "CURLOPT_MAIL_RCPT"
			case 86
				cFunc = "CURLOPT_MAXCONNECTS"
			case 87
				cFunc = "CURLOPT_MAXFILESIZE"
			case 88
				cFunc = "CURLOPT_MAXFILESIZE_LARGE"
			case 89
				cFunc = "CURLOPT_MAXREDIRS"
			case 90
				cFunc = "CURLOPT_MAX_RECV_SPEED_LARGE"
			case 91
				cFunc = "CURLOPT_MAX_SEND_SPEED_LARGE"
			case 92
				cFunc = "CURLOPT_NETRC"
			case 93
				cFunc = "CURLOPT_NETRC_FILE"
			case 94
				cFunc = "CURLOPT_NEW_DIRECTORY_PERMS"
			case 95
				cFunc = "CURLOPT_NEW_FILE_PERMS"
			case 96
				cFunc = "CURLOPT_NOBODY"
			case 97
				cFunc = "CURLOPT_NOPROGRESS"
			case 98
				cFunc = "CURLOPT_NOPROXY"
			case 99
				cFunc = "CURLOPT_NOSIGNAL"
			case 100
				cFunc = "CURLOPT_OPENSOCKETDATA"
			case 101
				cFunc = "CURLOPT_OPENSOCKETFUNCTION"
			case 102
				cFunc = "CURLOPT_PASSWORD"
			case 103
				cFunc = "CURLOPT_PORT"
			case 104
				cFunc = "CURLOPT_POST"
			case 105
				cFunc = "CURLOPT_POSTFIELDS"
			case 106
				cFunc = "CURLOPT_POSTFIELDSIZE"
			case 107
				cFunc = "CURLOPT_POSTFIELDSIZE_LARGE"
			case 108
				cFunc = "CURLOPT_POSTQUOTE"
			case 109
				cFunc = "CURLOPT_POSTREDIR"
			case 110
				cFunc = "CURLOPT_PREQUOTE"
			case 111
				cFunc = "CURLOPT_PRIVATE"
			case 112
				cFunc = "CURLOPT_PROGRESSDATA"
			case 113
				cFunc = "CURLOPT_PROGRESSFUNCTION"
			case 114
				cFunc = "CURLOPT_PROTOCOLS"
			case 115
				cFunc = "CURLOPT_PROXY"
			case 116
				cFunc = "CURLOPT_PROXYAUTH"
			case 117
				cFunc = "CURLOPT_PROXYPASSWORD"
			case 118
				cFunc = "CURLOPT_PROXYPORT"
			case 119
				cFunc = "CURLOPT_PROXYTYPE"
			case 120
				cFunc = "CURLOPT_PROXYUSERNAME"
			case 121
				cFunc = "CURLOPT_PROXYUSERPWD"
			case 122
				cFunc = "CURLOPT_PROXY_TRANSFER_MODE"
			case 123
				cFunc = "CURLOPT_PUT"
			case 124
				cFunc = "CURLOPT_QUOTE"
			case 125
				cFunc = "CURLOPT_RANDOM_FILE"
			case 126
				cFunc = "CURLOPT_RANGE"
			case 127
				cFunc = "CURLOPT_READDATA"
			case 128
				cFunc = "CURLOPT_READFUNCTION"
			case 129
				cFunc = "CURLOPT_REDIR_PROTOCOLS"
			case 130
				cFunc = "CURLOPT_REFERER"
			case 131
				cFunc = "CURLOPT_RESOLVE"
			case 132
				cFunc = "CURLOPT_RESUME_FROM"
			case 133
				cFunc = "CURLOPT_RESUME_FROM_LARGE"
			case 134
				cFunc = "CURLOPT_RTSP_CLIENT_CSEQ"
			case 135
				cFunc = "CURLOPT_RTSP_REQUEST"
			case 136
				cFunc = "CURLOPT_RTSP_SERVER_CSEQ"
			case 137
				cFunc = "CURLOPT_RTSP_SESSION_ID"
			case 138
				cFunc = "CURLOPT_RTSP_STREAM_URI"
			case 139
				cFunc = "CURLOPT_RTSP_TRANSPORT"
			case 140
				cFunc = "CURLOPT_SEEKDATA"
			case 141
				cFunc = "CURLOPT_SEEKFUNCTION"
			case 142
				cFunc = "CURLOPT_SHARE"
			case 143
				cFunc = "CURLOPT_SOCKOPTDATA"
			case 144
				cFunc = "CURLOPT_SOCKOPTFUNCTION"
			case 145
				cFunc = "CURLOPT_SOCKS5_GSSAPI_NEC"
			case 146
				cFunc = "CURLOPT_SOCKS5_GSSAPI_SERVICE"
			case 147
				cFunc = "CURLOPT_SSH_AUTH_TYPES"
			case 148
				cFunc = "CURLOPT_SSH_HOST_PUBLIC_KEY_MD5"
			case 149
				cFunc = "CURLOPT_SSH_KEYDATA"
			case 150
				cFunc = "CURLOPT_SSH_KEYFUNCTION"
			case 151
				cFunc = "CURLOPT_SSH_KNOWNHOSTS"
			case 152
				cFunc = "CURLOPT_SSH_PRIVATE_KEYFILE"
			case 153
				cFunc = "CURLOPT_SSH_PUBLIC_KEYFILE"
			case 154
				cFunc = "CURLOPT_SSLCERT"
			case 155
				cFunc = "CURLOPT_SSLCERTTYPE"
			case 156
				cFunc = "CURLOPT_SSLENGINE"
			case 157
				cFunc = "CURLOPT_SSLENGINE_DEFAULT"
			case 158
				cFunc = "CURLOPT_SSLKEY"
			case 159
				cFunc = "CURLOPT_SSLKEYTYPE"
			case 160
				cFunc = "CURLOPT_SSLVERSION"
			case 161
				cFunc = "CURLOPT_SSL_CIPHER_LIST"
			case 162
				cFunc = "CURLOPT_SSL_CTX_DATA"
			case 163
				cFunc = "CURLOPT_SSL_CTX_FUNCTION"
			case 164
				cFunc = "CURLOPT_SSL_SESSIONID_CACHE"
			case 165
				cFunc = "CURLOPT_SSL_VERIFYHOST"
			case 166
				cFunc = "CURLOPT_SSL_VERIFYPEER"
			case 167
				cFunc = "CURLOPT_STDERR"
			case 168
				cFunc = "CURLOPT_TCP_NODELAY"
			case 169
				cFunc = "CURLOPT_TELNETOPTIONS"
			case 170
				cFunc = "CURLOPT_TFTP_BLKSIZE"
			case 171
				cFunc = "CURLOPT_TIMECONDITION"
			case 172
				cFunc = "CURLOPT_TIMEOUT"
			case 173
				cFunc = "CURLOPT_TIMEOUT_MS"
			case 174
				cFunc = "CURLOPT_TIMEVALUE"
			case 175
				cFunc = "CURLOPT_TLSAUTH_PASSWORD"
			case 176
				cFunc = "CURLOPT_TLSAUTH_TYPE"
			case 177
				cFunc = "CURLOPT_TLSAUTH_USERNAME"
			case 178
				cFunc = "CURLOPT_TRANSFERTEXT"
			case 179
				cFunc = "CURLOPT_TRANSFER_ENCODING"
			case 180
				cFunc = "CURLOPT_UNRESTRICTED_AUTH"
			case 181
				cFunc = "CURLOPT_UPLOAD"
			case 182
				cFunc = "CURLOPT_URL"
			case 183
				cFunc = "CURLOPT_USERAGENT"
			case 184
				cFunc = "CURLOPT_USERNAME"
			case 185
				cFunc = "CURLOPT_USERPWD"
			case 186
				cFunc = "CURLOPT_USE_SSL"
			case 187
				cFunc = "CURLOPT_VERBOSE"
			case 188
				cFunc = "CURLOPT_WILDCARDMATCH"
			case 189
				cFunc = "CURLOPT_WRITEDATA"
			case 190
				cFunc = "CURLOPT_WRITEFUNCTION"
		} 
		#Get the Constant Name
		cConstantName = T_CT_LIBCURL_EASYSETOPT_IP_VALUE2LIST[Variable(:Value2)]
		#Generate Step and Code
		NewStep(T_CT_LIBCURL_EASYSETOPT_ST_VALUE+StepData(:Value)+T_CT_LIBCURL_EASYSETOPT_ST_VALUE2+cConstantName+T_CT_LIBCURL_EASYSETOPT_ST_VALUE3+StepData(:Value3))
		SetStepCode("curl_easy_setopt("+Variable(:Value)+","+cConstantName+","+Variable(:Value3)+")")
		return True
	} 
private
class libcurl_easysetoptComponentView from ComponentViewParent
	Title(T_CT_LIBCURL_EASYSETOPT_IP_TITLE)
	TextBox(T_CT_LIBCURL_EASYSETOPT_IP_VALUE,:value)
	ListBox(T_CT_LIBCURL_EASYSETOPT_IP_VALUE2,:value2,T_CT_LIBCURL_EASYSETOPT_IP_VALUE2LIST)
	TextBox(T_CT_LIBCURL_EASYSETOPT_IP_VALUE3,:value3)
	PageButtons()
private
