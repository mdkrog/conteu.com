require 'offsite_payments'
require 'offsite_payments/action_view_helper'

template = ERB.new File.new("#{Rails.root}/config/payfast.yml.erb").read
# processed = YAML.load template.result(binding)

ActionView::Base.send(:include, OffsitePayments::ActionViewHelper)
#OffsitePayments.mode = :test # for testing server
Rails.configuration.offsite_payments = YAML.load template.result(binding)
