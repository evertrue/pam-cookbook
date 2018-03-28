default['pam_d']['services'] = value_for_platform_family(
  'debian' => {
    'su' => {
      'main' => {
        'pam_rootok' => {
          'interface' => 'auth',
          'control_flag' => 'sufficient',
          'name' => 'pam_rootok.so',
        },
        'pam_env' => {
          'interface' => 'session',
          'control_flag' => 'required',
          'name' => 'pam_env.so',
          'args' => 'readenv=1',
        },
        'pam_env_locate' => {
          'interface' => 'session',
          'control_flag' => 'required',
          'name' => 'pam_env.so',
          'args' => 'readenv=1 envfile=/etc/default/locale',
        },
        'pam_mail' => {
          'interface' => 'session',
          'control_flag' => 'optional',
          'name' => 'pam_mail.so',
          'args' => 'nopen',
        },
        'pam_limits' => {
          'interface' => 'session',
          'control_flag' => 'required',
          'name' => 'pam_limits.so',
        },
      },
      'includes' => %w(
        common-auth
        common-account
        common-session
      ),
    },
  }
)
