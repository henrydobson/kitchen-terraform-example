control 'component-00' do
  describe 'OS family' do
    subject { os.redhat? }
    it 'should be Redhat' do
      expect(subject).to eq true
    end
  end
end

control 'component-01' do
  describe "OS arch" do
    subject { os.arch }
    it 'should be 64-bit' do
      expect(subject).to cmp 'x86_64'
    end
  end
end

control 'component-02' do
  describe "OS release" do
    subject { os.release }
    it 'should be gt 7.4' do
      expect(subject).to cmp >= 7.4
    end
  end
end