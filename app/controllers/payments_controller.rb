class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:paid]

  def paid
    create_notification
    if @notification.acknowledge
      if @notification.complete?
        @order = Order.where(order_number: @notification.params['custom_str1']).first
        @order.update(status: :paid)
        session['cart'] = nil
        render body: nil
      else
        render body: nil
      end
    else
      head :bad_request
    end
  end

  def success
  end

  def fail
  end

  private

  def create_notification
    @notification = OffsitePayments.integration(:pay_fast).notification(request.raw_post, secret: Rails.configuration.offsite_payments['payfast']['password'])
  end
end
