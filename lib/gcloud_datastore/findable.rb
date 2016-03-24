module GcloudDatastore
  module Findable

    select_with :with_default_scope

    delegate \
      :aggregates,
      :avg,
      :create_with,
      :distinct,
      :each,
      :each_with_index,
      :extras,
      :find_one_and_delete,
      :find_one_and_replace,
      :find_one_and_update,
      :find_or_create_by,
      :find_or_create_by!,
      :find_or_initialize_by,
      :first_or_create,
      :first_or_create!,
      :first_or_initialize,
      :for_js,
      :geo_near,
      :includes,
      :map_reduce,
      :max,
      :min,
      :none,
      :pluck,
      :read,
      :sum,
      :text_search,
      :update,
      :update_all, to: :with_default_scope

    def find(*args)
      with_default_scope.find(*args)
    end

    def find_by(attrs = {})
      result = where(attrs).find_first
      if result.nil? && Mongoid.raise_not_found_error
        raise(Errors::DocumentNotFound.new(self, attrs))
      end
      yield(result) if result && block_given?
      result
    end

    def find_by!(attrs = {})
      result = where(attrs).find_first
      raise(Errors::DocumentNotFound.new(self, attrs)) unless result
      yield(result) if result && block_given?
      result
    end

    def first
      with_default_scope.first
    end
    alias :one :first
 
     def last
      with_default_scope.last
    end
  end
end