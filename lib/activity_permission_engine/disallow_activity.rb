module ActivityPermissionEngine
  class DisallowActivity
    def initialize(request, activities_registry)
      @request = request
      @activities_registry = activities_registry
    end

    def call
      Response.new(activities_registry.remove_role(request.activity_ref, request.role_ref))
    end

    private
    attr_reader(:request, :activities_registry)

    class Request
      def initialize(activity_ref, role_ref)
        @activity_ref = activity_ref
        @role_ref = role_ref
      end

      attr_reader(:activity_ref, :role_ref)
    end

    class Response
      def initialize(success)
        @success = success
      end

      def success?
        success
      end
      private
      attr_reader(:success)
    end
  end
end