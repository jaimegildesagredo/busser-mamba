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
          'https://github.com/nestorsalceda/mamba/archive/master.zip')
      end

      def test
        suite_path = suite_path('mamba').to_s
        requirements_file = File.join(suite_path, 'requirements.txt')

        if File.exists?(requirements_file)
          pip_install("-r #{requirements_file}")
        end

        info 'Running mamba ...'
        run!("mamba #{suite_path}")
      end
    end
  end
end
