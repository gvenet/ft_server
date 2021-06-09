<?php
$cfg['blowfish_secret'] = 'CfX1la/aG83gx1{7rADus,iqz8RzeV8x'; 
/* Servers configuration */
$i = 0;
/* First server */
$i++;
/* Authentication type */
$cfg['Servers'][$i]['auth_type'] = 'cookie';
/* Server parameters */
$cfg['Servers'][$i]['host'] = 'localhost';
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = true;
/* Directories for saving/loading files from server */
$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';
