# For the demonstration of error

When running system `aws` and `baseline`.

```
Verifying aws
>>>>>> ------Exception-------
>>>>>> Class: Kitchen::ActionFailed
>>>>>> Message: 1 actions failed.
>>>>>>     Failed to complete #verify action: [undefined method `name' for nil:NilClass] on aws-linux-baseline-centos-7
>>>>>> ----------------------
>>>>>> Please see .kitchen/logs/kitchen.log for more details
>>>>>> Also try running `kitchen diagnose --all` for configuration
```

# Usage

This will allow 22 0.0.0.0/0 

You must add your own backend and provider credentials.

```
bundle install
kitchen test
```