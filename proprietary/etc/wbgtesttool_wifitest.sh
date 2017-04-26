#!/system/bin/sh

LOGFILENAME="/data/data/com.fihtdc.wbgtesttool/wifilog.txt"

MODE=`getprop persist.sys.wbg.wifi.mode`

echo "Mode:"$MODE >> $LOGFILENAME

STANDARD=`getprop persist.sys.wbg.wifi.standard`

echo "Standard:"$STANDARD >> $LOGFILENAME

CHANNEL=`getprop persist.sys.wbg.wifi.channel`

echo "Channel:"$CHANNEL >> $LOGFILENAME

RATE=`getprop persist.sys.wbg.wifi.rate`

echo "Rate:"$RATE >> $LOGFILENAME

BAND=`getprop persist.sys.wbg.wifi.band`

echo "Band:"$BAND >> $LOGFILENAME

if [ "$STANDARD" == "802.11n" ]; then

    HT=`getprop persist.sys.wbg.wifi.ht`

    echo "HT:"$HT >> $LOGFILENAME

fi

POWER=`getprop persist.sys.wbg.wifi.power`

echo "Power:"$POWER >> $LOGFILENAME

WLFILENAME=`getprop persist.sys.wbg.wifi.wlfile`

echo "wlfilename:"$WLFILENAME >> $LOGFILENAME

FUNCTION=`getprop persist.sys.wbg.wifi.function`

echo "Function:"$FUNCTION >> $LOGFILENAME


if [ "$FUNCTION" == "removemodule" ]; then

    rmmod /system/lib/modules/wlan.ko con_mode=5
    sleep 1

    lsmod > "/data/data/com.fihtdc.wbgtesttool/rmmodcheck.txt"
    echo lsmod >> $LOGFILENAME

    chmod 777 "/data/data/com.fihtdc.wbgtesttool/rmmodcheck.txt"

elif [ "$FUNCTION" == "insertmodule" ]; then

    insmod /system/lib/modules/wlan.ko con_mode=5
    sleep 1

    lsmod > "/data/data/com.fihtdc.wbgtesttool/insmodcheck.txt"
    echo lsmod >> $LOGFILENAME

    chmod 777 "/data/data/com.fihtdc.wbgtesttool/insmodcheck.txt"

elif [ "$FUNCTION" == "enablewifi" ]; then

    #insmod /system/lib/modules/wlan.ko con_mode=5
    #echo insmod /system/lib/modules/wlan.ko con_mode=5 >> $LOGFILENAME

    ptt_socket_app
    echo ptt_socket_app >> $LOGFILENAME

    iwpriv wlan0 ftm 1
    echo iwpriv wlan0 ftm 1 >> $LOGFILENAME

    echo $FUNCTION "end" >> $LOGFILENAME
    echo "--------------------------------------" >> $LOGFILENAME

elif [ "$FUNCTION" == "disablewifi" ]; then

    iwpriv wlan0 ena_chain 0
    echo iwpriv wlan0 ena_chain 0 >> $LOGFILENAME

    #iwpriv wlan0 ftm 0
    #echo iwpriv wlan0 ftm 0 >> $LOGFILENAME

    echo $FUNCTION "end" >> $LOGFILENAME
    echo "--------------------------------------" >> $LOGFILENAME

elif [ "$FUNCTION" == "enabletx" ]; then

    iwpriv wlan0 ena_chain 2
    echo iwpriv wlan0 ena_chain 2 >> $LOGFILENAME

    iwpriv wlan0 tx 0
    echo iwpriv wlan0 tx 0 >> $LOGFILENAME

    iwpriv wlan0 set_bandwidth $HT
    
    iwpriv wlan0 set_channel $CHANNEL
    echo iwpriv wlan0 set_channel $CHANNEL >> $LOGFILENAME

    if [ "$STANDARD" == "802.11a" ]; then

        if [ "$RATE" == "1" ]; then

            iwpriv wlan0 set_txrate 11B_LONG_1_MBPS
            echo iwpriv wlan0 set_txrate 11B_LONG_1_MBPS >> $LOGFILENAME

        elif [ "$RATE" == "2" ]; then

            iwpriv wlan0 set_txrate 11B_LONG_2_MBPS
            echo iwpriv wlan0 set_txrate 11B_LONG_2_MBPS >> $LOGFILENAME

        elif [ "$RATE" == "5.5" ]; then

            iwpriv wlan0 set_txrate 11B_LONG_5_5_MBPS
            echo iwpriv wlan0 set_txrate 11B_LONG_5_5_MBPS >> $LOGFILENAME

        elif [ "$RATE" == "11" ]; then

            iwpriv wlan0 set_txrate 11B_LONG_11_MBPS
            echo iwpriv wlan0 set_txrate 11B_LONG_11_MBPS >> $LOGFILENAME

        elif [ "$RATE" == "6" ]; then

            iwpriv wlan0 set_txrate 11A_6_MBPS
            echo iwpriv wlan0 set_txrate 11A_6_MBPS >> $LOGFILENAME

        elif [ "$RATE" == "9" ]; then

            iwpriv wlan0 set_txrate 11A_9_MBPS
            echo iwpriv wlan0 set_txrate 11A_9_MBPS >> $LOGFILENAME

        elif [ "$RATE" == "12" ]; then

            iwpriv wlan0 set_txrate 11A_12_MBPS
            echo iwpriv wlan0 set_txrate 11A_12_MBPS >> $LOGFILENAME

        elif [ "$RATE" == "18" ]; then

            iwpriv wlan0 set_txrate 11A_18_MBPS
            echo iwpriv wlan0 set_txrate 11A_18_MBPS >> $LOGFILENAME

        elif [ "$RATE" == "24" ]; then

            iwpriv wlan0 set_txrate 11A_24_MBPS
            echo iwpriv wlan0 set_txrate 11A_24_MBPS >> $LOGFILENAME

        elif [ "$RATE" == "36" ]; then

            iwpriv wlan0 set_txrate 11A_36_MBPS
            echo iwpriv wlan0 set_txrate 11A_36_MBPS >> $LOGFILENAME

        elif [ "$RATE" == "48" ]; then

            iwpriv wlan0 set_txrate 11A_48_MBPS
            echo iwpriv wlan0 set_txrate 11A_48_MBPS >> $LOGFILENAME

        elif [ "$RATE" == "54" ]; then

            iwpriv wlan0 set_txrate 11A_54_MBPS
            echo iwpriv wlan0 set_txrate 11A_54_MBPS >> $LOGFILENAME

        fi

    elif [ "$STANDARD" == "802.11b" ]; then

        if [ "$RATE" == "1" ]; then

            iwpriv wlan0 set_txrate 11B_LONG_1_MBPS
            echo iwpriv wlan0 set_txrate 11B_LONG_1_MBPS >> $LOGFILENAME

        elif [ "$RATE" == "2" ]; then

            iwpriv wlan0 set_txrate 11B_LONG_2_MBPS
            echo iwpriv wlan0 set_txrate 11B_LONG_2_MBPS >> $LOGFILENAME

        elif [ "$RATE" == "5.5" ]; then

            iwpriv wlan0 set_txrate 11B_LONG_5_5_MBPS
            echo iwpriv wlan0 set_txrate 11B_LONG_5_5_MBPS >> $LOGFILENAME

        elif [ "$RATE" == "11" ]; then

            iwpriv wlan0 set_txrate 11B_LONG_11_MBPS
            echo iwpriv wlan0 set_txrate 11B_LONG_11_MBPS >> $LOGFILENAME

        fi

    elif [ "$STANDARD" == "802.11g" ]; then

        if [ "$RATE" == "1" ]; then

            iwpriv wlan0 set_txrate 11B_LONG_1_MBPS
            echo iwpriv wlan0 set_txrate 11B_LONG_1_MBPS >> $LOGFILENAME

        elif [ "$RATE" == "2" ]; then

            iwpriv wlan0 set_txrate 11B_LONG_2_MBPS
            echo iwpriv wlan0 set_txrate 11B_LONG_2_MBPS >> $LOGFILENAME

        elif [ "$RATE" == "5.5" ]; then

            iwpriv wlan0 set_txrate 11B_LONG_5_5_MBPS
            echo iwpriv wlan0 set_txrate 11B_LONG_5_5_MBPS >> $LOGFILENAME

        elif [ "$RATE" == "11" ]; then

            iwpriv wlan0 set_txrate 11B_LONG_11_MBPS
            echo iwpriv wlan0 set_txrate 11B_LONG_11_MBPS >> $LOGFILENAME

        elif [ "$RATE" == "6" ]; then

            iwpriv wlan0 set_txrate 11A_6_MBPS
            echo iwpriv wlan0 set_txrate 11A_6_MBPS >> $LOGFILENAME

        elif [ "$RATE" == "9" ]; then

            iwpriv wlan0 set_txrate 11A_9_MBPS
            echo iwpriv wlan0 set_txrate 11A_9_MBPS >> $LOGFILENAME

        elif [ "$RATE" == "12" ]; then

            iwpriv wlan0 set_txrate 11A_12_MBPS
            echo iwpriv wlan0 set_txrate 11A_12_MBPS >> $LOGFILENAME

        elif [ "$RATE" == "18" ]; then

            iwpriv wlan0 set_txrate 11A_18_MBPS
            echo iwpriv wlan0 set_txrate 11A_18_MBPS >> $LOGFILENAME

        elif [ "$RATE" == "24" ]; then

            iwpriv wlan0 set_txrate 11A_24_MBPS
            echo iwpriv wlan0 set_txrate 11A_24_MBPS >> $LOGFILENAME

        elif [ "$RATE" == "36" ]; then

            iwpriv wlan0 set_txrate 11A_36_MBPS
            echo iwpriv wlan0 set_txrate 11A_36_MBPS >> $LOGFILENAME

        elif [ "$RATE" == "48" ]; then

            iwpriv wlan0 set_txrate 11A_48_MBPS
            echo iwpriv wlan0 set_txrate 11A_48_MBPS >> $LOGFILENAME

        elif [ "$RATE" == "54" ]; then

            iwpriv wlan0 set_txrate 11A_54_MBPS
            echo iwpriv wlan0 set_txrate 11A_54_MBPS >> $LOGFILENAME

        fi

    elif [ "$STANDARD" == "802.11n" ]; then
		#802.11n MCS0~7 for band: 20
		if [ "$HT" == "20" ]; then
		
			if [ "$RATE" == "0" ]; then

				iwpriv wlan0 set_txrate MCS_6_5_MBPS
				echo iwpriv wlan0 set_txrate MCS_6_5_MBPS >> $LOGFILENAME

			elif [ "$RATE" == "1" ]; then

				iwpriv wlan0 set_txrate MCS_13_MBPS
				echo iwpriv wlan0 set_txrate MCS_13_MBPS >> $LOGFILENAME

			elif [ "$RATE" == "2" ]; then

				iwpriv wlan0 set_txrate MCS_19_5_MBPS
				echo iwpriv wlan0 set_txrate MCS_19_5_MBPS >> $LOGFILENAME

			elif [ "$RATE" == "3" ]; then

				iwpriv wlan0 set_txrate MCS_26_MBPS
				echo iwpriv wlan0 set_txrate MCS_26_MBPS >> $LOGFILENAME

			elif [ "$RATE" == "4" ]; then

				iwpriv wlan0 set_txrate MCS_39_MBPS
				echo iwpriv wlan0 set_txrate MCS_39_MBPS >> $LOGFILENAME

			elif [ "$RATE" == "5" ]; then

				iwpriv wlan0 set_txrate MCS_52_MBPS
				echo iwpriv wlan0 set_txrate MCS_52_MBPS >> $LOGFILENAME

			elif [ "$RATE" == "6" ]; then

				iwpriv wlan0 set_txrate MCS_58_5_MBPS
				echo iwpriv wlan0 set_txrate MCS_58_5_MBPS >> $LOGFILENAME

			elif [ "$RATE" == "7" ]; then

				iwpriv wlan0 set_txrate MCS_65_MBPS
				echo iwpriv wlan0 set_txrate MCS_65_MBPS >> $LOGFILENAME
			fi
		elif [ "$HT" == "40" ]; then 
		#802.11n MCS0~7 for band: 40	
			if [ "$RATE" == "0" ]; then

				iwpriv wlan0 set_txrate MCS_CB_13_5_MBPS
				echo iwpriv wlan0 set_txrate MCS_CB_13_5_MBPS >> $LOGFILENAME

			elif [ "$RATE" == "1" ]; then

				iwpriv wlan0 set_txrate MCS_CB_27_MBPS
				echo iwpriv wlan0 set_txrate MCS_CB_27_MBPS >> $LOGFILENAME

			elif [ "$RATE" == "2" ]; then

				iwpriv wlan0 set_txrate MCS_CB_40_5_MBPS
				echo iwpriv wlan0 set_txrate MCS_CB_40_5_MBPS >> $LOGFILENAME

			elif [ "$RATE" == "3" ]; then

				iwpriv wlan0 set_txrate MCS_CB_54_MBPS
				echo iwpriv wlan0 set_txrate MCS_CB_54_MBPS >> $LOGFILENAME

			elif [ "$RATE" == "4" ]; then

				iwpriv wlan0 set_txrate MCS_CB_81_MBPS
				echo iwpriv wlan0 set_txrate MCS_CB_81_MBPS >> $LOGFILENAME

			elif [ "$RATE" == "5" ]; then

				iwpriv wlan0 set_txrate MCS_CB_108_MBPS
				echo iwpriv wlan0 set_txrate MCS_CB_108_MBPS >> $LOGFILENAME

			elif [ "$RATE" == "6" ]; then

				iwpriv wlan0 set_txrate MCS_CB_121_5_MBPS
				echo iwpriv wlan0 set_txrate MCS_CB_121_5_MBPS >> $LOGFILENAME

			elif [ "$RATE" == "7" ]; then

				iwpriv wlan0 set_txrate MCS_CB_135_MBPS
				echo iwpriv wlan0 set_txrate MCS_CB_135_MBPS >> $LOGFILENAME
			fi		
		fi
    fi
    iwpriv wlan0 pwr_cntl_mode 1
    iwpriv wlan0 set_txpower $POWER
    echo iwpriv wlan0 set_txpower $POWER >> $LOGFILENAME

    iwpriv wlan0 tx 1
    echo iwpriv wlan0 tx 1 >> $LOGFILENAME

    echo $FUNCTION "end" >> $LOGFILENAME
    echo "--------------------------------------" >> $LOGFILENAME

elif [ "$FUNCTION" == "disabletx" ]; then

    iwpriv wlan0 tx 0
    echo iwpriv wlan0 tx 0 >> $LOGFILENAME

    iwpriv wlan0 ena_chain 0
    echo iwpriv wlan0 ena_chain 0 >> $LOGFILENAME

    echo $FUNCTION "end" >> $LOGFILENAME
    echo "--------------------------------------" >> $LOGFILENAME

elif [ "$FUNCTION" == "enablerx" ]; then

    iwpriv wlan0 ena_chain 1
    echo iwpriv wlan0 ena_chain 1 >> $LOGFILENAME

    iwpriv wlan0 rx 0
    echo iwpriv wlan0 rx 0 >> $LOGFILENAME

    iwpriv wlan0 set_channel $CHANNEL
    echo iwpriv wlan0 set_channel $CHANNEL >> $LOGFILENAME

    iwpriv wlan0 clr_rxpktcnt 1
    echo iwpriv wlan0 clr_rxpktcnt 1 >> $LOGFILENAME

    iwpriv wlan0 rx 1
    echo iwpriv wlan0 rx 1 >> $LOGFILENAME

    echo $FUNCTION "end" >> $LOGFILENAME
    echo "--------------------------------------" >> $LOGFILENAME

elif [ "$FUNCTION" == "disablerx" ]; then

    iwpriv wlan0 rx 0
    echo iwpriv wlan0 rx 0 >> $LOGFILENAME

    iwpriv wlan0 ena_chain 0
    echo iwpriv wlan0 ena_chain 0 >> $LOGFILENAME

    echo $FUNCTION "end" >> $LOGFILENAME
    echo "--------------------------------------" >> $LOGFILENAME

elif [ "$FUNCTION" == "reportPacket" ]; then

    iwpriv wlan0 get_rxpktcnt > $WLFILENAME
    echo iwpriv wlan0 get_rxpktcnt >> $LOGFILENAME

    chmod 777 $WLFILENAME

    echo $FUNCTION "end" >> $LOGFILENAME
    echo "--------------------------------------" >> $LOGFILENAME

elif [ "$FUNCTION" == "resetCounters" ]; then

    iwpriv wlan0 clr_rxpktcnt 1
    echo iwpriv wlan0 clr_rxpktcnt 1 >> $LOGFILENAME

    echo $FUNCTION "end" >> $LOGFILENAME
    echo "--------------------------------------" >> $LOGFILENAME

elif [ "$FUNCTION" == "enablecw" ]; then

    iwpriv wlan0 ena_chain 2
    echo iwpriv wlan0 ena_chain 2 >> $LOGFILENAME

    iwpriv wlan0 set_channel $CHANNEL
    echo iwpriv wlan0 set_channel $CHANNEL >> $LOGFILENAME

    iwpriv wlan0 stop_txpkt 1
    echo iwpriv wlan0 stop_txpkt 1 >> $LOGFILENAME

    iwpriv wlan0 set_cwgain 23 31 0
    echo iwpriv wlan0 set_cwgain 23 31 0 >> $LOGFILENAME

    iwpriv wlan0 set_tonenum 0
    echo iwpriv wlan0 set_tonenum 0 >> $LOGFILENAME

    iwpriv wlan0 cw 1
    echo iwpriv wlan0 cw 1 >> $LOGFILENAME

    echo $FUNCTION "end" >> $LOGFILENAME
    echo "--------------------------------------" >> $LOGFILENAME

elif [ "$FUNCTION" == "disablecw" ]; then

    iwpriv wlan0 cw 0
    echo iwpriv wlan0 cw 0 >> $LOGFILENAME

    iwpriv wlan0 ena_chain 0
    echo iwpriv wlan0 ena_chain 0 >> $LOGFILENAME

    echo $FUNCTION "end" >> $LOGFILENAME
    echo "--------------------------------------" >> $LOGFILENAME

else

    echo "Do nothing" >> $LOGFILENAME
    echo "--------------------------------------" >> $LOGFILENAME

fi
