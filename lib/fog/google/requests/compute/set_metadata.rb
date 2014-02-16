module Fog
  module Compute
    class Google

      class Mock

        def set_metadata(instance, zone, metadata={})
          Fog::Mock.not_implemented
        end

      end

      class Real

        def set_metadata(instance, zone, metadata={}, fingerprint)
          api_method = @compute.instances.set_metadata
          parameters = {
            'project' => @project,
            'instance' => instance,
            'zone' => zone
          }
          body_object = {
            'fingerprint' => fingerprint,
            "items" => metadata.to_a.map {|pair| { :key => pair[0], :value => pair[1] } }
          }
          result = self.build_result(
            api_method,
            parameters,
            body_object=body_object
          )
          response = self.build_response(result)
        end
      end
    end
  end
end
