# -*- encoding: utf-8 -*-

require 'busser/runner_plugin'
require 'busser/mamba/pip'

module Busser
  module Thor
    class BaseGroup
      include Busser::Mamba::Pip
    end
  end

  module RunnerPlugin
    # A Busser runner plugin for Mamba.
    #
    # @author Jaime Gil de Sagredo Luna <jaimegildesagredo@gmail.com>
    #
    class Mamba < Base
      postinstall do
        ensure_pip
        pip_install(
          '-e git+git://github.com/nestorsalceda/mamba.git#egg=mamba')
      end

      def test
        suite_path = suite_path('mamba').to_s
        requirements_file = File.join(suite_path, 'requirements.txt')

        if File.exists?(requirements_file)
          run!("pip install -r #{requirements_file}")
        end

        run!("mamba #{suite_path}")
      end
    end
  end
end
