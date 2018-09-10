vpc = attribute('vpc', default: '', description: '')
instances = attribute('instances', default: '', description: '')

control 'aws-00' do
  impact 1.0
  title "Validate AWS Root Account Configuration"
  describe aws_iam_root_user do
    it { should have_hardware_mfa_enabled }
  end

  describe aws_iam_root_user do
    it { should_not have_access_key }
  end
end

control 'aws-10' do
  impact 1.0
  title "Validate AWS VPC"
  describe aws_vpc(vpc) do
    it { should exist }
  end

  describe aws_vpc(vpc) do
    its('cidr_block') { should cmp '10.20.0.0/16' }
  end

  describe aws_vpc(vpc) do
    its ('state') { should eq 'available' }
  end

  describe aws_flow_log(vpc_id: vpc) do
    it { should exist }
  end
end

control 'aws-11' do
  impact 1.0
  title "Validate EC2 Instances"
  for i in instances

    describe aws_ec2_instance(i) do
      it { should exist }    
    end

    describe aws_ec2_instance(i) do
      it { should be_running }
    end
    
    describe aws_ec2_instance(i) do
      its('key_name') { should cmp 'cp-prod-app' }
    end 
  end
end
