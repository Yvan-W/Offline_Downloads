RED_FONT_PREFIX="\033[31m"
GREEN_FONT_PREFIX="\033[32m"
YELLOW_FONT_PREFIX="\033[1;33m"
LIGHT_PURPLE_FONT_PREFIX="\033[1;35m"
FONT_COLOR_SUFFIX="\033[0m"
INFO="[${GREEN_FONT_PREFIX}INFO${FONT_COLOR_SUFFIX}]"
ERROR="[${RED_FONT_PREFIX}ERROR${FONT_COLOR_SUFFIX}]"
ARIA2_CONF=${1:-aria2.conf}
DOWNLOADER="curl -fsSL --connect-timeout 3 --max-time 3 --retry 2"
NL=$'\n'

DATE_TIME() {
    date +"%m/%d %H:%M:%S"
}

GET_TRACKERS() {
    
    if [[ -z "${CUSTOM_TRACKER_URL}" ]]; then
        echo && echo -e "$(DATE_TIME) ${INFO} Get BT trackers..."
        TRACKER=$(
            ${DOWNLOADER} https://gitea.com/XIU2/TrackersListCollection/raw/branch/master/best_aria2.txt ||
                ${DOWNLOADER} https://gitea.com/XIU2/TrackersListCollection/raw/branch/master/http_aria2.txt
        )
    else
        echo && echo -e "$(DATE_TIME) ${INFO} Get BT trackers from url(s):${CUSTOM_TRACKER_URL} ..."
        URLS=$(echo ${CUSTOM_TRACKER_URL} | tr "," "$NL")
        for URL in $URLS; do
            TRACKER+="$(${DOWNLOADER} ${URL} | tr "," "\n")$NL"
        done
        TRACKER="$(echo "$TRACKER" | awk NF | sort -u | sed 'H;1h;$!d;x;y/\n/,/' )"
    fi

    [[ -z "${TRACKER}" ]] && {
        echo
        echo -e "$(DATE_TIME) ${ERROR} Unable to get trackers, network failure or invalid links." && exit 1
    }
}

ECHO_TRACKERS() {
    echo -e "
--------------------[BitTorrent Trackers]--------------------
${TRACKER}
--------------------[BitTorrent Trackers]--------------------
"
}

ADD_TRACKERS() {
    echo -e "$(DATE_TIME) ${INFO} Adding BT trackers to Aria2 configuration file ${LIGHT_PURPLE_FONT_PREFIX}${ARIA2_CONF}${FONT_COLOR_SUFFIX} ..." && echo
    if [ ! -f ${ARIA2_CONF} ]; then
        echo -e "$(DATE_TIME) ${ERROR} '${ARIA2_CONF}' does not exist."
        exit 1
    else
        echo "${TRACKER}" > "${ARIA2_CONF}" && echo -e "$(DATE_TIME) ${INFO} BT trackers successfully added to Aria2 configuration file !"
    fi
}


[ $(command -v curl) ] || {
    echo -e "$(DATE_TIME) ${ERROR} curl is not installed."
    exit 1
}

if [ "$1" = "cat" ]; then
    GET_TRACKERS
    ECHO_TRACKERS
else
    GET_TRACKERS
    ECHO_TRACKERS
    ADD_TRACKERS
fi

exit 0
