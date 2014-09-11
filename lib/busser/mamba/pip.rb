# -*- encoding: utf-8 -*-

module Busser
  module Mamba
    # Common methods for pip
    #
    # @author Jaime Gil de Sagredo <jaimegildesagredo@gmail.com>
    #
    module Pip
      module_function

      def ensure_pip
        run!(ensure_pip_cmd)
      end

      def ensure_pip_cmd
        <<-CMD
        pip --version || curl https://bootstrap.pypa.io/get-pip.py|python
        CMD
      end

      def pip_install(requirements)
        run!("pip install #{requirements}")
      end
    end
  end
end
