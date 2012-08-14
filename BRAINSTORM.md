# Puppet module requirements

## Use parameters

By rule, no user of your module should need to touch any code to change
configuration. An example in it's most primitive form:

Bad:

```puppet
  class x::params {
    $foo = 'bar'
  }
```

Good:

```puppet
  class x::params (
    $foo = 'bar'
  ) {
    $package = $::operatingsystem ? {}
  }

  class x {
    require x::params
    $foo = $::x::params::foo
  }

```

Better:

```puppet
  class x::params(
    $foo = 'bar',
    $os_dep = undef,
  ) {
    $_os_dep = $os_dep ? {
      undef    => $::operatingsystem ? {
        /(?i:centos|redhat)/  => 'redhat_dep',
        default               => 'default_dep',
      },
      default  => $os_dep,
    }
  }

  class x (
    $foo    = $::x::params::foo,
    $os_dep = $::x::params::_os_dep,
  ) inherits ::x::params  {

    # VICTORY, I CAN OVERLOAD VARIABLES GLOBALLY, AND CLASS SPECIFIC!!

  }

```
## sanity checks

Check requirements on top of your class as much as possible
Do a case statement to check for whatever you need to check and fail
if something is unsupported.

Every fail you use should be mentioned in the docs ofcourse.


## Don't configure repositories.

You can list your required repositories as a requirement in your fine
documentation, but don't force system admins to use a specific repository.
In an environment where you need more control over installed packages, this
can be a mess to deal with.

You can however include a definition for a repository, but don't include it
by default. Allow the user to choose to do so.

## Other stuff you should pay attention to

* Always depend on the alias of a package, but not on the class that installs that package.
* Include the following header in your templates files, taking that the target file supports some kind of commenting.

```erb
### File managed with puppet ###
## Served by:        '<%= scope.lookupvar('::servername') %>'
## Module:           '<%= scope.to_hash['module_name'] %>'
## Template source:  '<%= template_source %>'
```

## Stuff to think about

How are we going to version the hieradata folder?


## puppet.conf directives I should remember in case I ever need them

dynamicfacts:
  Facts that are dynamic; these  facts  will  be  ignored  when  deciding
  whether  changed  facts  should  result  in a recompile. Multiple facts
  should be comma-separated.

  Default: memorysize,memoryfree,swapsize,swapfree



templatedir:
  Where Puppet looks for template files. Can be a list of colon-seperated
  directories.

  Default: $vardir/templates


