# Install XDebug

This page is a lifesaver, careful with the paths it suggests if you have multiple php versions installed through brew because it will mix them...

[https://xdebug.org/wizard](https://xdebug.org/wizard)

Add this to the ini file:

```ini
xdebug.mode = debug
xdebug.start_with_request = yes
```

Once done if on macos run `sudo apachectl restart`
