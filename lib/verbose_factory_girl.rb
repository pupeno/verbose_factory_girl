# Copyright © 2010, José Pablo Fernández

# Verbose factory.
module VFactory
  def self.create *args
    human_factory_name = args.first.to_s.gsub("_", " ")
    if args.size > 1
      human_arguments = args.second.map { |name, value| "#{name}=>#{value.is_a?(Array) ? value.join(", ") : value}" }.to_sentence
      puts "-- creating #{human_factory_name} with #{human_arguments}."
    else
      puts "-- creating #{human_factory_name}."
    end
    Factory.create(*args).tap do |obj|
      puts "   -> done: #{obj}"
    end
  end
end
