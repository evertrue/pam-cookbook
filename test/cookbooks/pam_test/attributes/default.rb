override['pam_d']['services']['su']['main']['pam_limits'] = {
  'interface' => 'session',
  'control_flag' => 'optional',
  'name' => 'pam_limits.so'
}
