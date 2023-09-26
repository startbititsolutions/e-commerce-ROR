class OrderMailer < ApplicationMailer
    def order_confirmation(order, pdf_content)
      @pdf_url = success_url(format: :pdf)
        @order = order
        attachments["Order_Invoice.pdf"] = {
        mime_type: 'application/pdf',
        content: pdf_content,
        disposition: 'attachment'
      }
        mail(to: order.customer.email, subject: 'Order Confirmation')
      end
end
