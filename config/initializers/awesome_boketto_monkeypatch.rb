require 'awesome_print'

if defined?(AwesomePrint)
  module AwesomePrint::ActiveRecordPatch
    private

    def awesome_active_record_class(object)
      return object.inspect if !defined?(::ActiveSupport::OrderedHash) || !object.respond_to?(:columns) || object.to_s == "ActiveRecord::Base"
      return awesome_class(object) if object.respond_to?(:abstract_class?) && object.abstract_class?

      hints = Boketto::CONFIG[object.name]

      data = object.columns.inject(::ActiveSupport::OrderedHash.new) do |hash, c|
        if hints && hints[c.name].present?
          value = [c.type, hints[c.name]]
        else
          value = c.type
        end
        hash[c.name.to_sym] = value
        hash
      end
      "class #{object} < #{object.superclass} " << awesome_hash(data)
    end
  end

  AwesomePrint::Formatter.send(:include, AwesomePrint::ActiveRecordPatch)
end
