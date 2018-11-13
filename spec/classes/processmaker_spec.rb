require 'spec_helper'

describe 'processmaker' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let(:params) { {'dbpassword' => 'Letmein!'} }

      it { is_expected.to compile }
    end
  end
end
