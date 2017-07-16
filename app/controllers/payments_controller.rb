class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  # Not sure how clever this is

  def paid
    create_notification 'clientpass'
    order = Order.find_by(order_number: @notification.params['custom_str1'])
    if @notification.acknowledge && (order.total_price == @notification.params['amount_gross'].to_i)
      if @notification.complete?
        # update the order status / maybe send an email to client / or conteu
        order.update(status: :paid)
        # clear cart
        head :ok
      else
        head :ok
        # do something else
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

  def create_notification(password)
    @notification = OffsitePayments.integration(:pay_fast).notification(request.raw_post, secret: Rails.configuration.offsite_payments['payfast'][password])
  end
end
