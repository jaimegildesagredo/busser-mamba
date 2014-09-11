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
        if !pip_installed?
          f = Tempfile.new('busser-mamba', Dir.tmpdir, 'wb+')
          f.write(Net::HTTP.get(URI('https://bootstrap.pypa.io/get-pip.py')))
          f.flush
          run!("python #{f.path}")
          f.close!
        end
      end

      def pip_installed?
        system('pip --version')
        $?.exitstatus == 0
      end

      def pip_install(requirements)
        run!("pip install #{requirements}")
      end
    end
  end
end
