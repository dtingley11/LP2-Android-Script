#!/bin/bash
cd "$(dirname "$0")"

### Flashing aboot to use the oem adb_enable 1 command

./fastboot flash aboot aboot.img
./fastboot reboot bootloader
read -p " " -t 10
./fastboot oem adb_enable 1
./fastboot reboot
printf "Phone is rebooting. Please wait..." 
printf "\n"
./adb wait-for-device
read -p "Phone detected :)" -t 25

### Using adb to start the service menu, and starting Launcher3

./adb shell am start -n com.android.launcher3/com.android.launcher3.Launcher
read -p " " -t 10
./adb shell settings put global development_settings_enabled 1
./adb shell am start -n com.arima.servicemenu/com.arima.servicemenu.SerivceMainActivity
read -p "Service Menu starting..." -t 10

### Setting Launcher3 as the default home application

printf "\n"
./adb shell cmd package set-home-activity "com.android.launcher3/com.android.launcher3.Launcher"
read -p " " -t 5
./adb shell am force-stop com.lightos
read -p " " -t 5
./adb shell input keyevent 3
read -p "Rebooting" -t 5
printf "\n"

### Rebooting to bring up home buttons

./adb reboot bootloader
read -p " " -t 15

### Using fastboot to enable Adb so this Script can detect the phone

./fastboot oem adb_enable 1
./fastboot reboot
printf "\n"
read -p "Rebooting" -t 90
printf "\n"
./adb wait-for-device
./adb shell am force-stop com.lightos

### Cleaning up

./adb shell am start -n com.arima.servicemenu/com.arima.servicemenu.SerivceMainActivity
read -p " " -t 10
./adb shell am force-stop com.arima.servicemenu
printf "\n"
echo "Done!"
read -p " " -t 3
                                                                         
printf "                                                                          
                @@*    .@@@     @@@              @@   *@/                                  
                 @@    @@ @@    @@  @@ @@@ (@* @@@@@ @@@@@    @@@@@@    @@ @@@@@           
                 (@@  @@   @@  @@   @@@    (@*   @@   *@/   @@     @@   @@     @@          
                  @@ @@    @@ ,@@   @@.    (@*   @@   *@/  *@@@@@@@@@@  @@     @@          
                   @@@@     @@@@    @@.    (@*   @@   *@/   @@     /@&  @@     @@          
                   #@@       @@     @@.    (@*   @@@   @@@    @@@@@@    @@     @@          
                                                                                
                                                                                
                                                                                
                                                                                
                                   @@@@@@@@@@&                                             
                                   @@       @@  @@      @@                                 
                                   @@@@@@@@@@    @@    @@    @@                            
                                   @@       @@@   @@  @@                                   
                                   @@        @@   /@@/@*                                   
                                   @@@@@@@@@@*     @@@#      @@                            
                                                   .@@                                     
                                                 @@@               



                                                                   
                        .@@@@@@@@@               #@                                        
                        .@@       @@             #@                                        
                        .@@        @@  @@    @@  #@   @@&   @@(   @@@   @@                 
                        .@@        @@  *@&  &@,  #@        @@@@   @&     @@                
                        .@@       @@    &@  @@   #@   @@     @@   @&     @@                
                        .@@@@@@@@@@      @@@@    #@   @@,  @@@@   @&     @@                
                                          @@                                               
                                        @@@                                                 
                                                                                
                                                                                
                 @@@@@@@@@@@@.@,                         @@                                
                      @@                                 @@                                
                      @@     .@,  @@@    @@   @@   ,@@(  @@   @@    @@.  @@    &@*         
                      @@     .@,  @@     @@  @@      @(  @@  @@&&&&&&@@   @@   @&          
                      @@     .@,  @@     @@  @@     /@(  @@  @@            @@ @@           
                      @@     .@,  @@     @@   @@@@@@@@(  @@   @@@&&@@@      @@@            
                                                    @@                      @@             
                                               *@@@@@@                    @@@

"
















