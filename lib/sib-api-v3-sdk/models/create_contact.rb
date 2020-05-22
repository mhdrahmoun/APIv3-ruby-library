=begin
#SendinBlue API

#SendinBlue provide a RESTFul API that can be used with any languages. With this API, you will be able to :   - Manage your campaigns and get the statistics   - Manage your contacts   - Send transactional Emails and SMS   - and much more...  You can download our wrappers at https://github.com/orgs/sendinblue  **Possible responses**   | Code | Message |   | :-------------: | ------------- |   | 200  | OK. Successful Request  |   | 201  | OK. Successful Creation |   | 202  | OK. Request accepted |   | 204  | OK. Successful Update/Deletion  |   | 400  | Error. Bad Request  |   | 401  | Error. Authentication Needed  |   | 402  | Error. Not enough credit, plan upgrade needed  |   | 403  | Error. Permission denied  |   | 404  | Error. Object does not exist |   | 405  | Error. Method not allowed  |   | 406  | Error. Not Acceptable  | 

OpenAPI spec version: 3.0.0
Contact: contact@sendinblue.com
Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.12

=end

require 'date'

module SibApiV3Sdk
  class CreateContact
    # Email address of the user. Mandatory if \"SMS\" field is not passed in \"attributes\" parameter. Mobile Number in \"SMS\" field should be passed with proper country code. For example {\"SMS\":\"+91xxxxxxxxxx\"} or {\"SMS\":\"0091xxxxxxxxxx\"}
    attr_accessor :email

    # Pass the set of attributes and their values. These attributes must be present in your SendinBlue account. For eg. {\"FNAME\":\"Elly\", \"LNAME\":\"Roger\"}
    attr_accessor :attributes

    # Set this field to blacklist the contact for emails (emailBlacklisted = true)
    attr_accessor :email_blacklisted

    # Set this field to blacklist the contact for SMS (smsBlacklisted = true)
    attr_accessor :sms_blacklisted

    # Ids of the lists to add the contact to
    attr_accessor :list_ids

    # Facilitate to update the existing contact in the same request (updateEnabled = true)
    attr_accessor :update_enabled

    # transactional email forbidden sender for contact. Use only for email Contact ( only available if updateEnabled = true )
    attr_accessor :smtp_blacklist_sender

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'email' => :'email',
        :'attributes' => :'attributes',
        :'email_blacklisted' => :'emailBlacklisted',
        :'sms_blacklisted' => :'smsBlacklisted',
        :'list_ids' => :'listIds',
        :'update_enabled' => :'updateEnabled',
        :'smtp_blacklist_sender' => :'smtpBlacklistSender'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'email' => :'String',
        :'attributes' => :'Object',
        :'email_blacklisted' => :'BOOLEAN',
        :'sms_blacklisted' => :'BOOLEAN',
        :'list_ids' => :'Array<Integer>',
        :'update_enabled' => :'BOOLEAN',
        :'smtp_blacklist_sender' => :'Array<String>'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'email')
        self.email = attributes[:'email']
      end

      if attributes.has_key?(:'attributes')
        self.attributes = attributes[:'attributes']
      end

      if attributes.has_key?(:'emailBlacklisted')
        self.email_blacklisted = attributes[:'emailBlacklisted']
      end

      if attributes.has_key?(:'smsBlacklisted')
        self.sms_blacklisted = attributes[:'smsBlacklisted']
      end

      if attributes.has_key?(:'listIds')
        if (value = attributes[:'listIds']).is_a?(Array)
          self.list_ids = value
        end
      end

      if attributes.has_key?(:'updateEnabled')
        self.update_enabled = attributes[:'updateEnabled']
      else
        self.update_enabled = false
      end

      if attributes.has_key?(:'smtpBlacklistSender')
        if (value = attributes[:'smtpBlacklistSender']).is_a?(Array)
          self.smtp_blacklist_sender = value
        end
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          email == o.email &&
          attributes == o.attributes &&
          email_blacklisted == o.email_blacklisted &&
          sms_blacklisted == o.sms_blacklisted &&
          list_ids == o.list_ids &&
          update_enabled == o.update_enabled &&
          smtp_blacklist_sender == o.smtp_blacklist_sender
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [email, attributes, email_blacklisted, sms_blacklisted, list_ids, update_enabled, smtp_blacklist_sender].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        temp_model = SibApiV3Sdk.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end
  end
end
