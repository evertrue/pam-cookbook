# pam-cookbook

[![Cookbook Version](https://img.shields.io/cookbook/v/pam.svg)](https://supermarket.chef.io/cookbooks/pam)
[![Build Status](https://travis-ci.org/evertrue/pam-cookbook.svg?branch=master)](https://travis-ci.org/evertrue/pam-cookbook)

Manages PAM services in `/etc/pam.d`

## Limitations

This cookbook will not set up PAM if you do not already have it installed. It will only modify an existing configuration.

Also, currently it only includes defaults for `/etc/pam.d/su` on Debian systems.

If you want to override any other PAM services, or you are not on a Debian-based OS, you will first need to transcribe the entire service configuration into the appropriate node attibute, otherwise the PAM file will be overwritten *with only the attributes you configure* (and your system will become unusable).

## Supported Platforms

This cookbook _should_ work fine on Red Hat systems, however it has only been tested on *Ubuntu 14.04* & *16.04*.

## Attributes

- `node['pam_d']['services']` - Example:

  ```ruby
  {
    'su' => {
      'main' => {
        'pam_env' => {
          'interface' => 'session',
          'control_flag' => 'required',
          'name' => 'pam_env.so',
          'args' => 'readenv=1',
          'disabled' => false,
          'priority' => 10,
        }
      },
      'includes' => %w(
        common-something
      )
    }
  }
  ```

*NOTE:* `pam_env` in this case is just a placeholder so that we can use a keyed hash instead of an array. `disabled` is optional but if it is present and set to true, it will prevent the entry from showing up in the PAM service file.

Line ordering within the service can be achieved by setting the `priority` key, lower numbers coming first. If `priority` is unset, then it is considered to be `9999` and will be at the mercy of node attribute ordering.

## Usage

### pam::default

Include `pam` in a recipe:

```ruby
include_recipe 'pam'
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors

Author:: EverTrue, Inc. <devops@evertrue.com>  
Author:: Jeff Byrnes <thejeffbyrnes@gmail.com>
