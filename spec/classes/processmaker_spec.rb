require 'spec_helper'

describe 'processmaker' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let(:params) { { dbpassword: 'Letmein!' } }

      context 'with configitems' do
        let(:params) do
          super().merge(
            numberlogfile: 50,
            configitems: {
              'item1' => 'value1',
              'item2' => 'value2',
            },
          )
        end

        it { is_expected.to compile.with_all_deps }
        it do
          is_expected.to contain_file('/opt/processmaker/workflow/engine/config/env.ini').with(
            'ensure'  => 'file',
            'path'    => '/opt/processmaker/workflow/engine/config/env.ini',
          )
        end
      end
    end
  end
end
