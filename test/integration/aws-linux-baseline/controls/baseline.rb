# #
# # todo: uncomment when profile conflict with dependencies is fixed.
# #

# include_controls 'linux-baseline' do
#     # todo: tests that require tasks to resolve
#     skip_control 'os-05'
#     skip_control 'os-05b'
#     skip_control 'os-06'
#     skip_control 'os-10'
#     skip_control 'sysctl-05'
#     skip_control 'sysctl-06'
#     skip_control 'sysctl-07'
#     skip_control 'sysctl-08'
#     skip_control 'sysctl-09'
#     skip_control 'sysctl-10'
#     skip_control 'sysctl-14'
#     skip_control 'sysctl-15'
#     skip_control 'sysctl-16'
#     skip_control 'sysctl-17'
#     skip_control 'sysctl-18'
#     skip_control 'sysctl-20'
#     skip_control 'sysctl-21'
#     skip_control 'sysctl-22'
#     skip_control 'sysctl-23'
#     skip_control 'sysctl-24'
#     skip_control 'sysctl-25'
#     skip_control 'sysctl-26'
#     skip_control 'sysctl-27'
#     skip_control 'sysctl-28'
#     skip_control 'sysctl-30'

#     # skip entropy test, as our short living test VMs usually do not
#     # have enough
#     skip_control 'os-08'
#     # skip auditd tests, we do not have any implementation for audit management yet
#     skip_control 'package-08'
# end

# include_controls 'ssh-baseline' do
#     # todo: tests that require tasks to resolve
#     skip_control 'ssh-02'
#     skip_control 'ssh-03'
#     skip_control 'ssh-04'
#     skip_control 'ssh-05'
#     skip_control 'ssh-06'
#     skip_control 'ssh-07'
#     skip_control 'ssh-08'
#     skip_control 'ssh-09'
#     skip_control 'ssh-10'
#     skip_control 'ssh-11'
#     skip_control 'ssh-12'
#     skip_control 'ssh-13'
#     skip_control 'ssh-14'
#     skip_control 'ssh-15'
#     skip_control 'ssh-16'
#     skip_control 'ssh-17'
#     skip_control 'ssh-18'
#     skip_control 'ssh-19'
#     skip_control 'ssh-20'
#     skip_control 'ssh-21'
#     skip_control 'ssh-20'
# end