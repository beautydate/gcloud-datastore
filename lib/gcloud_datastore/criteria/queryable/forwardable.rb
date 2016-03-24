module GcloudDatastore
  class Criteria
    module Queryable
      module Forwardable
        
        def select_with(receiver)
          (Selectable.forwardables + Optional.forwardables).each do |name|
            __forward__(name, receiver)
          end
        end

        private

        def __forward__(name, receiver)
          if self.class == Module
            module_eval <<-SEL
              def #{name}(*args, &block)
                #{receiver}.__send__(:#{name}, *args, &block)
              end
            SEL
          else
            (class << self; self; end).class_eval <<-SEL
              def #{name}(*args, &block)
                #{receiver}.__send__(:#{name}, *args, &block)
              end
            SEL
          end
        end

      end
    end
  end
end