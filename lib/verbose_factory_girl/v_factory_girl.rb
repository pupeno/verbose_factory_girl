# Copyright © 2011, José Pablo Fernández


module VFactoryGirl
  def self.create *args
    factory_name = args.first.to_s.gsub("_", " ")
    arguments = args[1..-1].map do |arg|
                  if arg.is_a? Hash
                    arg.map { |name, value| "#{name}=>#{value.is_a?(Array) ? value.join(", ") : value}" }
                  else
                    arg
                  end
                end.flatten.to_sentence
    if arguments.present?
      puts "-- creating #{factory_name} with #{arguments}."
    else
      puts "-- creating #{factory_name}."
    end
    FactoryGirl.create(*args).tap do |obj|
      puts "   -> done: #{obj}"
    end
  end
end