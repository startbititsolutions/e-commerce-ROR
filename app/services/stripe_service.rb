class StripeService
    def  initialize()
        Stripe.api_key = ENV['STRIPE_SECRET_KEY']
    end
    def self.calculate_total_amount_paid
        total_amount_paid = 0


        Stripe.api_key = 'sk_test_51NkQmqBmFMBRRenabOm23pEYYG1oiM3BnMLRodHkCw8rvImbvdRyFL6gY8NLVV6PMpfs2fsBDFwwyQNL2Rzn7B0K00vqTjNulq'
        payment_intent = Stripe::PaymentIntent.list(limit: 10000).data.first
        
   
      
        
      
        total_amount_paid += payment_intent.amount_received

        total_amount_paid_in_dollars = total_amount_paid / 100.0
      end
     
      
end