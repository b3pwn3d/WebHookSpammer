@echo off
:menu
echo b   d8b   db d88888b d8888b. db   db  .d88b.   .d88b.  db   dD      .d8888. d8888b.  .d8b.  .88b  d88. .88b  d88. d88888b d8888b. 
echo 88   I8I   88 88'     88  `8D 88   88 .8P  Y8. .8P  Y8. 88 ,8P'      88'  YP 88  `8D d8' `8b 88'YbdP`88 88'YbdP`88 88'     88  `8D 
echo 88   I8I   88 88ooooo 88oooY' 88ooo88 88    88 88    88 88,8P        `8bo.   88oodD' 88ooo88 88  88  88 88  88  88 88ooooo 88oobY' 
echo Y8   I8I   88 88~~~~~ 88~~~b. 88~~~88 88    88 88    88 88`8b          `Y8b. 88~~~   88~~~88 88  88  88 88  88  88 88~~~~~ 88`8b   
echo `8b d8'8b d8' 88.     88   8D 88   88 `8b  d8' `8b  d8' 88 `88.      db   8D 88      88   88 88  88  88 88  88  88 88.     88 `88. 
echo  `8b8' `8d8'  Y88888P Y8888P' YP   YP  `Y88P'   `Y88P'  YP   YD      `8888Y' 88      YP   YP YP  YP  YP YP  YP  YP Y88888P 88   YD 
echo.
echo.
echo.                                                                                                                          
set /p webhook=Add the webhook to spam:
set /p message=Add the message to spam:
set /p delay=Put a delay delay on seconds(0=no):

if %delay%==0 (
    goto no_delay_spam
) else (
    goto delay_spam
)


:no_delay_spam
curl -X POST -H "Content-Type: application/json" -d "{\"content\":\"%message%\"}" %webhook%
echo Message sent 
goto :no_delay_spam

:delay_spam
echo Sending Message...
curl -X POST -H "Content-Type: application/json" -d "{\"content\":\"%message%\"}" %webhook%
ping 127.0.0.1 -n %delay% > nul 
goto :delay_spam

