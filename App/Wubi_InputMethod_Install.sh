#!/bin/bash
function Install_Simple_Chinese {
    echo Install Simple Chinese Language Packages
    sudo apt-get install language-pack-zh-hans*
    sudo apt-get install language-pack-gnome-zh-hans*
    #sudo apt-get install language-pack-kde-zh-hans*
}
function Install_Traditional_Chinese {
    echo Install Tranditional Chinese Language Packages
    sudo apt-get install language-pack-zh-hant*
    sudo apt-get install language-pack-gnome-zh-hant*
    #sudo apt-get install language-pack-kde-zh-hant*
    sudo apt install $(check-language-support)
}

function Install_Fcitx_Wbpy {
    echo Installing Fcitx-table-wbpy
    sudo apt update
    sudo apt install fcitx-table-wubi fcitx-table-wbpy fcitx-config-gtk
    sudo apt-get install im-config 
    im-config -n fcitx
}

function Set_system_language_to_Chinese {
    echo setting system language to Chinese
    # modifying the file /etc/default/locale 
    # sudo cp Surport/locale.zh /etc/default/locale
    # or modifying the user-specific $HOME/.pam_environment
    sudo cp Surport/pam_environment.zh $HOME/.pam_environment 
    # Older releases, at least before Lucid (when did this change?), required modifying the file /etc/environment.
    # As an alternative to editing these files by hand update-locale may be used (this applies to older releases as well, at least before Raring):
    sudo update-locale
    # $ update-locale LANG=zh_CN
    # If none of the above worked for you there is an option to change the actual definition of a locale. 
    # You need to edit a file with your locale, for instance:
    # $ sudo vim /usr/share/i18n/locales/ru_RU and change the definition that you need.  
    # and then recompile locale definition files by:
    # $ sudo locale-gen
    # Read the man page for more information. 
}
function Set_system_language_to_English {
    echo setting system language to English
    sudo cp Surport/pam_environment.en $HOME/.pam_environment 
    sudo update-locale
}
function main {
    Install_Fcitx_Wbpy
    Install_Simple_Chinese
    Set_system_language_to_Chinese
    # Changes take effect only after a fresh login.
    # Configuring Fcitx to add Wbpy input method.
    # Fcitx-config-gtk3
    Set_system_language_to_English
}
main
